+++
title = 'Note on Design of Butt-coupling Stage'
author = 'Di Yu'
date = 2025-04-19
draft = false
+++

## Introduction

---

This note describes how to customize a sample stage using 3D modeling. The stage components can be modeled in the commercial software Autodesk Fusion, which is available free of charge to students. The resulting .step files can be submitted to a CNC machining supplier to manufacture the parts. The stage reserves space for a thermoelectric cooler (TEC) and a thermistor to support temperature control. Its dimensions depend on the sample specifications, so a suitable stage generally needs to be designed for each type of sample. Here, we present a stage designed for chip butt-coupling, together with the 3D model files and sources for the required components.

## Design Notes

---

- Supports temperature control and accommodates a 20x20x3.5 mm TEC and a thermistor with a diameter < 2 mm.
- The TEC sits close to the sample, and the metal component on the cold side is much smaller than that on the hot side to increase the temperature tuning range.
- Provides one degree of freedom for horizontal translation and one for coarse horizontal rotation.
- The top component is made of pure copper; the other components are stainless steel.
- A raised step on one side of the stage supports butt-coupling.
- The stage height is 75 mm, matching the combined height of a Thorlabs NanoMax translation stage and a fiber holder.
- CNC machining ([supplier](https://store.taobao.com/shop/view_shop.htm?spm=a1z09.2.0.0.5c932e8dFeuJNQ&user_number_id=2677404002)): machine all 3.3 mm diameter holes into M4 threaded holes and all 4 mm diameter holes into M6 threaded holes.

## Sample Stage Design

---

[Sample stage 3D model](https://1drv.ms/u/c/5c6f2430cdc8a807/EckCd4IkcztIqjlyGvS2IPkBqZG3m00OH3i8SjvOXhPD6Q?e=PmSNLA):

<!-- ![Design drawing](figures/top_view.png) -->

{{< image src="/posts/note-3d-model/sample_stage.png" width=400 >}}

## Component List

---

- TEC: [link](https://detail.tmall.com/item.htm?_u=h33up4ie1301&id=763280840083), model TES1-4903.
- Thermistor: [link](https://detail.tmall.com/item.htm?abbucket=8&id=619037896400), model B3950 10K.
- Horizontal translation stage: [link](https://item.taobao.com/item.htm?_u=h33up4ie40ce&id=641480208355), model 60A-DB80.
- Rotation stage: [link](https://item.taobao.com/item.htm?spm=a1z09.2.0.0.14a02e8dflIH7v&id=612699402922), model RS60-L.
- Custom component 1: [3D model](https://1drv.ms/u/c/5c6f2430cdc8a807/ERCie9EDYK5OkoTI8by98UcB1SB4Em0BciBaA5FThtLZ3w?e=GiZcK9), stainless steel.
- Custom component 2: [3D model](https://1drv.ms/u/c/5c6f2430cdc8a807/Eah7YOJzUkNKlcRGQ174sZYBOC0fK9L4FND0EeANveV6Kg?e=oZSbrs), stainless steel.
- Custom component 3: [3D model](https://1drv.ms/u/c/5c6f2430cdc8a807/ET6SbFcBWTFIocpoLPfPymMBBXPC92B6WRwuEkwTu_I0gg?e=pQhuXf), pure copper.
