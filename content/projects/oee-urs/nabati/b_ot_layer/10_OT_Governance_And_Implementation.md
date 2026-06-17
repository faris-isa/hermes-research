---
title: "Nabati — Part B: OT Governance & Implementation"
description: "Kebutuhan Tata Kelola & Implementasi OT (GOV, REQ, TST, DOC)."
tags:
  - nabati
  - mes
  - urs
  - part-b
---

# Nabati MES Ecosystem — Part B: Kebutuhan Tata Kelola & Implementasi OT

**Referensi URS:** Part B Bagian 4.3 — Governance & Implementation Requirements
**Sumber URS:** URS-2026.05 V1.6

---

## 4.3.1 Tata Kelola & Perencanaan Proyek

| ID | Kebutuhan | Solusi Kami | Penjelasan |
|:---|:---|:---|:---|
| **GOV-01** | Vendor harus menyediakan Project Plan yang mencakup scope, milestone, timeline, RACI, roles/responsibilities, communication cadence, dan escalation path. | | |
| **GOV-02** | Vendor harus menyediakan dedicated Project Manager sebagai single point of contact dan menyerahkan organization chart project, termasuk principal/subcontractor jika ada. | | |
| **GOV-03** | Vendor harus mengelola Risk/Issue Log, Decision Log, dan Change Log selama implementasi. | | |
| **GOV-04** | Vendor harus menyediakan Cutover Plan yang mencakup go/no-go checklist, cutover runbook, rollback plan, dan readiness checklist. | | |
| **GOV-05** | Vendor harus menyediakan Hypercare Plan yang mencakup durasi, support hour, severity-based response target/SLA, escalation path, dan reporting cadence. | | |
| **GOV-06** | Vendor sebaiknya menyediakan phased rollout recommendation berdasarkan hasil PoC/pilot, scalability, risiko, dan effort implementasi. | | |
| **GOV-07** | Vendor harus menyediakan project delivery approach yang dapat berupa waterfall, agile, hybrid, atau metode lain yang disepakati, selama tetap memenuhi milestone, deliverables, testing, dan acceptance criteria dalam URS ini. | | |
| **GOV-08** | Vendor harus mengakomodasi controlled configuration/workflow adjustment allowance hingga 50% dari initially agreed configured workflow, form, report, and master-data configuration items selama implementasi, sepanjang tidak menambah module license, hardware/device, major custom development, atau integration scope baru. | | |
| **GOV-09** | Setiap penyesuaian di luar allowance tersebut harus dikelola melalui change control, termasuk impact analysis terhadap scope, timeline, cost, testing, dan acceptance. | | |

---

## 4.3.2 Deliverables Assessment, Requirement & Desain

| ID | Kebutuhan | Solusi Kami | Penjelasan |
|:---|:---|:---|:---|
| **REQ-01** | Vendor harus melakukan site assessment untuk memvalidasi proses, data availability, OT readiness, integration assumption, dan memberikan agenda serta findings summary. | | |
| **REQ-02** | Vendor harus menyerahkan Vendor URS Response & Gap Assessment yang mencakup compliance matrix, gap, assumption, dependency, pendekatan solusi, dan referensi dokumen vendor yang menjelaskan solusi secara lebih detail dari URS Nabati. | | |
| **REQ-03** | Vendor sebaiknya menyediakan Traceability Matrix yang mengaitkan URS ID → design specification → test case minimal untuk requirement prioritas Must. | | |
| **REQ-05** | Vendor harus menyerahkan Solution Design Specification (SDS) yang mencakup application architecture, data model, MES-SAP data flow, common plant database/historian design, integration/interface, security approach, dan deployment topology. | | |
| **REQ-06** | Vendor harus menyerahkan Hardware / Interface Requirements Specification jika hardware, gateway, network, sensor, instrument, device, database/historian, atau integration runtime masuk scope implementasi. | | |
| **REQ-08** | Vendor harus menyediakan Data Architecture & Interface Specification yang mencakup data source, tag naming, schema, topic/API list, data retention, synchronization rule, data ownership, security, backup/restore, dan integration boundary. | | |

---

## 4.3.3 Paket Pengujian, Validasi & Penerimaan

| ID | Kebutuhan | Solusi Kami | Penjelasan |
|:---|:---|:---|:---|
| **TST-01** | Vendor harus menyediakan Test Strategy & Test Plan yang mencakup FAT, SAT, UAT, responsibilities, entry/exit criteria, dan evidence format. | | |
| **TST-02** | Vendor harus melakukan FAT dan menyerahkan FAT Protocol, FAT Report, test evidence, dan defect list. | | |
| **TST-03** | Vendor harus melakukan SAT dan menyerahkan SAT Protocol, SAT Report, test evidence, dan defect list, termasuk validasi konektivitas dan perangkat shopfloor. | | |
| **TST-04** | Vendor harus mendukung UAT dengan menyediakan UAT Plan, test script, evidence template, dan sign-off template. | | |
| **TST-05** | Vendor harus menyediakan integration testing evidence untuk SAP, historian/data layer, reporting/BI, webhook/API endpoint, atau consumer lain yang masuk scope. | | |
| **TST-06** | Vendor harus melakukan commissioning/validation terhadap device, interface, data flow, dashboard, report, dan integration point yang masuk scope. | | |
| **TST-07** | Vendor sebaiknya menyediakan IQ/OQ/PQ Protocol dan Report jika diwajibkan oleh standar internal Nabati atau disepakati dalam scope validation. | | |
| **TST-08** | Vendor harus menyediakan testing evidence untuk transactional database, software historian, integration runtime, data synchronization, buffering/retry, and data reconciliation. | | |

---

## 4.3.4 Manual, Pelatihan, Handover & Penutupan

| ID | Kebutuhan | Solusi Kami | Penjelasan |
|:---|:---|:---|:---|
| **DOC-01** | Vendor harus menyerahkan User Manual berbasis role untuk modul, workflow, form, dashboard, dan aktivitas operasional yang masuk scope. | | |
| **DOC-02** | Vendor harus menyerahkan Admin SOP yang mencakup user/role management, konfigurasi, backup/restore, monitoring, troubleshooting, dan audit log. | | |
| **DOC-03** | Vendor harus menyerahkan Standard User Procedures / Work Instructions untuk role shopfloor yang selaras dengan workflow dan form yang dikonfigurasi. | | |
| **DOC-04** | Vendor harus melakukan training untuk admin dan end user, serta menyerahkan training material, attendance record, dan training sign-off. | | |
| **DOC-05** | Vendor harus menyerahkan final handover package yang mencakup as-built documentation, configuration/export package, daftar integration endpoint, instruksi backup/restore, DB/historian schema jika in-scope, dan operational runbook. | | |
| **DOC-06** | Vendor harus menyediakan final acceptance document/minutes yang mencakup scope, testing result, open issue, closure status, dan acceptance status. | | |
| **DOC-07** | Vendor sebaiknya menyediakan improvement recommendation berdasarkan gap antara as-is process dan MES best practice. | | |

---

## Referensi Tim Implementasi (dari URS 3.6.3)

| No | Nama Item | Deskripsi | Qty |
|:---|:---|:---|:---:|
| D1.1 | Project Manager (PM) | Perencanaan, tata kelola, budget/jadwal, stakeholder, risiko, cadence, eskalasi | 1 orang |
| D1.2 | Business Analyst (BA) | Requirement, as-is/to-be, fit-gap, functional spec, validasi proses | 1 orang |
| D1.3 | Solution Architect (SA) | Desain solusi, arsitektur app/integrasi/data, keputusan teknis, keselarasan ISA-95 | 1 orang |
| D1.5 | Integration Engineer | SAP/API, DAQ/interface, integrasi barcode/label/timbangan, alur data, dukungan pengujian | 1 orang |
| D1.7 | OT Infrastructure Engineer | Deployment hardware, commissioning, kabel, jaringan, server, gateway, device, terminal, printer, sensor, persiapan site | 1 orang |
| D1.8 | Quality Assurance (QA) Engineer | FAT/SAT/UAT, skenario pengujian, defect, retest, sign-off, bukti validasi, dukungan pelatihan | 1 orang |

---

## Timeline Implementasi Indikatif (dari URS 1.3)

| Aktivitas | Sub-aktivitas | M1 | M2 | M3 | M4 | M5 | M6 | M7 |
|:---|:---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **Pilot Project Sektor 8** | Kick-Off | ✓ | | | | | | |
| | Assessment & Functional Design | ✓ | ✓ | | | | | |
| | Software: Production Management | | | ✓ | ✓ | ✓ | UAT/SAT | Go Live |
| | Software: Material & Inventory Management | | | ✓ | ✓ | ✓ | UAT/SAT | Go Live |
| | Software: Quality Management | | | ✓ | ✓ | ✓ | UAT/SAT | Go Live |
| | Hardware: Design & Assessment | | ✓ | ✓ | | | | |
| | Hardware: OT Infra Installation | | | ✓ | ✓ | ✓ | | |
| | Hardware: Sensor & Instrument Installation | | | | ✓ | ✓ | FAT | |
| | Interface: Design & Assessment | | ✓ | ✓ | | | | |
| | Interface: SAP Interface Setups | | | ✓ | ✓ | ✓ | | |
| | Interface: OT/MES Integration | | | ✓ | ✓ | ✓ | | |

---

*← Kembali ke [index.md](../index.md)*
