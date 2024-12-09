+++
title = 'Note on Microring Resonator (Part III)'
author = 'Di Yu'
date = 2024-12-06
draft = false
+++

The preliminary knowledge for the note is provided in [Note on Microring Resonator (Part II)](https://nagato-d.github.io/notes_optoelectronics_basics/note-microring-resonator-ii/).

## Introduction

---

In this note, we present a derivation of the coupled mode equation for an all-pass ring resonator (refer to Figure 1). We include intracavity backscattering in our theory and analyze the resulting splitting of resonance dip in the transmission spectrum.

![](/posts/note-microring-resonator-III/fig1.png)

Left: all-pass ring; Right: add-drop ring [[1](#reference)].

## Coupled Mode Theory

---

An all-pass ring is a ring resonator evanescently coupled to a nearby bus waveguide. Here, we denote the input optical field amplitude in the bus waveguide as $s_{in}$ and the output field amplitude as $s_{out}$. We use $a_{1}$ and $a_{2}$ to represent the amplitudes of a counter-clockwise mode and a clockwise mode, respectively. These modes are degenerate when there is no coupling between them, and their resonant frequencies are close to the laser pump frequency: $\omega_{1} = \omega_{2} \approx \omega$. The total power decay rate of the ring resonator is $\gamma_{T}$, which is the sum of the coupling-induced power decay rate $\gamma_{ex}$ and the intrinsic loss (absorption, radiation, and scattering) induced power decay rate $\gamma_{in}$, given by $\gamma_{T} = \gamma_{in} + \gamma_{ex}$. The out-coupling decay rate $\gamma_{ex}$ depends on the ring circumference and coupling ratio, and this relation will be explained in detail later.

### Derivation of coupled mode equation

We use a phenomenological approach to derive the coupled mode equation for $a_{1}$ and $a_{2}$. In the absence of pump light, coupling loss, or backward mode coupling, each mode will oscillate at its resonant frequency and exhibits an exponential energy decay. Thus, the evolution of mode coefficients follows $a_{1,2} \propto \exp(-i\omega_{c} - \gamma_{T}/2)$. The corresponding equation of motion should be $da_{1,2}/dt = -(i\omega_{c}+\gamma_{T}/2)a_{1,2}$. Taking into account the backward mode coupling and input/output of the ring, the complete coupled mode equation takes the following form:

$$
\frac{da_{1}}{dt} = -(i\omega_{c} + \frac{\gamma_{T}}{2})a_{1} + g_{12}a_{2} + \kappa s_{in},\\
\frac{da_{2}}{dt} = -(i\omega_{c} + \frac{\gamma_{T}}{2})a_{2} + g_{21}a_{1}.  \tag{1}
$$

Here, $g_{12}$, $g_{21}$, and $\kappa$ are coefficients that need to be determined.

First, we determine $g_{12}$ and $g_{21}$. In the absence of coupling loss or intrinsic loss in the ring $\gamma_{T} = \gamma_{ex} = \gamma_{in} = 0$, the intracavity power should remain constant: $|a_{1}|^{2} + |a_{2}|^{2} = C$. We express the coupled mode equation in matrix form $d\mathbf{a}/dt = i\mathbf{H}\mathbf{a}$, where $\mathbf{H}$ must be a Hermitian matrix to ensure energy conservation. Hence, the matrix elements must satisfy $H_{12} = H_{21}^{ * }$, namely $-ig_{12} = (-ig_{21})^{*}$. For simplicity, we assume both $-ig_{12}$ and $-ig_{21}$ are real numbers, which means $-ig_{12} = -ig_{21} = g/2 \in \mathbb{R}$. Therefore, we can write $g_{12} = g_{21} = ig/2$, where $g$ is a real number representing the power coupling rate between the clockwise and counter-clockwise modes.

Next, we consider the out-coupling coefficient $\kappa$. Assuming no detuning and no mode coupling ($\Delta\omega = 0$ and $g = 0$) for simplicity, the evolution of the intracavity field is solely determined by the coupling loss. It is essential to note that coupling loss occurs only when light passes through the coupler, whereas intrinsic loss occurs throughout the ring. This distinction complicates our system modeling. However, we can apply the mean-field approximation, replacing the position-dependent coupling loss with a mean, uniformly distributed loss.

In each roundtrip time interval $\tau_{rt} = n_{g}L/c$, light in the ring resonator passes the coupler once. This results in the following change in the mode coefficient:

$$
\Delta a_{1} = i\sqrt{\theta}s_{in} + \sqrt{1-\theta}e^{-\alpha L/2}a_{1} - a_{1}.  \tag{2}
$$

Here, $\theta$ represents the power coupling ratio and $\alpha$ is the power attenuation coefficient. To simplify this expression, we apply the mean-field approximation by introducing the substitution $\Delta a_{1} = \frac{da_{1}}{dt}\tau_{rt}$. This substitution assumes that the coupling loss causes a continuous change in the mode coefficient $a_{1}$, implying that the roundtrip coupling loss is averaged over the time interval $\tau_{rt}$. With this mean-field approximation substitution, Equation 2 transforms to:

$$
\frac{da_{1}}{dt} = -\frac{\theta c}{2n_{g}L}a_{1} - \frac{\alpha c}{2n_{g}}a_{1} + i\frac{\sqrt{\theta}c}{n_{g}L}s_{in}.  \tag{3}
$$

In Equation 3, the first term represents the coupling loss, the second term denotes the intrinsic loss, and the third term corresponds to the gain. In deriving this equation, we have assumed the roundtrip change in $a$ is small and used the one-order approximation that $\sqrt{1-\theta}e^{-\alpha L/2} \approx 1 - \frac{\theta}{2} - \frac{\alpha L}{2}$. By comparing Equations 1 and 3, we can derive:

$$
\gamma_{in} = \frac{\alpha c}{n_{g}}, \gamma_{ex} = \frac{\theta c}{n_{g}L}, \kappa = i\frac{\sqrt{\theta}c}{n_{g}L}.  \tag{4}
$$

The transmitted optical field in the bus waveguide is given by:

$$
s_{out} = \sqrt{1-\theta}s_{in} + i\sqrt{\theta}a \approx s_{in} + i\sqrt{\theta}a,  \tag{5}
$$

This approximation holds when the roundtrip power coupling ratio $\theta \ll 1$.

### Coupled mode equation with mode coupling

In this section, we summarize the coupled mode equation derived earlier. For an all-pass ring resonator with both counter-clockwise and clockwise modes, the coupled mode equations for the mode coefficients $a_{1}$ and $a_{2}$ are given by [[2](#reference)]:

$$
\frac{da_{1}}{dt} = -(i\omega_{c} + \frac{\gamma_{ex}+\gamma_{in}}{2})a_{1} + i\frac{g}{2}a_{2} + i\sqrt{\gamma_{ex}}s_{in}',  \tag{6.1}
$$

$$
\frac{da_{2}}{dt} = -(i\omega_{c} + \frac{\gamma_{ex}+\gamma_{in}}{2})a_{2} + i\frac{g}{2}a_{1},  \tag{6.2}
$$

$$
s_{out}' = s_{in}' + i\sqrt{\gamma_{ex}}a_{1}.  \tag{6.3}
$$

In these equations:

- $\omega_{c}$ is the mode resonant frequency (in the absence of backward mode coupling).
- $s_{in}' = \sqrt{1/\tau_{rt}}s_{in}$ and $s_{out}' = \sqrt{1/\tau_{rt}}s_{out}$ are the scaled amplitudes of the input and transmitted optical fields, respectively. Here, $\tau_{rt} = n_{g}L/c$ represents the roundtrip delay.
- $\gamma_{in} = \alpha c/n_{g}$ is the intrinsic decay rate, where $\alpha$ is the intensity attenuation coefficient.
- $\gamma_{ex} = \theta c/n_{g}L$ is the coupling decay rate, with $\theta$ being the roundtrip power coupling ratio.
- $g$ denotes the power coupling rate between the counter-clockwise and clockwise modes.

### Resonance line shape with mode splitting

Here, we derive the steady-state transmission spectrum of an all-pass ring resonator with backscattering. In the steady state, the mode amplitudes oscillate at the laser frequency $\omega$, therefore $da_{1}/dt = -i\omega a_{1}$ and $da_{2}/dt = -i\omega a_{2}$. We denote the total decay rate as $\gamma_{T} = \gamma_{in}+\gamma_{ex}$. From the first two equations in Equation 6, we can derive:

$$
a_{2} = \frac{ig/2}{i\Delta\omega + \gamma_{T}/2}a_{1},  \tag{7.1}
$$
$$
a_{1} = \frac{ig/2}{i\Delta\omega + \gamma_{T}/2}a_{2} + \frac{i\sqrt{\gamma_{ex}}}{i\Delta\omega + \gamma_{T}/2}s_{in}'.  \tag{7.2}
$$

where $\Delta\omega = \omega$ is the detuning of the mode resonant frequency from the laser frequency. Substituting the first equation into the second one, we obtain:

$$
i\sqrt{\gamma_{ex}}a_{1} = s_{in}' \times \{-\frac{\gamma_{ex}/2}{i(\Delta\omega+g/2)+\gamma_{T}/2} - \frac{\gamma_{ex}/2}{i(\Delta\omega-g/2)+\gamma_{T}/2}\}.  \tag{8}
$$

Next, substituting Equation 8 into the third equation of Equation 6, we find the transmission spectrum of the all-pass ring:

$$
|\frac{s_{out}'}{s_{in}'}|^{2} = |1 - \frac{\gamma_{ex}/2}{i(\Delta\omega-g/2)+\gamma_{T}/2} - \frac{\gamma_{ex}/2}{i(\Delta\omega+g/2)+\gamma_{T}/2}|^{2}.  \tag{9}
$$

This expression indicates that the transmission spectrum has two resonance dips located at $\omega_{0} + g / 2$ and $\omega_{0} - g / 2$, where $\omega_{0}$ is the resonant frequency in the absence of mode coupling. In other words, the coupling between the counter-clockwise and clockwise modes lifts their degeneracy and results in a mode splitting of $g$. This mode splitting can be observed in the transmission spectrum of the all-pass ring if the resonance FWHM is relatively small $\gamma_{T} < g$. Otherwise, the doublet resonance dips merge and appear as a single Lorentzian resonance dip.

The PDF version of this note is available [here](/posts/note-microring-resonator-III/Note_ring_resonator_III.pdf).

## Reference

---

1. Bogaerts, W., De Heyn, P., Van Vaerenbergh, T., De Vos, K., Kumar Selvaraja, S., Claes, T., ... & Baets, R. (2012). Silicon microring resonators. Laser & Photonics Reviews, 6(1), 47-73.
2. Puckett, M. W., Liu, K., Chauhan, N., Zhao, Q., Jin, N., Cheng, H., ... & Blumenthal, D. J. (2021). 422 Million intrinsic quality factor planar integrated all-waveguide resonator with sub-MHz linewidth. Nature communications, 12(1), 934.