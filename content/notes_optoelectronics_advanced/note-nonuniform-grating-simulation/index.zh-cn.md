+++
title = '非均匀光栅光谱数值仿真笔记'
author = 'Di Yu'
date = 2025-09-06
draft = false
+++

## 引言 {#introduction}

---

在本笔记中，我们介绍如何对周期或耦合系数（$\kappa$）随空间变化的布拉格光栅进行数值仿真。光栅周期的空间变化称为“啁啾”，耦合系数的空间变化则称为“切趾”。具有啁啾和切趾特性的光栅已广泛用于实际应用，包括密集波分复用（DWDM）通信和脉冲激光器的色散补偿。这里，我们详细介绍传输矩阵法及其基于 Python 的代码实现，并通过复现文献结果 [1] 验证代码实现的正确性。

这篇笔记的完整内容可在[此处](/posts/note-nonuniform-grating/Note_nonuniform_grating.pptx)获取。

1. Erdogan, T. (2002). Fiber grating spectra. Journal of lightwave technology, 15(8), 1277-1294.
2. [啁啾光栅仿真代码](https://1drv.ms/f/c/5c6f2430cdc8a807/ElUo0H2DKa1Bjsg9ks-a_PgBpozEsJx502zjztv4TBoPcA?e=Yopocf)
3. [切趾光栅仿真代码](https://1drv.ms/f/c/5c6f2430cdc8a807/ElgNHnGKJolJhuRayX9OlusB4PNDR-31p6JqvFSCSKMAPA?e=HopMIl)
