+++
title = '微环谐振器笔记（三）'
author = 'Di Yu'
date = 2024-12-06
draft = false
+++

本笔记所需的预备知识见[微环谐振器笔记（二）](https://nagato-d.github.io/notes_optoelectronics_basics/note-microring-resonator-ii/)。

## 引言

---

本笔记推导全通环形谐振器的耦合模方程（见图 1）。理论中纳入腔内背向散射，并分析由此导致的透射光谱共振谷分裂。

![](/posts/note-microring-resonator-III/fig1.png)

图 1 左：全通环；右：上下路环 [[1](#reference)]。

## 耦合模理论

---

全通环是与邻近总线波导通过倏逝场耦合的环形谐振器。用 $s_{in}$ 和 $s_{out}$ 分别表示总线波导中的输入和输出光场振幅，用 $a_{1}$ 和 $a_{2}$ 分别表示逆时针模式和顺时针模式的振幅。没有相互耦合时，这两个模式简并，其共振频率接近激光泵浦频率：$\omega_{c} \approx \omega$。环形谐振器的总功率衰减率为 $\gamma_{T}$，等于耦合引起的功率衰减率 $\gamma_{ex}$ 与本征损耗（吸收、辐射和散射）引起的功率衰减率 $\gamma_{in}$ 之和，即 $\gamma_{T} = \gamma_{in} + \gamma_{ex}$。输出耦合衰减率 $\gamma_{ex}$ 取决于环周长和耦合比，后文将详细说明。

### 耦合模方程的推导

采用唯象方法推导 $a_{1}$ 和 $a_{2}$ 的耦合模方程。没有泵浦光、耦合损耗及反向模式耦合时，每个模式在自身共振频率处振荡，其能量呈指数衰减。因此模式系数满足 $a_{1,2} \propto \exp(-i\omega_{c} - \gamma_{in}/2)$，相应运动方程应为 $da_{1,2}/dt = -(i\omega_{c}+\gamma_{in}/2)a_{1,2}$。考虑反向模式耦合以及环的输入和输出后，完整耦合模方程为：

$$
\frac{da_{1}}{dt} = -(i\omega_{c} + \frac{\gamma_{T}}{2})a_{1} + g_{12}a_{2} + \kappa s_{in},\\
\frac{da_{2}}{dt} = -(i\omega_{c} + \frac{\gamma_{T}}{2})a_{2} + g_{21}a_{1}.  \tag{1}
$$

这里，$g_{12}$、$g_{21}$ 和 $\kappa$ 是待定系数。

首先确定 $g_{12}$ 和 $g_{21}$。当环中没有耦合损耗和本征损耗，即 $\gamma_{T} = \gamma_{ex} = \gamma_{in} = 0$ 时，腔内功率应保持不变：$|a_{1}|^{2} + |a_{2}|^{2} = C$。将耦合模方程写为矩阵形式 $d\mathbf{a}/dt = i\mathbf{H}\mathbf{a}$，为保证能量守恒，$\mathbf{H}$ 必须是厄米矩阵。因此矩阵元必须满足 $H_{12} = H_{21}^{ * }$，即 $-ig_{12} = (-ig_{21})^{*}$。为简单起见，假设 $-ig_{12}$ 和 $-ig_{21}$ 均为实数，也就是 $-ig_{12} = -ig_{21} = g/2 \in \mathbb{R}$。于是可写成 $g_{12} = g_{21} = ig/2$，其中实数 $g$ 表示顺时针和逆时针模式之间的功率耦合速率。

接下来考虑输出耦合系数 $\kappa$。为简单起见，假设腔与激光的失谐足够小且没有模式耦合，即单圈相移接近 $2\pi$ 的整数倍，且 $g = 0$。腔内场的演化由耦合损耗和泵浦场振幅决定。耦合损耗只发生在光通过耦合器时，而本征损耗遍布整个环，这一区别使建模更复杂。不过，可以采用平均场近似，将依赖位置的耦合损耗替换为均匀分布的平均损耗。

在每个单圈时间间隔 $\tau_{rt} = n_{g}L/c$ 内，环中的光通过耦合器一次，使模式系数发生如下变化：

$$
\Delta a_{1} = i\sqrt{\theta}s_{in} + \sqrt{1-\theta}e^{-\alpha L/2-i\omega\tau_{rt}}a_{1} - a_{1}.  \tag{2}
$$

这里，$\theta$ 是功率耦合比，$\alpha$ 是功率衰减系数。由于单圈相移接近 $2\pi$ 的整数倍，故 $\exp(-i\omega\tau_{rt}) \approx 1$。为进一步简化，利用平均场近似作代换 $\Delta a_{1} = \frac{da_{1}}{dt}\tau_{rt}$。这相当于假定耦合损耗使模式系数 $a_{1}$ 连续变化，即将单圈耦合损耗平均到时间间隔 $\tau_{rt}$ 中。采用此代换，式 2 变为：

$$
\frac{da_{1}}{dt} = -i\omega a_{1} -\frac{\theta c}{2n_{g}L}a_{1} - \frac{\alpha c}{2n_{g}}a_{1} + i\frac{\sqrt{\theta}c}{n_{g}L}s_{in}.  \tag{3}
$$

式 3 的第一项表示耦合损耗，第二项表示本征损耗，第三项表示增益。推导时假定 $a$ 的单圈变化很小，并使用一阶近似 $\sqrt{1-\theta}e^{-\alpha L/2} \approx 1 - \frac{\theta}{2} - \frac{\alpha L}{2}$。比较式 1 和式 3，可得：

$$
\gamma_{in} = \frac{\alpha c}{n_{g}}, \gamma_{ex} = \frac{\theta c}{n_{g}L}, \kappa = i\frac{\sqrt{\theta}c}{n_{g}L}.  \tag{4}
$$

总线波导中的透射光场为：

$$
s_{out} = \sqrt{1-\theta}s_{in} + i\sqrt{\theta}a \approx s_{in} + i\sqrt{\theta}a,  \tag{5}
$$

当单圈功率耦合比 $\theta \ll 1$ 时，该近似成立。

### 包含模式耦合的耦合模方程

本节汇总前面推导的耦合模方程。对于同时具有逆时针和顺时针模式的全通环形谐振器，模式系数 $a_{1}$ 和 $a_{2}$ 的耦合模方程为 [[2](#reference)]：

$$
\frac{da_{1}}{dt} = -(i\omega_{c} + \frac{\gamma_{ex}+\gamma_{in}}{2})a_{1} + i\frac{g}{2}a_{2} + i\sqrt{\gamma_{ex}}s_{in}',  \tag{6.1}
$$

$$
\frac{da_{2}}{dt} = -(i\omega_{c} + \frac{\gamma_{ex}+\gamma_{in}}{2})a_{2} + i\frac{g}{2}a_{1},  \tag{6.2}
$$

$$
s_{out}' = s_{in}' + i\sqrt{\gamma_{ex}}a_{1}.  \tag{6.3}
$$

在这些方程中：

- $\omega_{c}$ 是无反向模式耦合时的模式共振频率。
- $s_{in}' = \sqrt{1/\tau_{rt}}s_{in}$ 和 $s_{out}' = \sqrt{1/\tau_{rt}}s_{out}$ 分别为缩放后的输入光场和透射光场振幅。其中，$\tau_{rt} = n_{g}L/c$ 表示单圈延迟。
- $\gamma_{in} = \alpha c/n_{g}$ 是本征衰减率，$\alpha$ 为强度衰减系数。
- $\gamma_{ex} = \theta c/n_{g}L$ 是耦合衰减率，$\theta$ 为单圈功率耦合比。
- $g$ 表示逆时针和顺时针模式之间的功率耦合速率。

### 存在模式分裂时的共振线形

下面推导存在背向散射的全通环形谐振器的稳态透射光谱。稳态时，模式振幅以激光频率 $\omega$ 振荡，因此 $da_{1}/dt = -i\omega a_{1}$，$da_{2}/dt = -i\omega a_{2}$。记总衰减率为 $\gamma_{T} = \gamma_{in}+\gamma_{ex}$，由式 6 的前两个方程可得：

$$
a_{2} = \frac{ig/2}{i\Delta\omega + \gamma_{T}/2}a_{1},  \tag{7.1}
$$
$$
a_{1} = \frac{ig/2}{i\Delta\omega + \gamma_{T}/2}a_{2} + \frac{i\sqrt{\gamma_{ex}}}{i\Delta\omega + \gamma_{T}/2}s_{in}'.  \tag{7.2}
$$

其中，$\Delta\omega = \omega$ 表示模式共振频率相对于激光频率的失谐。将第一个方程代入第二个方程，得到：

$$
i\sqrt{\gamma_{ex}}a_{1} = s_{in}' \times \[ -\frac{\gamma_{ex}/2}{i(\Delta\omega+g/2)+\gamma_{T}/2} - \frac{\gamma_{ex}/2}{i(\Delta\omega-g/2)+\gamma_{T}/2} \].  \tag{8}
$$

接着将式 8 代入式 6 的第三个方程，可得全通环的透射光谱：

$$
|\frac{s_{out}'}{s_{in}'}|^{2} = |1 - \frac{\gamma_{ex}/2}{i(\Delta\omega-g/2)+\gamma_{T}/2} - \frac{\gamma_{ex}/2}{i(\Delta\omega+g/2)+\gamma_{T}/2}|^{2}.  \tag{9}
$$

该表达式表明，透射光谱有两个共振谷，分别位于 $\omega_{0} + g / 2$ 和 $\omega_{0} - g / 2$，其中 $\omega_{0}$ 是没有模式耦合时的共振频率。也就是说，逆时针和顺时针模式之间的耦合解除简并，造成大小为 $g$ 的模式分裂。当共振半高全宽相对较小，即 $\gamma_{T} < g$ 时，可以在全通环透射光谱中观察到分裂；否则，两个共振谷会合并，看起来像单个洛伦兹共振谷。

本笔记的 PDF 版本见[此处](/posts/note-microring-resonator-III/Note_ring_resonator_III.pdf)。

## 参考文献 {#reference}

---

1. Bogaerts, W., De Heyn, P., Van Vaerenbergh, T., De Vos, K., Kumar Selvaraja, S., Claes, T., ... & Baets, R. (2012). Silicon microring resonators. Laser & Photonics Reviews, 6(1), 47-73.
2. Puckett, M. W., Liu, K., Chauhan, N., Zhao, Q., Jin, N., Cheng, H., ... & Blumenthal, D. J. (2021). 422 Million intrinsic quality factor planar integrated all-waveguide resonator with sub-MHz linewidth. Nature communications, 12(1), 934.