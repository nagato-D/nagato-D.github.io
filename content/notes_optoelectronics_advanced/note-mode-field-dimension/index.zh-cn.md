+++
title = '近场模场尺寸与远场光斑关系笔记'
author = 'Di Yu'
date = 2024-07-24
draft = false
+++

对于半导体激光芯片，远场发散角与其出光端面处测得的模场尺寸直接相关。这一关系十分有用：既可以根据波导模场分布估算半导体激光器的远场光斑，也可以反过来推算。在本笔记中，我们介绍这一关系，并将其应用于一款商用半导体增益芯片（型号：[Thorlabs SAF1126C RSOA](https://www.thorlabs.com/thorproduct.cfm?partnumber=SAF1126C)），根据芯片的远场规格推导近场模场尺寸。

通常，半导体激光器输出到自由空间中的光束可以用高斯光束建模，因此有（来源：[维基百科](https://en.wikipedia.org/wiki/Rayleigh_length)）：

$$
D \approx \frac{4\lambda}{\pi\Theta_{\rm div}},
$$

其中，$D$ 是激光器出光端面处的模场尺寸，以光强降至最大光强的 $1/e^{2}$ 时的位置为界；$\lambda$ 是增益芯片的工作波长（=1550 nm）；$\Theta_{\rm div}$ 是以弧度表示的远场发散角，以发射光强降至最大光强的 $1/e^{2}$ 时的角度为界。上述方程建立了远场光斑与近场分布之间的关系，使我们可以由其中一个推导另一个。

现在，我们将近场与远场光斑之间的关系应用于 Thorlabs 增益芯片。在水平方向上，增益芯片的半高全宽（FWHM）发散角为 16 度（来源：[Thorlabs](https://www.thorlabs.com/newgrouppage9.cfm?objectgroup_id=3944&pn=SAF1126C)）。这对应于 $1/e^{2}$ 发散角 $\Theta_{\rm div} = 1.7\times 30/180\times\pi = 0.47$（弧度）。注意，高斯光束的 $1/e^{2}$ 发散角约为其 FWHM 发散角的 1.7 倍。将 $\Theta_{\rm div}$ 的值代入 $D_{x}$ 的表达式，得到：

$$
D_{x} \approx \frac{4\times 1.55\ {\rm um}}{\pi\times 0.47} = 4.2\ {\rm um}.
$$

类似地，利用垂直方向 30 度的 FWHM 发散角（对应于 $1/e^{2}$ 发散角 $\Theta_{\rm div} = 0.89$），可以计算增益芯片在垂直方向上的 $1/e^{2}$ 光束直径：

$$
D_{y} \approx \frac{4\times 1.55\ {\rm um}}{\pi\times 0.89} = 2.2\ {\rm um}.
$$

因此，根据远场规格估算，Thorlabs 增益芯片的模场尺寸为 4.2 um（水平方向）x 2.2 um（垂直方向）。
