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

### [[Nabati MES Ecosystem|nabati/index]]

**Perusahaan:** PT. Kaldu Sari Nabati Indonesia (PT KSNI)
**Ruang Lingkup:** Full MES Ecosystem — Gedung A Sektor 8, Plant Majalengka
**URS:** URS-2026.05 V1.6

Two-part URS covering MES Application (Production, Inventory, Quality, Platform) and OT Layer (Infrastructure, Network, Data Capture, Governance).

#### Part A — MES Application

- [[Pemetaan Proses As-Is|nabati/a_mes_application/00_1_as_is_process]]
- [[Model Operasi To-Be|nabati/a_mes_application/00_2_as_to_be_process]]
- [[Production Management (PRD-01 ~ PRD-10)|nabati/a_mes_application/02_production_management]]
- [[Inventory & Material (INV-01 ~ INV-12)|nabati/a_mes_application/03_Inventory_And_Material]]
- [[IPQC (QLT-01 ~ QLT-12)|nabati/a_mes_application/04_In_Process_Quality_Control]]
- [[Platform & Architecture (PLT-01 ~ PLT-09)|nabati/a_mes_application/05_Platform_And_Architecture]]

#### Part B — OT Layer

- [[Infrastructure & Data Platform (INF + DBH)|nabati/b_ot_layer/07_OT_Infrastructure_And_Data_Platform]]
- [[Network & Connectivity (NET-01 ~ NET-12)|nabati/b_ot_layer/08_Network_And_Connectivity]]
- [[Data Capture & Shopfloor (DSA, ACQ, DVC, DAT)|nabati/b_ot_layer/09_Data_Capture_And_Shopfloor_Devices]]
- [[OT Governance & Implementation (GOV, REQ, TST, DOC)|nabati/b_ot_layer/10_OT_Governance_And_Implementation]]

---

### [[Konimex OEE Online|konimex/index]]

**Klien:** PT Konimex — Produksi Food 2
**Ruang Lingkup:** OEE Online — Line Hecrona 2
**URS:** FOOD2/URS/2026/001/00

Real-time OEE monitoring replacing manual EBR recording. PLC/HMI integration via OPC-UA, web dashboards, CPPOB compliance.

- [[Business Requirements (1.6)|konimex/01_Business_Requirements]]
- [[Data Requirements (1.7)|konimex/02_Data_Requirements]]
- [[Design Requirements (1.8)|konimex/03_Design_Requirements]]
- [[Infrastructure Requirements (1.9)|konimex/04_Infrastructure_Requirements]]

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
