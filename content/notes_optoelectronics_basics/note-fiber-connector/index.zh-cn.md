+++
title = '光纤连接器笔记'
author = 'Di Yu'
date = 2024-03-14
draft = false
+++

## FC 连接器

---

FC（Fiber Channel）连接器是一种使用陶瓷插芯来保护并对准光纤端头的光纤连接器。下图展示了典型的 FC 连接器。

{{< image src="/posts/note-fiber-connector/FC_connector.jpg" height=150 >}} {{< image src="/posts/note-fiber-connector/ferrule.png" height=150 >}}

**图 1** 左：FC 连接器照片 [[1](#reference)]。右：FC 连接器插芯示意图 [[2](#reference)]。

## 端面研磨方式

---

为了保证高质量的信号传输，光纤连接器需要具有较低的插入损耗和背向反射。这两个指标是衡量连接器性能的主要参数。工程师通过研磨连接器的插芯表面来降低插入损耗和回波损耗。常见研磨方式有 PC、UPC 和 APC 三种，对应不同的插芯形状。

### PC

PC（physical contact，物理接触）连接器采用平坦的插芯端面，消除光纤芯之间的空气隙，从而减小插入损耗。不过，由于约为 -40 dB 的较高回波水平，这种连接器已逐渐过时。

{{< image src="/posts/note-fiber-connector/FCPC_connector.jpg" width=400 >}}

**图 2** PC 光纤连接器 [[2](#reference)]

### UPC

UPC（ultra physical contact，超物理接触）连接器是 PC 连接器的改进版本。它采用渐缩的端面来降低背向反射，回波水平约为 -50 dB，比 PC 连接器低 10 dB。但是，频繁插拔容易损坏 UPC 连接器，导致性能下降。

{{< image src="/posts/note-fiber-connector/FCUPC_connector.jpg" width=400 >}}

**图 3** UPC 光纤连接器 [[2](#reference)]

### APC

APC（angled physical contact，斜面物理接触）连接器具有倾斜的端面。8 度的端面倾角有助于降低回波水平。在常见光纤连接器中，APC 连接器的反射通常最低，约为 -60 dB。APC 连接器必须与另一只 APC 连接器对接，才能保证合适的界面接触；否则可能造成机械损伤并产生较大的插入损耗。

{{< image src="/posts/note-fiber-connector/FCAPC_connector.jpg" width=400 >}}

**图 4** APC 光纤连接器 [[2](#reference)]

### PC、UPC 和 APC 连接器的比较

由于回波水平最低，APC 连接器适用于对信号传输保真度要求较高的场景。PC 和 UPC 连接器则适用于回波要求没有那么严格的场景。光纤连接器的颜色可以表示研磨类型：APC 连接器为绿色，PC 或 UPC 连接器为蓝色。

{{< admonition type=note title="PDF 版本" open=false >}}
本笔记的 PDF 版本请见[此处](/posts/note-fiber-connector/Note_fiber_connectors.pdf)。
{{< /admonition >}}

## 参考文献 {#reference}

---

1. https://en.wikipedia.org/wiki/FC_connector
2. https://community.fs.com/article/pc-vs-upc-vs-apc-connector-selecting-the-right-fiber-connector-type.html