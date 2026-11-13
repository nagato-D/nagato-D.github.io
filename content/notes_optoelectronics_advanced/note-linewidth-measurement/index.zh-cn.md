+++
title = '互相关自外差激光线宽测量笔记'
author = 'Di Yu'
date = 2024-05-10
draft = false
+++

## 引言 {#introduction}

---

窄线宽激光器对于光学原子钟、光谱学和激光雷达（LIDAR）等多种应用至关重要。要准确确定这些激光器的线宽，需要高精度地测量其噪声谱。在本笔记中，我们介绍一种相关自外差（COSH）装置，能够检测低至 0.01 Hz2/Hz 的频率噪声 [[1](#reference)]。我们详细解释该方案背后的信号处理理论，并对已发布的、用于计算激光噪声谱的代码进行注释 \[[2](#reference)]。这一装置能够满足前沿半导体激光器的线宽表征需求，并有助于超低噪声激光器的开发。

{{< admonition type=note title="PDF 版本" open=false >}}
本页仅展示这篇笔记的引言部分，完整版本请参见[此处](/posts/note-linewidth-measurement/Note_linewidth_measurement.pdf)。
{{< /admonition >}}

## 参考文献 {#reference}

---

1. Yuan, Z., Wang, H., Liu, P., Li, B., Shen, B., Gao, M., ... & Vahala, K. (2022). Correlated self-heterodyne method for ultra-low-noise laser linewidth measurements. Optics Express, 30(14), 25147-25161.
2. [重建激光频率噪声功率谱密度的代码](https://github.com/MaodongGao/pycosh)
