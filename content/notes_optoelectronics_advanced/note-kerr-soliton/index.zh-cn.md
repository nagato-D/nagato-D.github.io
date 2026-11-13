+++
title = "克尔孤子笔记"
author = 'Di Yu'
date = 2024-04-13
draft = false
+++

## 克尔非线性与孤子简介 {#introduction-to-kerr-nonlinearity-and-solitons}

---

克尔效应是指材料的折射率随外加电场强度线性变化的现象。由于光伴随着振荡电场，当光通过具有克尔效应的材料时，便可引起折射率变化。形式上，这种折射率变化写为 $\Delta n = n_{0}+n_{2}I$ [[1](#reference)]。其中，$n$ 表示折射率，$I$ 表示光强；$n_{0}$ 是光强为零时的折射率，$n_{2}$ 称为克尔系数或二阶非线性折射率。多种材料中都已观察到克尔效应，例如 Si3N4、Ti2O5、SiO2 和 MgF2。

克尔效应是一种典型的非线性光学效应。事实上，如果将依赖于光强的折射率代入麦克斯韦方程组，就可以得到包含非线性项的 $\mathbf{E}$ 的波动方程。这一方程不存在只在单一频率上振荡的解。相反，即使电场由做简谐振荡的偶极子激发，它也必须包含多个频率的振荡。在这种情况下，我们说电磁场的动力学是非线性的，而具有稳定波形的非线性动力学方程解称为孤子。

## 光纤孤子 {#fiber-solitons}

---

光纤孤子是在沿光纤传播时保持形状不变的光脉冲，其形成源于波导色散与克尔效应之间的精确平衡。这一概念于 1973 年由贝尔实验室的两位科学家长谷川晃（Akira Hasegawa）和 Frederick Tappert 在一系列开创性论文中首次提出 [[2,3](#reference)]。当时，波导色散被普遍视为一种令人困扰的效应，因为它会使光纤中传输的信号发生畸变。利用非线性效应抵消波导色散的提议立即引起了极大兴趣，尤其是光纤孤子在高速通信中的潜力。尽管如今工业界为了获得更高的信号容量和更低的成本，采用密集波分复用来替代孤子通信，光纤孤子仍然是学习非线性光学的良好起点。

这里，我们介绍一个解释光纤孤子基本动力学的简单解析模型 [[2,3](#reference)]。考虑一条有效折射率如下的单模波导：

$$
n = n_{0}(\omega)+i\chi(\omega)+n_{2}\overline{E^{2}},  \tag{1}
$$

其中，$\chi(\omega)>0$ 表征光学衰减，$n_{2}$ 描述克尔非线性。我们假设波导中的电场具有如下形式：

$$
E(x, r, t) = R(r){\rm Re}[{\phi(x, t)\exp[i(k_{0}x-\omega_{0}t)]}],  \tag{2}
$$

其中，$R_{r}$ 对应横向电场分布，$\phi(x, t)$ 表示波沿纵向的包络形状，$\exp[i(k_{0}x-\omega_{0}t)]$ 是满足 $ck_{0} = \omega_{0}n_{0}(\omega_{0})$ 的载波。

将式 1 和式 2 代入麦克斯韦方程组，并对径向坐标 $r$ 积分消去该变量，就可以得到包络的一维非线性波动方程：

$$
i(\frac{\partial\phi}{\partial t}+\omega_{0}'\frac{\partial\phi}{\partial x}+v_{0}\phi) + \frac{1}{2}\omega_{0}''\frac{\partial^{2}\phi}{\partial x^{2}} + \frac{\alpha\omega_{0}n_{2}}{n_{0}}|\phi|^{2}\phi = 0.  \tag{3}
$$

这里，$\omega_{0}' = \partial\omega_{0}/\partial k_{0}$ 是 $\omega_{0}$ 处的群速度，$\omega_{0}'' = \partial^{2}\omega_{0}/\partial k_{0}^{2}$ 表示 $\omega_{0}$ 处的群速度色散，$v_{0} = \chi(\omega_{0})\omega_{0}/n_{0}$ 是波导中经过缩放的光学损耗，$\alpha$ 是取决于电场径向分布 $R(r)$ 的无量纲量。

现在分析式 3 的物理意义。前两项描述以恒定群速度 $\omega_{0}'$ 平移的包络，第三、第四和第五项分别对应光学损耗、群速度色散和克尔非线性。

我们特别关注式 3 中具有稳定包络的解。这些包络可以在空间中移动，但波形必须保持不变。非线性方程的这类稳定解称为（克尔）孤子。在寻找式 3 的克尔孤子解时，我们分别处理 $\omega_{0}''>0$ 和 $\omega_{0}''<0$ 两种情况，因为它们的解集有显著不同。$\omega_{0}''>0$ 对应反常色散，意味着光的群速度随频率增加而增加。相反，$\omega_{0}''$ 表示正常色散，其特征是光的群速度随频率增加而降低。波导色散包含材料色散和几何色散两部分。通常，材料色散是正常色散；几何色散则可以是正常或反常色散，具体取决于光学约束是弱还是强。

### 亮孤子 {#bright-solitons}

如果波导具有反常色散（$\omega_{0}''>0$），式 3 存在光强同时在空间和时间上局域化的孤子解，即光脉冲。这些解称为亮孤子或亮脉冲，可以表示为：

$$
\phi(x, t) = E_{s}{\rm sech}(\frac{t-t_{0}-x/v_{g}}{\tau_{0}})\exp[i(kx-\Omega t)],  \tag{4}
$$

其中，$E_{s}$ 是最大场强，$\tau_{0}$ 是脉冲的时间半宽，$\Omega$ 是频移，$k$ 是波数偏移，$v_{g}$ 是脉冲的传播速度。这些量满足 $\Omega = k\omega_{0}'+\frac{1}{2}k^{2}\omega_{0}''-\alpha\omega_{0}n_{2}E_{s}^{2}/2n_{0}$、$v_{g} = \omega_{0}'+k\omega_{0}''$ 和 $E_{s}^{2} = n_{0}\omega_{0}''/\alpha\omega_{0}n_{2}v_{g}^{2}\tau_{0}^{2}$，而 $t_{0}$ 是脉冲中心。将求得的包络与载波结合，可以得到孤子的频率 $\omega_{c} = \omega_{0}+k\omega_{0}'+\frac{1}{2}k^{2}\omega_{0}''-\alpha\omega_{0}n_{2}E_{s}^{2}/2n_{0}$ 和波数 $k_{c} = k_{0}+k$。由于五个参数（$E_{s}, \tau_{0}, \Omega, k, v_{g}$）受到三个约束，因此有两个独立参数，可由初始条件任意选定。

### 暗孤子 {#dark-solitons}

如果波导具有正常色散（$\omega_{0}''<0$），式 3 存在称为暗孤子、暗脉冲或包络激波的解。这些解表现为恒定光强背景上的局域凹陷。暗孤子的形式为：

$$
\phi(x, t) = E_{s}{\rm tanh}(\frac{t-t_{0}-x/v_{g}}{\tau_{0}})\exp[i(kx-\Omega t)],  \tag{5}
$$

其中的符号与式 4 相同。各参数满足 $\Omega = k\omega_{0}'+\frac{1}{2}k^{2}\omega_{0}''-\alpha\omega_{0}n_{2}E_{s}^{2}/n_{0}$、$v_{g} = \omega_{0}'+k\omega_{0}''$ 和 $E_{s}^{2} = -n_{0}\omega_{0}''/\alpha\omega_{0}n_{2}v_{g}^{2}\tau_{0}^{2}$。

## 光学微谐振器中的耗散克尔孤子 {#dissipative-kerr-solitons-in-optical-microresonators}

---

光纤克尔孤子为相干多波长光源提供了一种优雅的实现方案。遗憾的是，其实现需要一台用于注入光脉冲的锁模激光器，还需要较大的空间来布置光纤。这使得基于光纤的孤子发生器昂贵且笨重，限制了其应用。因此，人们逐渐失去了对克尔孤子研究的兴趣。

但情况在 2007 年发生了变化：马克斯·普朗克量子光学研究所由 Tobias J. Kippenberg 教授（现任职于 EPFL）领导的研究团队展示了光学微谐振器能够产生克尔孤子 [[4](#reference)]。值得关注的是，微谐振器中的克尔孤子可由连续波激光器泵浦产生，且所需器件尺寸紧凑。此外，产生的克尔孤子具有由相干、等间距梳齿构成的频谱，称为光学频率梳，非常适合高速光通信、精密计量和激光雷达（LIDAR）等应用。微谐振器克尔孤子的这些特性在此后十年中引起了广泛研究兴趣。

这里，我们给出一个简单的物理图像，说明克尔孤子如何在具有克尔非线性的光学微谐振器中形成。首先，连续波激光器将光泵浦到谐振器的单个模式中。随后，在克尔非线性的作用下，谐振器内循环的连续波光逐渐局域化，形成光脉冲。在频域中，这种光波形的局域化对应于四波混频激发微谐振器的边带谐振。光脉冲在微谐振器中循环，每次通过与总线波导倏逝耦合的区域时，都会将部分能量输出到总线波导中。由此，总线波导中输出周期性的光脉冲序列，其频谱由等间距谱线组成。参考文献 [[5](#reference)] 给出了微谐振器克尔孤子形成过程的直观图示。

光纤克尔孤子与微谐振器克尔孤子之间有一些关键区别。首先，光纤孤子传播过程中没有外部能量输入，而微谐振器克尔孤子每次周期性通过总线波导耦合区域时都会获得外部增益。因此，微谐振器中克尔孤子的形成不仅涉及色散与非线性效应之间的平衡，还涉及增益与损耗之间的平衡。相比之下，光纤孤子的形成仅涉及色散与非线性效应之间的平衡。由于微谐振器克尔孤子形成于与环境交换能量的开放系统中，我们将其称为耗散克尔孤子（DKS）。

其次，微谐振器中的电磁场必须满足周期性条件。这使其向总线波导输出周期性的光脉冲序列，并使 DKS 具有离散的光学频谱。相比之下，光纤孤子不受周期性边界条件的约束，因此具有连续的光学频谱。当光纤孤子具有宽带连续光谱时，我们将其称为超连续谱 [[6](#reference)]。超连续谱也是近年来的一个研究热点。

### Lugiato–Lefever 理论形式 {#lugiato-lefever-formalism}

本节介绍定量描述微谐振器中耗散克尔孤子形成的 Lugiato–Lefever 方程（LLE）[[7](#reference)]。这一方程建立了非线性微谐振器中光场的时间演化关系，并解释孤子的形成。LLE 的推导思路很简单，只需对参考文献 [[8](#reference)] 中推导的模式方程进行变换；该文利用耦合模理论解释微谐振器中光学频率梳的形成。我们需要做的就是将模式复振幅方程转换为光场包络的微分方程。下面详细介绍这一变换过程。

微谐振器的每个模式都可以用一个整数编号。特别地，我们将被泵浦模式的编号记为 $l_{0}$。谐振器模式频率是模式编号的函数，可以表示为泰勒级数：

$$
\omega_{l} = \omega_{l_{0}}+\sum_{n=1}^{N}\frac{\zeta_{n}}{n!}(l-l_{0})^{n},  \tag{6}
$$

其中，$\omega_{l}$ 是第 $l$ 个模式的频率，$\zeta_{n}$ 是 $n$ 阶色散系数，$\zeta_{1}$ 为频率 $\omega_{l_{0}}$ 处的自由光谱范围。

利用耦合模理论／模式展开法，可以推导出谐振器模式复振幅所满足的一组方程 [[8](#reference)]：

$$
\frac{dA_{l}}{dt} = -\frac{1}{2}\Delta\omega_{l}A_{l}+\frac{1}{2}\Delta\omega_{l}F_{l}e^{i(\Omega_{0}-\omega_{l})t}\delta(l-l_{0})-ig_{0}\sum_{l_{m},l_{n},l_{p}}A_{l_m}A_{l_{n}}^{*}A_{l_{p}}e^{[i(\omega_{l_{m}}-\omega_{l_{n}}+\omega_{l_{p}}-\omega_{l})t]}\\
\times\Lambda_{l}^{l_{m}l_{n}l_{p}}\delta(l_{m}-l_{n}+l_{p}-l). (7)
$$

在这一方程中，$A_{l}$ 是第 $l$ 个模式的复振幅。模式场已进行归一化，使 $A_{l}$ 为无量纲量，并等于模式 $l$ 中的光子数。$\Delta\omega_{l} = \omega_{l}/Q_{0}$ 是模式 $l$ 的线宽，与加载品质因数 $Q_{0}$ 成反比。这里假设所有模式具有相同的加载品质因数。$F_{0}$ 是外部激励的振幅，$\Omega_{0}$ 表示泵浦光的角频率。$\delta(x)$ 是克罗内克函数，在 $x=0$ 时取 1，其余位置取 0。四波混频增益为 $g_{0} = n_{2}c\hbar\omega_{l_{0}}^{2}/n_{0}^{2}V_{0}$，其中，$\hbar$ 是约化普朗克常数，$n_{2}$ 是 $l = l_{0}$ 处的克尔系数，$V_{0}$ 是有效模体积。注意，$g_{0}$ 对应于被泵浦模式中存在一个光子时的非线性频移。$\Lambda_{l}^{l_{m}l_{n}l_{p}}$ 表示非线性增益随模式编号的变化，其来源是模式重叠和克尔系数的变化。

如果只考虑编号位于 $l_{0}$ 附近的模式，那么四波混频增益随模式编号的变化可以忽略，于是有 $\Lambda_{l}^{l_{m}l_{n}l_{p}} \approxeq 1$。当频谱接近或超过一个倍频程带宽时，这一近似不再适用。在这种情况下，必须保留 $\Lambda_{l}^{l_{m}l_{n}l_{p}}$ 的高阶泰勒展开项。采用最低阶近似时，有：

$$
\Lambda_{l}^{l_{m}l_{n}l_{p}} = 1+\eta_{l}(l-l_{0})+\eta_{l_{m}}(l_{m}-l_{0})+\eta_{l_{n}}(l_{n}-l_{0})+\eta_{l_{p}}(l_{p}-l_{0}),  \tag{8}
$$

其中，$\eta_{l} = \partial\Lambda/\partial l$ 在 $l=l_{m}=l_{n}=l_{p}=l_{0}$ 处取值。其他系数 $\eta_{l_{m}}$、$\eta_{l_{n}}$ 和 $\eta_{l_{p}}$ 采用类似方式定义。

由于模式重叠在 $l=l_{m}=l_{n}=l_{p}=l_{0}$ 时达到最大值，这些一阶贡献将主要由模体积变化引起的克尔系数变化决定。

根据模式振幅 $A_{l}$ 的定义，可以建立这些振幅与定义在实空间中的包络 $A = A(\theta, t)$ 之间的关系：

$$
A(\theta, t) = \sum_{l}A_{l}(t)\exp[i(\omega_{l}-\omega_{l_{0}})t-i(l-l_{0})\theta],  \tag{9}
$$

其中，$\theta \in [-\pi, \pi]$ 是沿圆周的方位角。注意，包络 $A(\theta, t)$ 定义在一个以角频率 $\omega_{l_{0}}$ 随时间振荡、以波数 $l_{0}$ 随空间振荡的坐标系中。选择这一坐标系可以简化 $A(\theta, t)$ 的时空动力学方程。

分别对式 9 两侧关于 $t$ 和 $\theta$ 求导，得到：

$$
\frac{\partial A}{\partial t} = \sum_{l}[\frac{dA_{l}}{dt}+i(\omega_{l}-\omega_{l_{0}})A_{l}]e^{[i(\omega_{l}-\omega_{l_{0}})t-i(l-l_{0})\theta]},  \tag{10}
$$

以及

$$
i^{n}\frac{\partial^{n}A}{\partial\theta^{n}} = \sum_{l}(l-l_{0})^{n}A_{l}e^{[i(\omega_{l}-\omega_{l_{0}})t-i(l-l_{0})\theta]}.  \tag{11}
$$

如果采用近似 $\Delta\omega_{l} = \Delta\omega_{l_{0}}$，并将式 7、式 8 和式 11 代入式 10，就得到：

$$
\frac{\partial A}{\partial t} = -\frac{1}{2}\Delta\omega_{l_{0}}A - ig_{0}|A|^{2}A + \frac{1}{2}\Delta\omega_{l_{0}}F_{0}e^{i\sigma t} + \sum_{n=1}^{N}i^{n+1}\frac{\zeta_{n}}{n!}\frac{\partial^{n}A}{\partial\theta^{n}}\\
+g_{0}[\eta_{l}\frac{\partial}{\partial\theta}(|A|^{2}A)+2\eta_{l_{m}}|A|^{2}\frac{\partial A}{\partial\theta}-\eta_{l_{n}}A^{2}\frac{\partial A^{*}}{\partial\theta}], (12)
$$

其中，$\sigma = \Omega_{0}-\omega_{l_{0}}$ 表示激光与被泵浦模式之间的失谐。式 12 考虑了非线性对频率的依赖，但忽略了吸收对频率的依赖。

通过坐标变换 $A \rightarrow A\exp(i\sigma t)$ 和 $\theta \rightarrow \theta+\zeta_{1}t {\rm mod} [2\pi]$，并采用 $\Lambda_{l}^{l_{m}l_{n}l_{p}} \approxeq 1$ 来忽略非线性对频率的依赖，可以大幅简化式 12。经过这些变换和近似，可得到关于 $A(\theta, t)$ 的一种 LLE 形式：

$$
\frac{\partial A}{\partial t} = -\frac{1}{2}\Delta\omega_{l_{0}}A-i\sigma A+\frac{1}{2}\Delta\omega_{l_{0}}F_{0}-ig_{0}|A|^{2}A-i\frac{\zeta_{2}}{2}\frac{\partial^{2}A}{\partial\theta^{2}}.  \tag{13}
$$

式 13 就是描述光学微谐振器中孤子形成的著名 LLE。只要可以忽略高阶色散，以及式 7 中 $\Delta\omega_{l}$ 和 $\Lambda_{l}^{l_{m}l_{n}l_{p}}$ 对频率的依赖，带周期性边界条件的这一 LLE 就与模式展开方程等价。此外，还可以将式 13 改写为 LLE 的归一化形式：

$$
\frac{\partial\psi}{\partial\tau} = -(1+i\alpha)\psi+i|\psi|^{2}\psi-i\frac{\beta}{2}\frac{\partial^{2}\psi}{\partial\theta^{2}}+F,  \tag{14}
$$

其中，场包络按下式重新缩放：

$$
\psi = \sqrt{2g_{0}/\Delta\omega_{l_{0}}}A^{*}
$$

时间也进行重新缩放，使得：

$$
\tau = \Delta\omega_{l_{0}}t/2.
$$

这一归一化方程中的无量纲参数分别是频率失谐 $\alpha = -2\sigma/\Delta\omega_{l_{0}}$、色散 $\beta = -2\zeta_{2}/\Delta\omega_{l_{0}}$，以及外部泵浦 $F = \sqrt{2g_{0}/\Delta\omega_{l_{0}}}F_{0}^{*}$。

{{< admonition type=note title="PDF 版本" open=false >}}
这篇笔记的 PDF 版本请参见[此处](/posts/note-kerr-soliton/Note_Kerr_soliton.pdf)。
{{< /admonition >}}

## 参考文献 {#reference}

---

1. https://en.wikipedia.org/wiki/Kerr_effect
2. Hasegawa, A., & Tappert, F. (1973). Transmission of stationary nonlinear optical pulses in dispersive dielectric fibers. I. Anomalous dispersion. Applied Physics Letters, 23(3), 142-144.
3. Hasegawa, A., & Tappert, F. (1973). Transmission of stationary nonlinear optical pulses in dispersive dielectric fibers. II. Normal dispersion. Applied Physics Letters, 23(4), 171-172.
4. Del'Haye, P., Schliesser, A., Arcizet, O., Wilken, T., Holzwarth, R., & Kippenberg, T. J. (2007). Optical frequency comb generation from a monolithic microresonator. Nature, 450(7173), 1214-1217.
5. Herr, T., Gorodetsky, M. L., & Kippenberg, T. J. (2016). Dissipative Kerr solitons in optical microresonators. Nonlinear optical cavity dynamics: from microresonators to fiber lasers, 129-162.
6. https://en.wikipedia.org/wiki/Supercontinuum
7. Chembo, Y. K., & Menyuk, C. R. (2013). Spatiotemporal Lugiato-Lefever formalism for Kerr-comb generation in whispering-gallery-mode resonators. Physical Review A, 87(5), 053852.
8. Chembo, Y. K., & Yu, N. (2010). Modal expansion approach to optical-frequency-comb generation with monolithic whispering-gallery-mode resonators. Physical Review A, 82(3), 033801.