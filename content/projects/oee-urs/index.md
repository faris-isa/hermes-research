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

### [[Nabati MES Ecosystem|nabati]]

**Client:** PT. Kaldu Sari Nabati Indonesia
**Scope:** Full MES Ecosystem — Gedung A Sektor 8, Plant Majalengka
**URS:** URS-2026.05 V1.6

Two-part URS covering MES Application (Production, Inventory, Quality, Platform) and OT Layer (Infrastructure, Network, Data Capture, Governance).

→ [[Nabati MES Ecosystem|nabati]]

### [[Konimex OEE Online|konimex]]

**Client:** PT Konimex — Produksi Food 2
**Scope:** OEE Online — Line Hecrona 2
**URS:** FOOD2/URS/2026/001/00

Real-time OEE monitoring replacing manual EBR recording. PLC/HMI integration via OPC-UA, web dashboards, CPPOB compliance.

→ [[Konimex OEE Online|konimex]]

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
