+++
title = 'RE-DBR 激光器：窄线宽可调谐集成激光器'
author = 'Di Yu'
date = 2026-03-04
draft = false
+++

<!-- {{< admonition type=note title="PDF 版本" open=false >}}
本笔记的 PDF 原文版本请见[此处](/posts/post-valley-PhC/Note_VPC_paper.pdf)。
{{< /admonition >}} -->

## 引言

---

具有波长可调谐能力的集成窄线宽激光器，是精密计量和光通信系统的重要组成部分。然而，传统集成激光器设计在线宽、可调谐性和运行稳健性之间存在根本性的权衡：改善一个参数往往需要牺牲其他参数。

在我们近期的研究 [1] 中，我们提出了一种称为谐振腔增强型分布式布拉格反射器（RE-DBR）激光器的新架构，突破了这一限制。RE-DBR 激光器同时实现了 24 Hz 的超窄本征线宽、34 GHz 的宽范围无跳模调谐，以及稳健的即开即用运行。该设计基于混合集成半导体激光器平台，采用光栅辅助微环谐振腔作为外腔，提供窄带且可调谐的光反馈。

我们证明，这一架构对制造缺陷和环境扰动具有内在容忍度，使 RE-DBR 激光器有望成为低成本、可制造且适合现场部署的高相干可调谐光源。此类激光器在调频连续波（FMCW）激光雷达、微波光子学、光谱学和光纤传感等多种实际应用中具有潜力。

{{< image src="/posts/post-ReDBR-laser/fig1.png" caption="RE-DBR 激光器的特点 [[1](#reference)]" >}}


## 参考文献 {#reference}


---

1. Yu, D., Geng, Z., Huang, Y. et al. Resonator-enhanced distributed Bragg reflector lasers. Light Sci Appl 15, 142 (2026). https://doi.org/10.1038/s41377-026-02249-x
