+++
title = 'Note on COMSOL-MATLAB Co-simulation'
author = 'Di Yu'
date = 2024-03-14
draft = false
+++

## Introduction

---

[COMSOL](https://www.comsol.com/products) is a widely used finite element analysis software for multiphysics simulation. Here, I will introduce how to use the [LiveLink for MATLAB](https://www.comsol.com/livelink-for-matlab), a COMSOL API for MATLAB, to retrieve and process the numerical results obtained in COMSOL. This constitutes a powerful tool that enables almost any kind of calculation regarding classical physical fields.

## Installation

---

We start with an introduction to the installation of MATLAB, COMSOL, and LiveLink for MATLAB.

### MATLAB

To set up the COMSOL-MATLAB co-simulation, you first need to install MATLAB on your computer. You can access the [MATLAB website](https://www.mathworks.com/products/matlab.html) and register an account using your institution email. If your institution has purchased the MATLAB service, you should be able to download a release version of MATLAB from that website and install it.

### COMSOL & LiveLink for MATLAB

Once MATLAB is installed on your computer, you can proceed to install COMSOL and LiveLink for MATLAB. To do this, you need to visit the [website of COMSOL](https://www.comsol.com/product-download) and register an account using your institutional email. If your institution has subscribed to the COMSOL product, you can download a release version of COMSOL from that website and install it. During the installation process, you will be guided to choose which modules are needed, such as wave optics, heat transfer, and so on. **Remember to select the LiveLink for MATLAB module** at this stage, and COMSOL's installation routine will automatically set up an API for MATLAB. If your installation is successful, you will find `COMSOL Multiphysics with MATLAB` in your start menu.

## Usage

---

Let's say you have already set up a COMSOL simulation file (.mph) with results saved in it. Now we will introduce how to retrieve this simulation data in MATLAB. First, open 'COMSOL Multiphysics with MATLAB', which will launch two windows. One window is for MATLAB, and the other one is a command line window for establishing a link between COMSOL and MATLAB. You can create and perform a .m script in that MATLAB window as you usually do in a normal MATLAB user interface. What's different is that you are allowed to use some special instructions here to access the COMSOL simulation file. For guidance on these commands, please type 'help mpi' in the MATLAB user interface.

Some common commands provided by LiveLink for MATLAB are:

- `mphopen`: Load a COMSOL simulation file into MATLAB. Example usage: `model = mphopen(filename)`.
- `mphglobal`: Evaluate a global variable for a specified solution saved in the COMSOL simulation file. Example usage: `neff = mphglobal(model, 'ewfd.neff', 'dataset', 'dset1', 'outersolnum', 1)`, this command return the effective index of an optical mode in dataset 1 with solution index 1.
- `mphinterp`: Evaluate the field value at specified positions by using interpolation. Example usage: `mphinterp(model, 'ewfd.Hz', 'coord', coord_mat)`, this command returns the complex amplituds of a magnetic field evaluated at N positions specied by the 2-by-N matrix `coord_mat`.
- `mphnavigator`: Launch a graphical user interface in MATLAB to view the COMSOL simulation file. This window helps find the indices of data sets and solutions. Example usage: `mphnavigator(model)`.

## Applications

---

The COMSOL-MATLAB co-simulation can be applied to calculate physical quantities that involve multiple physical fields, such as the resonance shift induced by thermo-optic effect in a microring resonator and the Berry curvature of a photonic crystal. I will share my code for these applications below.

### Thermo-optic effect in a microring resonator

Code: https://1drv.ms/f/s!AgeoyM0wJG9cg44z4BFzt-Ui5f6HLQ?e=orAnWN

Results:

{{< image src="/posts/note-comsol-matlab/temperature_distribution_700K.png" width=400 >}}

Figure 1: Simulated temperature distribution around a heater placed on an optical waveguide, temperature is expressed in Kelvin.

{{< image src="/posts/note-comsol-matlab/GM_resonance_shift_vs_temperature.png" width=400 >}}

Figure 2: Simulated resonance shift in a microring resonator due to temperature variation.

### Berry curvature of a magneto-optic/valley-Hall photonic crystal

Code: https://github.com/nagato-D/Berry-curvature-for-photonic-crystals/releases/tag/v2.0.0

Results:

{{< image src="/posts/note-comsol-matlab/magneto_berry_curvature_band_1.png" width=300 >}} {{< image src="/posts/note-comsol-matlab/magneto_berry_curvature_band_2.png" width=300 >}}

Figure 3: Simulated Berry curvature of the first (left) and second (right) bands of a magneto-optic square-lattice photonic crystal.

{{< image src="/posts/note-comsol-matlab/valley_berry_curvature_band_1.png" width=300 >}} {{< image src="/posts/note-comsol-matlab/valley_berry_curvature_band_2.png" width=300 >}}

Figure 4: Simulated Berry curvature of the first (left) and second (right) bands of a valley-Hall photonic crystal.

{{< admonition type=note title="PDF version" open=false >}}
Please refer to [here](/posts/note-comsol-matlab/Note_comsol_matlab.pdf) for a PDF version of this note.
{{< /admonition >}}