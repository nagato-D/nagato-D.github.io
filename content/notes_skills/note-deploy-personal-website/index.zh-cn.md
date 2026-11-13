+++
title = '在 GitHub 上部署个人网站的笔记'
author = 'Di Yu'
date = 2025-02-04
draft = false
+++

## 创建 Markdown 文件

---

1. 使用 [Markdown](https://en.wikipedia.org/wiki/Markdown) 编写笔记。

## 将 Markdown 文件转换为本地网站

---

### 安装 Hugo 并配置网站文件夹

1. 按照[指南](https://gohugo.io/installation/)安装 Hugo。
2. 安装 [PowerShell](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3)。
3. 打开 `powershell`，运行 `cd <loc>`，切换到希望存放网站文件的位置。
4. 在 `powershell` 中运行 `hugo new site <site_name>`，使用 Hugo 创建新网站。
5. 编辑 `hugo.toml` 文件，暂时将 `baseURL` 留空。
6. 在 `powershell` 中切换到网站文件夹。
7. 运行 `hugo new docs/test.md` 创建一篇内容文档。

### 安装主题并添加内容

1. 运行 `git init`。
2. 在 [Hugo](https://themes.gohugo.io/) 选择喜欢的主题，依次进入 Download → Install（运行方法 1 中的 `git clone` 命令，以及方法 2 中的 `git submodule add` 命令）。
3. 编辑 `hugo.toml` 文件，添加 `theme = <theme_name>`。
4. 编辑内容文件，将 `draft` 设为 `false`，并添加一些内容。
5. 运行 `hugo server`，然后在本地访问 `http://localhost:1313/`。

## 将网站部署到 GitHub

---

### 将网站框架推送到 GitHub

1. 创建一个空的 GitHub 仓库。
2. 复制 `git remote add origin <website_path>.git` 命令。
3. 添加 `README.md` 文件并推送：`git add README.md` → `git commit -m "initial commit"` → `git branch -M main` → `git remote add origin <website_path>.git` → `git push -u origin main`。

### 为 GitHub Pages 设置分支

1. 创建 `gh-pages` 分支。
2. 在仓库中依次进入 Settings → Actions → General，启用 `Read and write permissions`，然后保存。

### 创建 GitHub 工作流

1. 在本地仓库的 `.github/workflows/` 目录中创建名为 `hugo.yaml` 的空文件。
2. 将 [HUGO: Host on GitHub Pages](https://gohugo.io/hosting-and-deployment/hosting-on-github/) 中“Step 6”的 YAML 代码复制到 `hugo.yaml`。
3. 修改 `hugo.yaml` 中指定的 Hugo 版本，使其与本地版本一致（在终端输入 `hugo version` 查看）。

### Git 推送

1. 依次运行 `git add .` → `git commit -m "add the first test page"` → `git push`。
2. 等待 GitHub 部署网站。
3. 通过 `https://<user_name>.github.io/<repo_name>/` 访问网站。

## 如何更新网站

---

1. 在 `content` 文件夹中添加（`hugo new <path/filename>`）或修改 Markdown 文件；记得将这些文件中的 `draft` 设为 `false`。
2. 运行 `hugo server` 在本地重新构建网站。
3. 发布网站：`git add .` → `git commit -m "message"` → `git push`。
4. 验证发布结果。

## 如何配置网站

---

1. 将 `themes/<theme_name>/config.toml` 的内容复制到 `hugo.toml`。
2. 修改 `hugo.toml` 中的网站标题、`avatarURL` 和社交链接等参数。
3. 若要在主页添加菜单（例如右上角的标签），请参考 [`config.toml`](https://github.com/dillonzq/LoveIt/blob/master/exampleSite/config.toml) 中的菜单设置，配置网站根目录的 `hugo.toml`。
4. 推荐的内容文件结构和组织方式见[此处](https://github.com/dillonzq/LoveIt/tree/master/exampleSite)。
5. 要启用 LaTeX 风格的公式显示，在 `hugo.toml` 的 `params.page.math` 项下设置 `enable = true`。

## 添加图标

---

+ LoveIt 使用 [Font Awesome](https://fontawesome.com/icons) 提供的图标库，可以将图标融入文章内容。

+ 图标引用遵循 Markdown 语法。只需使用 `:icon_name:` 格式即可插入图标，具体的 `icon_name` 可在 Font Awesome 网站查找。

+ 例如，要插入代码图标，可以在[此处](https://fontawesome.com/icons/code?f=classic&s=solid)找到对应的 HTML 代码 `<i class="fa-solid fa-code"></i>`。随后使用 `:fa-solid fa-code:` 即可插入图标，其中 `fa-solid fa-code`（即 `icon_name`）直接取自该 HTML 代码。

## 参考文献 {#reference}

---

1. [Deploy Hugo Blog to Github Pages via Github Actions w/ a Custom Domain](https://www.youtube.com/watch?v=_QSr2_pxIJs)
2. [Deploying a Blog Powered by Hugo to Github Pages w/ Custom Domain via Github Actions](https://theplaybook.dev/docs/deploy-hugo-to-github-pages/)
3. [Hugo: Host on GitHub Pages](https://gohugo.io/hosting-and-deployment/hosting-on-github/)
4. [LoveIt 主题文档：内容](https://hugoloveit.com/theme-documentation-content/#fontawesome)
