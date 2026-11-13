+++
title = '激光噪声笔记'
author = 'Di Yu'
date = 2023-11-28
draft = false
+++

## 基本概念
---
### 傅里叶变换
给定信号 $x(t)$，其傅里叶变换为
$$
\hat{x}(f) = \int_{-\infty}^{\infty}\exp(-i2\pi ft)x(t)dt.  \tag{1}
$$

### 功率谱密度（光谱线形）
信号的功率谱密度描述功率在各个频率分量之间的分布。功率谱的计算涉及傅里叶变换，但平稳过程信号的傅里叶变换可能发散。即便如此，仍然可以定义平稳过程信号的功率谱密度。

信号 $x(t)$ 的平均功率为
$$
P = \lim_{T\rightarrow\infty}\frac{1}{T}\int_{t_{0}-T/2}^{t_{0}+T/2}|x(t)|^{2}dt,
$$
其中，$t_{0}$ 为任意时刻。这个功率表达式还可以写成另一种形式。令 $x_{T}(t) = x(t)\omega_{T}(t)$，其中 $\omega_{T}(t)$ 在长度为 T 的时间窗口内等于 1，在其他时刻为 0。于是
$$
P = \lim_{T\rightarrow\infty}\frac{1}{T}\int_{-\infty}^{\infty}|x_{T}(t)|^{2}dt.
$$

根据帕塞瓦尔定理，有

$$
P = \lim_{T\rightarrow\infty}\frac{1}{T}\int_{-\infty}^{\infty}|\hat{x}_{T}(f)|^{2}df
$$

$$
= \int_{-\infty}^{\infty}\lim_{T\rightarrow\infty}\frac{1}{T}|\hat{x}_{T}(f)|^{2}df.
$$

功率谱密度即可定义为上式中的被积函数（见 [1](#references)）。
$$
S_{xx}(f) = \lim_{T\rightarrow\infty}\frac{1}{T}|\hat{x}_{T}(f)|^{2}.  \tag{2}
$$

### 相位噪声
这里讨论一类特定信号——激光输出。实际激光必然存在瞬时相位起伏 $\delta\phi(t)$。相位噪声通常用其功率谱密度表征，记为 $S_{\phi}(f)$。

### 频率噪声
当激光相位发生起伏时，其频率也会随之波动而变得不稳定。频率起伏为
$$
\delta\nu(t) = \frac{1}{2\pi}\frac{d\phi}{dt}.
$$

实际上，相位噪声和频率噪声本质上都描述激光的瞬时相位起伏。频率噪声通常用功率谱密度 $S_{\nu}(f)$ 表征。$S_{\phi}(f)$ 和 $S_{\nu}(f)$ 之间存在简单关系（见 [2](#references)）：
$$
S_{\phi}(f) = \frac{S_{\nu}(f)}{f^{2}}.  \tag{3}
$$

由于相位起伏，激光的功率谱密度会偏离理想的狄拉克 delta 函数，形成具有有限宽度的谱线。这条谱线的半高全宽（FWHM）定义为激光线宽。

激光线宽 $\Delta\nu_{\rm int}$、频率噪声功率谱密度 $S_{\nu}(f)$ 和相位噪声功率谱密度 $S_{\phi}(f)$ 之间有如下简单关系（见 [2](#references)）：
$$
\int_{\Delta\nu_{\rm int}}^{\infty}S_{\phi}(f)df = \int_{\Delta\nu_{\rm int}}^{\infty}\frac{S_{\nu}(f)}{f^{2}}df = \frac{1}{\pi}\mathrm{rad}^{2}.  \tag{4}
$$

### 噪声来源
激光输出噪声通常主要包含白噪声和闪烁噪声（1/f 噪声），详见 [3](#references)。白噪声源于自发辐射，闪烁噪声则源于激光腔、驱动电路等各种因素的起伏。在频率噪声功率谱密度中，白噪声表现为水平平台，而闪烁噪声表现为低频侧的 1/f 区域。

{{< image src="/posts/note-laser-noise/typical_frequency_noise_PSD.png" caption="典型的频率噪声功率谱密度" >}}

文献 [4](#references) 中通常报告所谓的**基本／本征／Schawlow–Townes／量子噪声极限洛伦兹线宽**，它等于白噪声强度的 $\pi$ 倍。这一线宽应与实际光谱线形的半高全宽区分开来。光谱线形的半高全宽称为积分线宽，它同时包含白噪声（量子噪声）和 1/f 噪声（电噪声）的影响，因此总是大于基本线宽。

### 相对强度噪声
相对强度噪声（RIN）描述激光功率的起伏，是分析光纤通信和激光雷达遥感所用激光器的重要指标。与依赖激光输出相位的频率噪声或激光线宽不同，RIN 只与振幅有关，通常以 dB/Hz 为单位。例如，激光输出相位突然跳变 π 会影响频率噪声或激光线宽，却不会改变 RIN。

{{< admonition type=note title="PDF 版本" open=false >}}
本笔记的 PDF 版本请见[此处](/posts/note-laser-noise/Note_laser_noise.pdf)。
{{< /admonition >}}

## 参考文献 {#references}
---
1. https://en.wikipedia.org/wiki/Spectral_density
2. Tran, M. A., Huang, D., & Bowers, J. E. (2019). Tutorial on narrow linewidth tunable semiconductor lasers using Si/III-V heterogeneous integration. APL photonics, 4(11).
3. https://emcore.com/wp-content/uploads/2021/04/EMCORE-Laser-Linewidth-Frequency-Noise-and-Measurement.pdf
4. Tran, M. A., Huang, D., Guo, J., Komljenovic, T., Morton, P. A., & Bowers, J. E. (2019). Ring-resonator based widely-tunable narrow-linewidth Si/InP integrated lasers. IEEE Journal of Selected Topics in Quantum Electronics, 26(2), 1-14.