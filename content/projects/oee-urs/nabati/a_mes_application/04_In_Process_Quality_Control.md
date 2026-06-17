---
title: "Nabati — Part A: IPQC"
description: "Kebutuhan Quality Management / IPQC (QLT-01 ~ QLT-12)."
tags:
  - nabati
  - mes
  - urs
  - part-a
---

# Nabati MES Ecosystem - Part 4: In Process Quality Control Requirements

### 4.1.3 Quality Management / In Process Quality Control Requirements

| ID | Requirement | Our Solution | Explanation |
| :--: | :--- | :--- | :--- |
| **QLT-01** | MES harus mendukung digital Control Plan dan Inspection Record untuk checkpoint QC/IPC yang disepakati. | | |
| **QLT-02** | MES harus mendukung master control plan per recipe/SKU: checkpoint, parameter, spec/limit/threshold, sampling frequency, inspection type. | | |
| **QLT-03** | MES harus menyediakan configurable digital inspection form untuk CCP, parameter check, organoleptik, equipment condition, dll. | | |
| **QLT-04** | MES harus mencatat hasil inspeksi dengan timestamp, user, area, product/material reference, batch/lot, dan WO jika relevan. | | |
| **QLT-05** | MES harus mendukung validasi hasil terhadap spec limit, inspection rule, atau acceptance criteria. | | |
| **QLT-06** | MES harus menghasilkan status inspeksi: pass, fail, hold, release, reject, recheck, atau status lain. | | |
| **QLT-07** | MES harus menyediakan histori inspeksi berdasarkan produk, material, batch/lot, WO, area, dan waktu. | | |
| **QLT-08** | MES sebaiknya mendukung alert/reminder untuk abnormal result, OOT/OOS, missed inspection, atau sampling schedule. | | |
| **QLT-09** | MES sebaiknya menyediakan Quality Analytics: RFT, defect rate, parameter trend, deviation pattern, SPC-related reporting. | | |
| **QLT-10** | MES sebaiknya mendukung attachment evidence seperti foto, CoA, atau dokumen pemeriksaan lain. | | |
| **QLT-11** | MES harus mendukung incoming & pre-process material QC gate untuk memastikan material/premix/recycle siap digunakan sebelum execution. | | |
| **QLT-12** | MES harus mendukung final QC release & order close gate sebagai dasar hold/release, label status, dan production confirmation proposal. | | |


---
 
## Peta Checkpoint IPQC
 
| Area Proses | Checkpoint | Parameter | Metode Capture | Frekuensi |
|:---|:---|:---|:---|:---|
| Mixing | Pengecekan parameter mixing | CCP, OKP, BS | Auto IoT + input manual | Per batch |
| Baking & Creaming | Pengecekan parameter baking/creaming | CCP, berat sheet book, BS | Auto IoT + manual | Per batch |
| Cooling & Cutting | Pengecekan parameter cooling/cutting | CCP, BS | Auto IoT + manual | Per batch |
| Packaging | Pengecekan parameter packaging | CCP, seal, berat, kode, BS | Auto IoT + manual | Per batch |
| Cartoning | Pengecekan parameter cartoning | CCP, BS | Auto IoT + manual | Per batch |
| Sampel pallet | Pengecekan fisik & kondisi produk | Visual, fisik | Input manual | Per pallet |
| Berat FG | Berat FG per karton | Berat | Auto (counter/timbangan) | Per batch |
| Conching | Pengecekan kualitas cream | Moisture, refractometer, CCP | Auto IoT + manual | Setiap 1 jam |
| BS & Recycle | Klasifikasi kualitas BS | Kondisi metal/filter, berat | Manual + timbangan IoT | Per pengumpulan |
| Incoming WH RMPM | QC material masuk | Verifikasi CoA, sampling, berat | Input manual | Per pengiriman |
 
---
 
## Referensi Ruang Lingkup Implementasi (dari URS 3.4)
 
| No | Area | Ruang Lingkup Layanan | Pengguna | Deskripsi |
|:---|:---|:---|:---|:---|
| 1 | Sand box | Dev/deploy QC Control Plans & Inspections | QC, Plant Production, Plant Supporting | Modul QC plan, aturan sampling, batas parameter, workflow disposition (pass/hold/reject/release), alert OOT ke operator/foreman. |
| 2 | Sand box | Config & test QC Control Plans & Inspections | QC, Plant Production, Plant Supporting | Master QC plan per produk/tahap, aturan sampling, routing alert OOT ke Plant Production/Supporting, UAT skenario disposition. |
| 3 | Sand box | Dev/deploy Modul Quality Analytics | QC | Dashboard pass-rate, hold-aging, control chart, SPC/Cpk, pelacakan deviasi & CAPA. |
| 4 | Sand box | Config & test Modul Quality Analytics | QC | KPI QC, threshold control chart, UAT visualisasi report quality. |
| 5 | Sand box | Dev/deploy integrasi hasil QC ke SAP QM | QC | Antarmuka posting usage decision dan hasil inspeksi ke SAP QM jika in-scope. |
| 6 | Sand box | Config & test integrasi hasil QC ke SAP QM | QC | Pemetaan field SAP QM dan UAT posting hasil QC. |
| 7 | WH RMPM / Incoming QC | Konfigurasi & rollout workflow incoming QC | QC | Formulir inspeksi incoming QC, referensi material/lot, status disposition, gate QC pass, integrasi status label/release. |
| 8 | Conching | Konfigurasi & rollout workflow Conching IPQC | QC | QC checkpoint, batas parameter/spec, aturan sampling, disposition, alert OOT/OOS, control chart/pelaporan untuk conching. |
| 9 | Mixing | Konfigurasi & rollout workflow Mixing IPQC | QC | Rencana sampling per batch WIP, formulir inspeksi, disposition WIP release/hold/reject, alert/pelaporan untuk mixing. |
| 10 | Processing (Baking & Creaming) | Konfigurasi & rollout workflow Processing IPQC | QC | Monitoring CCP, formulir inspeksi, batas parameter/spec, alert OOT/OOS, workflow disposition untuk baking/creaming. |
| 11 | Packaging & FG | Konfigurasi & rollout workflow QC Packaging & final release | QC | Parameter QC packaging, pengecekan seal/berat/kode, gate final QC release, prasyarat serah terima FG. |
| 12 | BS & Recycle | Konfigurasi & rollout workflow klasifikasi kualitas BS/recycle | QC | Pengecekan kualitas BS, klasifikasi reusable/scrap, status release recycle, tautan ke workflow penggunaan recycle. |
| 13 | Office | Dev/deploy dashboard QC & SPC | QC | Dashboard pass-rate, hold-aging, control chart, SPC/Cpk, pelacakan deviasi & CAPA. |
| 14 | Office | Config & test dashboard QC & SPC | QC | Role/permission dashboard QC, threshold alert, UAT report quality analytics. |
 
---
 
*← Kembali ke [index.md](../index.md)*
