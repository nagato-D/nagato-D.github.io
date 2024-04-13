+++
title = "Note on Kerr Solitons"
author = 'Di Yu'
date = 2024-04-13
draft = false
+++

{{< admonition type=note title="PDF version" open=false >}}
Please refer to [here](/posts/note-kerr-soliton/Note_Kerr_soliton.pdf) for a PDF version of this note.
{{< /admonition >}}

## Introduction to Kerr Nonlinearity and Solitons

---

Kerr effect refers to the phenomenon that the refractive index of a material changes linearly with the intensity of an external electric field. Light passing through a material with the Kerr effect can induce a refractive index change since light is associated with an oscillating electric field. Formally, this change in refractive index is formulated as $\Delta n = n_{0}+n_{2}I$ [[1](#reference)]. Here, $n$ represents the index of refraction and $I$ stands for the intensity of light. $n_{0}$ is the refractive index at zero light intensity, and $n_{2}$ is called the Kerr coefficient or second-order nonlinear refractive index. Kerr effect has been observed in various materials, including Si3N4, Ti2O5, SiO2, MgF2, to mention a few.

Kerr effect is a typical nonlinear optical effect. In fact, if we substitute the intensity-dependent refractive index into Maxwell's equations, we can obtain a wave equation of $\mathbf{E}$ with nonlinear terms. This equation has no solutions that oscillate at a single frequency. Instead, the electric field must oscillate at multiple frequencies even if the field is excited by a dipole in a harmonic oscillation. In this case, we say the dynamics of the electromagnetic fields is nonlinear, and the solutions to the nonlinear dynamic equation with stationary waveforms are called solitons.

## Fiber Solitons

---

Fiber solitons are optical pulses that maintain their shapes when travelling along an optical fiber, which comes from an exact balance between waveguide dispersion and the Kerr effect. This concept was first proposed in 1973 by two scientists at Bell Laboratories, Akira Hasegawa and Frederick Tappert, in a series of groundbreaking papers [[2,3](#reference)]. At that time, waveguide dispersion was widely recognized as an annoying effect that distorts signals transmitting through optical fibers. The proposal of nonlinear effect for countering the waveguide dispersion immediately attracted immense interest, especially in the potential of fiber solitons for high-speed communication. Although the industry today exclusively implements dense wavelength division multiplexing as an alternative to soliton communication for a higher signal capacity and lower cost, fiber solitons can still serve as a good starting point for diving into the world of nonlinear optics.

Here we introduce a single analytical model that explains the basic dynamics of fiber solitons [[2,3](#reference)]. Let's consider a single-mode waveguide with effective index,

$$
n = n_{0}(\omega)+i\chi(\omega)+n_{2}\overline{E^{2}},  \tag{1}
$$

where $\chi(\omega)>0$ characterizes optical attenuation, and $n_{2}$ describes Kerr nonlinearity. We assume the electric field in the waveguide has the form that

$$
E(x, r, t) = R(r){\rm Re}[{\phi(x, t)\exp[i(k_{0}x-\omega_{0}t)]}],  \tag{2}
$$

where $R_{r}$ corresponds to electric field distribution in the transverse direction, $\phi(x, t)$ represents the envelope shape of the wave along the longitudinal direction, and $\exp[i(k_{0}x-\omega_{0}t)]$ is a carrier wave such that $ck_{0} = \omega_{0}n_{0}(\omega_{0})$.

If we substitute Eqs. 1 and 2 into Maxwell's equations and integrate out the radial coordinate $r$, we will obtain a one-dimensional nonlinear wave equation of the envelope:

$$
i(\frac{\partial\phi}{\partial t}+\omega_{0}'\frac{\partial\phi}{\partial x}+v_{0}\phi) + \frac{1}{2}\omega_{0}''\frac{\partial^{2}\phi}{\partial x^{2}} + \frac{\alpha\omega_{0}n_{2}}{n_{0}}|\phi|^{2}\phi = 0.  \tag{3}
$$

Here, $\omega_{0}' = \partial\omega_{0}/\partial k_{0}$ is the group velocity at $\omega_{0}$, $\omega_{0}'' = \partial^{2}\omega_{0}/\partial k_{0}^{2}$ represents the group velocity dispersion at $\omega_{0}$, $v_{0} = \chi(\omega_{0})\omega_{0}/n_{0}$ is the scaled optical loss in the waveguide, and $\alpha$ is a unitless quantity that depends on the radial variation of the electric field $R(r)$.

Now let's analyze the physical meaning of Eq. 3. The first two terms describe an envelope translating at a constant group velocity $\omega_{0}'$, the third, fourth, and fifth terms account for optical loss, group velocity dispersion, and Kerr nonlinearity, respectively.

We are particularly interested in solutions to Eq. 3 that feature stationary envelopes. These envelopes are allowed to move in space but their waveform must remain unchanged. Such stationary solutions to the nonlinear equation are called (Kerr) solitons. In searching for Kerr soliton solutions to Eq. 3, we treat the scenarios $\omega_{0}''>0$ and $\omega_{0}''<0$ individually, since they have quite different solution sets. The case of $\omega_{0}''>0$ corresponds to anomalous dispersion, meaning that the group velocity of light increases with frequency. In contrast, $\omega_{0}''$ represents normal dispersion, whih features a group velocity of light decreasing with frequency. The waveguide dispersion includes two parts, material dispersion and geometrical dispersion. Typically, material dispersion is normal dispersion, while the geometrical dispersion could be normal or anomalous, depending on if the optical confinement is weak or strong.

### Bright solitons

If the waveguide has anomalous dispersion ($\omega_{0}''>0$), Eq. 3 has soliton solutions with light intensity localized both in space and in time, namely optical pulses. These solutions are called bright solitons or bright pulses and can be expressed as

$$
\phi(x, t) = E_{s}{\rm sech}(\frac{t-t_{0}-x/v_{g}}{\tau_{0}})\exp[i(kx-\Omega t)],  \tag{4}
$$

where $E_{s}$ is the maximum field intensity, $\tau_{0}$ is the pulse temporal half-width, $\Omega$ is the frequency shift, $k$ is the wavenumber shift, and $v_{g}$ is the transmission speed of the pulse. These quantities are related through $\Omega = k\omega_{0}'+\frac{1}{2}k^{2}\omega_{0}''-\alpha\omega_{0}n_{2}E_{s}^{2}/2n_{0}$, $v_{g} = \omega_{0}'+k\omega_{0}''$, and $E_{s}^{2} = n_{0}\omega_{0}''/\alpha\omega_{0}n_{2}v_{g}^{2}\tau_{0}^{2}$, and $t_{0}$ is the pulse center. Combining the solved envelope and the carrier wave, we obtain the frequency of the soliton $\omega_{c} = \omega_{0}+k\omega_{0}'+\frac{1}{2}k^{2}\omega_{0}''-\alpha\omega_{0}n_{2}E_{s}^{2}/2n_{0}$ and the wave number $k_{c} = k_{0}+k$. Since we have five parameters ($E_{s}, \tau_{0}, \Omega, k, v_{g}$) with three constraints, there are two independent parameters that can be chosen arbitrarily by the initial condition.

### Dark solitons

If the waveguide has normal dispersion ($\omega_{0}''<0$), Eq. 3 has solutions known as dark solitons, dark pulses, or envelope shocks. These solutions feature a background of constant light intensity with a localized dip. Dark solitons have the form that

$$
\phi(x, t) = E_{s}{\rm tanh}(\frac{t-t_{0}-x/v_{g}}{\tau_{0}})\exp[i(kx-\Omega t)],  \tag{5}
$$

where the notations are the same as in Eq. 4. The parameters are related through $\Omega = k\omega_{0}'+\frac{1}{2}k^{2}\omega_{0}''-\alpha\omega_{0}n_{2}E_{s}^{2}/n_{0}$, $v_{g} = \omega_{0}'+k\omega_{0}''$, and $E_{s}^{2} = -n_{0}\omega_{0}''/\alpha\omega_{0}n_{2}v_{g}^{2}\tau_{0}^{2}$.

## Dissipative Kerr Solitons in Optical Microresonators

---

Fiber Kerr solitons constitute an elegant solution to coherent multi-wavelength optical sources. Unfortunately, their implementation requires a mode-locked laser that injects optical pulses and a large volume for deploying optical fibers, rendering fiber-based soliton generators expensive and bulky and limiting their applications. For these reasons, people gradually lost their interest in the study of Kerr solitons.

But things changed in 2007, when a group of Max Planck Institute of Quantum Optics led by Prof. Tobias J. Kippenberg (now at EPFL) demonstrated that optical microresonators could generate Kerr solitons [[4](#reference)]. Remarkably, the generation of Kerr solitons in microresonators can be pumped by a continuous wave laser and requires a compact footprint. Moreover, the frequency spectrum of the generated Kerr solitons exhibits coherent equidistant comb lines, known as optical frequency combs, which are ideal for applications such as high-speed optical communication, precision metrology, and light detection and ranging (LIDAR). These fascinating properties of microresonator Kerr solitons raise considerable interests in the following decade.

Here we present a simple physics picture of how Kerr solitons form in an optical microresonator with Kerr nonlinearity. First, light is pumped into a single mode of the resonator by a continuous-wave laser. Then, the continuous-wave light circulating in the resonator gradually localizes and becomes an optical pulse due to Kerr nonlinearity. In frequency domain, this localization of optical waveform corresponds to the excitation of sideband resonances of the microresonator due to four-wave mixing. The optical pulse circulates in the microresonator and ejects part of its energy to the bus waveguide each time when it passes through the region evanescently coupled to the bus waveguide. This results in a periodic train of optical pulses emitted to the bus waveguide, which features a frequency spectrum consisting of equidistant spectral lines. An informative illustration of the formation of microresonator Kerr solitons can be found in [[5](#reference)].

There are some key differences between fiber Kerr solitons and microresonator Kerr solitons. First, there is no external energy input during the propagation of fiber solitons, while microresonator Kerr solitons accept external gain from its periodic passenge through the bus waveguide. Therefore, the formation of Kerr solitons in microresonators involves the balance between gain and loss, in addition to that between dispersion and the nonlinear effect. Note that the formation of fiber solitons only involve the balance between dispersion and nonlinear effect. Since microresonator Kerr solitons are formed in an open system with energy exchange with the environment, we call these solitons dissipative Kerr solitons (DKS).

Second, electromagnetic field in a microresonator must satisfy a periodic condition. This results in the emission of a periodic train of the optical pulses into the bus waveguide and a discrete optical spectrum of the DKSs. In contrast, fiber solitons exhibit a continuous optical spectrum since they are not constraint by a periodic boundary condition. When the fiber solitons have a broadband continuous optical spectrum, we call this spectrum a supercontinuum [[6](#reference)]. Supercontinuum is another hot research topic in recent years. 

### Lugiato-Lefever Formalism

In this section, we introduce the Lugiato-lefever equation (LLE) that quantitatively describes the formation of dissipative Kerr solitons in a microresonator [[7](#reference)]. This equation establishes the time evolution equation of optical fields in a nonlinear microresonator and explains the formation of solitons. The idea of the derivation of LLE is quite simple, one only needs to transform the modal equations derived in [[8](#reference)], which utilizes coupled mode theory to explain the formation of optical frequency combs in a microresonator. All we need to do is to transform the equations of modal complex amplitudes to a differential equation of optical field envelope. We will detail this transform procedure below.

Each mode of the microresonator can be indexed by an integer. In particular, we denote the index of the pumped mode as $l_{0}$. The frequencies of resonator modes are a function of the mode index and can be expressed as a Taylor series:

$$
\omega_{l} = \omega_{l_{0}}+\sum_{n=1}^{N}\frac{\zeta_{n}}{n!}(l-l_{0})^{n},  \tag{6}
$$

where $\omega_{l}$ is the frequency of the $l$-th mode, $\zeta_{n}$ is the $n$-th order dispersion coefficient with $\zeta_{1}$ the free spectral range at frequency $\omega_{l_{0}}$.

By using coupled mode theory/modal expansion method, one can derive a set of equations for the complex amplitudes of resonator modes [[8](#reference)]:

$$
\frac{dA_{l}}{dt} = -\frac{1}{2}\Delta\omega_{l}A_{l}+\frac{1}{2}\Delta\omega_{l}F_{l}e^{i(\Omega_{0}-\omega_{l})t}\delta(l-l_{0})-ig_{0}\sum_{l_{m},l_{n},l_{p}}A_{l_m}A_{l_{n}}^{*}A_{l_{p}}e^{[i(\omega_{l_{m}}-\omega_{l_{n}}+\omega_{l_{p}}-\omega_{l})t]}\\
\times\Lambda_{l}^{l_{m}l_{n}l_{p}}\delta(l_{m}-l_{n}+l_{p}-l). (7)
$$

In this equation, $A_{l}$ is the complex amplitude of the $l$-th mode. The mode fields have been normalized such that $A_{l}$ is unitless and equals the photon number in mode $l$. $\Delta\omega_{l} = \omega_{l}/Q_{0}$ is the linewidth of the mode $l$, which is inversely proportional to the loaded quality factor $Q_{0}$. Note that we have assumed all the modes to have the same loaded quality factor. $F_{0}$ is the amplitude of the external excitation, and $\Omega_{0}$ denotes the angular frequency of the pumping light. $\delta(x)$ is the Kronecker function that takes 1 at $x=0$ and 0 elsewhere. The four-wave mixing gain $g_{0} = n_{2}c\hbar\omega_{l_{0}}^{2}/n_{0}^{2}V_{0}$, where $\hbar$ is reduced Planck's constant, $n_{2}$ is the Kerr coefficient at $l = l_{0}$, and $V_{0}$ is the effective mode volume. Note that $g_{0}$ corresponds to the nonlinear frequency shift of the pumped mode when there is one photon in that mode. $\Lambda_{l}^{l_{m}l_{n}l_{p}}$ represents the variation of nonlinear gain with mode number, which comes from variations in the mode overlap and the Kerr coefficient.

If we only consider the modes with an index around $l_{0}$, then the variation of four-wave mixing gain with mode index becomes negligible, and we have $\Lambda_{l}^{l_{m}l_{n}l_{p}} \approxeq 1$. This approximation doesn't apply to the case where the frequency spectrum approaches or surpasses an octave of bandwidth. In this scenario, one must keep the higher-order Talor expansion terms of $\Lambda_{l}^{l_{m}l_{n}l_{p}}$. To the lowest-order approximation, we have

$$
\Lambda_{l}^{l_{m}l_{n}l_{p}} = 1+\eta_{l}(l-l_{0})+\eta_{l_{m}}(l_{m}-l_{0})+\eta_{l_{n}}(l_{n}-l_{0})+\eta_{l_{p}}(l_{p}-l_{0}),  \tag{8}
$$

where $\eta_{l} = \partial\Lambda/\partial l$ is evaluated at $l=l_{m}=l_{n}=l_{p}=l_{0}$. Other coefficients $\eta_{l_{m}}$, $\eta_{l_{n}}$, and $\eta_{l_{p}}$ are defined in a similar way.

Since the mode overlap reaches a maximum at $l=l_{m}=l_{n}=l_{p}=l_{0}$, these first-order contributions will be dominated by variations of the Kerr coefficient due to changes in the mode volume.

By the definition of mode amplitudes $A_{l}$, we can establish a relation between these amplitudes and the envelope defined in the real space $A = A(\theta, t)$:

$$
A(\theta, t) = \sum_{l}A_{l}(t)\exp[i(\omega_{l}-\omega_{l_{0}})t-i(l-l_{0})\theta],  \tag{9}
$$

where $\theta \in [-\pi, \pi]$ is the azimuthal angle along the circumference. Note that the envelope $A(\theta, t)$ is defined in a coordinate system that oscillates in time at angular frequency $\omega_{l_{0}}$ and in space with a wavenumber $l_{0}$. This choice of coordinate system will simplify the spatiotemporal dynamic equation for $A(\theta, t)$.

By differentiating two sides of Eq. 9 with respect to $t$ and $\theta$, we obtain

$$
\frac{\partial A}{\partial t} = \sum_{l}[\frac{dA_{l}}{dt}+i(\omega_{l}-\omega_{l_{0}})A_{l}]e^{[i(\omega_{l}-\omega_{l_{0}})t-i(l-l_{0})\theta]},  \tag{10}
$$

as well as

$$
i^{n}\frac{\partial^{n}A}{\partial\theta^{n}} = \sum_{l}(l-l_{0})^{n}A_{l}e^{[i(\omega_{l}-\omega_{l_{0}})t-i(l-l_{0})\theta]}.  \tag{11}
$$

If we make the approximation that $\Delta\omega_{l} = \Delta\omega_{l_{0}}$ and substitute Eqs. 7, 8, and 11 into Eq. 10, then we obtain

$$
\frac{\partial A}{\partial t} = -\frac{1}{2}\Delta\omega_{l_{0}}A - ig_{0}|A|^{2}A + \frac{1}{2}\Delta\omega_{l_{0}}F_{0}e^{i\sigma t} + \sum_{n=1}^{N}i^{n+1}\frac{\zeta_{n}}{n!}\frac{\partial^{n}A}{\partial\theta^{n}}\\
+g_{0}[\eta_{l}\frac{\partial}{\partial\theta}(|A|^{2}A)+2\eta_{l_{m}}|A|^{2}\frac{\partial A}{\partial\theta}-\eta_{l_{n}}A^{2}\frac{\partial A^{*}}{\partial\theta}], (12)
$$

where $\sigma = \Omega_{0}-\omega_{l_{0}}$ denotes the detuning between the laser and the pumped mode. It's worthwhile mentioning that Eq. 12 incorporates the frequency dependency of nonlinearity but neglects that of absorption.

We can greatly simplify Eq. 12 by transforming the coordinate system by $A \rightarrow A\exp(i\sigma t)$ and $\theta \rightarrow \theta+\zeta_{1}t {\rm mod} [2\pi]$ and neglecting the frequency dependency of nonlinearity by $\Lambda_{l}^{l_{m}l_{n}l_{p}} \approxeq 1$. The consequence of these transformations and approximation is a variant of the LLE regarding $A(\theta, t)$:

$$
\frac{\partial A}{\partial t} = -\frac{1}{2}\Delta\omega_{l_{0}}A-i\sigma A+\frac{1}{2}\Delta\omega_{l_{0}}F_{0}-ig_{0}|A|^{2}A-i\frac{\zeta_{2}}{2}\frac{\partial^{2}A}{\partial\theta^{2}}.  \tag{13}
$$

Eq. 13 is the well known LLE that captures soliton formation in an optical microresonator. This LLE with periodic boundary condition is equivalent to the modal expansion equations as long as higher-order dispersion as well as the frequency dependency of $\Delta\omega_{l}$ and $\Lambda_{l}^{l_{m}l_{n}l_{p}}$ in Eq. 7 can be neglected. Additionally, Eq. 13 can be recast to the normalized form of LLE:

$$
\frac{\partial\psi}{\partial\tau} = -(1+i\alpha)\psi+i|\psi|^{2}\psi-i\frac{\beta}{2}\frac{\partial^{2}\psi}{\partial\theta^{2}}+F,  \tag{14}
$$

where the field envelope has been rescaled by

$$
\psi = \sqrt{2g_{0}/\Delta\omega_{l_{0}}}A^{*}
$$

and the time has been rescaled so that

$$
\tau = \Delta\omega_{l_{0}}t/2.
$$

The dimensionless parameters of this normalized equation are the frequency detuning $\alpha = -2\sigma/\Delta\omega_{l_{0}}$, the dispersion $\beta = -2\zeta_{2}/\Delta\omega_{l_{0}}$, and the external pump $F = \sqrt{2g_{0}/\Delta\omega_{l_{0}}}F_{0}^{*}$.

## Reference

---

1. https://en.wikipedia.org/wiki/Kerr_effect
2. Hasegawa, A., & Tappert, F. (1973). Transmission of stationary nonlinear optical pulses in dispersive dielectric fibers. I. Anomalous dispersion. Applied Physics Letters, 23(3), 142-144.
3. Hasegawa, A., & Tappert, F. (1973). Transmission of stationary nonlinear optical pulses in dispersive dielectric fibers. II. Normal dispersion. Applied Physics Letters, 23(4), 171-172.
4. Del'Haye, P., Schliesser, A., Arcizet, O., Wilken, T., Holzwarth, R., & Kippenberg, T. J. (2007). Optical frequency comb generation from a monolithic microresonator. Nature, 450(7173), 1214-1217.
5. Herr, T., Gorodetsky, M. L., & Kippenberg, T. J. (2016). Dissipative Kerr solitons in optical microresonators. Nonlinear optical cavity dynamics: from microresonators to fiber lasers, 129-162.
6. https://en.wikipedia.org/wiki/Supercontinuum
7. Chembo, Y. K., & Menyuk, C. R. (2013). Spatiotemporal Lugiato-Lefever formalism for Kerr-comb generation in whispering-gallery-mode resonators. Physical Review A, 87(5), 053852.
8. Chembo, Y. K., & Yu, N. (2010). Modal expansion approach to optical-frequency-comb generation with monolithic whispering-gallery-mode resonators. Physical Review A, 82(3), 033801.