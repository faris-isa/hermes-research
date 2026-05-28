---
title: "Master Data"
description: "Product, machine, and line configuration management."
tags:
  - ajinomoto
  - modules
  - master-data
---

# Master Data

Reference data management for the [[Ajinomoto MES]] system.

## Purpose

- Product definitions (SKU, ideal cycle time, variants)
- Machine configurations (rated speed, maintenance schedule)
- Line definitions (machine grouping, hierarchy)
- Shift templates and schedules

## Key Entities

| Entity | Description |
|--------|-------------|
| **Product** | SKU, ideal cycle time, variants, recipe |
| **Machine** | Equipment ID, rated speed, location |
| **Line** | Grouping of machines, area assignment |
| **Shift** | Time windows, operator assignments |

## Related
- [[OEE Monitoring]]
- [[Schedule Maintenance]]
