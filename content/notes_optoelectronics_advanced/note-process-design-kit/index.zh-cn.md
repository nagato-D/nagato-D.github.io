+++
title = '工艺设计套件笔记'
author = 'Di Yu'
date = 2025-08-08
draft = false
+++

## 引言 {#introduction}

---

工艺设计套件（Process Design Kit，PDK）是一组可作为可复用模块的设计版图，有助于加速集成电路的设计与开发。本指南介绍如何使用 gdspy Python 库，将 PDK 嵌入 GDS 设计版图。

假设你有一个封装在名为 ``test_pdk.gds`` 的 GDS 文件中的 PDK。下面的示例展示如何导入该 PDK，并将它插入设计中的指定位置：

```Python
import gdspy

# Create a new GDS library and main cell
lib = gdspy.GdsLibrary()
main_cell = lib.new_cell('main_cell')

# Import the PDK from the GDS file
pdk_lib = lib.read_gds("test_pdk.gds")

# Remove the context info cell to avoid conflicts
lib.remove("$$$CONTEXT_INFO$$$")

# Specify where to place the PDK cell in the layout
port_position = (0, 0)

# Reference the cell to import from the PDK and add it to the main cell
pdk_cell_ref = gdspy.CellReference(
pdk_lib.cells["cell_to_import"],
port_position
)
main_cell.add(pdk_cell_ref)

# Write the resulting design to an output GDS file
lib.write_gds("output.gds")
```

说明：

这段代码创建一个包含名为 ``main_cell`` 的单元的新设计版图。
它从 ``test_pdk.gds`` 中读取 PDK，并移除 ``$$$CONTEXT_INFO$$$`` 单元，以防止图层名称冲突。
随后，将 PDK 单元（``cell_to_import``）插入主单元中的指定位置（``port_position``）。
最终，将包含作为子单元的 PDK 的版图保存到 ``output.gds``。

这一方法允许你以模块化方式将 PDK 元素整合到集成电路设计中，从而简化开发流程。
