+++
title = '保偏光纤笔记'
author = 'Di Yu'
date = 2024-03-26
draft = false
+++

<!-- # Note on Polarization Maintained Fibers
**Created on** 2024-3-26\
**Author** Di Yu (yudi.0211@foxmail.com) -->

## 引言

---

具有圆对称截面的单模光纤不表现出双折射，即无论偏振状态如何，模式有效折射率都相同。由于这种偏振简并，在应变或弯曲等外部扰动下，两个独立偏振态很容易相互耦合。

保偏光纤（PM 光纤或 PMF）是一类通过人为引入双折射来工作的特殊光纤。双折射显著降低扰动引起的不同偏振态之间的耦合，使线偏振光即使受到外部扰动，也能在传播时维持自身偏振态。

## 分类

---

在保偏光纤中引入双折射通常有两种方法：

1. 制作椭圆形纤芯
2. 施加内部应力

两种方法都会破坏光纤截面的圆对称性，解除偏振简并。下图展示单模光纤、椭圆芯保偏光纤和内应力保偏光纤的截面。

{{< image src="/posts/note-pmf/fiber_cross_section.png" width="700" >}}

**图 1** 单模光纤、椭圆芯保偏光纤和内应力保偏光纤的截面 [[1](#reference)]。

利用内应力维持光偏振态的保偏光纤具有独特的熊猫形截面，如图所示。截面中的两个黑色圆形区域对称分布，其热膨胀系数与周围材料不同。制造后光纤冷却到环境温度时，这些圆形区域的收缩速度与光纤其余部分不同，从而向纤芯施加应力。该应力引起的双折射有助于保持传播光的偏振态。由于应力施加部分的独特外观，这种依赖内应力的保偏光纤也常称为 PANDA 光纤。

## 关键参数

---

保偏光纤的性能通常用两个偏振模式传播常数的相对差异表征。这一量称为模式双折射，定义为：

$$ B_m = \frac{\Delta\beta}{k_0}, $$

其中，$\Delta\beta$ 为两个独立偏振模式传播常数之差，$k_0 = 2\pi/\lambda_0$，$\lambda_0$ 为真空波长。典型保偏光纤的模式双折射大于 $10^{-4}$。

{{< admonition type=note title="PDF 版本" open=false >}}
本笔记的 PDF 版本请见[此处](/posts/note-pmf/Note_pmf.pdf)。
{{< /admonition >}}

## 参考文献 {#reference}

---

1. https://www.fiberlabs.com/glossary/polarization-maintaining-fiber