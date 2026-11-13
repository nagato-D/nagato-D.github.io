+++
title = 'GDS 文件笔记'
author = 'Di Yu'
date = 2024-02-07
draft = false
+++

## 引言

---

[GDSII](https://en.wikipedia.org/wiki/GDSII) 是用于存储和传输集成电路设计版图的数据库文件格式，扩展名为 `.gds`。GDS 文件包含一系列平面几何图形，每个图形都对应一个图层编号。这些图形定义器件形状，相应图层编号则指定器件的制造顺序。GDS 格式广泛用于纳米加工，尤其是光刻：将 GDS 文件作为设计输入上传到光刻系统后，即可在晶圆上形成所需图形。因此，从事纳米加工需要掌握 GDS 文件的创建、编辑和查看方法。本笔记介绍这些内容，重点关注 GDS 文件在集成光子学中的应用。

## 编辑和查看 `gds` 文件

---

多个 Python 模块支持创建和编辑 GDS 文件，例如 [`gdspy`](https://gdspy.readthedocs.io/en/stable/) 和 [`PICwriter`](https://picwriter.readthedocs.io/en/latest/)。本课题组最常使用 `gdspy`，它可以直接创建光子集成电路的常见基本结构。为避免与其他 Python 模块发生版本冲突，建议在独立的 [`Anaconda`](https://www.anaconda.com/download) 环境中安装 `gdspy`。`gdspy` 的使用教程可见[此处](https://gdspy.readthedocs.io/en/stable/gettingstarted.html)。

GDS 文件是二进制文件，只能由特定软件解析。广泛使用的 GDS 查看工具之一是 [`KLayout`](https://www.klayout.de/)。`KLayout` 同样可以编辑 GDS 文件，其中两项很实用的功能是图层间布尔运算和图层属性编辑，下面分别介绍。

## 使用 `lydrc` 脚本进行布尔运算

---

`KLayout` 支持 GDS 文件不同图层之间的布尔运算，其计算开销远小于 `gdspy`，因此是一个值得选择的工具。在 `KLayout` 中有多种执行布尔运算的方法，最简单的方法是在 `Macros - Macro Development - DRC` 窗口中编写 `drc`（或 `lydrc`）脚本。

`lydrc` 脚本的基本语法比较简单。例如，下面的脚本从 `input.gds` 加载所有图层，并计算属于第 2 层、但不属于第 1 层或第 3 层的区域。结果将保存到名为 `output.gds` 的新 GDS 文件中。

```
source("input.gds")
target("output.gds")

layer_output = (input(2, 0) - input(1, 0)) - input(3, 0)
layer_output.merged.output(100)
```

## 使用 `lyp` 脚本保存和加载图层属性

---

在 GDS 文件中，每一层都分配了一个数字编号。这种编号方式可能不够直观，因为它不能表达图层的功能或材料。在显示 GDS 图形的初始界面中，可以右键单击图层编号，选择 `rename`，再输入新的图层名称。

需要注意，如果没有正确保存图层属性，新定义的图层标识将会丢失。通过 `File - Save Layer Properties` 可以保存图层属性，生成包含自定义图层标识的 `lyp` 脚本。以后只需把该 `lyp` 脚本拖入 `KLayout` 窗口，就能加载这些自定义图层标识。

{{< admonition type=note title="PDF 版本" open=false >}}
本笔记的 PDF 版本请见[此处](/posts/note-gds/Note_gds_file.pdf)。
{{< /admonition >}}