+++
title = 'Note on Process Design Kit'
author = 'Di Yu'
date = 2025-08-08
draft = false
+++

## Introduction

---

A Process Design Kit (PDK) is a collection of design layouts that serve as reusable modules, helping to accelerate the design and development of integrated circuits. This guide explains how to embed a PDK into a GDS design layout using the gdspy Python library.

Suppose you have a PDK packaged in a GDS file named ``test_pdk.gds``. The following example shows how to import the PDK and insert it at a specific location in your design:


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

Explanation:

The code creates a new design layout with a cell named ``main_cell``.
It reads the PDK from ``test_pdk.gds`` and removes the ``$$$CONTEXT_INFO$$$`` cell to prevent layer name conflicts.
The PDK cell (``cell_to_import``) is inserted at the specified position (``port_position``) within the main cell.
The final layout, with the PDK included as a subcell, is saved to ``output.gds``.

This approach allows you to modularly incorporate PDK elements into your integrated circuit designs, streamlining the development process.