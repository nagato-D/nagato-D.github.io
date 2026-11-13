+++
title = '微环谐振器笔记（二）'
author = 'Di Yu'
date = 2024-12-05
draft = false
+++

## 引言

---

环形谐振器是集成光子电路的基本组件，可作为紧凑的窄带光学滤波器，用于激光器、调制器和复用／解复用器。环形谐振器与总线波导有两种常见耦合结构：全通环和上下路环，如图 1 所示。在全通环结构中，总线波导与环形谐振器通过倏逝场耦合，选择性地抽取并耗散共振频率处的泵浦光，同时使其他光信号以很小损耗通过。上下路环则把共振频率处的泵浦光从下方波导传输到上方波导，避免其在环内耗散。本笔记利用耦合模理论分析全通环的传输特性。

![](/posts/note-microring-resonator-II/fig1.png)

左：全通环；右：上下路环 [[1](#reference)]。

## 环形谐振器的耦合模理论

---

### 全通环的透射率

对于图 1 左侧的全通环结构，定义单圈振幅衰减因子为 $a$，振幅自耦合系数为 $r$。具体而言，光在环中循环一周时，由散射、辐射等本征损耗引起的强度衰减为 $a^{2} = e^{-\alpha L}$，其中 $\alpha$ 为衰减系数，$L$ 为环周长。此外，环与总线波导之间的功率耦合比为 $|k|^{2} = 1 - |r|^{2}$，其中 $r = \cos(\kappa l)$ 和 $k = -j\sin(\kappa l)$ 分别表示振幅自耦合系数和交叉耦合系数，$\kappa$ 和 $l$ 分别是耦合强度和耦合区长度。需要注意，$k$ 与 $r$ 之间存在 $\pi/2$ 的相位差；这一相位因子的推导可见参考文献 [[1](#reference)] 第 4.1 节。

透射场振幅正比于输入场振幅，两者之比为 [[1](#reference)]：

$$
\frac{E_{\rm pass}}{E_{\rm input}} = r + k^{2}(ae^{-i\phi} + a^{2}re^{-i2\phi} + a^{3}r^{2}e^{-i3\phi} + ...)\\
= \frac{r-ae^{-i\phi}}{1-are^{-i\phi}}.  \tag{1}
$$

其中，$\phi = \beta L$ 为单圈相移，$\beta$ 为环的传播常数。

对式 1 两侧取绝对值的平方，可得全通环的透射率：

$$
T = |\frac{E_{\rm pass}}{E_{\rm input}}|^{2} = \frac{a^{2} - 2ar\cos\phi + r^{2}}{1 - 2ar\cos\phi + (ar)^{2}}.  \tag{2}
$$

为更清楚地展示全通环透射率对频率的依赖，把式 2 改写为

$$
T = 1 - \frac{(1-a^{2})(1-r^{2})}{1-2ar\cos\phi+(ar)^{2}}.  \tag{3}
$$

由于 $0 < a, r < 1$，全通环透射率在 $\phi = 2N\pi$（$N = 1, 2, ...$）处取得局部最小值。这些最小值对应透射光谱在频率 $f = N \times c/n_{\rm eff}L$ 处的谷，其中 $n_{\rm eff}$ 为模式有效折射率。这些谷对应环形谐振器的共振频率，通常称为共振谷。

环形谐振器在波长 $\lambda$ 附近的自由光谱范围（FSR）定义为相邻两个共振波长之间的光谱间隔，其表达式为

$$
{\rm FSR}_{f} = \frac{c}{n_gL}.
$$

这里，$n_{g} = n_{\rm eff} - \lambda dn_{\rm eff}/d\lambda$ 表示环在波长 $\lambda$ 处的群折射率。

### 洛伦兹线形与 Q 因数

精细度由 FSR 与共振谷半高全宽（也称共振宽度）的比值确定。当环的精细度远大于 1 时，共振宽度所对应的单圈相移 $\phi$ 变化量相对于 $2\pi$ 很小。此时，可以在共振频率 $\omega$ 附近对全通环透射率作泰勒展开，近似描述共振谷的形状：

$$
T = 1 - \frac{(1-a^{2})(1-r^{2})}{(1-ar)^{2}+ar(\Delta\omega t_{\rm rt})^{2}}\\
= 1 - \frac{h}{1 + (\frac{\Delta\omega}{w/2})^{2}},  \tag{4}
$$

其中，$\Delta\omega$ 表示相对于共振频率的失谐，$t_{rt} = n_{g}L/c$ 为单圈时间，$h = \frac{(1-a^{2})(1-r^{2})}{(1-ar)^{2}}$ 为共振谷深度，$w = 2\frac{1-ar}{\sqrt{ar}}\frac{c}{n_{g}L}$ 为共振谷的半高全宽，$n_{g} = n_{\rm eff}+f\frac{dn_{\rm eff}}{df} = n_{\rm eff}-\lambda\frac{dn_{\rm eff}}{d\lambda}$ 为群折射率。最小透射率为 $T_{\rm min} = T(\Delta\omega = 0) = \frac{(r-a)^{2}}{(1-ra)^{2}}$。

需要注意，泰勒展开只在共振频率附近进行。全通环的最大透射率位于所有共振谷之外，远离共振频率，因此不能用这一展开计算最大透射率。应改用式 3，并令 $\phi = (2N+1)\pi$，其中 $N$ 为某个非负整数。由此得到 $T_{\rm max} = \frac{(r+a)^{2}}{(1+ra)^{2}}$ [[2](#reference)]。综上，全通环共振谷的半高全宽和消光比可由下式求得：

$$
{\rm FWHM}_{\omega} = w = 2\frac{1-ar}{\sqrt{ar}}\frac{c}{n_gL},  \tag{5.1}
$$

$$
{\rm ER} = \frac{T_{\max}}{T_{\min}} = \frac{(r+a)^{2}(1-ra)^{2}}{(1+ra)^{2}(r-a)^{2}}.  \tag{5.2}
$$

$1 - T = h/[1+(\Delta\omega/(w/2))^{2}]$ 是高度为 $h$、半高全宽为 $w$ 的标准洛伦兹线形。通过傅里叶变换可以证明，这一频域中的洛伦兹共振谷对应指数衰减的时域信号 $s(t) \propto \exp(-wt/2-i\omega t)$，即典型的阻尼振荡。该时域信号实际描述腔内光场振幅的演化，腔内功率为 $P \propto |s(t)|^{2} = \exp(-wt)$。因此，以角频率为横轴、功率透射率为纵轴的透射光谱中，共振谷半高全宽等于腔内功率衰减率 $|\frac{1}{P}\frac{dP}{dt}| = w$。

一般而言，阻尼振荡的衰减速率可用 Q 因数表征，其定义为 $Q = \omega/w = 2\pi\tau/T$。其中，$w$ 为功率衰减率，$\omega$ 为振荡角频率，$\tau = 1/w$ 为衰减时间，$T = 2\pi/\omega$ 为振荡周期。对于与总线波导耦合（或加载）的环形谐振器，本征损耗 $a$ 和耦合损耗 $r$ 都对 $\omega$ 有贡献，并共同决定 $Q$，此时称为加载 Q 因数。随着环与总线波导之间的耦合减弱，加载 Q 因数将趋近于仅由本征损耗决定的值。该值称为本征 Q 因数，可在假定无耦合损耗（$r = 1$）时求得。

本笔记的 PDF 版本见[此处](/posts/note-microring-resonator-II/Note_ring_resonator_II.pdf)。

## 参考文献 {#reference}

---

1. Okamoto, K. (2010). Fundamentals of optical waveguides. Elsevier.
2. Bogaerts, W., De Heyn, P., Van Vaerenbergh, T., De Vos, K., Kumar Selvaraja, S., Claes, T., ... & Baets, R. (2012). Silicon microring resonators. Laser & Photonics Reviews, 6(1), 47-73.