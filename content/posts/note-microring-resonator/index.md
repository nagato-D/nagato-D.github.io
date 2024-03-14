+++
title = 'Note on Microring Resonator'
author = 'Di Yu'
date = 2023-12-19
draft = false
+++

<!-- # Note on Ring Resonator
**Created on** 2023-12-19\
**Author** Di Yu (yudi.0211@foxmail.com) -->

{{< admonition type=note title="PDF version" open=false >}}
Please refer to [here](/posts/note-microring-resonator/Note_ring_resonator.pdf) for a PDF version of this note.
{{< /admonition >}}

## Introduction

---

In integrated photonics, resonators are usually formed by looped waveguides known as 'ring resonators.' Ring resonators offer favorable compactness and highly wavelength-selective transmission characteristics. For these reasons, ring resonators have become fundamental building blocks in integrated photonics, particularly in applications such as filters, sensors, and modulators, to name a few [[1](#reference)]. In this note, we will introduce the basic properties of ring resonators and briefly discuss their connection to materials and the fabrication process.

## Notations

---
+ $Q_{\rm int}$ (1): Intrinsic quality factor
+ $Q_{\rm ext}$ (1): External quality factor
+ $Q_{\rm load}$ (1): Loaded quality factor
+ $T$ (1): Intensity transmittance
+ $\lambda$ (m): Wavelength of light in free space
+ $n_{\rm eff}$ (1): Effective index of the resonator
+ $n_{g}$ (1): Group index of the resonator
+ $L$ (m): Circumference of the resonator
+ $\kappa$ (1): Power out-coupling ratio of the resonator
+ $\alpha_{i}$ (1/m): Internal intensity attenuation coefficient in the resonator
+ $\gamma$ (1): Intensity insertion loss/excess coupling loss of the resonator
+ ${\rm FWHM}$ (m): Full width half maximum of a resonant peak

## Quality Factor

---

The *intrinsic (internal) Q factor* of a resonator describes the lifetime of a photon in an isolated resonator in unit of the oscillation period of EM wave and with a coefficient of $2\pi$. That is, the intrinsic Q factor of a resonator reads [[2](#reference)]:

$$Q_{\rm int} = \frac{2\pi n_{\rm eff}}{\alpha_{i}\lambda}$$

Note that $\alpha$ incorporates two types of optical loss: propagation loss in straight waveguide sections or waveguides with constant curvature, and bending loss occurring at positions where the curvature of the (ring) resonator changes. The latter can be reduced by using Euler-spiral waveguide bending to form the resonator, which avoids a sharp change in the waveguide curvature. 

The *external Q factor* quantifies the impact of waveguide coupler on the lifetime of photons in the resonator. There are two factors that contribute to the external Q factor, including power out-coupling and excess coupling loss (due to nonadiabatic mode conversion/scattering/mode leakage/radiation) at the coupler. The external Q factor is formulated as follow:

$$Q_{\rm ext} = \frac{2\pi n_{\rm eff}}{-\ln(1-\gamma)-\ln(1-\kappa)}\frac{L}{\lambda} \approx \frac{2\pi n_{\rm eff}L}{\lambda}[\kappa+\gamma]^{-1}$$

The *loaded Q factor* is a measure of photon lifetime in a resonator coupled to a bus waveguide. It is determined by the photon loss rate both in the resonator and at the coupler and therefore follows the equation below [[3](#reference),[4](#reference)]:

$$Q_{\rm load} = Q_{\rm int} + Q_{\rm ext} = \frac{2\pi n_{\rm eff}L}{\lambda}[\kappa + \alpha_{i} L + \gamma]^{-1}$$

The loaded Q factor can be easily extracted from measured transmittance spectrum of the resonator using the equation below [[1](#reference)]:

$$Q_{\rm load} = \frac{\lambda_{\rm res}}{\rm FWHM}$$

where $\lambda_{\rm res}$ is a resonance frequency, and $\rm FWHM$ is the full width half maximum of the corresponding resonant peak in the transmittnce spectrum. This expression of $Q_{\rm load}$ implies that, from an experimental perspective, the loaded Q factor is a measure of the width of a resonant peak. The narrower the resonance peak, the larger the loaded Q factor. On the other hand, we observe that $Q_{\rm load}$ increases as the optical loss in the resonator decreases. Therefore, we can conclude with an important insight: the finite width of resonant peaks is due to the presence of optical loss in the resonator.

## How to Improve Quality Factor

---

+ To improve the intrinsic quality factor of a resonator, we need to reduce its optical losses, including material absorption, excess coupling loss, and cavity bending loss.

+ To reduce material absorption, one can use large bandgap materials such as silicon nitride and lithium niobate instead of those with a smaller bandgap like silicon.

+ To reduce excess coupling loss, one can employ a weakly tapered gap directional coupler, where the resonator is evanescently coupled to a waveguide, and the gap in between changes adiabatically.

+ To reduce cavity bending loss, one can incorporate waveguide bends in the resonator using Euler-spiral bending waveguides, where the curvature changes adiabatically, thus suppressing optical loss.

## Transmittance of Resonator

---

### Resonance
The transmittance spectra of a ring resonator is comprised of a series of equidistant dips, namely absorption peaks of the resonator. These transmittance dips/absorption peaks are known as resonances. Each resonance is associated with energy building up in the resonator in the form of standing wave, due to the frequency matching between the excitation and an eigenmode of the resonator. Therefore, these resonances locate at:

$$\lambda_{m} = \frac{n_{\rm eff}L}{m}, m = 1, 2, 3 ...$$

### Free Spectral Range
The spectral distance, or difference in frequency/wavelength between these resonances is defined as the free spectral range (FSR) of the resonator. FSR determines the spectral range free of resonance and is dependent of wavelength. For FSR around the m-th resonant frequency, it can be calculated with the equation below:

$${\rm FSR} = \frac{n_{\rm eff,1}L}{m} - \frac{n_{\rm eff,2}L}{m+1} \approx \frac{n_{\rm eff,1}L}{m^{2}} + \frac{\Delta n_{\rm eff}L}{m}.$$

where $n_{\rm eff,1}$ and $n_{\rm eff,2}$ represent the effective index of the resonator at the m-th and (m+1)-th resonant frequencies (denoted as $\lambda_{m}$ and $\lambda_{m+1}$), respectivley. $\Delta n_{\rm eff} = n_{\rm eff,1} - n_{\rm eff,2}$ represents their difference. We can rewrite the expression of FSR as follows:

$${\rm FSR} = \frac{\lambda_{m}^{2}}{n_{\rm eff,1}L} + {\rm FSR}\frac{\Delta n_{\rm eff}}{{\rm FSR}}\frac{L}{m}\\
= \frac{\lambda_{m}^{2}}{n_{\rm eff,1}L} + {\rm FSR}\frac{dn_{\rm eff}}{d\lambda}\frac{\lambda_{m}}{n_{\rm eff,1}}$$

Solving this equation, we obtain the expression of FSR as follows [[1](#reference)]:

$${\rm FSR} = \frac{\lambda_{m}^{2}}{L}/(n_{\rm eff,1}-\lambda_{m}\frac{dn_{\rm eff}}{d\lambda}) = \frac{\lambda_{m}^{2}}{n_{g}L}$$

Where $n_{g} = n_{\rm eff} - \lambda_{m} dn_{\rm eff}/d\lambda$ is the group index of the resonator at $\lambda_{m}$, which has taken into account the dispersion effect. The corresponding group velocity in the resonator is $v_{g} = c/n_{g}$. Note that, when the dispersion effect is ignorable, the group index will be equal to effective index.

## Coupling Regimes

---

The optical transmission characteristics of a waveguide coupled to a ring resonator may vary significantly with their coupling strength. In fact, there are three coupling regimes for the coupled resonator, distinguished in the relative size of the power coupling ratio $\kappa$ (1) and the single-trip optical loss rate $l = 1 - \exp(-\alpha_{i}L)(1-\gamma)$.

### Over-coupling Regime
The resonator is in the over-coupling regime if $\kappa > l$. In this regime, the coupling strength between the waveguide and the resonator is larger than the optical loss rate in the resonator, and the out-coupling of the resonator becomes the dominant factor contributing to the finite resonance width. The over-coupling regime is usually employed in applications such as modulators and detectors.

### Under-coupling Regime
The resonator is in the under-coupling regime if $\kappa < l$. In this regime, the main source of optical loss is the internal cavity loss, rather than the out-coupling or insertion loss. In large band gap materials such as silicon nitride, the internal cavity loss could be low (0.1 dB/cm), enabling a high Q factor and narrow resonant peaks. Since a narrow resonance is widely used in high-resolution measurements, the under-coupling regime becomes an ideal choice for applications such as sensors.

### Critical-coupling Regime
The resonator is in the critical-coupling regime if $\kappa = l$. The most remarkable feature of this regime is that the transmittance of the bus waveguide at resonance is minimized, making it a favorable regime for band-pass/stop filters.

## Reference

---

1. Bogaerts, W., De Heyn, P., Van Vaerenbergh, T., De Vos, K., Kumar Selvaraja, S., Claes, T., ... & Baets, R. (2012). Silicon microring resonators. Laser & Photonics Reviews, 6(1), 47-73.
2. Tran, M. A., Huang, D., & Bowers, J. E. (2019). Tutorial on narrow linewidth tunable semiconductor lasers using Si/III-V heterogeneous integration. APL photonics, 4(11).
3. Spencer, D. T., Bauters, J. F., Heck, M. J., & Bowers, J. E. (2014). Integrated waveguide coupled Si 3 N 4 resonators in the ultrahigh-Q regime. Optica, 1(3), 153-157.
4. Schwelb, O. (2004). Transmission, group delay, and dispersion in single-ring optical resonators and add/drop filters-a tutorial overview. Journal of Lightwave Technology, 22(5), 1380-1394.