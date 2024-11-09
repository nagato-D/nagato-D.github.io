+++
title = 'Note on Spontaneous Synchronization of Coupled Nonlinear Oscillators'
author = 'Di Yu'
date = 2024-11-09
draft = false
+++

## Introduction

---

The harmonic oscillator is a simple physical model that has been widely used to describe all sorts of oscillations, including acoustic, electromagnetic, and even atomic oscillations. Yet, this model has a limitation in that it cannot explain the ubiquitous phenomenon of spontaneous synchronization of coupled oscillators. This can be observed in scenarios such as mechanically coupled pendulums, phase-locked electrical oscillators, and circadian rhythms synchronized to the environment. To understand these phenomena, we need to take into account the nonlinear dynamical properties of the oscillation, which are absent in the harmonic oscillator model.

In this note, we introduce the Kuramoto model, a simple and effective mathematical model, to account for the spontaneous synchronization of coupled nonlinear oscillators. This model is named after Yoshiki Kuramoto, a Japanese theoretical physicist who proposed the model in 1975 [[1](#reference)].

## Kuramoto Model

---

We consider an ensemble of oscillators with second-order nonlinearity. We will start with the scenario where the coupling between oscillators is absent. The complex amplitudes of these oscillators follow

$$
\dot{Q}_{s} = (i\omega _{s}+\alpha)Q _{s} - \beta|Q _{s}|^{2}Q _{s}  \tag{1}
$$

where $Q_{s}$ is the complex amplitude of the $s$-th oscillator ($s = 1,2,...,N$), $\omega_{s}$ is the natural frequency, $\alpha$ is the gain coefficient, and $\beta$ is the second-order nonlinear coefficient. Here and below, we assume $\alpha$ and $\beta$ to be positive constants for simplicity.

Equation 1 has a steady-state solution of $Q_{s} = \sqrt{(\alpha/\beta)}\exp(i\omega_{s}t)$, where the gain and nonlinear effect balance each other. If the nonlinear term $-\beta|Q_{s}|^{2}Q_{s}$ is absent, the oscillating amplitude will diverge provided a constant gain. Therefore, the nonlinear effect is essential for the presence of a finite-energy steady state.

Now let's introduce the coupling term into Equation 1. Assuming the coupling terms to be linear to the amplitudes (the simplest case), we obtain

$$
\dot{Q}_{s} = (i\omega _{s}+\alpha)Q _{s} + \sum _{r\neq s}\nu _{rs} Q _{r} - \beta|Q _{s}|^{2}Q _{s},  \tag{2}
$$

where $\nu_{rs}$ is the coupling strength between the $s$-th and the $r$-th oscillators.

To make Equation 2 mathematically tractable, Kuramoto introduces some simplifying assumptions, including:

- $\nu_{rs} = \nu/N$, independent of $r$ and $s$ (mean-field coupling),
- $\alpha, \beta \rightarrow \infty$ but $\alpha/\beta, \omega_{s}$ are finite (fixing amplitude $|Q_{s}|$),
- $N\rightarrow\infty$ (infinite ensemble).

With the second assumption, the amplitude $|Q_{s}|$ in Equation 2 is forced to be $\sqrt{\alpha/\beta}$, independent of the amplitudes of other oscillators. With the amplitude fixed, each oscillator only has a degree of freedom in phase. Let $Q_{s} = |Q_{s}|\exp(i\phi_{s})$, Equation 2 can be recast to

$$
\dot{\phi}_{s} = \omega _{s} + \frac{\nu}{N}\sum _{r}\sin(\phi _{r}-\phi _{s}).  \tag{3}
$$

Equation 3 is the well-known Kuramoto model. On the right side of this equation, there is a coupling term $\sin(\phi_{r}-\phi_{s})$, which 'forces' the $s$-th oscillator to be phase-locked, or oscillate in phase, with the $r$-th oscillator. In fact, when the coupling strength $\nu$ is large enough, all oscillators will oscillate at the same frequency asymptotically, indicating a spontaneous synchronization. When $\nu$ is small enough, in contrast, these oscillators will oscillate at their individual natural frequencies. Therefore, the Kuramoto model successfully captures the phenomenon of spontaneous synchronization of coupled nonlinear oscillators.

## Reference

---

1. Kuramoto, Y. (1975). Self-entrainment of a population of coupled non-linear oscillators. In International Symposium on Mathematical Problems in Theoretical Physics: January 23–29, 1975, Kyoto University, Kyoto/Japan (pp. 420-422). Springer Berlin Heidelberg.