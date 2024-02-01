+++
title = "Limitations of Topological Protection in Valley Photonic Crystals"
author = 'Di Yu'
date = 2024-01-30
draft = false
+++

{{< admonition type=note title="Note" open=false >}}
This post introduces our [recent work](https://arxiv.org/abs/2310.00858) accepted by *Physical Review Letters*.
{{< /admonition >}}

## Introduction

---

Topological optics is a research field that investigates the properties of nanophotonic materials with topologically nontrivial band structures. This field has raised people's interests in recent years for its potential in developing low-loss optical waveguides and in studying fundamental condensed matter physics. Valley photonic crystals (VPCs) are particularly interesting among numerous proposals of topologically nontrivial photonic materials. This is because VPCs can be realized in dielectric materials and support low-loss photonic edge modes (known as topological edge states). These properties make VPCs a promising candidate for realizing large-scale low-loss photonic integrated circuits.

Topological edge states in VPCs have been theoretically predicted and experimentally observed in recent studies [[1-3](#reference)], where the emergence of these photonic modes is attributed to the topologically nontrivial band structures of VPCs. The relation between VPCs' band structures and the emergence of topological edge states is referred to topological protection. Importantly, this statement of topological protection implicitly omits the role of interface geometry of VPCs. This immediately entails a fundamental question that, will topological edge states arise at any interface of VPCs? 

This question can raise two seemly contradicting arguments. On the one hand, according to the currently prevailing understanding of VPCs, topological edge states should appear at their interfaces regardless what the interface shape looks like. However, our physical intuition of nanophotonics suggests that the properties of these photonic edge modes should strongly depend the interface geometry due to optical confinement.

To answer this question, we investigate how transforming the interface geometry impacts edge modes in VPCs [[4](#reference)]. Our experimental observation and numerical simulation both suggest that, the emergence of topological edge states only occurs at certain interfaces. And they can be transformed to trivial photonic modes when changes are made to the interface geometry. These results break the current intuition regarding the behavior of topological edge states and establish the limitations of topological protection in VPCs.

{{< image src="/posts/post-valley-PhC/measurement_setup.png" caption="Our measurement setup [[3](#reference)]" >}}

## Acknowledgement

I would like to express my gratitude to my advisers, Prof. [Kobus Kuipers](https://kuiperslab.tudelft.nl/) and Dr. [Sonakshi Arora](https://www.linkedin.com/in/sonakshi-arora--/), for their exceptional guidance and unwavering support throughout this project. Their mentorship has been invaluable, and I cannot imagine better teachers.

## Reference

---

1. Ma, T., & Shvets, G. (2016). All-Si valley-Hall photonic topological insulator. New Journal of Physics, 18(2), 025012.
2. Shalaev, M. I., Walasik, W., Tsukernik, A., Xu, Y., & Litchinitser, N. M. (2019). Robust topologically protected transport in photonic crystals at telecommunication wavelengths. Nature nanotechnology, 14(1), 31-34.
3. Arora, S., Bauer, T., Barczyk, R., Verhagen, E., & Kuipers, L. (2021). Direct quantification of topological protection in symmetry-protected photonic edge states at telecom wavelengths. Light: Science & Applications, 10(1), 9.
4. Yu, D., Arora, S., & Kuipers, L. (2023). Impact of transforming interface geometry on edge states in valley photonic crystals. arXiv preprint arXiv:2310.00858. (accepted by PRL)