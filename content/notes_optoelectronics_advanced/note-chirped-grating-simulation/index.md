+++
title = "Note on Numerical Simulation of Chirped Grating"
author = 'Di Yu'
date = 2025-04-26
draft = false
+++

## Introduction

---

In this note, we introduce how to numerically calculate the passive characteristics of a Bragg grating with a spatially varying period. Such a grating is usually referred to as a chirped grating and is known for its applications in dense wavelength division multiplexing (DWDM) communications and dispersion compensation for pulsed lasers. In particular, we will use the transfer matrix method to calculate the reflectance spectra and group delay of a linearly chirped single-mode grating. The notations used in this note follow the convention of [[1]](#reference). The MATLAB script for the calculation is available via this [link](https://1drv.ms/f/c/5c6f2430cdc8a807/Eo16-EG3NStCtG0l-hZTL0kBuN85e2z50Is03Yg-xotiJA?e=LMlZgb), which can reproduce the simulation results reported in [[2]](#reference) (Fig. 4(a)).

This note is organized as follows: First, we will briefly introduce the coupled mode theory for a no-chirp Bragg grating. Next, we will calculate the transfer matrix, reflection spectra, and group delay of a linearly chirped grating using the transfer matrix method. Finally, we will present the results of numerical experiments that reproduce figures from the literature.

The full contents of this note can be found [here](/posts/note-chirped-grating/Note_chirped_grating.pdf).