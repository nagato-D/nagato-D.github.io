+++
title = '行波马赫–曾德尔调制器设计笔记'
author = 'Di Yu'
date = 2024-10-11
draft = false
+++

## 引言 {#introduction}

---

基于薄膜铌酸锂的行波马赫–曾德尔调制器能够以高带宽、低电压将射频信号编码到光载波上，这对于实现高速、低功耗的数据通信至关重要。下图展示了一种典型的行波马赫–曾德尔调制器[^3]。它由具有两条波导臂的马赫–曾德尔干涉仪，以及用于电光调制的三条电极组成。

{{< image src="/posts/note-modulator-design/modulator_schematic.png" >}}

设计这类调制器时，应仔细优化波导和电极的几何参数，以在插入损耗、调制效率和调制带宽之间取得满意的折中。

在本笔记中，我将介绍如何通过数值方法计算铌酸锂行波马赫–曾德尔调制器的插入损耗、调制效率和带宽。我们的计算基于 COMSOL Multiphysics[^1]，并通过复现文献结果[^2]进行了验证。

## 关键性能指标 {#key-performance-indicators}

调制器的性能主要由光学插入损耗、调制效率 $(V_{\pi} \cdot L)$ 和调制带宽来量化。理想的调制器应具有低光学插入损耗、低 $V_{\pi} \cdot L$ 和高调制带宽。

对于马赫–曾德尔干涉仪，$V_{\pi}$ 定义为使两条臂之间产生 $\pi$ 相位差的直流驱动电压。调制器的调制效率定义为 $V_{\pi}$ 与调制器长度的乘积。较低的 $V_{\pi} \cdot L$ 意味着紧凑的尺寸和低功耗，这也是多数应用所期望的特性。

调制器的输出光功率以与电驱动信号相同的频率振荡，即以调制频率振荡。该输出光信号通过光电探测器转换为电信号，其中包含位于调制频率处的频谱分量。该频谱分量的功率与电驱动信号功率之比定义为电光响应。电光响应是调制频率的函数，通常随频率升高而降低。3-dB 带宽定义为电光响应下降至直流电光响应一半时的调制频率。

高性能薄膜铌酸锂调制器可实现小于 3 dB 的插入损耗、约 2 Vcm 的调制效率，以及超过 70 GHz 的 3-dB 带宽。

## 行波马赫–曾德尔调制器的设计原则 {#design-principles-of-traveling-wave-mach-zehnder-modulators}

---

### 集总式与行波马赫–曾德尔调制器 {#lumped-and-traveling-wave-mach-zehnder-modulators}

马赫–曾德尔调制器分为两类：集总式马赫–曾德尔调制器和行波马赫–曾德尔调制器[^4]。如图所示，它们具有类似的波导和电极几何结构。在集总式马赫–曾德尔调制器中，每条电极连接一个探针，电信号沿横向于波导的方向传播。由于电信号的传播方向与光信号正交，二者之间的相互作用较弱。在高调制频率下，这一现象尤其显著，因为调制电信号的振荡周期较短，进一步限制了射频信号与光信号之间的相互作用。因此，集总式马赫–曾德尔调制器的带宽通常较低（约数 GHz）。

对于行波马赫–曾德尔调制器，射频驱动信号与光信号以相同方向、相同速度传播。这显著增强了射频信号与光信号之间的相互作用，从而降低所需驱动功率。此外，由于这类调制器针对高调制频率下的速度匹配进行设计，电光响应能够在较宽带宽内保持较高水平。因此，行波马赫–曾德尔调制器具有低驱动功率和高调制带宽的特点。下面将介绍如何设计高性能行波马赫–曾德尔调制器。

### 调制效率与插入损耗的平衡 {#balance-modulation-efficiency-and-insertion-loss}

为实现较低的 $V_{\pi} \cdot L$，应将电极放置在靠近波导的位置，使较低的偏置电压也能在波导周围产生足够强的电场。然而，当电极与波导距离较小时，电极也会给光信号引入金属损耗。因此，需要找到能在调制效率与插入损耗之间取得满意折中的电极位置。在最佳折中条件下，典型金属吸收损耗为数 dB/cm。

在数值仿真中，可从仿真所得有效折射率的虚部提取金属吸收损耗[^5]。不过，调制效率的计算更为复杂，因为它需要仿真外加电场存在时波导中的光学模式。可以使用 COMSOL 进行此类仿真，用于计算 (V_{\pi} \cdot L) 的示例仿真文件可在[本节](#simulation-files)获取。

### 特性阻抗、带宽与制造成本的平衡 {#balance-characteristic-impedance-bandwidth-and-fabrication-cost}

除了电极的位置，还需要确定它们的几何尺寸。选择调制器电极的几何结构时，需要同时考虑阻抗匹配、速度匹配和可接受的制造成本。具体而言，特性阻抗随电极宽度和厚度的增加而降低，而阻抗匹配要求特性阻抗为 50 Ohm。速度匹配要求射频信号的有效折射率与光信号的群折射率相匹配，这通常通过调节电极厚度来实现。然而，完美的速度匹配往往要求电极厚度超过 1 um；当电极材料为金（Au）时，这会带来较高的制造成本。因此，有时需要牺牲一定的速度匹配程度及相应的调制带宽，以换取可接受的制造成本。

## 仿真文件 {#simulation-files}

---

用于计算行波马赫–曾德尔调制器调制效率和带宽的 COMSOL 仿真文件及代码，通过以下只读 OneDrive 文件夹共享。每个文件夹都包含 COMSOL 模型、导出数据、绘图脚本，以及说明仿真设置、与文献的比较和运行方法的 `readme.md`。

- [调制效率](https://1drv.ms/f/c/5c6f2430cdc8a807/IgD2PKe_XTm3TY8mhU3hET3JAW9rQVDUObVfzgZUqPq6MVk?e=ClEy1a)
- [调制带宽](https://1drv.ms/f/c/5c6f2430cdc8a807/IgBTIsttPfwrSbyy6U5LrThvARZzGFWPA2soVnGBez6oOYY?e=pDbwHU)

[^1]: https://www.comsol.com/
[^2]: He, M., Xu, M., Ren, Y., Jian, J., Ruan, Z., Xu, Y., ... & Cai, X. (2019). High-performance hybrid silicon and lithium niobate Mach–Zehnder modulators for 100 Gbit s− 1 and beyond. Nature photonics, 13(5), 359-364.
[^3]: Wang, C., Zhang, M., Chen, X., Bertrand, M., Shams-Ansari, A., Chandrasekhar, S., ... & Lončar, M. (2018). Integrated lithium niobate electro-optic modulators operating at CMOS-compatible voltages. Nature, 562(7725), 101-104.
[^4]: Ghione, G. (2009). Semiconductor devices for high-speed optoelectronics (Vol. 116). Cambridge: Cambridge University Press.
[^5]: https://optics.ansys.com/hc/en-us/articles/360034917493-Working-with-lossy-modes-and-dB-m-to-kappa-conversion
