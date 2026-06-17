---
title: "Konimex OEE Online"
description: "Vendor URS response for PT Konimex — OEE Online system for Line Hecrona 2, Produksi Food 2."
tags:
  - konimex
  - oee
  - urs
  - manufacturing
---

# Konimex OEE Online

**Client:** PT Konimex — Produksi Food 2
**URS Reference:** FOOD2/URS/2026/001/00
**Scope:** OEE Online for Line Hecrona 2
**Document Type:** Vendor URS Response

---

## Overview

Implementation of a real-time [[oee|OEE]] monitoring system for Line Hecrona 2, replacing manual OEE recording in EBR. The system covers machines from Mixer to primary packaging, with PLC/HMI integration via OPC-UA, web-based dashboards, and compliance with CPPOB (food safety) regulations.

### Machines in Scope

- Mixer Hecrona 1 & 2
- Moulding, Oven, Kuhlban
- Mesin Packaging 1–6

---

## Business Requirements (1.6)

| ID | Requirement | Solution | Notes |
|:---:|:---|:---:|:---|
| 1.6.1 | Data capture from PLC/HMI, stored on server for ERP/EBR/Asset Management | — | Currently not processed by third-party apps |
| 1.6.2 | Dashboard: Availability, Performance, Quality, machine status (red=stopped, green=running) | OEE Monitoring | Dashboard → Per-machine detail |
| 1.6.3 | Charts and tables for decision support | Shopfloor, OEE Monitoring | Waterfall OEE charts, downtime tables, Excel export |
| 1.6.4 | Integration with existing PLC/HMI (Omron, Schneider, etc.) | — | OPC-UA data acquisition from each device |
| 1.6.5 | Reports compliant with CPPOB — data cannot be manipulated | — | CPPOB = Good Food Processing Practice |

---

## Data Requirements (1.7)

| ID | Requirement | Notes |
|:---:|:---|:---|
| 1.7.1 | System upgradeable for additional data | — |
| 1.7.2 | Compatible with existing ERP/EBR | — |
| 1.7.3 | Prevent data duplication and transfer errors | — |
| 1.7.4 | Approval workflow for data corrections | — |
| 1.7.5–1.7.8 | ALCOA+ compliance | Attributable, Legible, Contemporaneous, Original, Accurate |
| 1.7.9 | Immutable audit trail for all user activities | Login, logout, print, edit downtime, etc. |
| 1.7.10 | Data change log: who, when, what, old value, new value | — |
| 1.7.11–1.7.14 | Standard reports | Daily OEE, Weekly/Monthly Trend, Downtime Pareto, Loss Analysis |

### Report Requirements

- Printed reports include: timestamp, user who printed, watermark
- All reports exportable to Excel

---

## Design Requirements (1.8)

| ID | Requirement | Notes |
|:---:|:---|:---|
| 1.8.1 | User-friendly operation | — |
| 1.8.2 | Real-time data collection, printing, verification | — |
| 1.8.3 | Web browser access (Chrome, Edge, Firefox) — no install | — |
| 1.8.4 | Responsive across all screen sizes | — |
| 1.8.5 | Multi-bahasa: Indonesian & English | — |
| 1.8.6 | Default timezone: WIB (GMT+7) | — |

---

## Infrastructure Requirements (1.9)

| ID | Requirement | Solution | Notes |
|:---:|:---|:---:|:---|
| 1.9.1 | SSO + RBAC + VPN for remote access | Keycloak SSO | RBAC per-feature not yet detailed |
| 1.9.2 | Run on 1 Gbps network | — | — |
| 1.9.3 | Server specs: Intel Xeon Gold >3GHz 12 core, FO/Cat6, PostgreSQL/NoSQL, Linux | — | — |
| 1.9.4 | Dashboard via web browser | Web App | Lowest supported version TBD |
| 1.9.5 | Single central server, no local production server | — | — |
| 1.9.6 | Easy reconfiguration for device changes (HMI, PLC) | — | Currently manual config by developer |

---

## OEE Formula Reference

| Metric | Formula | Description |
|:---|:---|:---|
| **Availability** | Operating Time / Loading Time × 100% | Machine uptime rate |
| **Performance** | Net Operating Time / Operating Time × 100% | Output vs SOP capacity |
| **Quality** | Valuable Operating Time / Net Operating Time × 100% | Good output rate |

---

## Acceptance Criteria (SAT)

1. Installed components match the offered component list
2. System functions correctly per URS and vendor proposal

---

*Source: URS FOOD2/URS/2026/001/00*
