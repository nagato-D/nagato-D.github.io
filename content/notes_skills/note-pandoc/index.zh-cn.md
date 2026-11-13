+++
title = 'Pandoc 使用笔记：将 Markdown 转换为 TeX/PDF'
author = 'Di Yu'
date = 2023-12-18
draft = false
+++

<!-- # Pandoc 使用指南：将 Markdown 转换为 LaTeX/PDF
**创建日期** 2023-12-18\
**作者** Di Yu (yudi.0211@foxmail.com) -->

{{< admonition type=note title="PDF 版本" open=false >}}
本笔记的 PDF 原文版本请见[此处](/posts/note-pandoc/Note_pandoc_usage.pdf)。
{{< /admonition >}}

## 引言

---

[`Pandoc`](https://pandoc.org/) 是一个功能丰富的工具，可以方便地将 Markdown 文件转换为 LaTeX、PDF、DOCX、HTML 等格式。借助 `Pandoc`，我们可以用 Markdown 编写文档，再轻松转换为所需的输出格式。相比直接使用 LaTeX 或 HTML 撰写文稿，这种方法大幅简化了文档的写作和组织过程。

## 安装

---

1. 下载 [TeX Live ISO](https://mirror-hk.koddos.net/CTAN/systems/texlive/Images/) 并安装。
2. 安装 [Pandoc](https://pandoc.org/installing.html)。

## 使用方法

---

### 创建 Markdown 文件

使用 `Pandoc` 之前，需要先创建 Markdown 文件。Markdown 语法介绍见[此处](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)。推荐使用 VS Code，并安装 `Markdown All in One` 和 `Markdown Preview Enhanced` 扩展来编写 Markdown 文件。

### 插入图片

`Pandoc` 可以将标准的图片插入指令 `![caption](figure_path)` 转换为相应的 LaTeX 指令 `\begin{figure} ... \end{figure}`。问题在于如何指定图片的大小和位置。下面给出一些方法：

+ 要指定图片大小（例如将图片宽度设为 300 px），可使用 Markdown 指令 `![caption](figure_path){width=300px}`。
+ 要让图片在 Markdown 中居中，可以使用如下 HTML 指令：

```
<center>

![caption](figure_path){width=300px}

</center>
```

+ 注意，应在 `<center>`（`</center>`）和图片插入指令 `![caption](figure_path){width=300px}` 之间加入空行。
+ 如果 `caption` 留空，LaTeX 中的图片将不会居中，而是左对齐。
+ `figure_path` 中的所有空格都应替换为 `%20`，否则图片无法正常显示。
+ 如果希望两张图片并排显示，将两条图片插入指令连续放置，中间用空格而非换行分隔，例如 `![caption1](figure1) ![caption2](figure2)`。

### 设置 PDF 页边距

要控制 `Pandoc` 将 Markdown 文件转换为 PDF 时的页边距，可以在 Markdown 文件中加入以下头部：

```
---
geometry: margin=1in
---
```

### 自定义 LaTeX 模板

如果希望自定义 `Pandoc` 生成 LaTeX 或 PDF 文件时使用的 LaTeX 模板，可以切换到输入 Markdown 所在文件夹，新建 `pandoc` 文件夹，并在其中创建 `pandoc_template.latex` 文件。要在转换时启用该模板，请使用如下 `Pandoc` 命令：

```
pandoc input.md -o output.tex --template=./pandoc/pandoc_template.latex
```

请将 `input.md` 和 `output.tex` 替换为输入和输出文档的文件名。

我为 `Pandoc` 制作了一个 LaTeX 模板，生成的 PDF 外观接近原生 LaTeX，下载地址见[此处](/posts/note-pandoc/pandoc_template.latex)。该模板基于 `Pandoc` 默认模板修改，包含以下调整：

### 插入通栏水平线

若希望在 `Pandoc` 生成的 LaTeX/PDF 文档中插入通栏水平线，效果类似 Markdown 中的 `---`，需注意以下几点：

1. 在输入 Markdown 中，确保 `---` 与其他文本之间有空行。
2. 使用自定义 LaTeX 模板，并在模板文件中加入重新定义水平线函数（`rule`）的命令，否则水平线不会占满整行。
3. 重新定义的命令如下：

```
\let\OldRule\rule
\renewcommand{\rule}[2]{\OldRule{\linewidth}{#2}}
```

### 多行公式

在 Markdown 中，可以在每行公式之后加入 `\\` 来创建多行公式。然而，`Pandoc` 将 Markdown 转换为 LaTeX 后，这一换行命令会保留在 LaTeX 文件中，却不会在最终 PDF 中呈现为换行。

一个简单的解决方法是重新定义 `Pandoc` 默认的公式渲染方式。具体而言，`Pandoc` 使用 `\[ \]` 定义 LaTeX 公式；我们可以在它的 LaTeX 模板中加入以下重定义命令，将每个公式放入 `\begin{align*} \end{align}*` 环境，从而支持使用 `\\` 换行。

```
\def\[#1\]{%
  \begin{align*}#1\end{align*}%
}
```
