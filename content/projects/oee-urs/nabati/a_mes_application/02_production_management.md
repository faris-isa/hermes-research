---
title: "Nabati — Part A: Production Management"
description: "Kebutuhan Production Management (PRD-01 ~ PRD-10)."
tags:
  - nabati
  - mes
  - urs
  - part-a
---

# Nabati MES Ecosystem - Part 2: Production Management Requirements

### 4.1.1 Production Management System Requirements

| ID | Requirement | Our Solution | Explanation |
| :---: | :--- | :---: | :---: |
| **PRD-01** | MES harus mendukung penerimaan Work Order dari SAP atau sumber planning yang disepakati. | | |
| **PRD-02** | MES harus mendukung tracking status Work Order: released, started/running, hold jika relevan, completed. | | |
| **PRD-03** | MES harus mendukung Batch Management: Batch ID per WO, lifecycle, hierarchy, dan parent WO linkage. | | |
| **PRD-04** | MES harus menyediakan eBR / Work Instruction untuk sequence, parameter, operator, timestamp, dan e-signature jika disepakati. | | |
| **PRD-05** | MES harus mencatat execution record: start/stop, output, status proses, shift, line/area, user, dan data operasional utama. | | |
| **PRD-06** | MES harus menyediakan Production Analytics: output, progress vs plan, OEE A/P/Q, loss, downtime, dan trend. | Module: OEE Monitoring - Detail Line | Pada halaman OEE Monitoring - Detail Line sudah terdapat progress vs planning dengan menampilkan achievement rate, output dari line, dan valu OEE. |
| **PRD-07** | MES sebaiknya mendukung real-time line status dan event-based alert untuk downtime, NG, batch hold, atau abnormality. | Module: Shopfloor, OEE Monitoring | line status: OK, NG Count : OK, Downtime : OK, Batch hold : missing, abnomality: missing |
| **PRD-08** | MES sebaiknya mendukung ownership tracking dan cross-functional follow-up terhadap issue operasional dan dapat melakukan konfigurasi BOM jika diperlukan (misal ada SKU baru). | | Sistem OEE memiliki konfigurasi BOM |
| **PRD-09** | MES harus memiliki audit trail untuk perubahan record produksi: user, waktu, data awal, dan data perubahan. | | Untuk saat ini apa yang sudah didevelop dan deploy belum memiliki user log activity |
| **PRD-10** | MES harus mendukung execution gate/checklist sebelum WO/batch dijalankan berdasarkan material readiness, QC release, dan prerequisite lain yang disepakati. | | Sistem tidak diperbolehkan menjalankan production plan atau batch proses sebelum menyelesaikan reccurment check |

---
 
## Referensi Ruang Lingkup Implementasi (dari URS 3.2)
 
| No | Area | Ruang Lingkup Layanan | Deskripsi |
|:---|:---|:---|:---|
| 1 | Sand box | Dev/deploy Modul Production Order | Terima WO dari SAP, dispatch, lacak status released → started → completed; tutup WO membutuhkan QC release. |
| 2 | Sand box | Config & test Modul Production Order | Mapping WO ke lini/area, WO board/Kanban, rule QC release gate saat tutup WO, UAT lifecycle end-to-end. |
| 3 | Sand box | Dev/deploy Modul Batch Management | Generator batch ID per WO, lifecycle batch, hierarki, tautan ke parent WO. |
| 4 | Sand box | Config & test Modul Batch Management | Batch state machine, aturan hierarki, UAT pembuatan–mulai–selesai batch per produk. |
| 5 | Sand box | Dev/deploy Modul eBR / eWI | eBR/eWI step-by-step: sequence, parameter, operator, timestamp, e-signature, serah terima shift, rekap harian. |
| 6 | Sand box | Config & test Modul eBR / eWI | Template eBR/eWI per produk, akses berbasis peran, alur e-sign, UAT compliance trail. |
| 7 | Sand box | Dev/deploy Modul Production Analytics | Dashboard OEE, kategorisasi loss, perbandingan lini/mesin, status lini real-time, notifikasi downtime/NG/batch-hold, tampilan Andon. |
| 8 | Sand box | Config & test Modul Production Analytics | KPI per area/lini, dashboard drill-down, threshold alert, UAT visualisasi analytics. |
| 9 | Conching | Konfigurasi & rollout workflow Production Management | Master data area, referensi work center/lini, mapping WO ke area, workflow eksekusi batch, template eBR/eWI, peran operator/foreman, papan status produksi. |
| 10 | Mixing | Konfigurasi & rollout workflow Production Management | Master data area, referensi mixer/work center, mapping WO ke mixing, workflow eksekusi batch, template eBR/eWI. |
| 11 | Processing (Baking & Creaming) | Konfigurasi & rollout workflow Production Management | Master data lini/proses, referensi tahap baking/creaming, workflow WO/batch, template eBR/eWI, workflow terminal operator, input downtime/status. |
| 12 | Packaging & FG | Konfigurasi & rollout workflow Production Management | Master data lini, referensi tahap packaging/cartoning, workflow WO/batch, workflow output/NG/downtime, peran foreman. |
| 13 | Office | Dev/deploy dashboard produksi | Output real-time, OEE, downtime, NG, tampilan Andon untuk manajer. |
| 14 | Office | Config & test dashboard produksi | Role/permission, threshold KPI, routing alert, UAT visualisasi dashboard. |
 
---
 
*← Kembali ke [index.md](../index.md)*
