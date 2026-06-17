---
title: "Nabati MES Ecosystem"
description: "Vendor URS response for PT. Kaldu Sari Nabati Indonesia — MES Ecosystem covering Part A (MES Application) and Part B (OT Layer)."
tags:
  - nabati
  - mes
  - urs
  - manufacturing
---

# Nabati MES Ecosystem

**Client:** PT. Kaldu Sari Nabati Indonesia (PT KSNI)
**URS Reference:** URS-2026.05 | V1.6 | 29/05/2026
**Pilot Scope:** Gedung A Sektor 8, Plant Majalengka
**Document Type:** Vendor URS Response & Solution Design

---

## Overview

Vendor response to the User Requirement Specification (URS-2026.05) for a full MES Ecosystem. The URS is split into two parts:

- **Part A — MES Application:** Production Management, Inventory & Material Management, Quality Management, SAP/API integration, analytics, reporting, role/access, audit trail, deployment readiness
- **Part B — OT Data, Infrastructure & Shopfloor DAQ:** Common plant data platform, server/DB/historian, gateway, network, DAQ, sensor/instrument, shopfloor device, installation, commissioning, and handover

---

## Part A — MES Application

| Document | URS Section | Topic | Status |
|:---|:---|:---|:---:|
| As-Is Process | Part A §2 | Process Mapping | 🔶 |
| To-Be Process | Part A §3 | To-Be Operating Model | 🔶 |
| Production Management | Part A 4.1.1 | PRD-01 ~ PRD-10 | 🔶 |
| Inventory & Material | Part A 4.1.2 | INV-01 ~ INV-12 | 🔶 |
| Quality Management / IPQC | Part A 4.1.3 | QLT-01 ~ QLT-12 | 🔶 |
| Platform & Architecture | Part A 4.1.4 | PLT-01 ~ PLT-09 | 🔶 |

### Requirement Prefixes

- **PRD** — Production Management
- **INV** — Inventory & Material Management
- **QLT** — Quality Management / IPQC
- **PLT** — Platform, Deployment & Integration

---

## Part B — OT Layer

| Document | URS Section | Topic | Status |
|:---|:---|:---|:---:|
| OT Infrastructure & Data Platform | Part B 4.1.1 + 4.1.2 | INF + DBH | 🔶 |
| Network & Connectivity | Part B 4.1.3 | NET-01 ~ NET-12 | 🔶 |
| Data Capture & Shopfloor | Part B 4.2 | DSA, ACQ, DVC, DAT | 🔶 |
| OT Governance & Implementation | Part B 4.3 | GOV, REQ, TST, DOC | 🔶 |

### Requirement Prefixes

- **INF** — OT Infrastructure & Panel
- **DBH** — Plant Data Platform & Historian
- **NET** — Network, Connectivity & Availability
- **DSA** — Data Point Assessment & Capture
- **ACQ** — Signal Acquisition & Instrument Interface
- **DVC** — Shopfloor Input, Scanning & Printing Devices
- **DAT** — Data Interface, Validation & Fallback
- **GOV** — Governance & Project Planning
- **REQ** — Assessment, Requirement & Design
- **TST** — Testing, Validation & Acceptance
- **DOC** — Manuals, Training & Handover

---

## Process Areas in Scope

| # | Area | Team |
|:---:|:---|:---|
| 1 | Mixing | Plant Production |
| 2 | Conching Macintyre (Cream White) | Plant Supporting |
| 3 | Conching Buhler (Cream Choc) | Plant Supporting |
| 4 | Cream Storage | Plant Production |
| 5 | Oven & Creaming (Line Processing) | Plant Production |
| 6 | Packaging | Plant Production |
| 7 | Cartoning | Plant Production |
| 8 | BS Weighing | Plant Supporting |
| 9 | BS Recycle Grinding | Plant Supporting |
| 10 | WH RMPM | QC / SCM |

---

## Key Abbreviations

- **eBR** — Electronic Batch Record
- **eWI** — Electronic Work Instruction
- **WO** — Work Order
- **BoM** — Bill of Material
- **IPQC** — In-Process Quality Control
- **PLC** — Programmable Logic Controller
- **RMPM** — Raw Material & Packaging Material
- **BS** — Bad Stock (reject/scrap)
- **FG** — Finish Good
- **WIP** — Work In Progress
- **SFG** — Semi-Finished Good
- **CCP** — Critical Control Point
- **OOT** — Out of Tolerance
- **OOS** — Out of Specification
- **PPIC** — Production Planning & Inventory Control

---

*Source: URS-2026.05 V1.6 | Last updated: 2026-05*
