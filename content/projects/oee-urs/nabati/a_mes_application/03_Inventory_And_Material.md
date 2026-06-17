---
title: "Nabati — Part A: Inventory & Material"
description: "Kebutuhan Inventory & Material Management (INV-01 ~ INV-12)."
tags:
  - nabati
  - mes
  - urs
  - part-a
---

# Nabati MES Ecosystem - Part 3: Inventory & Material Requirements

### 4.1.2 Inventory & Material Management System Requirements

| ID | Requirement | Our Solution | Explanation |
| :--- | :--- | :--- | :--- |
| **INV-01** | MES harus mendukung identifikasi material melalui label, barcode, QR code, atau metode lain yang disepakati. | | |
| **INV-02** | MES harus mendukung label generation dan printing untuk RM, SFG/WIP, BS/recycle, FG, atau material lain sesuai scope. | | |
| **INV-03** | MES harus mendukung konfigurasi label template berdasarkan material type, process area, atau kebutuhan operasional. | | |
| **INV-04** | MES harus mendukung H-1 material readiness dan validasi staging/tipping/dispensing terhadap WO, BOM, material code, lot/batch, stock, dan quantity. | | |
| **INV-05** | MES harus mencatat material movement: staging, issue, usage, transfer, return, handover, status change, dan posting proposal jika terintegrasi ke SAP. | | |
| **INV-06** | MES harus mendukung WIP Inventory Control per stage, batch, lokasi, dan WO. | | |
| **INV-07** | MES harus mendukung Lot Traceability forward/backward dari RM/PM lot, batch proses, WIP/SFG, FG, hingga dispatch/DC jika scope. | | |
| **INV-08** | MES harus menyediakan audit trail untuk scan, label print/reprint, movement, adjustment, dan handover. Terutama untuk high risk report seperti rekonsiliasi. | | |
| **INV-09** | MES sebaiknya menyediakan Inventory Analytics: yield, BS/recycle, stock movement, variance, actual vs theoretical usage. | | |
| **INV-10** | MES sebaiknya mendukung discrepancy handling untuk mismatch, shortage, excess, wrong lot, atau quantity difference. | | |
| **INV-11** | MES sebaiknya mendukung validation dan recording untuk BS/recycle usage, termasuk stock check, portioning, usage status, dan linkage ke WO/batch. | | |
| **INV-12** | MES harus mendukung material readiness & reservation proposal untuk PPIC/SAP berdasarkan hasil H-1 validation dan adjusted requirement jika diperlukan. | | |


---
 
## Referensi Ruang Lingkup Implementasi (dari URS 3.3)
 
| No | Area | Ruang Lingkup Layanan | Pengguna | Deskripsi |
|:---|:---|:---|:---|:---|
| 1 | Sand box | Dev/deploy Label Mgmt & Staging Validation | Plant Production, Plant Supporting, QC | Generator/print label barcode RM/SFG/BS/FG yang dapat dikonfigurasi, validasi scan RM vs WO BoM saat staging/tipping; labeling RM/PM butuh status QC pass. |
| 2 | Sand box | Config & test Label Mgmt & Staging Validation | Plant Production, Plant Supporting, QC | Template label per jenis material, aturan validasi staging vs BoM, gate QC pass untuk labeling RM/PM, UAT skenario staging. |
| 3 | Sand box | Dev/deploy WIP Inventory Control | Plant Production | Pelacakan WIP/SFG per tahap proses, batch ID, WO, status storage/lokasi. |
| 4 | Sand box | Config & test WIP Inventory Control | Plant Production | WIP state machine, aturan transfer antar tahap, UAT scan-in/out WIP + update lokasi. |
| 5 | Sand box | Dev/deploy Lot Traceability Module | Plant Production, QC | Engine genealogi forward/backward dari lot → batch SFG → batch lini → FG → DC, plus audit trail skenario recall. |
| 6 | Sand box | Config & test Lot Traceability Module | Plant Production, QC | Aturan linkage lot dan UAT trace report end-to-end termasuk simulasi recall. |
| 7 | Sand box | Dev/deploy Inventory Analytics Module | Plant Production, Plant Supporting | Analisis yield, pelacakan BS, perputaran stok, analytics varians material per WO/batch/shift. |
| 8 | Sand box | Config & test Inventory Analytics Module | Plant Production, Plant Supporting | KPI inventori, threshold alert varians, UAT report yield/BS/perputaran. |
| 9 | WH RMPM / Incoming QC | Konfigurasi & rollout referensi inventori & workflow integrasi label | QC, SCM WH RMPM | Master data material, referensi label, gate QC pass, status lot incoming, kesiapan antarmuka untuk printing label/dokumen. |
| 10 | Conching | Konfigurasi & rollout staging material, validasi scan & workflow konsumsi | Plant Supporting | Staging material, validasi scan-tipping vs WO/BoM, pemetaan konsumsi oil, status output cream, record pemakaian material. |
| 11 | Mixing | Konfigurasi & rollout validasi scan material & workflow label WIP | Plant Production | Validasi scan material vs WO/BoM per hopper, aturan label output WIP, tautan batch, status serah terima WIP. |
| 12 | Processing (Baking & Creaming) | Konfigurasi & rollout WIP, konsumsi cream & workflow yield | Plant Production | Scan-in WIP, referensi konsumsi cream, referensi hopper/lini, kalkulasi yield WIP, keterlacakan material proses. |
| 13 | Packaging & FG | Konfigurasi & rollout label FG/karton, perhitungan & workflow genealogi FG | Plant Production | Workflow label FG/karton, pemetaan capture quantity, genealogi FG-ke-WIP-ke-RM, kesiapan proposal posting GR FG. |
| 14 | BS & Recycle | Konfigurasi & rollout workflow pelacakan BS/recycle | Plant Supporting | Record penimbangan BS, referensi label BS/recycle, status reusable/scrap, workflow penggunaan recycle, tautan ke WO penerima recycle. |
| 15 | Office | Dev/deploy dashboard material & keterlacakan | Plant Production, Plant Supporting | Dashboard pergerakan stok, kesiapan material, trace report genealogi FG, tingkat pemulihan BS, rekonsiliasi MES vs SAP. |
| 16 | Office | Config & test dashboard material & keterlacakan | Plant Production, Plant Supporting | Role/permission dashboard, threshold KPI, UAT visualisasi report material & keterlacakan. |
 
---
 
*← Kembali ke [index.md](../index.md)*
