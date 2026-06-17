---
title: "Konimex OEE Online"
description: "Vendor URS response for PT Konimex — OEE Online system for Line Hecrona 2, Produksi Food 2."
tags:
  - konimex
  - oee
  - urs
  - manufacturing
---

# OEE Online – Line Hecrona 2
**Proyek:** Penerapan OEE Online di Line Hecrona 2  
**No. Dokumen:** TFD/URS/2026/001/00  
**Klien:** PT Konimex – Produksi Food 2  

---

## Ringkasan Proyek

Proyek ini bertujuan mengimplementasikan sistem **OEE (Overall Equipment Effectiveness) Online** untuk Line Hecrona 2 di PT Konimex, mencakup mesin-mesin dari Mixer hingga Mesin Kemas Primer.

Sistem ini menggantikan proses pencatatan OEE manual yang saat ini dilakukan operator di EBR, yang berpotensi tidak akurat dan baru dievaluasi setiap bulan sekali. Sistem baru akan menyediakan pengumpulan data secara real-time, dashboard langsung, dan integrasi dengan sistem yang sudah ada (ERP, EBR, Asset Management).

**Mesin yang tercakup:**
- Mixer Hecrona 1 & 2
- Moulding, Oven, dan Kuhlban
- Mesin Packaging 1–6

---

## Referensi Formula OEE

| Metrik | Formula | Keterangan |
|---|---|---|
| **Availability** | Operating Time / Loading Time × 100% | Tingkat ketersediaan mesin |
| **Performance** | Net Operating Time / Operating Time × 100% | Kemampuan output vs. kapasitas SOP |
| **Quality** | Valuable Operating Time / Net Operating Time × 100% | Tingkat output baik |

---

## Daftar Dokumen

| File | Isi |
|---|---|
| [01_Business_Requirements.md](./01_Business_Requirements.md) | Kebutuhan bisnis: integrasi PLC/HMI, dashboard, grafik & tabel, kepatuhan CPPOB (1.6.1–1.6.5) |
| [02_Data_Requirements.md](./02_Data_Requirements.md) | Kebutuhan data: integritas data, ALCOA+, audit trail, format laporan (1.7.1–1.7.14) |
| [03_Design_Requirements.md](./03_Design_Requirements.md) | Kebutuhan desain: kemudahan penggunaan, akses web browser, responsif, multi-bahasa (1.8.1–1.8.8) |
| [04_Infrastructure_Requirements.md](./04_Infrastructure_Requirements.md) | Kebutuhan infrastruktur: spesifikasi server, jaringan, SSO/RBAC, VPN, Linux/PostgreSQL (1.9.1–1.9.6) |

---

## Ringkasan Kebutuhan Wajib (Mandatory)

### Bisnis
- Integrasi dengan PLC/HMI (Omron, Schneider, dll.) dan sistem ERP/EBR/Asset Management
- Dashboard real-time dengan status mesin berkode warna (merah = berhenti, hijau = beroperasi)
- Grafik dan tabel sebagai pendukung pengambilan keputusan
- Laporan sesuai regulasi CPPOB (data tidak dapat dimanipulasi)

### Data
- Sistem dapat di-upgrade jika diperlukan data tambahan
- Kompatibel dengan sistem ERP/EBR yang sudah ada
- Mencegah duplikasi dan kesalahan transfer data
- Fitur approval untuk koreksi data
- Memenuhi prinsip ALCOA+
- Audit trail yang tidak dapat dihapus/dimodifikasi untuk seluruh aktivitas user
- Setiap perubahan data mencatat: siapa, kapan, apa yang diubah, nilai lama, nilai baru
- Laporan standar: Daily OEE Report, Weekly/Monthly Trend, Downtime Pareto, Loss Analysis
- Setiap laporan yang dicetak mencantumkan timestamp, user pencetak, dan watermark

### Desain
- Mudah dioperasikan (user friendly)
- Data dapat dikumpulkan, dicetak, dan diverifikasi secara real-time
- Dapat diakses melalui web browser (Chrome, Edge, Firefox) tanpa instalasi tambahan
- Responsif di semua dimensi layar
- Mendukung multi-bahasa: Bahasa Indonesia dan Bahasa Inggris
- Menggunakan timezone WIB (GMT+7) sebagai default

### Infrastruktur
- Keamanan mengikuti standar Konimex: SSO, RBAC, dan VPN untuk akses remote
- Menggunakan 1 server central yang sudah tersedia (tidak perlu server lokal di Produksi)
- Spesifikasi minimum: Prosesor Intel Xeon Gold >3GHz 12 core, jaringan FO/Cat6, database PostgreSQL/NoSQL, OS Linux
- Software dan hardware mudah dikonfigurasi untuk perubahan perangkat (HMI, PLC, dll.)

---

## Kriteria Penerimaan (SAT)

Sistem diterima apabila:
1. Komponen yang terpasang sesuai dengan daftar komponen yang ditawarkan.
2. Sistem berfungsi dengan baik sesuai yang tertulis di URS dan penawaran.

---

*Sumber: URS FOOD2/URS/2026/001/00 — Disusun oleh Technical Service Manager, Diperiksa oleh Plant Manager & OSSD Manager, Disetujui oleh GM Operation.*
