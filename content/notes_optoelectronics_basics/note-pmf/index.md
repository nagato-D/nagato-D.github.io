+++
title = 'Note on Polarization Maintained Fibers'
author = 'Di Yu'
date = 2024-03-26
draft = false
+++

<!-- # Note on Polarization Maintained Fibers
**Created on** 2024-3-26\
**Author** Di Yu (yudi.0211@foxmail.com) -->

## Introduction

---

A single-mode fiber with a circularly symmetric cross-section does not exhibit birefringence, meaning that the effective index of the mode remains the same regardless of the polarization state. This polarization degeneracy allows the two independent polarization states to easily couple when subjected to external perturbations, such as strain or bending.

Polarization-maintaining fibers (PM fibers or PMFs) are a special class of optical fibers designed to intentionally introduce birefringence. The presence of birefringence significantly reduces the perturbation-induced coupling between different polarization states, allowing linearly polarized light to propagate through the fiber while maintaining its polarization state, even in the presence of external disturbances.

## Classification

---

There are two common approaches to introducing birefringence into a PM fiber:

1. Making an elliptical fiber core
2. Applying internal stress

Both approaches break the circular symmetry of the fiber's cross-section and lift the polarization degeneracy. The figure below shows the cross-sections of a single-mode fiber, an elliptical core PM fiber, and a PM fiber with internal stress.

{{< image src="/posts/note-pmf/fiber_cross_section.png" width="700" >}}

**Fig. 1** Cross sections of a single-mode fiber, elliptical core PM fiber, and a PM fiber by internal stee [[1](#reference)].

A PM fiber that uses internal stress to maintain the polarization state of light has a distinctive panda-shaped cross-section, as illustrated in the figure. The cross-section features two symmetrically placed black circles with a different thermal expansion coefficient compared to the surrounding material. When the fiber cools down to ambient temperature after the manufacturing process, these circular regions contract at a different rate than the rest of the fiber, applying a stress to the fiber core. This stress induces birefringence that helps maintain the polarization state of the light propagating through the fiber. Due to the unique appearance of the stress-applying parts, PM fibers that rely on internal stress are also commonly referred to as PANDA fibers.

## Key Parameters

---

The performance of a PM fiber is usually characterized by the relative difference in propagation constant between the two polarization modes. This quantity, defined as modal birefringence, is given by:

$$ B_m = \frac{\Delta\beta}{k_0}, $$

where $\Delta\beta$ is the difference in the propagation constants of the two independent polarization modes, and $k_0 = 2\pi/\lambda_0$, with $\lambda_0$ being the wavelength in vacuum. A typical PM fiber exhibits a modal birefringence of over $10^{-4}$.

{{< admonition type=note title="PDF version" open=false >}}
Please refer to [here](/posts/note-pmf/Note_pmf.pdf) for a PDF version of this note.
{{< /admonition >}}

## Reference

---

1. https://www.fiberlabs.com/glossary/polarization-maintaining-fiber