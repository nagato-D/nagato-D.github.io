+++
title = 'Note on Mode-Locked Lasers'
author = 'Di Yu'
date = 2024-03-27
draft = false
+++

## Introduction

---

Mode-locked lasers are a special class of lasers that generate periodic short optical pulses. These lasers operate by exciting multiple modes that emit light at specific phase differences, resulting in periodic constructive interference and high-energy optical pulses. This mechanism, which creates a periodic sequence of optical pulses, is called mode locking.

## Mode-Locking Methods

---

There are two main approaches to realizing a mode-locked laser: active mode locking and passive mode locking [[1](#reference)].

### Active Mode Locking

Active mode locking requires external driving signals. The most common method is to place an electro-optic modulator inside the laser cavity. Assuming the laser is initially single-mode and operates at frequency $\nu$, and we now apply a driving voltage to the modulator with a modulation frequency $f$. The modulated light will then be generated at frequencies $\nu\pm f$. If the modulation frequency $\nu$ matches the frequency spacing of longitudinal modes $\rm FSR$, it will allow the modulated light to be significantly amplified.

This process can occur in a cascaded manner, creating a lasing spectrum with sidebands at $\nu\pm 2f$, $\nu\pm 3f$, $\nu\pm 4f$, and so on. Crucially, the seeding of all the sidebands is driven by the same modulation signal, ensuring that all the sidebands are phase-locked.

### Passive Mode Locking

Passive mode locking relies on passive optical elements that amplify high-intensity light and attenuate low-intensity light. A saturable absorber is a common element that meets this requirement. This element absorbs low-intensity light until the accumulated energy reaches a certain threshold. Then, it suddenly exhibits strong optical gain, releasing the stored energy and inducing strong intracavity optical intensity. This facilitates coherent emission of gain materials, further enhancing the optical gain.

The enhanced optical gain leads to a strong optical output, accompanied by a dramatic decrease in the energy stored in the gain materials and the saturable materials, forming a short and strong optical pulse. This process repeats cyclically, leading to a periodic train of optical pulses.

It's worth mentioning that some nonlinear optical elements can achieve a similar function by amplifying strong light while attenuating weak light, and these elements can also be used to create mode-locked lasers.

## Reference

---

1. https://en.wikipedia.org/wiki/Mode_locking