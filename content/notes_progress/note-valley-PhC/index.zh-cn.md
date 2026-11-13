+++
title = '谷光子晶体中拓扑保护的局限性'
author = 'Di Yu'
date = 2024-01-30
draft = false
+++

<!-- {{< admonition type=note title="说明" open=false >}}
本文介绍我们被 *Physical Review Letters* 接收的[近期研究](https://arxiv.org/abs/2310.00858)。
{{< /admonition >}} -->

{{< admonition type=note title="PDF 版本" open=false >}}
本笔记的 PDF 原文版本请见[此处](/posts/post-valley-PhC/Note_VPC_paper.pdf)。
{{< /admonition >}}

## 引言

---

拓扑光学研究具有拓扑非平庸能带结构的纳米光子材料的性质。近年来，这一领域因其在低损耗光波导开发和凝聚态基础物理研究中的潜力而受到关注。在众多拓扑非平庸光子材料方案中，谷光子晶体（VPC）尤为引人关注。这是因为 VPC 可以用介电材料实现，并支持低损耗的光子边缘模式（称为拓扑边缘态）。这些性质使 VPC 成为实现大规模低损耗光子集成电路的有力候选。

近期研究已从理论上预测并在实验中观测到 VPC 中的拓扑边缘态 [[1-3](#reference)]，这些光子模式的出现被归因于 VPC 的拓扑非平庸能带结构。VPC 能带结构与拓扑边缘态出现之间的关系，被称为拓扑保护。然而，这种关于拓扑保护的表述隐含地忽略了 VPC 界面几何形状的作用。这立即引出了一个基本问题：拓扑边缘态是否会出现在 VPC 的任意界面上？

这个问题会引出两种看似矛盾的观点。一方面，按照目前对 VPC 的主流理解，无论界面形状如何，拓扑边缘态都应出现在界面处。另一方面，纳米光子学的物理直觉告诉我们，由于光学局域作用，这些光子边缘模式的性质应当强烈依赖界面的几何形状。

为回答这一问题，我们研究了改变界面几何形状如何影响 VPC 中的边缘模式 [[4](#reference)]。实验观测和数值模拟均表明，拓扑边缘态只会出现在特定界面上；当界面几何形状发生改变时，它们可以转变为平庸的光子模式。这些结果打破了当前对拓扑边缘态行为的直觉，并确立了 VPC 中拓扑保护的局限性。

{{< image src="/posts/post-valley-PhC/measurement_setup.png" caption="我们的测量装置 [[3](#reference)]" >}}

## 致谢

感谢我的导师 [Kobus Kuipers](https://kuiperslab.tudelft.nl/) 教授和 [Sonakshi Arora](https://www.linkedin.com/in/sonakshi-arora--/) 博士在整个项目中给予的出色指导和坚定支持。他们的指导弥足珍贵，我无法想象更好的老师。


## 参考文献 {#reference}


---

1. Ma, T., & Shvets, G. (2016). All-Si valley-Hall photonic topological insulator. New Journal of Physics, 18(2), 025012.
2. Shalaev, M. I., Walasik, W., Tsukernik, A., Xu, Y., & Litchinitser, N. M. (2019). Robust topologically protected transport in photonic crystals at telecommunication wavelengths. Nature nanotechnology, 14(1), 31-34.
3. Arora, S., Bauer, T., Barczyk, R., Verhagen, E., & Kuipers, L. (2021). Direct quantification of topological protection in symmetry-protected photonic edge states at telecom wavelengths. Light: Science & Applications, 10(1), 9.
4. Yu, D., Arora, S., & Kuipers, L. (2023). Impact of transforming interface geometry on edge states in valley photonic crystals. arXiv preprint arXiv:2310.00858. (accepted by PRL)
