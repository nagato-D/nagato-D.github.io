+++
title = '耦合非线性振荡器自发同步笔记'
author = 'Di Yu'
date = 2024-11-09
draft = false
+++

## 引言 {#introduction}

---

谐振子是一种简单的物理模型，广泛用于描述各种振荡，包括声学、电磁乃至原子振荡。然而，这一模型有一个局限：它无法解释耦合振荡器中普遍存在的自发同步现象。机械耦合的摆、锁相电振荡器，以及与环境同步的昼夜节律等场景中都能观察到这一现象。要理解这些现象，我们需要考虑振荡的非线性动力学性质，而谐振子模型并未包含这些性质。

在本笔记中，我们介绍 Kuramoto 模型，这是一种简单而有效的数学模型，用于解释耦合非线性振荡器的自发同步。该模型以日本理论物理学家藏本由纪（Yoshiki Kuramoto）命名，他于 1975 年提出了这一模型 [[1](#reference)]。

## Kuramoto 模型 {#kuramoto-model}

---

我们考虑一组具有二阶非线性的振荡器。首先从振荡器之间不存在耦合的情形开始。这些振荡器的复振幅满足：

$$
\dot{Q}_{s} = (i\omega _{s}+\alpha)Q _{s} - \beta|Q _{s}|^{2}Q _{s}  \tag{1}
$$

其中，$Q_{s}$ 是第 $s$ 个振荡器的复振幅（$s = 1,2,...,N$），$\omega_{s}$ 是固有频率，$\alpha$ 是增益系数，$\beta$ 是二阶非线性系数。为简单起见，这里及下文均假设 $\alpha$ 和 $\beta$ 为正常数。

方程 1 有一个稳态解 $Q_{s} = \sqrt{(\alpha/\beta)}\exp(i\omega_{s}t)$，此时增益与非线性效应相互平衡。如果不存在非线性项 $-\beta|Q_{s}|^{2}Q_{s}$，那么在恒定增益下，振荡振幅将发散。因此，非线性效应对于有限能量稳态的存在至关重要。

现在，将耦合项引入方程 1。假设耦合项与振幅呈线性关系（最简单的情况），得到：

$$
\dot{Q}_{s} = (i\omega _{s}+\alpha)Q _{s} + \sum _{r\neq s}\nu _{rs} Q _{r} - \beta|Q _{s}|^{2}Q _{s},  \tag{2}
$$

其中，$\nu_{rs}$ 是第 $s$ 个与第 $r$ 个振荡器之间的耦合强度。

为使方程 2 在数学上便于处理，Kuramoto 引入了一些简化假设，包括：

- $\nu_{rs} = \nu/N$，与 $r$ 和 $s$ 无关（平均场耦合）；
- $\alpha, \beta \rightarrow \infty$，但 $\alpha/\beta, \omega_{s}$ 有限（固定振幅 $|Q_{s}|$）；
- $N\rightarrow\infty$（无限大振荡器集合）。

在第二个假设下，方程 2 中的振幅 $|Q_{s}|$ 被强制固定为 $\sqrt{\alpha/\beta}$，不依赖于其他振荡器的振幅。振幅固定后，每个振荡器只剩下相位这一自由度。令 $Q_{s} = |Q_{s}|\exp(i\phi_{s})$，可以将方程 2 改写为：

$$
\dot{\phi}_{s} = \omega _{s} + \frac{\nu}{N}\sum _{r}\sin(\phi _{r}-\phi _{s}).  \tag{3}
$$

方程 3 就是著名的 Kuramoto 模型。该方程右侧包含一个耦合项 $\sin(\phi_{r}-\phi_{s})$，它“迫使”第 $s$ 个振荡器与第 $r$ 个振荡器锁相，即同相振荡。事实上，当耦合强度 $\nu$ 足够大时，所有振荡器将渐近地以相同频率振荡，表现为自发同步。相反，当 $\nu$ 足够小时，这些振荡器将分别以各自的固有频率振荡。因此，Kuramoto 模型成功刻画了耦合非线性振荡器的自发同步现象。

## 参考文献 {#reference}

---

1. Kuramoto, Y. (1975). Self-entrainment of a population of coupled non-linear oscillators. In International Symposium on Mathematical Problems in Theoretical Physics: January 23–29, 1975, Kyoto University, Kyoto/Japan (pp. 420-422). Springer Berlin Heidelberg.
