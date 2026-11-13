+++
title = 'ResNet 笔记'
author = 'Di Yu'
date = 2024-01-23
draft = false
+++

## 引言

---

深度卷积神经网络是图像分类任务的有力工具。深层网络能够捕获高层次特征，并以更高的精度逼近复杂映射。因此，在图像识别问题中，深度神经网络可能比浅层网络表现更好。然而，训练这类深度学习模型十分困难，因为训练准确率通常会随着网络深度增加而下降（见图 1）。这一训练准确率问题限制了深度神经网络的应用，尽管它们原本有望以更高的准确率解决图像识别问题。

{{< image src="/posts/note-ResNet/training_accuracy_vs_network_depth.jpg" width="500" >}}

**图 1** 训练准确率随网络深度增加而下降 [[1](#reference)]

2016 年，何恺明与微软的同事发表了题为“Deep Residual Learning for Image Recognition”的论文 [[1](#reference)]，并获得当年的 CVPR 最佳论文奖。论文提出残差学习框架（即 ResNet），这种新的深度神经网络构件显著提高了训练准确率。其基本思想是引入捷径连接（如图 2 所示），使信息能够跨越多个非线性层传播。这种捷径连接使多个堆叠层更容易逼近恒等映射，而这正是训练深度学习模型的关键。

{{< image src="/posts/note-ResNet/schematic_ResNet.jpg" width="300" >}}

**图 2** ResNet 示意图 [[1](#reference)]

ResNet 对机器学习研究产生了深远影响。截至 2024 年，ResNet 论文已被引用超过 200,000 次。如今，ResNet 已成为现代深度学习模型的基本构件，包括 GPT 等先进的大语言模型。

## 观察、评论与趣事

---

- 利用捷径连接减少训练误差的想法，源于以下观察：深度神经网络中的非线性层，其表现甚至不如恒等映射。这使训练误差随着网络深度增加而积累，导致深层模型不如浅层模型。
- 此前的领先工作采用 16 至 30 层的神经网络模型，而 ResNet 架构将网络深度提升到 152 层。
- 极深的残差网络在实验中表现出色，在 2015 年多项重要竞赛中获得第一名，包括 ILSVRC 分类、ImageNet 检测、ImageNet 定位、COCO 检测和 COCO 分割，展示了 ResNet 架构的有效性和通用性。
- 何恺明意识到，网络深度增加时训练准确率下降的原因在于求解器，而非模型本身。值得关注的是，为提高训练准确率，他选择修改模型以便求解器更容易优化，而不是改变求解器的配置。
- 这一选择可能是因为修改求解器的成本很高：当时，求解器已经成为常见深度学习框架的基础。相比之下，从没有捷径连接的普通网络转向 ResNet 可能更容易，因为 ResNet 可以使用传统求解器通过反向传播进行优化，且不会引入额外计算成本。
- ResNet 表现优异的一个重要原因是，每个模块的最优解近似为恒等映射，而 ResNet 只需将所有参数设为零，就能轻松逼近这样的映射。
- 多个 ResNet 模块堆叠时，捷径连接形成串联通路，使信息能够从输入直接流向输出。事实表明，在优化复杂深度学习模型时，这种长程连接对降低训练误差十分重要。

{{< admonition type=note title="PDF 版本" open=false >}}
本笔记的 PDF 原文版本请见[此处](/posts/note-ResNet/Note_ResNet.pdf)。
{{< /admonition >}}


## 参考文献 {#reference}


---

- He, K., Zhang, X., Ren, S., & Sun, J. (2016). Deep residual learning for image recognition. In Proceedings of the IEEE conference on computer vision and pattern recognition (pp. 770-778).
