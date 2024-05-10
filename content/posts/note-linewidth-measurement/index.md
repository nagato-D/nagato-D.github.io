+++
title = 'Note on Cross-correlation Self-heterodyne Laser Linewidth Measurement'
author = 'Di Yu'
date = 2024-05-10
draft = false
+++

{{< admonition type=note title="Note" open=false >}}
This page presents only the introduction section of this note. Please refer to [here](/posts/note-linewidth-measurement/Note_linewidth_measurement.pdf) for a complete version.
{{< /admonition >}}

## Introduction

---

Lasers with narrow linewidths are essential for a variety of applications, such as optical atomic clocks, spectroscopy, and light detection and ranging (LIDAR). To accurately determine the linewidths of these lasers, it is necessary to measure their noise spectrum with high precision. In this note, we present a correlated self-heterodyne (COSH) setup capable of detecting frequency noise as low as 0.01 Hz2/Hz [[1](#reference)]. We provide a detailed explanation of the signal processing theory behind this scheme, along with annotations for the released code used to calculate the laser noise spectrum \[[2](#reference)]. This setup meets the requirements for characterizing the linewidth of cutting-edge semiconductor lasers and facilitates the development of ultra-low-noise lasers.

## Reference

---

1. Yuan, Z., Wang, H., Liu, P., Li, B., Shen, B., Gao, M., ... & Vahala, K. (2022). Correlated self-heterodyne method for ultra-low-noise laser linewidth measurements. Optics Express, 30(14), 25147-25161.
2. [Code for reconstructing laser frequency noise power spectral density](https://github.com/MaodongGao/pycosh)