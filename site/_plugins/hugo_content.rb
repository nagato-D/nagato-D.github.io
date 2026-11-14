# frozen_string_literal: true

# Render the existing bilingual Hugo content without rewriting its source files.
# The site's layouts and styling are supplied by al-folio; this adapter preserves
# the old page URLs, shared attachment URLs, shortcodes, and mathematical text.
require "cgi"
require "date"
require "pathname"
require "shellwords"
require "time"
require "tomlrb"
require "yaml"
require "kramdown"
require "kramdown-parser-gfm"
require "nokogiri"

module PreservedHugoContent
  class Renderer
    def initialize(entry, routes)
      @entry = entry
      @routes = routes
      @stored = {}
      @counter = 0
    end

    def store(value, block: false, code: false)
      @counter += 1
      token = if block
                %(<div data-hugo-preserved="#{@counter}"></div>)
              elsif code
                "HUGOPRESERVEDCODE#{@counter}TOKEN"
              else
                "HUGOPRESERVEDINLINE#{@counter}TOKEN"
              end
      @stored[token] = value
      token
    end

    def protect_code(text)
      lines = text.lines
      result = +""
      position = 0
      while position < lines.length
        opening = lines[position].match(/^ {0,3}(`{3,}|~{3,})[^\n]*\n?$/)
        unless opening
          result << lines[position]
          position += 1
          next
        end
        fence = opening[1]
        start = position
        position += 1
        closing = /^ {0,3}#{Regexp.escape(fence[0])}{#{fence.length},}\s*$/
        position += 1 while position < lines.length && !lines[position].match?(closing)
        position += 1 if position < lines.length
        original = lines[start...position].join
        result << store(original, code: true)
        result << "\n" unless result.end_with?("\n")
      end
      result.gsub(/(`+)([^`]*?)\1/m) { store(Regexp.last_match(0), code: true) }
    end

    def parameters(raw)
      positional = []
      named = {}
      Shellwords.shellsplit(raw).each do |part|
        if part.include?("=")
          key, value = part.split("=", 2)
          named[key] = value
        else
          positional << part
        end
      end
      [positional, named]
    end

    def escape(value)
      CGI.escapeHTML(value.to_s)
    end

    def render_admonitions(text)
      text.gsub(/\{\{<\s*admonition\b(.*?)>\}\}(.*?)\{\{<\s*\/admonition\s*>\}\}/m) do
        arguments = Regexp.last_match(1)
        inner = Regexp.last_match(2)
        positional, named = parameters(arguments)
        kind = named.fetch("type", positional[0] || "note")
        title = named.fetch("title", positional[1] || (@entry[:lang] == "zh-cn" ? "提示" : kind.capitalize))
        # A code block protected by the parent must be visible to the recursive
        # renderer, so it is restored before rendering this admonition's body.
        inner = restore(inner, code_only: true)
        content = self.class.new(@entry, @routes).render(inner)
        klass = kind.gsub(/[^a-zA-Z0-9_-]/, "")
        expanded = named["open"] == "false" ? "" : " open"
        html = %(<details class="admonition admonition-#{klass}"#{expanded}><summary>#{escape(title)}</summary><div class="admonition-body">#{content}</div></details>)
        "\n\n#{store(html, block: true)}\n\n"
      end
    end

    def protect_math(text)
      text = text.gsub(/(?<!\\)\$\$(.+?)(?<!\\)\$\$/m) do
        tex = Regexp.last_match(1)
        # In the existing $$ equations, escaped square brackets denote literal
        # grouping brackets: Goldmark previously removed those Markdown escapes.
        # Normalize paired brackets inside this display only, so MathJax does
        # not interpret them as nested display-math delimiters. Standalone
        # \[...\] displays and TeX line breaks remain untouched.
        tex = tex.gsub(/(?<!\\)\\\[(.*?)(?<!\\)\\\]/m) { "[#{Regexp.last_match(1)}]" }
        store(%(<div class="math-display">\\[#{escape(tex)}\\]</div>), block: true)
      end
      text = text.gsub(/\\\[(.*?)\\\]/m) do
        store(%(<div class="math-display">\\[#{escape(Regexp.last_match(1))}\\]</div>), block: true)
      end
      text = text.gsub(/\\\((.*?)\\\)/m) do
        store(%(<span class="math-inline">\\(#{escape(Regexp.last_match(1))}\\)</span>))
      end
      text = text.gsub(/\\begin\{(equation\*?|align\*?|alignat\*?|gather\*?|multline\*?|eqnarray\*?|displaymath)\}.*?\\end\{\1\}/m) do
        store(%(<div class="math-display">#{escape(Regexp.last_match(0))}</div>), block: true)
      end
      text.gsub(/(?<!\\)\$(?!\$)([^\n]+?)(?<!\\)\$(?!\$)/) do
        store(%(<span class="math-inline">\\(#{escape(Regexp.last_match(1))}\\)</span>))
      end
    end

    def render_shortcodes(text)
      text.gsub(/\{\{<\s*(image|bilibili)\b(.*?)>\}\}/m) do
        name = Regexp.last_match(1)
        positional, named = parameters(Regexp.last_match(2))
        if name == "image"
          src = named.fetch("src", positional[0].to_s)
          caption = named.fetch("caption", "")
          plain_caption = CGI.unescapeHTML(restore(caption).gsub(/<[^>]+>/, ""))
          alt = named.fetch("alt", plain_caption.gsub(/\[([^\]]+)\]\([^)]*\)/, '\1'))
          dimensions = %w[width height].filter_map do |key|
            value = named[key]
            %( #{key}="#{value}") if value&.match?(/\A\d+\z/)
          end.join
          caption_html = caption.empty? ? "" : %(<figcaption>#{self.class.new(@entry, @routes).render(caption).sub(/\A<p>/, "").sub(/<\/p>\s*\z/, "")}</figcaption>)
          html = %(<figure class="note-figure"><img src="#{escape(src)}" alt="#{escape(alt)}" loading="lazy"#{dimensions}>#{caption_html}</figure>)
        else
          id = named.fetch("id", positional[0].to_s)
          label = @entry[:lang] == "zh-cn" ? "在哔哩哔哩观看" : "Watch on Bilibili"
          html = %(<div class="video-embed"><iframe src="https://player.bilibili.com/player.html?bvid=#{escape(id)}&amp;autoplay=0" title="Bilibili #{escape(id)}" loading="lazy" allowfullscreen></iframe></div><p><a href="https://www.bilibili.com/video/#{escape(id)}/" target="_blank" rel="noopener noreferrer">#{label}</a></p>)
        end
        "\n\n#{store(html, block: true)}\n\n"
      end
    end

    def localized_link(destination)
      original = destination
      destination = destination.sub(%r{\Ahttps?://nagato-d\.github\.io(?=/|$)}i, "")
      return original if destination.match?(%r{\A(?:[a-z][a-z0-9+.-]*:|//|#)}i)
      path, suffix = destination.split(/(?=[?#])/, 2)
      return original if path.nil? || path.empty?
      # Only paths in the content route map are localized. In particular, shared
      # /posts/... PDF/image/model URLs keep their case and language-neutral path.
      absolute = if path.start_with?("/")
                   path
                 else
                   File.expand_path(path, @entry[:url])
                 end
      key = absolute.sub(%r{\A/zh-cn(?=/|$)}i, "").sub(%r{/index\.(?:html|md)\z}i, "/")
      key = key.sub(%r{\A/}, "").sub(%r{/\z}, "").downcase
      key = "home" if key.empty?
      target = @routes[[key, @entry[:lang]]]
      target ? "#{target}#{suffix}" : original
    end

    def restore(text, code_only: false)
      # Later blocks can contain an earlier math token (for example a figure
      # caption). Expand containers before the tokens inside them.
      @stored.to_a.reverse_each do |token, value|
        next if code_only && !token.start_with?("HUGOPRESERVEDCODE")
        text = text.gsub(token) { value }
      end
      text
    end

    # Keep news editable in the original home Markdown while presenting it with
    # al-folio's date/content table. Month-only source dates stay month-only.
    def format_home_news(html)
      return html unless @entry[:key] == "home"

      fragment = Nokogiri::HTML.fragment(html)
      heading = fragment.css("h2").find { |node| ["news", "最新动态"].include?(node.text.strip.downcase) }
      list = heading&.next_element
      return html unless list&.name == "ul"

      items = list.xpath("./li")
      dates = items.map { |item| item.xpath(".//text()").first&.text&.match(/\A\s*(\d{4})\.(0[1-9]|1[0-2])[,，]\s*/) }
      return html if items.empty? || dates.any?(&:nil?)

      news = Nokogiri::HTML.fragment('<div class="news home-news"><div class="table-responsive"><table class="table table-sm table-borderless"><tbody></tbody></table></div></div>')
      body = news.at_css("tbody")
      items.zip(dates).each do |item, match|
        year, month = match.captures
        label = @entry[:lang] == "zh-cn" ? "#{year} 年 #{month.to_i} 月" : Date.new(year.to_i, month.to_i, 1).strftime("%b %Y")
        row = Nokogiri::HTML.fragment(%(<tr><th scope="row"><time datetime="#{year}-#{month}">#{label}</time></th><td></td></tr>))
        first_text = item.xpath(".//text()").first
        first_text.content = first_text.text.sub(match[0], "")
        item.children.each { |child| row.at_css("td").add_child(child) }
        body.add_child(row)
      end
      heading.add_class("home-news-heading")
      list.replace(news)
      fragment.to_html
    end

    def render(markdown)
      text = protect_code(markdown.gsub("\r\n", "\n"))
      text = render_admonitions(text)
      text = protect_math(text)
      text = render_shortcodes(text)
      text = text.gsub(/:\((fa-[a-z-]+(?:\s+fa-[a-z0-9-]+)+)\):/) do
        %(<i class="#{escape(Regexp.last_match(1))}" aria-hidden="true"></i>)
      end
      text = text.gsub(/^(\#{1,6}\s+.*?)\s+\{#([a-zA-Z0-9_-]+)\}\s*$/) do
        "#{Regexp.last_match(1)}\n{: ##{Regexp.last_match(2)}}"
      end
      text = text.gsub(/(\]\()([^\s)]+)([^) ]*|\s+["'][^\n]*?["'])?\)/) do
        prefix = Regexp.last_match(1)
        destination = Regexp.last_match(2)
        tail = Regexp.last_match(3).to_s
        "#{prefix}#{localized_link(destination)}#{tail})"
      end
      text = restore(text, code_only: true)
      html = Kramdown::Document.new(text, input: "GFM", hard_wrap: false,
                                         syntax_highlighter: "rouge", math_engine: nil,
                                         parse_block_html: false).to_html
      format_home_news(restore(html))
    end
  end

  class Generator < Jekyll::Generator
    safe true
    priority :low

    def read_entry(path, content_root)
      text = File.read(path, encoding: "bom|utf-8").gsub("\r\n", "\n")
      if (match = text.match(/\A\+\+\+\s*\n(.*?)\n\+\+\+\s*\n?/m))
        metadata = Tomlrb.parse(match[1])
      elsif (match = text.match(/\A---\s*\n(.*?)\n---\s*\n?/m))
        metadata = YAML.safe_load(match[1], permitted_classes: [Date, Time], aliases: true) || {}
      else
        raise Jekyll::Errors::FatalException, "Missing content front matter: #{path}"
      end
      body = text[match.end(0)..]
      relative = Pathname.new(path).relative_path_from(Pathname.new(content_root)).to_s.tr("\\", "/")
      lang = relative.end_with?(".zh-cn.md") ? "zh-cn" : "en"
      key = File.dirname(relative).downcase
      key = "home" if key == "."
      url = key == "home" ? "/" : "/#{key}/"
      url = "/zh-cn#{url}" if lang == "zh-cn"
      is_section = File.basename(relative).start_with?("_index")
      kind = if key == "home"
               "home"
             elsif is_section || key == "posts"
               "section"
             elsif key.include?("/")
               "note"
             else
               "page"
             end
      title = metadata["title"].to_s.strip
      first_heading = body.match(/^#\s+(.+?)\s*$/)
      title = first_heading[1] if title.empty? && first_heading
      title = key.tr("_-", " ").split.map(&:capitalize).join(" ") if title.empty?
      title = lang == "zh-cn" ? "笔记" : "Notes" if key == "posts"
      # Independent pages already contain their title as an H1. The al-folio
      # page layout supplies that title; omit only this duplicate rendering.
      body = body.sub(/^#\s+.+?\s*\n/, "") if kind == "page" && first_heading
      { metadata: metadata, body: body, source: relative, key: key, lang: lang,
        url: url, title: title, kind: kind, section: key.split("/").first }
    end

    def normalized_date(value)
      return value if value.is_a?(Time)
      return Time.new(value.year, value.month, value.day) if value.is_a?(Date)
      Time.parse(value.to_s) unless value.nil? || value.to_s.empty?
    rescue ArgumentError
      nil
    end

    def summary(entry)
      { "title" => entry[:title], "url" => entry[:url], "lang" => entry[:lang],
        "date" => normalized_date(entry[:metadata]["date"]),
        "section_key" => entry[:section], "translation_key" => entry[:key],
        "content_kind" => entry[:kind] }
    end

    def section_items(entry, entries)
      entries.select do |candidate|
        next false unless candidate[:lang] == entry[:lang] && candidate[:kind] == "note"
        entry[:key] == "posts" ? candidate[:section].start_with?("notes_") : candidate[:section] == entry[:key]
      end.sort_by { |candidate| [normalized_date(candidate[:metadata]["date"]) || Time.at(0), candidate[:title]] }.reverse
    end

    def article_list(items, lang)
      return "" if items.empty?
      list = items.map do |entry|
        date = normalized_date(entry[:metadata]["date"])
        time = date ? %(<time datetime="#{date.strftime('%Y-%m-%d')}">#{date.strftime('%Y-%m-%d')}</time>) : ""
        %(<li><h3><a href="#{CGI.escapeHTML(entry[:url])}">#{CGI.escapeHTML(entry[:title])}</a></h3><p class="post-meta">#{time}</p></li>)
      end.join("\n")
      %(<ul class="post-list note-index">#{list}</ul>)
    end

    def generate(site)
      legacy_root = File.expand_path(site.config.fetch("legacy_source", ".."), site.source)
      content_root = File.join(legacy_root, "content")
      return unless Dir.exist?(content_root)
      entries = Dir.glob(File.join(content_root, "**", "*.md")).sort.map { |path| read_entry(path, content_root) }
      entries.reject! { |entry| entry[:metadata]["draft"] == true && !site.config["show_drafts"] }
      routes = entries.to_h { |entry| [[entry[:key], entry[:lang]], entry[:url]] }
      site.data["content_index"] = entries.map { |entry| summary(entry) }

      entries.each do |entry|
        page = Jekyll::PageWithoutAFile.new(site, site.source, entry[:url].delete_prefix("/"), "index.html")
        other_lang = entry[:lang] == "en" ? "zh-cn" : "en"
        layout = { "home" => "about", "section" => "page", "page" => "page", "note" => "note" }.fetch(entry[:kind])
        page.data.merge!(entry[:metadata])
        page.data.merge!(summary(entry))
        page.data.merge!("layout" => layout, "permalink" => entry[:url],
                         "html_lang" => (entry[:lang] == "zh-cn" ? "zh-CN" : "en"),
                         "translation_url" => routes.fetch([entry[:key], other_lang], other_lang == "en" ? "/" : "/zh-cn/"),
                         "render_with_liquid" => false, "toc" => false,
                         "legacy_source_path" => "content/#{entry[:source]}")
        items = section_items(entry, entries)
        page.data["section_pages"] = items.map { |item| summary(item) }
        page.content = Renderer.new(entry, routes).render(entry[:body])
        page.content += article_list(items, entry[:lang]) if entry[:kind] == "section" && entry[:key] != "posts"
        site.pages << page
      end

      static_root = File.join(legacy_root, "static")
      if Dir.exist?(static_root)
        Dir.glob(File.join(static_root, "**", "*"), File::FNM_DOTMATCH).sort.each do |path|
          next unless File.file?(path)
          relative = Pathname.new(path).relative_path_from(Pathname.new(static_root)).to_s.tr("\\", "/")
          # These local simulation models were intentionally never published;
          # the notes already link to their original OneDrive downloads.
          next if relative.start_with?("posts/note-MZM-design/")
          site.static_files << Jekyll::StaticFile.new(site, static_root, File.dirname(relative), File.basename(relative))
        end
      end
      Jekyll.logger.info "Preserved content:", "#{entries.length} bilingual pages from #{content_root}"
    end
  end
end
