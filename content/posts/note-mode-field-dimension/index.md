+++
title = 'Note on Relation Between Near-Field Mode Dimensions and Far-Field Pattern'
author = 'Di Yu'
date = 2024-07-24
draft = false
+++

<!-- # Relation Between Near-Field Mode Dimensions and Far-Field Pattern
**Created on** 2024-7-24\
**Author** Di Yu (yudi.0211@foxmail.com) -->

For a semiconductor laser chip, the far-field divergence angle is directly connected to the mode field dimensions measured at its optical exit facet. This relation is quite useful for estimating the far-field pattern of a semiconductor laser from its waveguide mode profile and vice versa. In this note, we give an introduction to this relation. We also apply this relation to a commercial semiconductor gain chip (model: [Thorlabs SAF1126C RSOA](https://www.thorlabs.com/thorproduct.cfm?partnumber=SAF1126C)) to derive the chip's near-field mode dimensions from its far-field specifications.

Typically, the output beam of a semiconductor laser into free space can be modeled as a Gaussian beam, which means (source: [Wiki](https://en.wikipedia.org/wiki/Rayleigh_length)):

$$
D \approx \frac{4\lambda}{\pi\Theta_{\rm div}},
$$

where $D$ is the mode field dimensions at the laser's exit facet, measured at positions where the optical intensity is $1/e^{2}$ times lower than the maximum intensity, $\lambda$ is the operating wavelength of the gain chip (=1550 nm), and $\Theta_{\rm div}$ is the far-field divergence angle in radian, which is measured at emitting angles where $1/e^{2}$ times the maximum intensity. Notably, the equation above establishes a relation between the far-field pattern and the near-field distribution, allowing us to derive one from another.

Now we apply the relation between the near-field and the far-field patterns to the Thorlabs gain chip. For the horizontal direction, the gain chip has a full-width-half-maximum (FWHM) divergence angle of 16 degrees (source: [Thorlabs](https://www.thorlabs.com/newgrouppage9.cfm?objectgroup_id=3944&pn=SAF1126C)). This corresponds to a $1/e^{2}$ divergence angle of $\Theta_{\rm div} = 1.7\times 30/180\times\pi = 0.47$ (radians). Note that the $1/e^{2}$ divergence angle of a Gaussian beam is approximately 1.7 times its FWHM divergence angle. Substituting the value of $\Theta_{\rm div}$ into the equation for $D_{x}$, we obtain:

$$
D_{x} \approx \frac{4\times 1.55\ {\rm um}}{\pi\times 0.47} = 4.2\ {\rm um}.
$$

Similarly, using the vertical FWHM divergence angle of 30 degrees (corresponding to a $1/e^{2}$ divergence angle $\Theta_{\rm div} = 0.89$), we can calculate the $1/e^{2}$ beam diameter of the gain chip in the vertical direction:

$$
D_{y} \approx \frac{4\times 1.55\ {\rm um}}{\pi\times 0.89} = 2.2\ {\rm um}.
$$

We conclude that the Thorlabs gain chip has a mode field dimensions of 4.2 um (horizontal) x 2.2 um (vertical), estimated from its far-field specifications.