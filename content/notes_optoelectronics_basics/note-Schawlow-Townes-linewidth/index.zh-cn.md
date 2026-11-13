+++
title = 'Schawlow–Townes 线宽笔记'
author = 'Di Yu'
date = 2024-11-24
draft = false
+++

## 背景

---

1958 年，贝尔电话实验室的 A. L. Schawlow 和 C. H. Townes 发表了著名论文《Infrared and Optical Masers》，提出构建“工作于红外或光频段的脉泽”。这种如今称为激光器的器件，后来由 Theodore Maiman 于 1960 年实现。激光器作为高速通信、遥感和精密计量的光源，深刻影响了科学技术的发展。

本笔记推导受量子涨落限制的激光洛伦兹线宽，即 Schawlow–Townes 线宽。文献中也将其称为基本线宽或本征线宽。Schawlow 和 Townes 首次在 1958 年的论文中提出这一线宽，为高性能激光器的设计实践提供了重要认识。

## 预备知识

---

### 洛伦兹线形

洛伦兹线形是频率的函数，定义为：

$$
L(\nu) = \frac{1}{1 + (\frac{\nu-\nu_{0}}{w/2})^{2}},
$$

其中，$\nu_{0}$ 是最大值所在位置，$w$ 是函数的半高全宽（FWHM），通常称为洛伦兹线宽。许多共振现象的功率谱密度呈洛伦兹线形，因此这一函数具有重要应用价值。

下面推导与洛伦兹线形对应的时域信号 $s(t)$。其功率谱密度应满足 $|F(s)|^{2} = L(\nu)$，其中 $F$ 表示傅里叶变换。注意到

$$
L(\nu) = \frac{1}{(1+i\frac{\nu-\nu_{0}}{w/2})(1-i\frac{\nu-\nu_{0}}{w/2})} = |\frac{1}{(1+i\frac{\nu-\nu_{0}}{w/2})}|^{2}.
$$

因此，除一个相位因子 $e^{i\phi}$ 外，有 $F(s) = [1+i\frac{(\nu-\nu_{0})}{w/2}]^{-1}$。为简单起见，只考虑该相位因子为 1 的情况。对 $F(s)$ 进行傅里叶逆变换即可得到时域信号 $s(t)$（可参见维基百科的傅里叶变换表）：

$$
s(t) = \pi w\exp(-\pi wt + i2\pi\nu_{0}t)u(t),
$$

其中，$u(t)$ 是 Heaviside 单位阶跃函数。因此，洛伦兹线形对应时域中振幅指数衰减的振荡信号。振荡周期与洛伦兹线形的中心频率对应，强度衰减率 $\nu_{\rm decay}$ 等于洛伦兹线宽 $w$ 的 $2\pi$ 倍，即

$$
\nu_{\rm decay} = 2\pi w.  \tag{1}
$$

### 无源法布里–珀罗腔

考虑一个包含两面端镜和增益介质的法布里–珀罗（FP）腔，它可以构成激光器。本节推导腔内光学增益导致的激光线宽压窄效应。分析基于半经典模型，所得结果将用于推导 Schawlow–Townes 线宽表达式。

为简单起见，假定增益介质由一组二能级原子构成，其增益光谱宽度大于腔共振宽度。此外，假设 FP 腔的自由光谱范围（FSR）远大于增益谱带宽，使得只有一个纵模能够被激发而产生激光。

在小信号情形下，可以忽略受激辐射，腔内只有自发辐射和吸收。由于增益光谱在腔共振范围内近似均匀，FP 腔输出应具有与腔共振相同的光谱形状；这里已经假设端镜反射率与波长无关。此时 FP 腔输出光谱为洛伦兹线形，线宽为

$$
\Delta\nu_{L} = \frac{1}{2\pi}(\nu_{a}+\nu_{cp}) = \Delta\nu_{c} + \frac{\nu_{a}}{2\pi},  \tag{2}
$$

其中，$\Delta\nu_{L}$ 表示 FP 腔输出的洛伦兹线宽，$\Delta\nu_{c}$ 是没有介质吸收或增益时腔共振的半高全宽，$\nu_{a}$ 是介质吸收速率（对应光子数随时间变化为 $\phi \propto e^{-\nu_{a}t}$，其他光子损耗或增益速率的含义类似），$\nu_{cp}$ 是输出耦合速率。容易得到

$$
\nu_{cp} = -\frac{n_{g}L}{c\ln(R_{1}R_{2})},\\
\nu_{a} = cl = -cN\sigma,
$$

其中，$R_{1}$ 和 $R_{2}$ 是两面端镜的反射率，$L$ 是 FP 腔长，$n_{g}$ 是介质在腔共振波长处的群折射率，$l$ 是单位长度腔内损耗，$\sigma$ 是每个原子的有效截面（每个原子的光子吸收概率），$N$ 是激发态原子密度与基态原子密度之差。小信号情况下有 $N < 0$。

### 有源法布里–珀罗腔

现在增大腔内增益，使受激辐射速率不可忽略，并考察腔输出光谱如何变化。由于光学增益的存在，腔内光子寿命会增加。不过，只要腔内增益和损耗均匀分布，光强在腔内传播时呈指数变化，腔输出光谱仍为洛伦兹线形。根据傅里叶变换，腔输出的洛伦兹线宽为

$$
\Delta\nu_{L} = \frac{1}{2\pi}|\nu_{a}+\nu_{cp}-\nu_{st}| = \Delta\nu_{c}|1 + \frac{\nu_{a}-\nu_{st}}{2\pi\nu_{cp}}| = \Delta\nu_{c}|1 - cg\tau_{cp}|,  \tag{3}
$$

其中，$\nu_{st}$ 是受激辐射速率，$g = (\nu_{st} - \nu_{a})/c$ 是单位长度光学增益，$\tau_{cp} = 1/\nu_{cp}$ 是腔输出耦合速率的倒数。

由式 3 可见，增益增大时，腔输出线宽变窄，这就是线宽压窄效应。它解释了为什么激光的洛伦兹线宽可以远小于腔共振的半高全宽。

式 3 可以改写成更实用的形式。总自发辐射速率 $R_{sp} = \nu_{sp}$ 描述自发辐射对光子数变化率 $d\phi/dt$ 的贡献，并且与腔模光子数 $\phi$ 无关。相比之下，总受激辐射速率 $R_{st} = \nu_{st} \phi$、总介质吸收速率 $R_{a} = \nu_{a} \phi$ 和总输出耦合速率 $R_{cp} = \nu_{cp} \phi = \phi / \tau_{cp}$ 均正比于光子数 $\phi$。注意到

$$
cg\tau_{cp} = \frac{cg\phi}{\phi/\tau_{cp}} = \frac{R_{st}-R_{a}}{R_{cp}}.  \tag{4}
$$

将式 4 代入式 3，得到 FP 激光洛伦兹线宽 $\Delta\nu_{L}$ 与腔共振半高全宽 $\Delta\nu_{c}$ 之间一个简单而实用的关系：

$$
\Delta\nu_{L} = \Delta\nu_{c}|\frac{R_{cp}+R_{a}-R_{st}}{R_{cp}}|.  \tag{5}
$$

## Schawlow–Townes 线宽的推导

---

下面推导著名的 Schawlow–Townes 线宽表达式 [[2](#reference)]。它给出了由量子涨落决定的激光洛伦兹线宽下限。

需要注意，在 FP 激光器的稳态（例如连续波工作状态）下，受激辐射速率并不等于吸收速率与输出耦合速率之和，即 $R_{a}+R_{cp}-R_{st} \neq 0$。这一点很重要，否则根据式 3，腔输出线宽将为零，即 $\Delta\nu_{L} = 0$。由于存在自发辐射，实际稳态方程应为：

$$
R_{a} + R_{cp} - R_{st} - R_{sp} = (\nu_{a}+\nu_{cp}-\nu_{st})\phi - \nu_{sp} = 0,  \tag{6}
$$

其中，$\nu_{sp}$ 是自发辐射速率。

对于稳态工作的 FP 激光器，将式 6 代入式 5 即可求得输出的洛伦兹线宽。这样得到的方程清楚地展示了自发辐射对激光线宽的贡献：

$$
\Delta\nu_{L} = \Delta\nu_{c}\frac{R_{sp}}{R_{cp}}.  \tag{7}
$$

根据量子光学，总自发辐射速率 $R_{sp}$ 与总受激辐射速率 $R_{st}$ 的关系为 [[3](#reference)]

$$
R_{st} = \phi R_{sp},
$$

其中，$\phi$ 是与原子跃迁共振的腔模光子数。增益足够大时，受激辐射速率将显著大于自发辐射速率。如果大部分原子处于激发态，介质吸收也会很低，输出耦合将成为主要损耗机制。因此，

$$
R_{sp} = \frac{1}{\phi}R_{st} \approx \frac{1}{\phi}(R_{sp}+R_{st}) = \frac{1}{\phi}(R_{a}+R_{cp}) \approx \frac{1}{\phi}R_{a}.  \tag{8}
$$

将式 8 代入式 7，得到著名的 Schawlow–Townes 线宽表达式：

$$
\Delta\nu_{L} = \Delta\nu_{c}\frac{1}{\phi} = \Delta\nu_{c}\frac{1/\tau_{c}}{P_{\rm out}/h\nu_{c}} = \frac{2\pi h\nu_{c}(\Delta\nu_{c})^{2}}{P_{\rm out}},  \tag{9}
$$

其中，$\tau_{c} = 1/\nu_{cp} = 1/2\pi\Delta\nu_{c}$ 是腔输出耦合速率的倒数，$\nu_{c}$ 是腔模频率，也是激光工作频率，$P_{\rm out} = h\nu_{c}\phi/\tau_{c}$ 是 FP 激光器的输出功率。

## 关于 Schawlow–Townes 线宽的说明

---

Schawlow–Townes 线宽给出了受量子涨落限制的激光洛伦兹线宽，通常为 Hz 或 kHz 量级。然而，实际激光器存在各种技术噪声，其线宽通常比 Schawlow–Townes 线宽大若干个数量级，处于 kHz 或 MHz 量级。因此，可以将 Schawlow–Townes 线宽理解为仔细隔离所有技术噪声后能够达到的激光线宽；完全实现这一条件当然很困难。

一个重要结论是，Schawlow–Townes 线宽正比于腔共振线宽的平方，反比于激光输出功率。因此，在共振波长给定时，激光线宽随腔 Q 因数按 $Q^{2}$ 的反比关系压窄。这说明高 Q 腔对实现窄线宽激光器非常重要。此外，输出功率增大时，受激辐射速率上升，腔内相干放大更强；与此同时，自发辐射速率保持不变，从而减小相位起伏并压窄线宽。上述标度关系已经成为构建高性能激光器的基本原则。

## 参考文献 {#reference}

---

1. Schawlow, A. L., & Townes, C. H. (1958). Infrared and optical masers. Physical review, 112(6), 1940.
2. Pollnau, M., & Eichhorn, M. (2020). Spectral coherence, Part I: Passive-resonator linewidth, fundamental laser linewidth, and Schawlow-Townes approximation. Progress in quantum electronics, 72, 100255.
3. Gerry, C. C., & Knight, P. L. (2023). Introductory quantum optics. Cambridge university press.