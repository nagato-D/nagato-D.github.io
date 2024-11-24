+++
title = 'Note on Schawlow-Townes Linewidth'
author = 'Di Yu'
date = 2024-11-24
draft = false
+++

## Background

---

In 1958, A. L. Schawlow and C. H. Townes of Bell Telephone Laboratories published a famous paper titled "Infrared and Optical Masers," in which the proposal of building "masers at infrared or optical frequencies" is described. Such devices, nowadays referred to as lasers, were later realized by Theodore Maiman in 1960. Lasers serve as light sources for high-speed communication, remote sensing, and precision metrology, profoundly influencing the development of science and technology.

In this note, I will present a derivation of the quantum-fluctuation-limited laser Lorentzian linewidth, or the Schawlow-Townes linewidth. The Schawlow-Townes linewidth is also referred to as the fundamental linewidth and the intrinsic linewidth in the literature. The Schawlow-Townes linewidth was first proposed by Schawlow and Townes in their 1958 paper and provides very important insight for the practice of building high-performance lasers.

## Preliminaries

---

### Lorentzian line shape

The Lorentzian line shape is a function of frequency defined by:

$$
L(\nu) = \frac{1}{1 + (\frac{\nu-\nu_{0}}{w/2})^{2}},
$$

where $\nu_{0}$ is the position of the maximum, and $w$ is the full width at half maximum (FWHM) of the function, usually referred to as the Lorentzian linewidth. This function plays an important role in practical applications since the power spectral density of many resonance phenomena has the Lorentzian line shape.

Now we derive the time-domain signal $s(t)$ that corresponds to a Lorentzian line shape. The power spectral density of this signal should be $|F(s)|^{2} = L(\nu)$, where $F$ denotes the Fourier transform. Note that

$$
L(\nu) = \frac{1}{(1+i\frac{\nu-\nu_{0}}{w/2})(1-i\frac{\nu-\nu_{0}}{w/2})} = |\frac{1}{(1+i\frac{\nu-\nu_{0}}{w/2})}|^{2}.
$$

Therefore, $F(s) = [1+i\frac{(\nu-\nu_{0})}{w/2}]^{-1}$ up to a phase factor $e^{i\phi}$. For simplicity, we only consider the case where the phase factor is 1. The time-domain signal $s(t)$ can be derived by applying the inverse Fourier transform to $F(s)$, leading to (refer to the Fourier transform table on Wiki):

$$
s(t) = \pi w\exp(-\pi wt + i2\pi\nu_{0}t)u(t),
$$

where $u(t)$ is the Heaviside unit step function. Therefore, a Lorentzian line shape corresponds to an oscillating signal with an exponentially decaying amplitude in the time domain. The oscillation period corresponds to the center frequency of the Lorentzian line shape, and the intensity decay rate $\nu_{\rm decay}$ is $2\pi$ times the FWHM of the Lorentzian linewidth $w$, namely

$$
\nu_{\rm decay} = 2\pi w.  \tag{1}
$$

### Passive Fabry-Perot cavity

Consider a Fabry-Perot (FP) cavity with two end mirrors and a gain medium. Such an FP cavity forms a laser. In this section, we derive the linewidth narrowing of this laser due to the presence of intracavity optical gain. Our analysis is based on a semi-classical model, and the result will be used for deriving the Schawlow-Townes linewidth expression.

For simplicity, we assume the gain medium to be an ensemble of two-energy-level atoms. Furthermore, the gain spectrum of this ensemble is assumed to be broader than the cavity resonance in terms of spectral width. Moreover, the free spectral range (FSR) of the FP cavity is assumed to be much larger than the gain spectrum bandwidth, such that there is only one longitudinal mode that can be excited for lasing.

In the small signal scenario, the stimulated emission can be neglected, and there are only spontaneous emission and absorption in the cavity. Since the gain spectrum is almost uniform across the cavity resonance, the optical output of the FP cavity should have the same spectral shape as the cavity resonance (note that we have assumed the end mirror reflectance to be wavelength-independent). In this case, the optical spectrum of the FP cavity output has a Lorentzian line shape with a linewidth

$$
\Delta\nu_{L} = \frac{1}{2\pi}(\nu_{a}+\nu_{cp}) = \Delta\nu_{c} + \frac{\nu_{a}}{2\pi},  \tag{2}
$$

where $\Delta\nu_{L}$ denotes the Lorentzian linewidth of the FP cavity output, $\Delta\nu_{c}$ is the cavity resonance FWHM in the absence of medium absorption or gain, $\nu_{a}$ is the medium absorption rate (this leads to a photon population in time, $\phi \propto e^{-\nu_{a}t}$, same for other photon loss or gain rates), and $\nu_{cp}$ is the out-coupling rate. It can be readily shown that

$$
\nu_{cp} = -\frac{n_{g}L}{c\ln(R_{1}R_{2})},\\
\nu_{a} = cl = -cN\sigma,
$$

where $R_{1}$ and $R_{2}$ are the reflectances of the two end mirrors, $L$ is the FP cavity length, $n_{g}$ is the group index of the medium at the cavity resonant wavelength, $l$ is the intracavity loss per unit length, $\sigma$ is the effective cross-section of each atom (photon absorption probability per atom), and $N$ is the difference between the excited-state atom density and the ground-state atom density. Note that $N < 0$ in the small signal case.

### Active Fabry-Perot cavity

Now let's increase the intracavity gain such that the stimulated emission rate is appreciable and see how the optical spectrum of the cavity output will change. In this case, the intracavity photon lifetime will increase due to the presence of optical gain. Yet, the cavity optical spectrum will still have a Lorentzian line shape, as long as the intracavity gain and loss are uniformly distributed and the light intensity changes exponentially during propagation in the cavity. From the Fourier transform, the Lorentzian linewidth of the cavity output is

$$
\Delta\nu_{L} = \frac{1}{2\pi}|\nu_{a}+\nu_{cp}-\nu_{st}| = \Delta\nu_{c}|1 + \frac{\nu_{a}-\nu_{st}}{2\pi\nu_{cp}}| = \Delta\nu_{c}|1 - cg\tau_{cp}|,  \tag{3}
$$

where $\nu_{st}$ is the stimulated emission rate, $g = (\nu_{st} - \nu_{a})/c$ is the optical gain per unit length, and $\tau_{cp} = 1/\nu_{cp}$ is the inverse cavity out-coupling rate.

From Eq. 3, we can see that the cavity output linewidth narrows as the gain increases. This effect is known as the linewidth narrowing effect, which explains why a laser can have a Lorentzian linewidth much narrower than the cavity resonance FWHM.

Eq. 3 can be recast in a more practical form. The total spontaneous emission rate $R_{sp} = \nu_{sp}$ describes the contribution of spontaneous emission to the rate of photon population change $d\phi/dt$. $R_{sp}$ is independent of the photon population number of the cavity mode $\phi$. However, we have the total stimulated emission rate $R_{st} = \nu_{st} \phi$, the total medium absorption rate $R_{a} = \nu_{a} \phi$, and the total out-coupling rate $R_{cp} = \nu_{cp} \phi = \phi / \tau_{cp}$; all these three quantities are proportional to the photon population number $\phi$. Note that

$$
cg\tau_{cp} = \frac{cg\phi}{\phi/\tau_{cp}} = \frac{R_{st}-R_{a}}{R_{cp}}.  \tag{4}
$$

Inserting Eq. 4 into Eq. 3, we obtain a simple and practical relation between the FP laser Lorentzian linewidth $\Delta\nu_{L}$ and the cavity resonance FWHM $\Delta\nu_{c}$:

$$
\Delta\nu_{L} = \Delta\nu_{c}|\frac{R_{cp}+R_{a}-R_{st}}{R_{cp}}|.  \tag{5}
$$

## Derivation of Schawlow-Townes Linewidth

---

Here we present a derivation of the well-known Schawlow-Townes linewidth expression [[2](#reference)], which establishes the quantum-fluctuation-limited lower bound on the Lorentzian linewidth of a laser.

It is important to note that, in the steady state (e.g., continuous wave operation) of a FP laser, the stimulated emission rate does not balance the sum of absorption and out-coupling rate: $R_{a}+R_{cp}-R_{st} \neq 0$. This is a significant fact since otherwise the cavity output will have a null linewidth $\Delta\nu_{L} = 0$, according to Eq. 3. Instead, due to the presence of spontaneous emission, the steady-state equation should be: 

$$
R_{a} + R_{cp} - R_{st} - R_{sp} = (\nu_{a}+\nu_{cp}-\nu_{st})\phi - \nu_{sp} = 0,  \tag{6}
$$

with $\nu_{sp}$ the spontaneous emission rate.

For a FP laser operating in a steady state, the Lorentzian linewidth of laser output is obtained by inserting Eq. 6 into Eq. 5. This substitution leads to an equation that makes clear the contribution of spontaneous emission to the laser linewidth:

$$
\Delta\nu_{L} = \Delta\nu_{c}\frac{R_{sp}}{R_{cp}}.  \tag{7}
$$

According to quantum optics, the total spontaneous emission rate $R_{sp}$ is related to the total stimulated emission rate $R_{st}$ by [[3](#reference)]

$$
R_{st} = \phi R_{sp},
$$

where $\phi$ is the photon population of the cavity mode resonant with the atomic transition. When the gain is large enough, the stimulated emission rate will be appreciably larger than the spontaneous emission rate. Furthermore, the medium absorption will be low if most atoms are in excited states, and the cavity out-coupling will become the major loss mechanism. Therefore,

$$
R_{sp} = \frac{1}{\phi}R_{st} \approx \frac{1}{\phi}(R_{sp}+R_{st}) = \frac{1}{\phi}(R_{a}+R_{cp}) \approx \frac{1}{\phi}R_{a}.  \tag{8}
$$

Inserting Eq. 8 into Eq. 7, we obtain the famous Schawlow-Townes linewidth expression:

$$
\Delta\nu_{L} = \Delta\nu_{c}\frac{1}{\phi} = \Delta\nu_{c}\frac{1/\tau_{c}}{P_{\rm out}/h\nu_{c}} = \frac{2\pi h\nu_{c}(\Delta\nu_{c})^{2}}{P_{\rm out}},  \tag{9}
$$

where $\tau_{c} = 1/\nu_{cp} = 1/2\pi\Delta\nu_{c}$ is the inverse cavity out-coupling rate, $\nu_{c}$ is the cavity mode frequency (which is also the laser operating frequency), $P_{\rm out} = h\nu_{c}\phi/\tau_{c}$ is the FP laser output power.

## Remark on Schawlow-Townes Linewidth

---

The Schawlow-Townes linewidth establishes the quantum fluctuation-limited Lorentzian linewidth of a laser. This linewidth is typically in the Hz or kHz range. In practice, however, due to the presence of various technical noise sources, the laser linewidth is typically orders of magnitude larger than the Schawlow-Townes linewidth, falling in the kHz or MHz range. In this sense, the Schawlow-Townes linewidth should be understood as the laser linewidth that can be achieved if all technical noise sources are carefully isolated, which is, of course, unlikely to happen.

One important insight is that the Schawlow-Townes linewidth is proportional to the squared cavity resonance linewidth and is inversely proportional to the laser output power. Therefore, for a cavity with a given resonant wavelength, as the cavity Q factor increases, the laser linewidth will narrow by a factor of $Q^{2}$. This argument indicates that a high-Q cavity is highly important for realizing a narrow-linewidth laser. Furthermore, as the output power increases, the stimulated emission rate increases, and the coherent amplification in the cavity becomes stronger. Meanwhile, the spontaneous emission rate remains constant, which leads to reduced phase fluctuations and therefore a narrowed linewidth. The scaling law described above is now a basic principle of building high-performance lasers.

## Reference

---

1. Schawlow, A. L., & Townes, C. H. (1958). Infrared and optical masers. Physical review, 112(6), 1940.
2. Pollnau, M., & Eichhorn, M. (2020). Spectral coherence, Part I: Passive-resonator linewidth, fundamental laser linewidth, and Schawlow-Townes approximation. Progress in quantum electronics, 72, 100255.
3. Gerry, C. C., & Knight, P. L. (2023). Introductory quantum optics. Cambridge university press.