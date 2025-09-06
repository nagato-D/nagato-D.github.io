+++
title = "Note on Numerical Simulation of Non-uniform Grating Spectra"
author = 'Di Yu'
date = 2025-09-06
draft = false
+++

## Introduction

---

In this note, we introduce how to numerically simulate a Bragg grating with a spatially varying period/coupling coefficient ($\kappa$). The spatial varying of grating period is called 'chirp', and that of coupling coefficient is known as 'apodization'. Gratings with chirp and apodization have been widely used in practical applications, including dense wavelength division multiplexing (DWDM) communications and dispersion compensation for pulsed lasers. Here, we present a detailed introduction to the transfer matrix method as well as code implementation based on Python. The correctness of our code implementation is verified by reproducing litearture results [1].

The full contents of this note can be found [here](/posts/note-nonuniform-grating/Note_nonuniform_grating.pptx).

1. Erdogan, T. (2002). Fiber grating spectra. Journal of lightwave technology, 15(8), 1277-1294.
2. [Code for simulating chirped grating](https://1drv.ms/f/c/5c6f2430cdc8a807/ElUo0H2DKa1Bjsg9ks-a_PgBpozEsJx502zjztv4TBoPcA?e=Yopocf)
3. [Code for simulating apodized grating](https://1drv.ms/f/c/5c6f2430cdc8a807/ElgNHnGKJolJhuRayX9OlusB4PNDR-31p6JqvFSCSKMAPA?e=HopMIl)