---
title: "Nabati MES Ecosystem"
description: "Vendor URS response for PT. Kaldu Sari Nabati Indonesia — MES Ecosystem covering Part A (MES Application) and Part B (OT Layer)."
tags:
  - nabati
  - mes
  - urs
  - manufacturing
---

# Nabati MES Ecosystem — Dokumen Respons Vendor & Desain Solusi

**Perusahaan:** PT. Kaldu Sari Nabati Indonesia (PT KSNI)
**Referensi Dokumen:** URS-2026.05 | Versi V1.6 | Tanggal 29/05/2026
**Ruang Lingkup Pilot:** Gedung A Sektor 8, Plant Majalengka
**Jenis Dokumen:** Vendor URS Response & Solution Design

---

## Gambaran Umum

Repositori ini berisi respons vendor terhadap User Requirement Specification (URS-2026.05) MES Ecosystem Nabati. URS dibagi menjadi dua bagian:

- **Part A — MES Application:** Mencakup Production Management, Inventory & Material Management, Quality Management, integrasi SAP/API, analytics, reporting, role/akses, audit trail, dan kesiapan deployment.
- **Part B — OT Data, Infrastructure & Shopfloor DAQ:** Mencakup common plant data platform, server/DB/historian, gateway, network, DAQ, sensor/instrumen, shopfloor device, instalasi, commissioning, dan handover.

Setiap file markdown dalam repositori ini memetakan langsung ke bagian URS, dengan respons solusi dan penjelasan untuk setiap ID requirement.

---

## Keterangan Status Penyelesaian

| Simbol | Keterangan |
|:---:|:---|
| ✅ | Sudah terpenuhi sepenuhnya |
| 🔶 | Sebagian terpenuhi / sedang dalam proses |
| ❌ | Belum terpenuhi / TBD |

---

## Struktur Dokumen

### Part A — MES Application (`a_mes_application/`)

| File | Bagian URS | Topik | Status |
|:---|:---|:---|:---:|
| [00_1_as_is_process.md](a_mes_application/00_1_as_is_process.md) | Part A Bagian 2 | Pemetaan Proses As-Is | 🔶 |
| [00_2_as_to_be_process.md](a_mes_application/00_2_as_to_be_process.md) | Part A Bagian 3 | Model Operasi To-Be | 🔶 |
| [02_production_management.md](a_mes_application/02_production_management.md) | Part A 4.1.1 | Kebutuhan Production Management (PRD-01 ~ PRD-10) | 🔶 |
| [03_Inventory_And_Material.md](a_mes_application/03_Inventory_And_Material.md) | Part A 4.1.2 | Kebutuhan Inventory & Material Management (INV-01 ~ INV-12) | 🔶 |
| [04_In_Process_Quality_Control.md](a_mes_application/04_In_Process_Quality_Control.md) | Part A 4.1.3 | Kebutuhan Quality Management / IPQC (QLT-01 ~ QLT-12) | 🔶 |
| [05_Platform_And_Architecture.md](a_mes_application/05_Platform_And_Architecture.md) | Part A 4.1.4 | Kebutuhan Platform, Deployment & Integrasi MES (PLT-01 ~ PLT-09) | 🔶 |

### Part B — OT Data, Infrastructure & Shopfloor DAQ (`b_ot_layer/`)

| File | Bagian URS | Topik | Status |
|:---|:---|:---|:---:|
| [07_OT_Infrastructure_And_Data.md](b_ot_layer/07_OT_Infrastructure_And_Data.md) | Part B 4.1.1 + 4.1.2 | Kebutuhan Infrastruktur OT, Platform Data & Historian (INF + DBH) | 🔶 |
| [08_Network_And_Connectivity.md](b_ot_layer/08_Network_And_Connectivity.md) | Part B 4.1.3 | Kebutuhan Jaringan, Konektivitas & Ketersediaan (NET-01 ~ NET-12) | 🔶 |
| [09_Data_Capture_And_Shopfloor.md](b_ot_layer/09_Data_Capture_And_Shopfloor.md) | Part B 4.2 | Kebutuhan Pengambilan Data & Perangkat Shopfloor (DSA, ACQ, DVC, DAT) | 🔶 |
| [10_OT_Governance_And_Implementation.md](b_ot_layer/10_OT_Governance_And_Implementation.md) | Part B 4.3 | Kebutuhan Tata Kelola & Implementasi OT (GOV, REQ, TST, DOC) | 🔶 |

---

## Referensi Cepat — Prefix ID Requirement

| Prefix | Domain | Dokumen |
|:---|:---|:---|
| PRD | Production Management | Part A 4.1.1 |
| INV | Inventory & Material Management | Part A 4.1.2 |
| QLT | Quality Management / IPQC | Part A 4.1.3 |
| PLT | Platform, Deployment & Integrasi | Part A 4.1.4 |
| GOV | Tata Kelola & Perencanaan Proyek | Part A 4.2.1 / Part B 4.3.1 |
| REQ | Assessment, Requirement & Desain | Part A 4.2.2 / Part B 4.3.2 |
| TST | Pengujian, Validasi & Penerimaan | Part A 4.2.3 / Part B 4.3.3 |
| DOC | Manual, Pelatihan & Handover | Part A 4.2.4 / Part B 4.3.4 |
| INF | Infrastruktur OT & Panel | Part B 4.1.1 |
| DBH | Platform Data Plant & Historian | Part B 4.1.2 |
| NET | Jaringan, Konektivitas & Ketersediaan | Part B 4.1.3 |
| DSA | Penilaian Titik & Pengambilan Data | Part B 4.2.1 |
| ACQ | Akuisisi Sinyal & Antarmuka Instrumen | Part B 4.2.2 |
| DVC | Perangkat Input, Scanning & Printing Shopfloor | Part B 4.2.3 |
| DAT | Antarmuka Data, Validasi & Fallback | Part B 4.2.4 |

---

## Singkatan & Istilah Utama

| Istilah | Definisi |
|:---|:---|
| MES | Manufacturing Execution System |
| OT | Operational Technology |
| DAQ | Data Acquisition — modul capture data dari mesin/sensor |
| eBR | Electronic Batch Record |
| eWI | Electronic Work Instruction |
| WO | Work Order — perintah kerja produksi dari PPIC |
| BoM | Bill of Material |
| OEE | Overall Equipment Effectiveness |
| IPQC | In-Process Quality Control |
| SAP | ERP system PT KSNI |
| PLC | Programmable Logic Controller |
| RMPM | Raw Material & Packaging Material |
| WH | Warehouse |
| BS | Bad Stock — material reject/scrap dari proses produksi |
| FG | Finish Good — produk jadi siap kirim |
| WIP | Work In Progress |
| SFG | Semi-Finished Good |
| SKU | Stock Keeping Unit |
| CCP | Critical Control Point — titik kontrol kritis pada proses |
| OOT | Out of Tolerance |
| OOS | Out of Specification |
| PPIC | Production Planning & Inventory Control |
| UAT | User Acceptance Test |
| FAT | Factory Acceptance Test |
| SAT | Site Acceptance Test |
| RACI | Responsible, Accountable, Consulted, Informed |

---

## Area Proses dalam Scope (Gedung A Sektor 8)

| No | Area | Tim |
|:---|:---|:---|
| 1 | Mixing | Plant Production |
| 2 | Conching Macintyre (Cream White) | Plant Supporting |
| 3 | Conching Buhler (Cream Choc) | Plant Supporting |
| 4 | Penyimpanan Cream (Cream Storage) | Plant Production |
| 5 | Oven dan Creaming (Line Processing) | Plant Production |
| 6 | Packaging | Plant Production |
| 7 | Cartoning | Plant Production |
| 8 | Timbang BS (Bad Stock) | Plant Supporting |
| 9 | Giling BS Recycle | Plant Supporting |
| 10 | WH RMPM | QC / SCM |

---

*Terakhir diperbarui: 2026-05 | Referensi URS: URS-2026.05 V1.6*
