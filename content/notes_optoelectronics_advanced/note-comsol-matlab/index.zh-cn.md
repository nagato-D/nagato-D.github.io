+++
title = 'COMSOL-MATLAB 联合仿真笔记'
author = 'Di Yu'
date = 2024-03-14
draft = false
+++

## 引言 {#introduction}

---

[COMSOL](https://www.comsol.com/products) 是一款广泛用于多物理场仿真的有限元分析软件。这里，我将介绍如何使用 [LiveLink for MATLAB](https://www.comsol.com/livelink-for-matlab)，即 COMSOL 面向 MATLAB 的 API，提取并处理 COMSOL 中得到的数值结果。这是一项强大的工具，能够支持几乎所有类型的经典物理场计算。

## 安装 {#installation}

---

我们先介绍 MATLAB、COMSOL 和 LiveLink for MATLAB 的安装方法。

### MATLAB

要建立 COMSOL-MATLAB 联合仿真，首先需要在计算机上安装 MATLAB。你可以访问 [MATLAB 网站](https://www.mathworks.com/products/matlab.html)，使用机构邮箱注册账号。如果所在机构已购买 MATLAB 服务，你应该能够从该网站下载 MATLAB 的发行版本并安装。

### COMSOL 与 LiveLink for MATLAB {#comsol--livelink-for-matlab}

在计算机上安装 MATLAB 后，就可以继续安装 COMSOL 和 LiveLink for MATLAB。为此，你需要访问 [COMSOL 网站](https://www.comsol.com/product-download)，使用机构邮箱注册账号。如果所在机构已订阅 COMSOL 产品，就可以从该网站下载 COMSOL 的发行版本并安装。在安装过程中，安装程序会引导你选择所需模块，例如波动光学、传热等。此时**请记得选择 LiveLink for MATLAB 模块**，COMSOL 的安装程序会自动配置面向 MATLAB 的 API。如果安装成功，你将在开始菜单中看到 `COMSOL Multiphysics with MATLAB`。

## 使用方法 {#usage}

---

假设你已经建立了一个 COMSOL 仿真文件（.mph），并在其中保存了结果。接下来介绍如何在 MATLAB 中提取这些仿真数据。首先，打开“COMSOL Multiphysics with MATLAB”，它将启动两个窗口。一个窗口是 MATLAB，另一个是用于建立 COMSOL 与 MATLAB 之间连接的命令行窗口。你可以像使用普通 MATLAB 界面一样，在这个 MATLAB 窗口中创建并运行 .m 脚本。不同之处在于，这里允许使用一些特殊命令来访问 COMSOL 仿真文件。有关这些命令的说明，请在 MATLAB 界面中输入“help mpi”。

LiveLink for MATLAB 提供的一些常用命令如下：

- `mphopen`：将 COMSOL 仿真文件加载到 MATLAB 中。用法示例：`model = mphopen(filename)`。
- `mphglobal`：对 COMSOL 仿真文件中保存的指定解计算全局变量。用法示例：`neff = mphglobal(model, 'ewfd.neff', 'dataset', 'dset1', 'outersolnum', 1)`；该命令返回数据集 1 中解编号为 1 的光学模式的有效折射率。
- `mphinterp`：利用插值计算指定位置处的场值。用法示例：`mphinterp(model, 'ewfd.Hz', 'coord', coord_mat)`；该命令返回由 2-by-N 矩阵 `coord_mat` 指定的 N 个位置处的磁场复振幅。
- `mphnavigator`：在 MATLAB 中启动图形用户界面，以查看 COMSOL 仿真文件。该窗口有助于查找数据集和解的编号。用法示例：`mphnavigator(model)`。

## 应用 {#applications}

---

COMSOL-MATLAB 联合仿真可用于计算涉及多个物理场的物理量，例如微环谐振器中由热光效应引起的谐振漂移，以及光子晶体的贝里曲率。下面分享我用于这些应用的代码。

### 微环谐振器中的热光效应 {#thermo-optic-effect-in-a-microring-resonator}

代码：https://1drv.ms/f/s!AgeoyM0wJG9cg44z4BFzt-Ui5f6HLQ?e=orAnWN

结果：

{{< image src="/posts/note-comsol-matlab/temperature_distribution_700K.png" width=400 >}}

图 1：位于光波导上方的加热器周围温度分布的仿真结果，温度以开尔文表示。

{{< image src="/posts/note-comsol-matlab/GM_resonance_shift_vs_temperature.png" width=400 >}}

图 2：温度变化引起的微环谐振器谐振漂移的仿真结果。

### 磁光／谷霍尔光子晶体的贝里曲率 {#berry-curvature-of-a-magneto-opticvalley-hall-photonic-crystal}

代码：https://github.com/nagato-D/Berry-curvature-for-photonic-crystals/releases/tag/v2.0.0

结果：

{{< image src="/posts/note-comsol-matlab/magneto_berry_curvature_band_1.png" width=300 >}} {{< image src="/posts/note-comsol-matlab/magneto_berry_curvature_band_2.png" width=300 >}}

图 3：磁光方晶格光子晶体第一条（左）和第二条（右）能带的贝里曲率仿真结果。

{{< image src="/posts/note-comsol-matlab/valley_berry_curvature_band_1.png" width=300 >}} {{< image src="/posts/note-comsol-matlab/valley_berry_curvature_band_2.png" width=300 >}}

图 4：谷霍尔光子晶体第一条（左）和第二条（右）能带的贝里曲率仿真结果。

{{< admonition type=note title="PDF 版本" open=false >}}
这篇笔记的 PDF 版本请参见[此处](/posts/note-comsol-matlab/Note_comsol_matlab.pdf)。
{{< /admonition >}}
