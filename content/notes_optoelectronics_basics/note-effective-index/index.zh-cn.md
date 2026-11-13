+++
title = '有效折射率笔记'
author = 'Di Yu'
date = 2023-12-27
draft = false
+++

## 引言

---

光在波导中传播时，其相位会沿传播方向周期性变化。*有效折射率*衡量的是在相同光频率下，这种相位变化相对于真空中光波长的快慢。数学上，有效折射率记作 $n_{\rm eff}$，定义为 [[1](#references)]：

$$
n_{\rm eff} = \frac{\lambda}{2\pi}\beta = \frac{\beta}{k},
$$

其中，$\beta$ 表示波导中特定模式的传播常数。需要注意，不同波导模式具有不同的有效折射率，因此 $n_{\rm eff}$ 是模式序号的函数。

## 平板波导的有效折射率

---

*平板波导*是夹在两层低折射率材料之间的二维高折射率薄层。这种非均匀结构能够在中间层内形成受限光学模式，从而构成光波导。如果上下两层采用相同材料，则称这种波导为*对称平板波导*。

对称平板波导中受限模式的有效折射率可以通过解析计算求得。为简单起见，下面只讨论 TE 模。设中间层的折射率为 $n_{1}$，上下两层的折射率为 $n_{s}$。对于芯层厚度为 $2a$ 的平板波导，可用参考文献 [[2](#references)] 第 19 页中的方程计算有效折射率 $n_{\rm eff}$：

$$
v\sqrt{1-b} = \frac{m\pi}{2} + \tan^{-1}\sqrt{\frac{b}{1-b}},
$$

其中，$v = ka\sqrt{n_{1}^{2}-n_{s}^{2}}$，$b = (n_{\rm eff}^{2} - n_{s}^{2})/(n_{1}^{2} - n_{s}^{2})$。$m$ 是非负整数，表示模式序号。

下面给出平板波导第一个 TE 模的色散曲线。波导中间是厚度为 220 nm 的硅层，上下均为二氧化硅层。

{{< image src="/posts/note-effective-index/slab_waveguide_dispersion.png" caption="二氧化硅包围的 220 nm 厚硅层中 TE 模的有效折射率" >}}

## 代码

---

用于解析计算对称平板波导有效折射率的 MATLAB 代码位于 `Note_effective_index/effective_index_slab_wg.m`。

{{< admonition type=note title="PDF 版本" open=false >}}
本笔记的 PDF 版本请见[此处](/posts/note-effective-index/Note_effective_index.pdf)。
{{< /admonition >}}

## 参考文献 {#references}

---

1. https://www.rp-photonics.com/effective_refractive_index.html
2. Okamoto, K. (2021). Fundamentals of optical waveguides. Elsevier.