# Welcome

Hey guys! I am Di. This is my personal website. I hope you can find something interesting here!

## 中英文内容

- 英文是默认语言，保留原有网址；简体中文页面位于 `/zh-cn/`。
- 同一页面使用 `index.md` 和 `index.zh-cn.md`，栏目首页使用 `_index.md` 和 `_index.zh-cn.md`。两种语言的文件放在同一目录，Hugo 会自动配对。
- 导航、网站标题和个人简介的语言配置位于 `hugo.toml` 的 `[languages]` 下。主题通用文案来自 `i18n/en.toml` 和 `i18n/zh-CN.toml`。
- 桌面和手机顶部的语言链接优先切换到同一页面的译文；新页面暂时没有译文时，会回到目标语言栏目或首页。
- 页面间的 Markdown 链接会指向当前语言的对应内容。PDF、图片、代码和模型等附件继续共享 `static/` 中的原始文件，不需要复制到中文目录。

## 本地验证

使用项目旁 `../.tools/hugo-0.156.0/hugo.exe`（Hugo Extended）。修改前先在 `../../version history/`（相对于本仓库目录）保存完整备份。构建和预览应将输出及缓存放在项目外，不要使用 `--gc`，也不要提交生成的 `public/`。

```powershell
& '..\.tools\hugo-0.156.0\hugo.exe' build --minify --destination '..\.tools\hugo-test-output' --cacheDir '..\.tools\hugo-cache' --noBuildLock
& '..\.tools\hugo-0.156.0\hugo.exe' server --bind 127.0.0.1 --port 1313 --disableFastRender --renderToMemory --noBuildLock --cacheDir '..\.tools\hugo-cache'
```

推送到 `main` 后，`.github/workflows/hugo.yaml` 会构建并部署到 GitHub Pages。
