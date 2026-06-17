---
title: "Nabati — Part A: Pemetaan Proses As-Is"
description: "Pemetaan proses manufaktur As-Is untuk Nabati MES Ecosystem."
tags:
  - nabati
  - mes
  - urs
  - part-a
---

# Nabati MES Ecosystem — Part A: Pemetaan Proses As-Is

**Referensi URS:** Bagian 2 — Proses As-Is & Kebutuhan Pengguna
**Ruang Lingkup:** PT KSNI Plant Majalengka, Gedung A Sektor 8

---

## 2.1 Pemetaan Proses Manufaktur: As-Is

Kondisi saat ini masih mengandalkan formulir kertas manual dan Excel untuk perhitungan dan rekap. Alur dimulai dari PPIC yang menerbitkan Work Order melalui SAP, dilanjutkan ke proses Conching, Mixing, Line Processing & Packaging, hingga FG Staging sebelum dikirim ke Distribution Center. Pengumpulan Bad Stock berjalan secara paralel di semua lini produksi.

### Diagram Alur End-to-End As-Is

```mermaid
flowchart TD
  subgraph PPIC["🏢 PPIC"]
    PPO["Production Planning Order - SAP"]
    MR["Material Reservation"]
    PPO --> MR
  end

  subgraph WHRMPM["🏭 WH RMPM"]
    WH_WO["Receive WO from PPIC\nRPH H-1 - SAP"]
    WH_GR["GR Confirmation - SAP"]
    WH_MATRES["Material Reservation to\nWH/Formulation - SAP"]
    WH_STAG["Material Staging"]
    WH_QCB["QC Pass Barcode - Scan"]
    WH_WO --> WH_GR --> WH_MATRES --> WH_STAG --> WH_QCB
  end

  subgraph MFGSUP["⚙️ Plant Supporting"]
    subgraph CON["2.1.1 Conching Process"]
      CON_MACH["Machine Process &\nTransfer to Storage"]
      CON_CREAM["Cream Storage\nfor Production"]
      CON_MACH --> CON_CREAM
    end
    subgraph BSC["2.1.4 BS Collection & Recycling"]
      BS_WEIGH["Helper Weigh\nBS Recycle & Reject"]
      BS_GRIND["Machine Grinding Process"]
      BS_WEIGHT2["Opr Weigh BS per 30kg"]
      BS_LABEL["Print & Apply\nBS Recycle Label"]
      BS_SEND["Helper Send Recycle"]
      BS_WEIGH --> BS_GRIND --> BS_WEIGHT2 --> BS_LABEL --> BS_SEND
    end
    subgraph QCPS["2.1.6 QC Plant Supporting"]
      QCPS_VIS["Visual & Condition BS Check"]
      QCPS_MD["Check Metal Detector & Filter"]
      QCPS_LBL["Labelling BS Recycle"]
      QCPS_DET["Determine Use of BS Recycle"]
      QCPS_MAT["Visual & Condition Material Check"]
      QCPS_CRM["Visual & Condition Cream Check"]
      QCPS_VERIF["Verification"]
      QCPS_VIS --> QCPS_MD --> QCPS_LBL --> QCPS_DET --> QCPS_MAT --> QCPS_CRM --> QCPS_VERIF
    end
  end

  subgraph MFGPROD["🏗️ Plant Production"]
    subgraph MIX["2.1.2 Mixing Process"]
      MIX_MACH["Machine Process &\nTransfer to Line"]
      MIX_CCP["Write down CCP 01, OKP, BS"]
      MIX_MACH --> MIX_CCP
    end
    subgraph LP["2.1.3 Line Processing & Packaging"]
      LP_BAKE["Baking & Creaming Machine Ops"]
      LP_COOL["Cooling & Cutting Machine Ops"]
      LP_PKG["Packaging Machine Ops"]
      LP_CART["Cartoning & Paletting Ops"]
      LP_RECAP["Recap & Calculation"]
      LP_GRFG["GR Finish Good - SAP"]
      LP_BAKE --> LP_COOL --> LP_PKG --> LP_CART --> LP_RECAP --> LP_GRFG
    end
    subgraph QCPP["2.1.5 QC Plant Production"]
      QCPP_MIX["Check Mixing Process & BS"]
      QCPP_BAKE["Check Baking & Creaming, BS"]
      QCPP_COOL["Check Cooling & Cutting, BS"]
      QCPP_PKG["Check Packaging, BS"]
      QCPP_CART["Check Cartoning, BS"]
      QCPP_VIS["Visual & Condition Product\nCheck in Pallet"]
      QCPP_VERIF["Verification"]
      QCPP_MIX --> QCPP_BAKE --> QCPP_COOL --> QCPP_PKG --> QCPP_CART --> QCPP_VIS --> QCPP_VERIF
    end
  end

  subgraph FG["📦 Finish Good"]
    FGS["FG Staging"]
    FGR["FG Register - Ready to DC - SAP"]
    FGS -.-> FGR
  end

  subgraph QC["🔍 Quality Control"]
    QCI["QC Incoming Check"]
    IPQ1["In Process QC"]
    IPQ2["In Process QC"]
    QRL["Quality Released"]
    QCI --> IPQ1 --> IPQ2 --> QRL
  end

  %% PPIC to WH RMPM
  PPO -.->|WO, BOM, Batch ID| WH_WO
  MR --> WH_MATRES

  %% WH RMPM to processes
  WH_STAG -->|Material + WO| CON_MACH
  WH_STAG -->|Material + WO| MIX_MACH
  WH_QCB -.->|QC Pass| QCI

  %% Plant Supporting flow
  CON_CREAM -->|Cream to storage| MIX_MACH
  BS_SEND -->|Recycled BS| WH_STAG

  %% Plant Production flow
  MIX_CCP -->|Adonan to line| LP_BAKE
  LP_CART -->|Bad Stock| BS_WEIGH
  LP_GRFG -->|Finish Good| FGS

  %% QC connections
  CON_CREAM -.->|QC Pass Barcode| IPQ1
  QCPP_VERIF -.->|Result| IPQ2
  QCPS_VERIF -.->|Result| IPQ2
  FGR -.->|Notification| QRL

  %% Styling
  classDef wh fill:#6c3483,stroke:#a569bd,color:#fff
  classDef supporting fill:#1a5276,stroke:#2980b9,color:#fff
  classDef production fill:#145a32,stroke:#27ae60,color:#fff
  classDef qc fill:#4a235a,stroke:#8e44ad,color:#fff
  classDef fg fill:#784212,stroke:#d35400,color:#fff
  classDef ppic fill:#7d6608,stroke:#f1c40f,color:#fff

  class WH_WO,WH_GR,WH_MATRES,WH_STAG,WH_QCB wh
  class CON_MACH,CON_CREAM,BS_WEIGH,BS_GRIND,BS_WEIGHT2,BS_LABEL,BS_SEND,QCPS_VIS,QCPS_MD,QCPS_LBL,QCPS_DET,QCPS_MAT,QCPS_CRM,QCPS_VERIF supporting
  class MIX_MACH,MIX_CCP,LP_BAKE,LP_COOL,LP_PKG,LP_CART,LP_RECAP,LP_GRFG,QCPP_MIX,QCPP_BAKE,QCPP_COOL,QCPP_PKG,QCPP_CART,QCPP_VIS,QCPP_VERIF production
  class QCI,IPQ1,IPQ2,QRL qc
  class FGS,FGR fg
  class PPO,MR ppic
```

> **Legenda:** Garis putus-putus (`-.->`) = alur informasi/data. Garis solid (`-->`) = pergerakan fisik material atau alur proses.

---

### 2.1.1 Plant Supporting — Proses Conching

**Ringkasan Proses:** Pembuatan cream oleh tim Plant Supporting. Dipicu oleh Work Order PPIC. Material berasal dari WH RMPM dan Formulasi. Output berupa cream yang disimpan untuk proses Creaming oleh tim Plant Production.

**Kebutuhan Pengguna / Pain Point Saat Ini:**

| No | Kebutuhan Pengguna | Kondisi Saat Ini | Potensi Cakupan MES |
|:---|:---|:---|:---|
| 1 | Mengurangi/menghilangkan proses administrasi manual | Formulir kertas untuk reservasi material, BSTB, rekap harian, dan transfer S-Log | ✅ Akan didigitalisasi melalui eBR/eWI MES dan scan material |
| 2 | Melacak proses & aktivitas orang | Tidak ada pelacakan digital tentang siapa yang melakukan apa dan kapan | ✅ Record eksekusi MES dengan user, timestamp, shift |
| 3 | Serah terima transaksi yang jelas antar tim proses | Serah terima fisik dengan tanda tangan manual | ✅ Konfirmasi serah terima digital di MES |
| 4 | Action alert langsung ke tim tertentu jika diperlukan | Tidak ada peringatan otomatis; berbasis verbal atau WhatsApp | ✅ Notifikasi/routing alert MES |

---

### 2.1.2 Plant Production — Proses Mixing

**Ringkasan Proses:** Persiapan adonan oleh Plant Production. Dipicu oleh WO dari PPIC. Input dari WH RMPM dan Formulasi. Output berupa adonan untuk mesin baking di line processing.

**Kebutuhan Pengguna / Pain Point Saat Ini:**

| No | Kebutuhan Pengguna | Kondisi Saat Ini | Potensi Cakupan MES |
|:---|:---|:---|:---|
| 1 | Mengurangi/menghilangkan proses administrasi manual | Formulir kertas untuk pengecekan material, stock count, BSTB | ✅ Validasi scan MES dan record material digital |
| 2 | Melacak proses & aktivitas orang | Pencatatan manual CCP, OKP, BS | ✅ eBR MES dengan pelacakan operator |
| 3 | Serah terima transaksi yang jelas antar tim proses | Serah terima formulir manual ke line process | ✅ Status serah terima WIP digital |
| 4 | Action alert langsung ke tim tertentu jika diperlukan | Tidak ada peringatan otomatis | ✅ Notifikasi MES saat kekurangan material atau deviasi |

---

### 2.1.3 Plant Production — Line Processing & Packaging

**Ringkasan Proses:** Rangkaian langkah produksi berurutan: Baking → Creaming → Cooling & Cutting → Packaging → Cartoning. Input dari Mixing (adonan), cream storage (Plant Supporting), dan packaging material (WH RMPM). Output berupa Finish Good (cartoning) dan Bad Stock (reject).

**Kebutuhan Pengguna / Pain Point Saat Ini:**

| No | Kebutuhan Pengguna | Kondisi Saat Ini | Potensi Cakupan MES |
|:---|:---|:---|:---|
| 1 | Mengurangi/menghilangkan proses administrasi manual | Beberapa lembar kerja per shift per mesin | ✅ Terminal operator MES untuk input digital |
| 2 | Melacak proses & aktivitas orang | Pencatatan manual per langkah mesin | ✅ eBR MES / monitoring OEE per lini |
| 3 | Serah terima transaksi yang jelas antar tim proses | Lembar rekap diserahkan antar shift | ✅ Serah terima shift digital di MES |
| 4 | Action alert langsung ke tim tertentu jika diperlukan | Tidak ada peringatan real-time | ✅ Andon / alert berbasis event untuk downtime, NG, batch hold |
| 5 | Visibilitas performa proses produksi | Rekap harian via Excel, tidak real-time | ✅ Dashboard OEE real-time dan analytics produksi |

---

### 2.1.4 Plant Supporting — Bad Stock Collection & Recycling

**Ringkasan Proses:** Pengumpulan BS dari semua lini produksi, dipilah untuk scrap atau recycle. Output recycle BS dapat digunakan kembali dalam proses Conching di shift berikutnya.

**Kebutuhan Pengguna / Pain Point Saat Ini:**

| No | Kebutuhan Pengguna | Kondisi Saat Ini | Potensi Cakupan MES |
|:---|:---|:---|:---|
| 1 | Mengurangi/menghilangkan proses administrasi manual | Pencatatan berat manual per lini/shift, label BS kertas | ✅ Integrasi timbangan IoT + label BS digital |
| 2 | Serah terima transaksi yang jelas antar tim proses | Pengiriman BS fisik dengan formulir manual | ✅ Serah terima BS digital dan tautan recycle ke WO |

---

### 2.1.5 In Process Quality Control — Plant Production

**Ringkasan Proses:** Pengecekan QC di Mixing, Baking & Creaming, Cooling & Cutting, Packaging, Cartoning, dan evaluasi visual produk pada sampel pallet. Pemeriksaan dilakukan setiap 1 jam.

**Kebutuhan Pengguna / Pain Point Saat Ini:**

| No | Kebutuhan Pengguna | Kondisi Saat Ini | Potensi Cakupan MES |
|:---|:---|:---|:---|
| 1 | Mengurangi/menghilangkan proses administrasi manual | Data QC dicatat di formulir kertas, rekap via Excel per shift | ✅ Formulir inspeksi digital di MES per checkpoint |
| 2 | Action alert langsung ke tim tertentu terutama saat OOT ditemukan | Tidak ada peringatan otomatis; notifikasi verbal saja | ✅ Routing alert OOT/OOS ke supervisor/foreman |

---

### 2.1.6 In Process Quality Control — Plant Supporting

**Ringkasan Proses:** Pengecekan visual, kondisi material, metal detector/filter grinding, penentuan penggunaan BS recycle, pencatatan form, rekap, dan verifikasi akhir. Dilakukan setiap 1 jam.

**Kebutuhan Pengguna / Pain Point Saat Ini:**

| No | Kebutuhan Pengguna | Kondisi Saat Ini | Potensi Cakupan MES |
|:---|:---|:---|:---|
| 1 | Mengurangi/menghilangkan proses administrasi manual | Formulir kertas, rekap Excel harian/shift | ✅ Formulir IPQC digital di MES |
| 2 | Action alert langsung ke tim tertentu terutama saat OOT ditemukan | Tidak ada peringatan otomatis | ✅ Alert OOT ke tim terkait |

---

### 2.1.7 Quality Control — Incoming WH RMPM *(Nabati Internal Development)*

**Ringkasan Proses:** Sampling material yang masuk ke WH RMPM. Output berupa validasi standar kualitas material masuk.

> **Catatan:** Pengembangan sistem label dan aplikasi untuk area ini ditangani oleh tim internal Nabati. Ruang lingkup vendor terbatas pada kesiapan integrasi dan dukungan perangkat.

**Kebutuhan Pengguna / Pain Point Saat Ini:**

| No | Kebutuhan Pengguna | Kondisi Saat Ini | Potensi Cakupan MES |
|:---|:---|:---|:---|
| 1 | Mengurangi/menghilangkan proses administrasi manual | Verifikasi CoA manual, formulir inspeksi QC kertas, rekap Excel | 🔶 MES menyediakan QC gate dan status lot; pelabelan oleh internal Nabati |

---

*← Kembali ke [index.md](../index.md)*
