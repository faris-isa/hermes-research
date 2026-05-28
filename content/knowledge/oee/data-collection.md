---
title: "OEE Data Collection Methods"
description: "Manual vs automated OEE data collection — PLC, Computer Vision, and hybrid approaches."
tags:
  - oee
  - manufacturing
  - data-collection
  - plc
  - computer-vision
---

# OEE Data Collection Methods

**Core Principle:** *"Garbage In, Garbage Out."* Inaccurate, delayed OEE data leads to poor business decisions, misallocated resources, and uninformed investments.

## Tier 1: Manual Collection (Clipboard and Paper Log)

- **How:** Operators manually log production counts, downtime, and reasons on a sheet
- **Pros:** Cheap to start
- **Cons:** Slow, error-prone, burdensome for staff, outdated data
- **Accuracy:** ~60-70% (operator estimation)

## Tier 2: Semi-Digital (Spreadsheets)

- **How:** Operators enter data into shared spreadsheet on terminal
- **Pros:** Digital, slightly better than paper
- **Cons:** Still not real-time, input errors, version control issues
- **Accuracy:** ~70-80%

## Tier 3: Automated (PLC and Sensor Integration)

- **How:** Direct digital connection to machine controller or sensors
- **Pros:** Gold standard for accuracy and timeliness, real-time data, no operator extra work
- **Cons:** Requires modern equipment with accessible PLCs
- **Accuracy:** ~95-99%
- **Best for:** Newer machines with PLC access

## Tier 4: Computer Vision (CV)

- **How:** Smart cameras read analog gauges, status lights, or count items on conveyors
- **Pros:** Works on legacy/un-connectable equipment, accurate to the second, no rewiring needed
- **Cons:** Requires camera setup, lighting conditions
- **Accuracy:** ~90-95%
- **Best for:** Legacy equipment that cannot be connected to PLC

## Hybrid Approach (Recommended)

Most factories should use a **hybrid system**:

1. **Automated Data (PLC and CV):** Provides ultimate accuracy and speed
2. **Simple Operator Input (via mobile tablets):** Adds critical human context (downtime reason selection from predefined dropdown)
3. **Result:** Perfect, real-time numbers enriched with on-the-ground intelligence

**Key Philosophy:** When a downtime event is detected (via PLC or camera), it must automatically trigger a work order in an integrated **CMMS**. An alert without automated action has little value.

## Selection Criteria

| Factor | Manual | Semi-Digital | PLC | Computer Vision |
|--------|--------|--------------|-----|-----------------|
| **Cost** | Low | Low | High | Medium |
| **Accuracy** | 60-70% | 70-80% | 95-99% | 90-95% |
| **Real-time** | No | No | Yes | Yes |
| **Legacy Support** | Yes | Yes | No | Yes |
| **Operator Burden** | High | Medium | None | None |

## Related

- [[OEE Knowledge Index]]
- [[Common OEE Mistakes]]
- [[OEE Improvement Strategies]]
