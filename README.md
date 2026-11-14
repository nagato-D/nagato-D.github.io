# Di Yu's academic homepage

Live site: <https://nagato-d.github.io/> · 中文：<https://nagato-d.github.io/zh-cn/>

The site uses [al-folio](https://github.com/alshedivat/al-folio), with published `al_folio_core 1.0.15` pinned in `Gemfile.lock`. Its bilingual layouts present Di Yu's research, publications, Notes, and Thoughts.

## 内容维护

- 原有笔记仍在 `content/` 中，源文件与附件不因迁移而重写。
- 英文为 `index.md`，中文为同目录的 `index.zh-cn.md`；栏目首页为 `_index.md` 和 `_index.zh-cn.md`。保留已有 TOML 或 YAML front matter。
- `site/_plugins/hugo_content.rb` 在 Jekyll 构建时读取内容，兼容 image、admonition、bilibili 短码、数学公式、代码块和引用锚点。
- 英文保留原网址；中文位于 `/zh-cn/`。切换按钮优先指向同一篇译文，缺少译文时回到另一语言首页。
- 站内文章链接保持当前语言；`static/` 中的 PDF、图片、代码等附件沿用原网址与大小写，不翻译或复制成两份。
- `static/posts/note-MZM-design/` 中原本未跟踪的本地仿真资源继续保留在本机和备份中，下载沿用笔记中的 OneDrive 链接，不加入 Git 或 Pages。
- 导航：`site/_data/navigation.yml`；配置：`site/_config.yml`；布局覆盖：`site/_layouts/` 与 `site/_includes/`。
- 原 Hugo 配置、主题源码仍保留供回退参考；现行部署只构建 `site/`，不再使用旧 Hugo 工作流或 `netlify.toml`。

## 本地构建与验证

需要 Ruby 3.3、Bundler 2.6.9，以及验证用的 Python 3.11+。

```sh
bundle install
bundle exec jekyll build --source site --config site/_config.yml --destination ../.tools/al-folio-output
python -m pip install beautifulsoup4==4.14.3
python scripts/verify_site.py --output ../.tools/al-folio-output
python -m http.server 1314 --bind 127.0.0.1 --directory ../.tools/al-folio-output
```

打开 <http://127.0.0.1:1314/> 和 <http://127.0.0.1:1314/zh-cn/>。每次提交、部署前先备份并检查本地页面；不要提交 `_site/`、`public/` 或缓存。

## 部署与回退

推送到 `main` 后，`.github/workflows/jekyll.yml` 安装锁定依赖、构建、验证双语页面和附件，再发布到 GitHub Pages。Pull request 只构建和验证。

迁移前备份位于仓库上两级的 `version history/nagato-D.github.io-20261114-181852-before-al-folio/`，含逐文件 SHA-256 清单。迁移前线上版本：`19851398c7248a72b9169784e14d76df485d296c`。回退时使用新的 Git 提交恢复旧部署配置，并先检查后续内容更新。

## Theme attribution

al-folio is MIT licensed. Its original styles and scripts come from the pinned theme gem. `site/AL_FOLIO_LICENSE` preserves its license; the footer retains attribution. Local overrides add bilingual navigation and metadata, compatibility with the original content format, and article layout adaptations. Original content and attachments retain their existing rights.
