---
title: "OEE URS — Vendor Response Documents"
description: "User Requirement Specification (URS) vendor response and solution design documents for OEE and MES implementations across multiple manufacturing clients."
tags:
  - oee
  - mes
  - urs
  - manufacturing
  - vendor-response
---

# OEE URS — Vendor Response Documents

Repository of vendor responses to User Requirement Specifications (URS) for [[oee|OEE]] and [[ajinomoto-mes|MES]] system implementations. Each client folder contains structured responses mapping directly to URS requirement IDs.

## Clients

### Nabati (PT. Kaldu Sari Nabati Indonesia)

**Scope:** MES Ecosystem — Gedung A Sektor 8, Plant Majalengka
**URS Reference:** URS-2026.05 | V1.6 | 29/05/2026
**Type:** Full MES Ecosystem (Application + OT Layer)

Two-part URS response:

- **Part A — MES Application:** Production Management (PRD), Inventory & Material (INV), Quality Management / IPQC (QLT), Platform & Integration (PLT)
- **Part B — OT Data, Infrastructure & Shopfloor DAQ:** OT Infrastructure (INF), Data Platform & Historian (DBH), Network & Connectivity (NET), Data Capture & Shopfloor Devices (DSA, ACQ, DVC, DAT)

Process areas in scope: Mixing, Conching (Macintyre & Buhler), Cream Storage, Oven & Creaming, Packaging, Cartoning, BS Handling, WH RMPM.

### Konimex (PT Konimex — Produksi Food 2)

**Scope:** OEE Online — Line Hecrona 2
**URS Reference:** FOOD2/URS/2026/001/00
**Type:** OEE Monitoring System

Covers machines from Mixer to Mesin Kemas Primer:

- Mixer Hecrona 1 & 2
- Moulding, Oven, Kuhlban
- Mesin Packaging 1–6

Requirements span: Business (PLC/HMI integration, real-time dashboards, CPPOB compliance), Data (ALCOA+, audit trail, reporting), Design (web-based, responsive, multi-bahasa), Infrastructure (Linux/PostgreSQL, SSO/RBAC, VPN).

## Common URS Patterns

The `same_reference.md` file maps cross-client requirement patterns:

- **URS-01:** Audit trail for all user activities
- **URS-02:** Integration with existing systems (WO, SKU, ERP)
- **URS-03:** Configurable machine hierarchy and line mapping

## Links

- **Repo:** `git@github_molca_isa:molcaIsa/oee-urs.git`
- **Related Knowledge:** [[oee|OEE]], [[ajinomoto-mes|MES Architecture]]

---

*Last updated: 2026-06*
