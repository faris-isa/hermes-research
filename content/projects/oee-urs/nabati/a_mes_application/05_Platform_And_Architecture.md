---
title: "Nabati — Part A: Platform & Architecture"
description: "Kebutuhan Platform, Deployment & Integrasi MES (PLT-01 ~ PLT-09)."
tags:
  - nabati
  - mes
  - urs
  - part-a
---

# Nabati MES Ecosystem - Part 5: Platform, Integration & Architecture

### 4.1.4 MES Platform, Deployment Compatibility & Application Integration Requirements

| ID | Requirement | Our Solution | Explanation |
| :--- | :--- | :--- | :--- |
| **PLT-01** | Vendor harus menjelaskan deployment model yang didukung oleh MES, termasuk on-premise, hybrid, cloud/SaaS, atau kombinasi. | | |
| **PLT-02** | Vendor harus menjelaskan application architecture, database/historian dependency, runtime component, licensing model, user access model, prerequisite software, dependency terhadap common plant data layer (Part B), serta data ownership, data access, dan data retention. | | |
| **PLT-03** | Jika MES berjalan on-premise, vendor harus menjelaskan kebutuhan server/VM, OS, database, storage, sizing user/transaksi, backup/restore, redundancy minimum, data growth, dan outgoing traffic. | | |
| **PLT-04** | Jika MES berjalan cloud/SaaS, vendor harus menjelaskan secure gateway/agent, connectivity model, data buffering requirement, data residency, availability/SLA, backup/restore, security control, dan mekanisme sinkronisasi dengan local database/historian. | | |
| **PLT-05** | Jika MES berjalan hybrid, vendor harus menjelaskan pembagian fungsi antara local runtime, historian/cache, transactional database, cloud application, SAP interface, dan shopfloor interface. | | |
| **PLT-06** | MES harus menyediakan integration capability untuk SAP/API, shopfloor data source, historian/cache, label/printer/scanner/gateway/tablet, reporting layer, dan common plant data layer. | | |
| **PLT-07** | MES harus mendukung role/permission, audit trail, user access control, dan basic application security sesuai kebijakan Nabati. | | |
| **PLT-08** | Vendor harus mendukung konfigurasi dan rollout MES workflow, master data, forms, roles/permissions, dashboard, reporting, and integration mapping untuk seluruh area proses yang tercantum pada Section 3.2, 3.3, dan 3.4 sesuai scope Part A. | | |
| **PLT-09** | Vendor harus menjelaskan boundary antara MES configuration/rollout scope dan dependency terhadap Part B. | | |

---
 
## Arsitektur Deployment yang Diusulkan
 
> *Bagian ini diisi berdasarkan solusi vendor yang diusulkan*
 
| Komponen | Detail | Keterangan |
|:---|:---|:---|
| Model Deployment | | On-premise / Hybrid / Cloud/SaaS |
| MES App Server | | Spesifikasi server/VM |
| Database | | Jenis DB, versi, sizing |
| Historian | | Platform historian, retention |
| OT Gateway | | Protokol yang didukung |
| Integrasi SAP | | Metode koneksi, API/RFC |
| User Access | | Model lisensi, jumlah user |
 
---
 
## Referensi Alur Data MES–SAP (dari URS 3.5)
 
| Alur Data | Arah | Keterangan |
|:---|:---:|:---|
| Production Plan / Work Order / Process Order | SAP → MES | Referensi perencanaan untuk eksekusi |
| Master Data & Referensi Recipe | SAP → MES | BOM, recipe, master material |
| Referensi Inventori / Saldo Stok | SAP → MES | Pengecekan ketersediaan material |
| Proposal Posting Pergerakan Material | MES → SAP | Proposal GI/GR dari MES |
| Notifikasi | MES → SAP | Pemicu reservasi material |
| Proposal Kesiapan & Reservasi Material | MES → SAP | Hasil validasi H-1 |
| Kebutuhan & Reservasi Material Dikonfirmasi | SAP → MES | Reservasi yang telah dikonfirmasi |
| Konfirmasi Produksi | MES → SAP | Aktual vs rencana akhir shift |
| Penerimaan FG & Referensi Pallet | MES → SAP | Posting GR FG |
 
---
 
## Batas Ruang Lingkup Part A vs Part B
 
| Elemen | Part A (MES Application) | Part B (OT Infrastructure) |
|:---|:---|:---|
| Aplikasi MES | ✅ Dalam scope | — |
| Workflow & konfigurasi modul | ✅ Dalam scope | — |
| Integrasi SAP/API | ✅ Dalam scope | — |
| Dashboard & reporting | ✅ Dalam scope | — |
| Server/VM MES | ✅ Dalam scope (spec) | ✅ Dalam scope (hardware) |
| Database & historian | Dependency | ✅ Dalam scope Part B |
| OT Gateway | Dependency (integrasi) | ✅ Dalam scope Part B |
| DAQ / sensor / instrumen | Dependency (data source) | ✅ Dalam scope Part B |
| Jaringan & infrastruktur shopfloor | Dependency | ✅ Dalam scope Part B |
| Perangkat shopfloor (tablet, scanner, printer) | Dependency | ✅ Dalam scope Part B |
 
---
 
*← Kembali ke [index.md](../index.md)*
