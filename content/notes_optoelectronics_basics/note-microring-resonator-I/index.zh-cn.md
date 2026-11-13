+++
title = '微环谐振器笔记（一）'
author = 'Di Yu'
date = 2023-12-19
draft = false
+++

## 引言

---

在集成光子学中，谐振器通常由闭合波导构成，称为“环形谐振器”。环形谐振器结构紧凑，并具有高度波长选择性的传输特性，因此成为集成光子学的基本单元，广泛用于滤波器、传感器和调制器等器件 [[1](#reference)]。本笔记介绍环形谐振器的基本性质，并简要讨论这些性质与材料及制造工艺的联系。

## 符号说明

---
+ $Q_{\rm int}$ (1)：本征品质因数
+ $Q_{\rm ext}$ (1)：外部品质因数
+ $Q_{\rm load}$ (1)：加载品质因数
+ $T$ (1)：强度透射率
+ $\lambda$ (m)：真空中的光波长
+ $n_{\rm eff}$ (1)：谐振器的有效折射率
+ $n_{g}$ (1)：谐振器的群折射率
+ $L$ (m)：谐振器周长
+ $\kappa$ (1)：谐振器的功率输出耦合比
+ $\alpha_{i}$ (1/m)：谐振器内部的强度衰减系数
+ $\gamma$ (1)：谐振器的强度插入损耗／额外耦合损耗
+ ${\rm FWHM}$ (m)：共振峰的半高全宽

## 品质因数

---

谐振器的*本征（内部）Q 因数*描述孤立谐振器内的光子寿命，以电磁波振荡周期为单位，并乘以系数 $2\pi$。因此，谐振器的本征 Q 因数为 [[2](#reference)]：

$$Q_{\rm int} = \frac{2\pi n_{\rm eff}}{\alpha_{i}\lambda}$$

需要注意，$\alpha$ 包含两类光学损耗：直波导段或恒定曲率波导中的传播损耗，以及环形谐振器曲率变化处的弯曲损耗。采用欧拉螺线弯曲波导构成谐振器，可以避免波导曲率突变，从而减小后一类损耗。

*外部 Q 因数*量化波导耦合器对谐振器内光子寿命的影响。外部 Q 因数受到两种因素影响：功率输出耦合，以及耦合器中由非绝热模式转换、散射、模式泄漏或辐射引起的额外耦合损耗。其表达式为：

$$Q_{\rm ext} = \frac{2\pi n_{\rm eff}}{-\ln(1-\gamma)-\ln(1-\kappa)}\frac{L}{\lambda} \approx \frac{2\pi n_{\rm eff}L}{\lambda}[\kappa+\gamma]^{-1}$$

*加载 Q 因数*衡量与总线波导耦合的谐振器中的光子寿命。它由谐振器内部和耦合器处的光子损失速率共同决定，因此满足下式 [[3](#reference),[4](#reference)]：

$$Q_{\rm load} = Q_{\rm int} + Q_{\rm ext} = \frac{2\pi n_{\rm eff}L}{\lambda}[\kappa + \alpha_{i} L + \gamma]^{-1}$$

利用下式，可以方便地从谐振器的实测透射光谱中提取加载 Q 因数 [[1](#reference)]：

$$Q_{\rm load} = \frac{\lambda_{\rm res}}{\rm FWHM}$$

其中，$\lambda_{\rm res}$ 表示共振位置，$\rm FWHM$ 是透射光谱中相应共振峰的半高全宽。从实验角度看，这个 $Q_{\rm load}$ 表达式说明加载 Q 因数衡量共振峰的宽度：共振峰越窄，加载 Q 因数越大。另一方面，谐振器的光学损耗越小，$Q_{\rm load}$ 越大。因此可以得到一个重要认识：共振峰之所以具有有限宽度，是因为谐振器中存在光学损耗。

## 如何提高品质因数

---

+ 要提高谐振器的本征品质因数，需要降低其光学损耗，包括材料吸收、额外耦合损耗和腔体弯曲损耗。

+ 要降低材料吸收，可以用氮化硅、铌酸锂等宽带隙材料替代硅等较小带隙材料。

+ 要降低额外耦合损耗，可以使用间隙缓慢渐变的定向耦合器，使谐振器与波导通过倏逝场耦合，并使两者间隙绝热变化。

+ 要降低腔体弯曲损耗，可以在谐振器中采用欧拉螺线弯曲波导，使曲率绝热变化，从而抑制光学损耗。

## 谐振器的透射率

---

### 共振
环形谐振器的透射光谱由一系列等间隔的谷组成，也就是谐振器的吸收峰。这些透射谷或吸收峰称为共振。激励频率与谐振器本征模匹配时，能量以驻波形式在谐振器内积累，每个共振都对应这种能量积累。因此，共振位置满足：

$$\lambda_{m} = \frac{n_{\rm eff}L}{m}, m = 1, 2, 3 ...$$

### 自由光谱范围
相邻共振之间的频率或波长间隔定义为谐振器的自由光谱范围（FSR）。FSR 决定不包含共振的光谱范围，并随波长变化。第 m 个共振附近的 FSR 可以用下式计算：

$${\rm FSR} = \frac{n_{\rm eff,1}L}{m} - \frac{n_{\rm eff,2}L}{m+1} \approx \frac{n_{\rm eff,1}L}{m^{2}} + \frac{\Delta n_{\rm eff}L}{m}.$$

其中，$n_{\rm eff,1}$ 和 $n_{\rm eff,2}$ 分别表示第 m 个和第 (m+1) 个共振处（记为 $\lambda_{m}$ 和 $\lambda_{m+1}$）谐振器的有效折射率，$\Delta n_{\rm eff} = n_{\rm eff,1} - n_{\rm eff,2}$ 是两者之差。FSR 的表达式可以改写为：

$${\rm FSR} = \frac{\lambda_{m}^{2}}{n_{\rm eff,1}L} + {\rm FSR}\frac{\Delta n_{\rm eff}}{{\rm FSR}}\frac{L}{m}\\
= \frac{\lambda_{m}^{2}}{n_{\rm eff,1}L} + {\rm FSR}\frac{dn_{\rm eff}}{d\lambda}\frac{\lambda_{m}}{n_{\rm eff,1}}$$

求解这个方程，得到如下 FSR 表达式 [[1](#reference)]：

$${\rm FSR} = \frac{\lambda_{m}^{2}}{L}/(n_{\rm eff,1}-\lambda_{m}\frac{dn_{\rm eff}}{d\lambda}) = \frac{\lambda_{m}^{2}}{n_{g}L}$$

其中，$n_{g} = n_{\rm eff} - \lambda_{m} dn_{\rm eff}/d\lambda$ 是谐振器在 $\lambda_{m}$ 处的群折射率，已经包含色散效应。谐振器内相应的群速度为 $v_{g} = c/n_{g}$。当色散可以忽略时，群折射率等于有效折射率。

## 耦合状态

---

波导与环形谐振器耦合时，光学传输特性可能随耦合强度显著变化。根据功率耦合比 $\kappa$（无量纲）与单圈光学损耗率 $l = 1 - \exp(-\alpha_{i}L)(1-\gamma)$ 的相对大小，可区分三种耦合状态。

### 过耦合
当 $\kappa > l$ 时，谐振器处于过耦合状态。此时波导与谐振器之间的耦合强度大于谐振器内部损耗率，输出耦合成为决定有限共振宽度的主要因素。过耦合状态常用于调制器和探测器等应用。

### 欠耦合
当 $\kappa < l$ 时，谐振器处于欠耦合状态。此时主要光学损耗来自腔内损耗，而不是输出耦合或插入损耗。在氮化硅等宽带隙材料中，腔内损耗可低至 0.1 dB/cm，从而实现高 Q 因数和窄共振峰。窄共振广泛用于高分辨率测量，因此欠耦合状态适合传感器等应用。

### 临界耦合
当 $\kappa = l$ 时，谐振器处于临界耦合状态。其最突出的特点是总线波导在共振处的透射率最低，因此适合带通或带阻滤波器。

{{< admonition type=note title="PDF 版本" open=false >}}
本笔记的 PDF 版本请见[此处](/posts/note-microring-resonator-I/Note_ring_resonator.pdf)。
{{< /admonition >}}

## 参考文献 {#reference}

---

1. Bogaerts, W., De Heyn, P., Van Vaerenbergh, T., De Vos, K., Kumar Selvaraja, S., Claes, T., ... & Baets, R. (2012). Silicon microring resonators. Laser & Photonics Reviews, 6(1), 47-73.
2. Tran, M. A., Huang, D., & Bowers, J. E. (2019). Tutorial on narrow linewidth tunable semiconductor lasers using Si/III-V heterogeneous integration. APL photonics, 4(11).
3. Spencer, D. T., Bauters, J. F., Heck, M. J., & Bowers, J. E. (2014). Integrated waveguide coupled Si 3 N 4 resonators in the ultrahigh-Q regime. Optica, 1(3), 153-157.
4. Schwelb, O. (2004). Transmission, group delay, and dispersion in single-ring optical resonators and add/drop filters-a tutorial overview. Journal of Lightwave Technology, 22(5), 1380-1394.