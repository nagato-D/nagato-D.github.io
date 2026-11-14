#!/usr/bin/env python3
"""Verify the built bilingual site without running Jekyll.

Requires Python 3.11+ and beautifulsoup4. The normal CI invocation needs only
--output. Optional --backup and --baseline add migration preservation checks.
"""

import argparse
from concurrent.futures import ThreadPoolExecutor
import hashlib
import json
from pathlib import Path
import re
import sys
import tomllib
from urllib.parse import unquote, urljoin, urlparse

from bs4 import BeautifulSoup


# These local simulation models are also excluded by site/_plugins/hugo_content.rb.
UNPUBLISHED_STATIC_PREFIX = "posts/note-MZM-design/"


def sha256(path):
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def yaml_scalar(text, key, default=None):
    """Read a relevant top-level scalar, without a PyYAML dependency.

    The site's YAML front matter uses plain or quoted title/draft scalars.
    Complex YAML values for these fields are rejected rather than misread.
    """
    match = re.search(r"^" + re.escape(key) + r":\s*([^\n]*)$", text, re.MULTILINE)
    if not match:
        return default
    value = match.group(1).strip()
    if value.startswith('"'):
        return json.JSONDecoder().raw_decode(value)[0]
    if value.startswith("'"):
        match = re.match(r"'((?:[^']|'')*)'", value)
        if not match:
            raise ValueError(f"Invalid quoted YAML scalar: {key}")
        return match.group(1).replace("''", "'")
    value = re.split(r"\s+#", value, maxsplit=1)[0].strip()
    if value in ("true", "false"):
        return value == "true"
    if value in ("|", ">", "|-", ">-", "|+", ">+"):
        raise ValueError(f"Use a single-line {key} for independent verification")
    return value or default


def source_entry(path, content_root):
    text = path.read_text(encoding="utf-8-sig").replace("\r\n", "\n")
    match = re.match(r"\A(\+\+\+|---)\s*\n(.*?)\n\1\s*\n?", text, re.DOTALL)
    if not match:
        raise ValueError(f"Missing front matter: {path}")
    raw = match.group(2)
    if match.group(1) == "+++":
        metadata = tomllib.loads(raw)
    else:
        metadata = {key: yaml_scalar(raw, key) for key in ("title", "draft")}
    relative = path.relative_to(content_root)
    language = "zh-cn" if path.name.endswith(".zh-cn.md") else "en"
    key = relative.parent.as_posix().lower()
    key = "" if key == "." else key
    english_url = "/" + (key + "/" if key else "")
    chinese_url = "/zh-cn" + english_url
    url = chinese_url if language == "zh-cn" else english_url
    title = str(metadata.get("title") or "").strip()
    body = text[match.end():]
    heading = re.search(r"^#\s+(.+?)\s*$", body, re.MULTILINE)
    if not title and heading:
        title = heading.group(1)
    if key == "posts":
        title = "笔记" if language == "zh-cn" else "Notes"
    return {
        "source": relative.as_posix(), "lang": language, "key": key,
        "url": url, "en": english_url, "zh": chinese_url,
        "title": title, "draft": metadata.get("draft") is True,
    }


class Audit:
    def __init__(self, args):
        self.args = args
        self.source = args.source.resolve()
        self.output = args.output.resolve()
        if not (self.source / "content").is_dir() or not self.output.is_dir():
            raise ValueError("Source content and built output directories must exist")
        config = (self.source / "site/_config.yml").read_text(encoding="utf-8-sig")
        self.host = yaml_scalar(config, "url", "https://nagato-d.github.io").rstrip("/")
        self.hostname = urlparse(self.host).hostname.lower()
        self.files = {p.relative_to(self.output).as_posix() for p in self.output.rglob("*") if p.is_file()}
        self.soups = {}
        self.errors = []
        self.warnings = []
        self.counts = {}
        self.static = {
            p.relative_to(self.source / "static").as_posix(): p
            for p in (self.source / "static").rglob("*")
            if p.is_file() and not p.relative_to(self.source / "static").as_posix().startswith(UNPUBLISHED_STATIC_PREFIX)
        }

    def error(self, kind, **details):
        self.errors.append({"kind": kind, **details})

    def soup(self, relative):
        if relative not in self.soups:
            self.soups[relative] = BeautifulSoup((self.output / relative).read_text(encoding="utf-8"), "html.parser")
        return self.soups[relative]

    def local_target(self, value, page_url):
        if not value or value.startswith(("data:", "mailto:", "javascript:", "tel:")):
            return None
        parsed = urlparse(urljoin(self.host + page_url, value))
        if parsed.hostname and parsed.hostname.lower() != self.hostname:
            return None
        path = unquote(parsed.path).lstrip("/")
        if not path or path.endswith("/"):
            path += "index.html"
        elif path not in self.files and path + "/index.html" in self.files:
            path += "/index.html"
        return path, unquote(parsed.fragment)

    def attachment_refs(self, article, url):
        refs = set()
        for element in article.find_all(True):
            for attr in ("href", "src", "data-src", "data-original", "poster"):
                target = self.local_target(element.get(attr), url)
                # Exclude former theme assets, such as LoveIt's lazy-load SVG.
                if target and target[0] in self.static:
                    refs.add(target[0])
        return refs

    def verify_page(self, entry):
        relative = entry["url"].lstrip("/") + "index.html"
        if relative not in self.files:
            self.error("missing_page", source=entry["source"], expected=relative)
            return
        soup = self.soup(relative)
        expected_lang = "zh-CN" if entry["lang"] == "zh-cn" else "en"
        if not soup.html or soup.html.get("lang") != expected_lang:
            self.error("html_lang", page=relative, expected=expected_lang)
        heading = soup.select_one("h1")
        if entry["key"] and entry["title"] and (not heading or heading.get_text(" ", strip=True) != entry["title"]):
            self.error("title", page=relative, expected=entry["title"], actual=heading.get_text(" ", strip=True) if heading else None)
        if not soup.title or not soup.title.get_text(strip=True):
            self.error("empty_document_title", page=relative)
        chinese = entry["lang"] == "zh-cn"
        prefix = "/zh-cn" if chinese else ""
        nav = soup.select_one("#navbar")
        for label, path in [("笔记" if chinese else "Notes", "/posts/"), ("随想" if chinese else "Thoughts", "/thoughts/")]:
            if not nav or not any(a.get_text(" ", strip=True) == label and a.get("href") == prefix + path for a in nav.select("a[href]")):
                self.error("navigation", page=relative, label=label, expected=prefix + path)
        switch = soup.select_one("a.language-switch")
        target = entry["en"] if chinese else entry["zh"]
        if not switch or switch.get("href") != target:
            self.error("language_switch", page=relative, expected=target)
        canonicals = soup.select("link[rel=canonical]")
        if len(canonicals) != 1 or canonicals[0].get("href") != self.host + entry["url"]:
            self.error("canonical", page=relative, expected=self.host + entry["url"])
        alternates = {a.get("hreflang"): a.get("href") for a in soup.select("link[rel=alternate][hreflang]")}
        expected = {"en": self.host + entry["en"], "zh-CN": self.host + entry["zh"], "x-default": self.host + entry["en"]}
        if alternates != expected:
            self.error("hreflang", page=relative, expected=expected, actual=alternates)
        article = soup.select_one("article")
        if not article:
            self.error("missing_article", page=relative)
            return
        clean = BeautifulSoup(str(article), "html.parser")
        for code in clean.select("pre,code"):
            code.decompose()
        if re.search(r"HUGOPRESERVED[A-Z0-9]+TOKEN|\{\{[<%].*?[>%]\}\}|data-hugo-preserved=", str(clean), re.DOTALL):
            self.error("unrendered_shortcode_or_token", page=relative)
        for math in article.select(".math-display"):
            text = math.get_text().strip()
            if text.startswith(r"\[") and text.endswith(r"\]") and re.search(r"\\[\[\]]", text[2:-2]):
                self.error("nested_math_delimiter", page=relative, formula=text[:180])
        if self.args.baseline:
            old_path = self.args.baseline / relative
            if old_path.is_file():
                old_soup = BeautifulSoup(old_path.read_text(encoding="utf-8"), "html.parser")
                old_article = old_soup.select_one("#content") or old_soup.select_one("article")
                if old_article:
                    removed = self.attachment_refs(old_article, entry["url"]) - self.attachment_refs(article, entry["url"])
                    if removed:
                        self.error("removed_attachment_links", page=relative, paths=sorted(removed))
                    old_code = [node.get_text().rstrip() for node in old_article.select("pre code")]
                    new_code = [node.get_text().rstrip() for node in article.select("pre code")]
                    if old_code != new_code:
                        self.error("changed_code_blocks", page=relative, old_count=len(old_code), new_count=len(new_code))

    def verify_links(self):
        checked = 0
        for relative in sorted(path for path in self.files if path.endswith(".html")):
            soup = self.soup(relative)
            url = "/" + relative.removesuffix("index.html")
            for element in soup.find_all(True):
                for attr in ("href", "src", "data-src", "poster"):
                    value = element.get(attr)
                    if not value:
                        continue
                    if "{{version}}" in value:
                        self.error("unresolved_asset_version", page=relative, link=value)
                    target = self.local_target(value, url)
                    if not target:
                        continue
                    checked += 1
                    path, fragment = target
                    if path not in self.files:
                        self.error("missing_internal_target", page=relative, link=value, target=path)
                    elif fragment and path.endswith(".html"):
                        destination = self.soup(path)
                        if not destination.find(id=fragment) and not destination.find(attrs={"name": fragment}):
                            # Source notes may contain old unresolved citations. Report
                            # them separately from missing pages and asset regressions.
                            self.warnings.append({"kind": "missing_fragment", "page": relative, "link": value})
        self.counts["internal_links_checked"] = checked

    def verify_files(self):
        def static_result(item):
            relative, path = item
            if relative not in self.files:
                return {"kind": "missing_static_file", "file": relative}
            if sha256(path) != sha256(self.output / relative):
                return {"kind": "static_bytes_changed", "file": relative}
            return None
        with ThreadPoolExecutor(max_workers=8) as pool:
            self.errors.extend(result for result in pool.map(static_result, self.static.items()) if result)
        self.counts["static_sha256_checked"] = len(self.static)
        if self.args.backup:
            content = self.source / "content"
            backup = self.args.backup / "content"
            current = {p.relative_to(content).as_posix(): p for p in content.rglob("*") if p.is_file()}
            original = {p.relative_to(backup).as_posix(): p for p in backup.rglob("*") if p.is_file()}
            for relative in sorted(current.keys() | original.keys()):
                if relative not in current or relative not in original:
                    self.error("source_content_set_changed", file=relative)
                elif sha256(current[relative]) != sha256(original[relative]):
                    self.error("source_content_bytes_changed", file=relative)
            self.counts["backup_content_files_checked"] = len(current)

    def run(self):
        content = self.source / "content"
        entries = [source_entry(path, content) for path in sorted(content.rglob("*.md"))]
        entries = [entry for entry in entries if not entry["draft"]]
        routes = set()
        for entry in entries:
            if entry["url"] in routes:
                self.error("duplicate_route", url=entry["url"], source=entry["source"])
            routes.add(entry["url"])
            self.verify_page(entry)
        for entry in entries:
            counterpart = entry["en"] if entry["lang"] == "zh-cn" else entry["zh"]
            if counterpart not in routes:
                self.error("missing_translation", source=entry["source"], expected=counterpart)
        self.counts.update({"source_pages": len(entries), "output_html": sum(path.endswith(".html") for path in self.files)})
        self.verify_links()
        self.verify_files()
        return {"counts": self.counts, "errors": self.errors, "warnings": self.warnings}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", type=Path, default=Path(__file__).resolve().parents[1], help="Repository root (default: parent of scripts/)")
    parser.add_argument("--output", type=Path, required=True, help="Built Jekyll output directory")
    parser.add_argument("--backup", type=Path, help="Optional pre-migration repository backup")
    parser.add_argument("--baseline", type=Path, help="Optional previous built Hugo/Jekyll site")
    parser.add_argument("--report", type=Path, help="Optional JSON report file")
    args = parser.parse_args()
    try:
        result = Audit(args).run()
    except (OSError, ValueError, tomllib.TOMLDecodeError) as error:
        print(f"Site verification could not run: {error}", file=sys.stderr)
        return 2
    if args.report:
        args.report.write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding="utf-8")
    print(json.dumps(result["counts"], ensure_ascii=False))
    for error in result["errors"]:
        print("ERROR " + json.dumps(error, ensure_ascii=False))
    for warning in result["warnings"]:
        print("WARNING " + json.dumps(warning, ensure_ascii=False))
    print(f"Site verification: {len(result['errors'])} error(s), {len(result['warnings'])} warning(s)")
    return 1 if result["errors"] else 0


if __name__ == "__main__":
    sys.exit(main())
