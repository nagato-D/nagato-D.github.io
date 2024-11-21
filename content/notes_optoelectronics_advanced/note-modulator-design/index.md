+++
title = 'Note on Design of Traveling-wave Mach-Zehnder Modulators'
author = 'Di Yu'
date = 2024-10-11
draft = false
+++

## Introduction

---

Traveling-wave Mach-Zehnder modulators based on thin-film lithium niobate enable high-bandwidth, low-voltage encoding of RF signals onto optical carrier waves, which is essential for realizing high-speed, power-efficient data communication. A typical traveling-wave Mach-Zehnder modulator is shown in the figure below[^3]. It comprises a Mach-Zehnder interferometer with two waveguide arms and three electrodes for electro-optic modulation.

{{< image src="/posts/note-modulator-design/modulator_schematic.png" width=600 >}}

When designing such modulators, the geometrical parameters of waveguide and electrode should be carefully optimized so as to achieve a satisfactory tradeoff among insertion loss, modulation efficiency, and modulation bandwidth.

In this Note, I will introduce how to numerically calculate the insertion loss, modulation efficiency, and bandwidth of a lithium niobate traveling-wave Mach-Zehnder modulator. Our calculation is based on COMSOL Multiphysics[^1] is verified by reproducing the results in the literature[^2].

## Key Performance Indicators

The performance of a modulator is primarily quantified with optical insertion loss, modulation efficiency ($V_{\pi}\cdot L$), and modulation bandwidth. An ideal modulator should have a low optical insertion loss, low $V_{\pi}\cdot L$, and a high modulation bandwidth.

When increasing the driving voltage applied to a modulator, its output optical power exhibits a periodic oscillation. $V_{\pi}$ is defined as half of this oscillation period. The modulation efficiency of modulator is defined as the product of $V_{\pi}$ and its length. A low $V_{\pi}\cdot L$ indicates a compact footprint and a low power consumption, which are desired properties for most applications.

The output optical power of a modulator oscillates at the same frequency as the RF driving signal, or the modulation frequency. This output optical signal translates to an electrical signal by a photodetector, which has a spectral component at the modulation frequency. The power ratio of this spectral component to the RF driving signal is defined as electro-optic response. Importantly, the electro-optic response is a function of modulation frequency and usually decreases with frequency. The 3-dB bandwidth is defined as the modulation frequency where the electro-optic response decreases to half of the DC electro-optic response.

A high-performance thin-film lithium niobate modulator can achieve an insertion loss less than 3 dB, a modulation efficiency around 2 Vcm, and a 3-dB bandwidth above 70 GHz.

## Design Principles of Traveling-wave Mach-Zehnder Modulators

---

 Particularly, the two electrodes on the outside are ground electrodes, while the one around the modulator center is signal electrode. In this configuration, the external electric field applied to the two waveguide arms is in the opposite direction. This results in a opposite polarity of phase shift for the two arms, which at the end enables a reduction of $V_{\pi}\cdot L$.

### Balance modulation efficiency and insertion loss



### Balance characteristic impedance, bandwidth, and fabrication cost



## Relevant Materials

---

### Lithium niobate and lithium tantalate


### Common material properties


## Simulation Files

---

My COMSOL simulation files and codes for calculating the modulation efficiency and bandwidth of a traveling-wave Mach-Zehnder modulator are available using the following links. The computation method has been introduced in detail in the corresponding `readme.pdf` file.

- [Modulation efficiency](https://1drv.ms/f/s!AgeoyM0wJG9chKRZumWG-LB8aTyoMw?e=gxS2Tj)
- [Modulation bandwidth](https://1drv.ms/f/s!AgeoyM0wJG9chKMRVWxtAzkxnwSEug?e=Rpglip)

[^1]: https://www.comsol.com/
[^2]: He, M., Xu, M., Ren, Y., Jian, J., Ruan, Z., Xu, Y., ... & Cai, X. (2019). High-performance hybrid silicon and lithium niobate Mach–Zehnder modulators for 100 Gbit s− 1 and beyond. Nature photonics, 13(5), 359-364.
[^3]: Wang, C., Zhang, M., Chen, X., Bertrand, M., Shams-Ansari, A., Chandrasekhar, S., ... & Lončar, M. (2018). Integrated lithium niobate electro-optic modulators operating at CMOS-compatible voltages. Nature, 562(7725), 101-104.