+++
title = 'Note on Design of Butt-coupling Stage'
author = 'Di Yu'
date = 2025-04-19
draft = false
+++

## 引言

---

本文档介绍基于三维建模定制样品台的方法。样品台工件的三维建模可通过商用软件 Autodesk Fusion 实现，该软件对学生免费开放使用。建模生成的 .step 文件可提交给 CNC 加工商，委托其制作相应工件。样品台设计为 TEC 和热敏电阻预留了空间，用以支持温度控制。样品台几何尺寸的确定取决于样品的规格，一般需要针对不同样品专门设计适用的样品台。这里，我们给出一种适合芯片对接耦合的样品台设计，并提供了三维模型文件和所需元件获取渠道。

## 设计说明

---

- 支持温控，兼容尺寸为 20x20x3.5 mm 的TEC 及直径 < 2 mm 的热敏电阻
- TEC 与样品距离较近，且冷端金属尺寸远小于热端，用以提升温度调节范围
- 具有单个水平位移自由度，以及水平旋转自由度 (粗调)
- 顶部组件材料纯铜，其他组件使用不锈钢
- 样品台一侧具有较高阶梯，支持对接耦合
- 样品台高度 75 mm，与 Thorlabs NanoMax 位移台 & 光纤夹持器总高度一致
- CNC 加工 ([供应商](https://store.taobao.com/shop/view_shop.htm?spm=a1z09.2.0.0.5c932e8dFeuJNQ&user_number_id=2677404002))，所有 3.3 mm 直径孔洞加工成 M4 螺孔，所有 4 mm 直径孔洞加工成 M6 螺孔

## 样品台设计图

---

[样品台 3D 模型](https://1drv.ms/u/c/5c6f2430cdc8a807/EckCd4IkcztIqjlyGvS2IPkBqZG3m00OH3i8SjvOXhPD6Q?e=PmSNLA): 

<!-- ![设计图纸](figures/top_view.png) -->

{{< image src="/posts/note-3d-model/sample_stage.png" width=400 >}}

## 组件清单

---

- TEC: [链接](https://detail.tmall.com/item.htm?_u=h33up4ie1301&id=763280840083)，型号 TES1-4903
- 热敏电阻: [链接](https://detail.tmall.com/item.htm?abbucket=8&id=619037896400)，型号 B3950 10K
- 水平位移台: [链接](https://item.taobao.com/item.htm?_u=h33up4ie40ce&id=641480208355)，型号 60A-DB80
- 旋转位移台: [链接](https://item.taobao.com/item.htm?spm=a1z09.2.0.0.14a02e8dflIH7v&id=612699402922)，型号 RS60-L
- 定制工件 1: [3D 模型](https://1drv.ms/u/c/5c6f2430cdc8a807/ERCie9EDYK5OkoTI8by98UcB1SB4Em0BciBaA5FThtLZ3w?e=GiZcK9)，材料不锈钢
- 定制工件 2: [3D 模型](https://1drv.ms/u/c/5c6f2430cdc8a807/Eah7YOJzUkNKlcRGQ174sZYBOC0fK9L4FND0EeANveV6Kg?e=oZSbrs)，材料不锈钢
- 定制工件 3: [3D 模型](https://1drv.ms/u/c/5c6f2430cdc8a807/ET6SbFcBWTFIocpoLPfPymMBBXPC92B6WRwuEkwTu_I0gg?e=pQhuXf)，材料纯铜