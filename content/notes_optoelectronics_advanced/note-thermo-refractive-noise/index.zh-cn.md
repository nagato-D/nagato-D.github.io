+++
title = '利用有限元分析计算热折射噪声笔记'
author = 'Di Yu'
date = 2025-05-01
draft = false
+++

## 引言 {#introduction}

---

小尺寸物体会由于与环境交换能量而经历随机温度涨落，这一现象称为热涨落。在光学微谐振器中，这些涨落通过热光效应引起谐振频率变化。这种谐振频率变化称为热折射噪声（TRN）。

TRN 是窄线宽半导体激光器中的重要噪声来源。在 10 kHz 至 100 kHz 的偏移频率范围内，它通常是占主导地位的噪声来源。此外，TRN 也为集成激光器在室温下实现亚 Hz 线宽带来挑战。

在本笔记中，我将解释如何利用 COMSOL 对氮化硅（SiN）微谐振器的热折射噪声进行数值仿真。仿真文件基于参考文献 [[1]](#reference) 和 [[2]](#reference) 所述方法开发，可通过此[链接](https://1drv.ms/u/c/5c6f2430cdc8a807/EapNIHibwkBEhXy896Tmq2kBSaURMjQ6RJQo2Y0emSLB6g?e=pa18l6)获取。本网页仅包含笔记的引言部分，完整内容可通过此[链接](/posts/note-thermo-refractive-noise/Note_thermorefractive_noise.pdf)获取。
