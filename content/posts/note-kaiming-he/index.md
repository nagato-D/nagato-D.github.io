+++
title = 'Note on Kaiming He's PhD Thesis'
author = 'Di Yu'
date = 2023-10-20
draft = false
+++

## Introduction

---

[Kaiming He](https://kaiminghe.github.io/) is an influential scholar in the field of computer vision. His papers have received more than 500,000 citations as of 2023, according to [Google Scholar](https://scholar.google.com/citations?user=DhtAFkwAAAAJ&hl=en&oi=ao). His research about ResNets has become a basic building block of artificial intelligence system today. Kaiming He is now a faculty member of the department of EECS at MIT since 2024. Prior to this, he worked in Facebook as a research scientist since 2016. Before that, Kaiming He was a researcher at Microsoft since 2011. He obtained his PhD degree from the Chinese University of Hong Kong (CUHK), supervised by Xiaoou Tang. In this note, I will briefly introduce Kaiming He's PhD thesis, titled "[Single Image Haze Removal Using Dark Channel Prior](https://kaiminghe.github.io/publications/thesis.pdf)" [[1](#reference)], in order to learn about how to conduct influential research and write appealling papers.

## Summary of Thesis

---

Kaiming He's thesis proposes a heuristic method for single-image haze removal problem. The key point is that He proposed an effective and simple prior, known as the dark channel prior, to impose additional contraints for solving haze removal equations. This prior is derived from He's observation of the statistics in haze-free images. It was found that most patches in these images contain pixels which are dark in at least one color channel. Additionally, the thesis also introduces efficient realization of the dark channel prior and demonstrates its close relation to human vision perception system.

## Observations, Comments, and Interesting Facts

---

Here are some valuable observations and interesting facts about Kaiming He's thesis, which might provide useful insights for writing research papers.

- Kaiming He started serving as a research intern at Microsoft since 2007, the same year when he enrolled as a PhD at CUHK. The research topic of single-image haze removal might be derived from a suggestion of Microsoft's engineers.
- Kaiming He started his PhD journey in 2007, and his first paper was published in 2009 (selected as CVPR Best Paper). Therefore, He had no research outcome during this first two years of PhD.
- The solution to single-image haze removel problem proposed by Kaiming He is effective, simple, and interesting. He also conducted extensive numerical experiments to demonstrate the effectiveness of the proposed solution.
- Kaiming He's thesis is reasonably readable, even people not familiar with the research topic can comprehend and appreciate it. This is realized by minimizing the use of terminologies.
- Kaiming He's writing typically follows this structure: first, he highlights the significance of a problem. Then, he discusses the challenges associated with solving it and explores existing solutions. Next, he introduces his newly proposed solution and emphasizes its advantages compared to previous approaches. Finally, he concludes by discussing the broad social impact that his proposal can have.
- Collaborating with the industry is an effective method to identify valuable research problems that have significant social impact. The goal of research should be to solve these problems in an effective and simple manner, which necessitates a deep understanding of the problem being investigated.

## Related Publications

---

Kaiming He published 5 research papers during his PhD, and 4 of them are related to his thesis. These papers were published in between 2009 and 2011, with Kaiming He as the first author. All these papers are published in top-level academic conferences and journals, including CVPR (x3), TPAMI (x1), and ECCV (x1). Remarkably, his first paper, titled "[Single image haze removal using dark channel prior](https://doi.org/10.1109/TPAMI.2010.168)", receives CVPR best paper award in 2009 and has been cited for over 8,000 times as of 2023. These achievements highlight his academic asethetics in identifying infludential research topics.

## Reference

---

1. https://kaiminghe.github.io/publications/thesis.pdf