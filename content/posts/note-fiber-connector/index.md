+++
title = 'Note on Fiber Connectors'
author = 'Di Yu'
date = 2024-03-14
draft = false
+++

<!-- # Note on Fiber Connectors
**Created on** 2024-3-14\
**Author** Di Yu (yudi.0211@foxmail.com) -->

## FC Connector

---

The FC (Fiber Channel) connector is an optical fiber connector that uses a ceramic ferrule to safeguard and align the fiber tip. The figure below illustrates a typical FC connector.

{{< image src="/posts/note-fiber-connector/FC_connector.jpg" height=150 >}} {{< image src="/posts/note-fiber-connector/ferrule.png" height=150 >}}

**Fig. 1** Left: an image of a FC connector [[1](#reference)]. Right: an illustration of the ferrule in a FC connector [[2](#reference)].

## Polish Options

---

To ensure high-quality signal transmission, an optical fiber connector must have low insertion loss and back reflection. These two factors are the main figures of merit for the connector. Engineers achieve low insertion loss and return loss by polishing the ferrule surface of the connector. There are three polish options available (PC/UPC/APC), each with a different ferrule shape.

### PC

The PC (physical contact) connector is designed with a flat ferrule end facet to eliminate the air gap between fiber cores and thus reduce the insertion loss. However, this connector has become outdated due to its high return loss of around -40 dB.

{{< image src="/posts/note-fiber-connector/FCPC_connector.jpg" width=400 >}}

**Fig. 2** PC fiber connector [[2](#reference)]

### UPC

The UPC (ultra physical contact) connector is an updated version of the PC connector. It has a tapered end facet that reduces back reflection and a return loss of about -50 dB, which is lower than the PC connector by 10 dB. However, the UPC connector can be easily damaged with frequent connecting and disconnecting, leading to a decrease in performance.

{{< image src="/posts/note-fiber-connector/FCUPC_connector.jpg" width=400 >}}

**Fig. 3** UPC fiber connector [[2](#reference)]

### APC

The APC (angled physical contact) connector is a fiber connector with an angled end facet. This angled end facet, at 8 degrees, helps reduce return loss. Among common fiber connectors, an APC connector typically has the lowest reflection at -60 dB. It is required to connect an APC connector to another APC connector to ensure the desired interface contact. Otherwise, the connector may experience mechanical damage and result in a high insertion loss.

{{< image src="/posts/note-fiber-connector/FCAPC_connector.jpg" width=400 >}}

**Fig. 4** APC fiber connector [[2](#reference)]

### Comparison of PC, UPC, and APC connectors

APC connectors are ideal for scenarios that require high-fidelity signal transmission, as they have the lowest return loss. On the other hand, PC and UPC connectors are suitable for situations where return loss is not as critical. The polish types of fiber connectors are indicated by their color: APC connectors are green, while PC or UPC connectors are blue.

## Reference

---

1. https://en.wikipedia.org/wiki/FC_connector
2. https://community.fs.com/article/pc-vs-upc-vs-apc-connector-selecting-the-right-fiber-connector-type.html