---
title: "Konimex — Business Requirements"
description: "Business requirements (1.6) for the Konimex OEE Online system."
tags:
  - konimex
  - oee
  - urs
  - business-requirements
---

# Business Requirements (1.6)

| ID | Requirement | Solution | Notes |
|:---:|:---|:---:|:---|
| 1.6.1 | Data capture from PLC/HMI, stored on server for ERP/EBR/Asset Management | — | Currently not processed by third-party apps |
| 1.6.2 | Dashboard: Availability, Performance, Quality, machine status (red=stopped, green=running) | OEE Monitoring | Dashboard → Per-machine detail |
| 1.6.3 | Charts and tables for decision support | Shopfloor, OEE Monitoring | Waterfall OEE charts, downtime tables, Excel export |
| 1.6.4 | Integration with existing PLC/HMI (Omron, Schneider, etc.) | — | OPC-UA data acquisition from each device |
| 1.6.5 | Reports compliant with CPPOB — data cannot be manipulated | — | CPPOB = Good Food Processing Practice |

---

*Source: URS FOOD2/URS/2026/001/00 | Section 1.6*
