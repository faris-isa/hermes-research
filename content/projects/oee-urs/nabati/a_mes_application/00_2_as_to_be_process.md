---
title: "Nabati — Part A: Model Operasi To-Be"
description: "Model operasi To-Be untuk Nabati MES Ecosystem."
tags:
  - nabati
  - mes
  - urs
  - part-a
---

# Nabati MES Ecosystem — Part A: Model Operasi To-Be

**Referensi URS:** Bagian 3 — Model Operasi To-Be
**Ruang Lingkup:** PT KSNI Plant Majalengka, Gedung A Sektor 8

---

## 3.1 Gambaran Umum

Model to-be menempatkan MES sebagai lapisan kontrol eksekusi shopfloor antara SAP (referensi perencanaan/transaksi) dan proses produksi fisik. Pendekatan ini tidak hanya berfokus pada digitalisasi formulir, tetapi juga penguatan eksekusi manufaktur melalui keterhubungan antara order, material, proses, quality record, pengambilan data, dan visibilitas operasional.

Lapisan integrasi utama:
- **SAP** → Work Order, BOM, Batch ID, Reservasi Material
- **MES** → Kontrol eksekusi, eBR/eWI, IPQC, pelacakan material, analytics OEE
- **IoT / OT Gateway / DAQ** → Pengambilan data otomatis dari mesin dan sensor
- **Barcode Scan** → Identifikasi material, validasi tipping, keterlacakan FG

### Legenda Diagram

| Simbol | Keterangan |
|:---|:---|
| ⚡ | Auto by MES + IoT sensor |
| 📋 | Transaksi SAP |
| 🔄 | Aktivitas yang dipantau MES |
| 📧 | Notifikasi sistem |
| 🖨️ | Auto printed / labeling |

---

### Diagram Alur End-to-End To-Be

```mermaid
flowchart TD
  subgraph PPIC["🏢 PPIC"]
    PPO["📋 Production Planning Order"]
    MR["📋 Material Reservation"]
    PPO --> MR
  end

  subgraph WHRMPM["🏭 WH RMPM"]
    WH_WO["📋 H-1 WO Received from PPIC\nRPH & Stock Calculation"]
    WH_TASK["🔄 Create Task for Batch\n& Line Production"]
    WH_BATCH["WO & Batch ID Generated"]
    WH_CHKMAT["Check Premix Condition\n& Stock from WH/Formulation"]
    WH_BSTB["📋 BSTB Material Online\nfrom WH/Formulation\nGR Confirmed to SAP"]
    WH_CONF["📧 WH Receive Confirmation"]
    WH_STAG["Moving to Material Staging"]
    WH_WO --> WH_TASK --> WH_BATCH --> WH_CHKMAT --> WH_BSTB --> WH_CONF --> WH_STAG
  end

  subgraph MFGSUP["⚙️ Plant Supporting"]

    subgraph CON["3.1.1 Conching Process"]
      CON_SCAN["⚡ Scan RM Input in M/C Conching\nauto RM usage count"]
      CON_OPS["🔄 Conching Ops Activity"]
      CON_LACK{"📧 Material Lacking\nNotification?"}
      CON_MATRES["📋 Material Reservation\nto WH/Formulation"]
      CON_OKP["⚡ Input OKP + cream transaction\nfrom volumetric sensor"]
      CON_RPT["📋 Receive Report & Confirmation\nauto report to SAP shiftly"]
      CON_FINISH([Finish])
      CON_SCAN --> CON_OPS --> CON_LACK
      CON_LACK -->|No| CON_MATRES
      CON_LACK -->|Yes| CON_OKP
      CON_OKP --> CON_RPT --> CON_FINISH
    end

    subgraph BSC["3.1.4 BS Collection & Recycling"]
      BS_COLL["⚡ Collect & Input BS\nWeight Parameter\nauto input from automation"]
      BS_GIA["📋 GI & Deliver BS to GA"]
      BS_GIG["📋 GI & Deliver BS to Grinding"]
      BS_RECOPS["🔄 Recycle Ops Activity"]
      BS_CHKWT["⚡ Check & Input Recycle\nWeight Portion\nauto input from automation"]
      BS_IDENT["🖨️ Creation of Goods Identity\nStatus & Labeling\nauto printed for traceability"]
      BS_DELIVER["Deliver Recycle to Conching"]
      BS_RPT["🔄 Receive Report,\nTransaction & Confirmation"]
      BS_FINISH([Finish])
      BS_COLL --> BS_GIA
      BS_COLL --> BS_GIG
      BS_GIG -.-> BS_RECOPS --> BS_CHKWT --> BS_IDENT --> BS_DELIVER
      BS_IDENT --> BS_RPT --> BS_FINISH
    end

    subgraph QCPS["3.1.6 QC Plant Supporting"]
      QCPS_START(["WO & Batch ID Applied"])
      QCPS_RECYCLE["🔄 Check & Input Recycle\nCondition - metal & filter"]
      QCPS_IDENT["🖨️ Creation of Goods Identity\nStatus & Labeling\nauto printed for traceability"]
      QCPS_CONCH["🔄 Check, Scan & Input\nConching Incoming Material"]
      QCPS_CREAM["⚡ Check & Input Cream Condition\nauto input from automation"]
      QCPS_RPT["🔄 Receive Report\n& Confirmation"]
      QCPS_FINISH([Finish])
      QCPS_START --> QCPS_RECYCLE --> QCPS_IDENT
      QCPS_RECYCLE --> QCPS_CONCH --> QCPS_CREAM --> QCPS_RPT --> QCPS_FINISH
    end

  end

  subgraph MFGPROD["🏗️ Plant Production"]

    subgraph MIX["3.1.2 Mixing Process"]
      MIX_SCAN["⚡ Scan RM Input in M/C Mixer\nauto RM usage count"]
      MIX_OPS["🔄 Mixing Operation Activity\nMonitored by MES"]
      MIX_LACK{"📧 Material Lacking\nNotification?"}
      MIX_MATRES["📋 Material Reservation\nto WH/Formulation"]
      MIX_OKP["⚡ Input OKP BS etc\nauto input from automation"]
      MIX_LINE["Line Process"]
      MIX_RPT["🔄 Receive Report\n& Confirmation"]
      MIX_FINISH([Finish])
      MIX_SCAN --> MIX_OPS --> MIX_LACK
      MIX_LACK -->|No| MIX_MATRES
      MIX_LACK -->|Yes| MIX_OKP
      MIX_OKP --> MIX_LINE
      MIX_OKP --> MIX_RPT --> MIX_FINISH
    end

    subgraph LP["3.1.3 Line Processing & Packaging"]
      LP_START(["WO & Batch ID Applied"])
      LP_OPS["🔄 Processing & Packaging\nOps Activity"]
      LP_QC["🔄 Receive Correction Action\nfrom QC Sampling"]
      LP_CART["⚡ Cartoning Ops Activity\nauto count FG for WO close"]
      LP_OKP["⚡ Input OKP BS, usage etc\nauto input from automation\nincluding transaction"]
      LP_TGTACH{"📧 Target Achieved\nNotification?"}
      LP_MORE["📋 PPIC Add Total WO\nfor More Target Achieved"]
      LP_LESS["📋 PPIC Revise RPH/WO\nfor Less Target Achieved"]
      LP_MIXBACK["Mixing Process"]
      LP_RPT["📋 Receive Report & Confirmation\nauto report to SAP shiftly"]
      LP_FINISH([Finish])
      LP_START --> LP_OPS
      LP_OPS --> LP_QC --> LP_CART
      LP_OPS --> LP_OKP --> LP_TGTACH
      LP_CART --> LP_OKP
      LP_TGTACH -->|Achieved| LP_RPT --> LP_FINISH
      LP_TGTACH -->|More| LP_MORE --> LP_RPT
      LP_TGTACH -->|Less| LP_LESS --> LP_MIXBACK
    end

    subgraph QCPP["3.1.5 QC Plant Production"]
      QCPP_START(["WO & Batch ID Applied"])
      QCPP_MIX["⚡ Check & Input Mixing Parameter\nauto input from automation"]
      QCPP_MIXBS["🔄 Check & Input Mixing BS"]
      QCPP_BAKE["⚡ Check & Input Baking Creaming\nParameter - auto input"]
      QCPP_BAKEBS["🔄 Check & Input Baking\nCreaming BS"]
      QCPP_SHT["⚡ Check & Input Sheet Book\nWeight - auto input"]
      QCPP_COOL["⚡ Check & Input Cooling Cutting\nParameter - auto input"]
      QCPP_COOLBS["🔄 Check & Input Cutting BS"]
      QCPP_PKG["⚡ Check & Input Packaging\nCartoning Parameter"]
      QCPP_PKGBS["🔄 Check & Input Packaging\nCartoning BS"]
      QCPP_FGW["⚡ Check & Input FG Weight\nauto input from automation"]
      QCPP_VIS["🔄 Physical Check & Input\nProduct on Palette Condition"]
      QCPP_RPT["🔄 Receive Report\n& Confirmation"]
      QCPP_FINISH([Finish])
      QCPP_START --> QCPP_MIX --> QCPP_MIXBS
      QCPP_MIX --> QCPP_BAKE --> QCPP_BAKEBS --> QCPP_SHT
      QCPP_BAKE --> QCPP_COOL --> QCPP_COOLBS
      QCPP_COOL --> QCPP_PKG --> QCPP_PKGBS --> QCPP_FGW
      QCPP_PKG --> QCPP_VIS --> QCPP_RPT --> QCPP_FINISH
    end

  end

  subgraph FG["📦 Finish Good"]
    FGS["FG Staging"]
    FGR["📋 FG Register - Ready to DC"]
    FGS -.-> FGR
  end

  subgraph QC["🔍 Quality Control"]
    QCI["🔄 QC Incoming Check"]
    IPQ1["🔄 In Process QC"]
    IPQ2["🔄 In Process QC"]
    QRL["🔄 Quality Released"]
    QCI --> IPQ1 --> IPQ2 --> QRL
  end

  %% PPIC to WH RMPM
  PPO -.->|WO, BOM, Batch ID| WH_WO
  MR --> WH_BSTB

  %% WH RMPM to processes
  WH_STAG -->|Material + WO| CON_SCAN
  WH_STAG -->|Material + WO| MIX_SCAN
  WH_STAG -.->|QC Pass Barcode| QCI

  %% Plant Supporting internal
  BS_DELIVER -->|Recycled BS| CON_OPS
  CON_OKP -->|Cream to Line| MIX_LINE

  %% Plant Production internal
  MIX_LINE --> LP_START
  LP_OPS -->|Bad Stock| BS_COLL
  LP_CART -->|Finish Good| FGS

  %% QC connections
  QCPP_RPT -.->|Result| IPQ1
  QCPS_RPT -.->|Result| IPQ2
  FGR -.->|Notification| QRL

  %% Styling by action type
  classDef auto fill:#1a5276,stroke:#3498db,color:#fff
  classDef sap fill:#784212,stroke:#e67e22,color:#fff
  classDef monitored fill:#145a32,stroke:#27ae60,color:#fff
  classDef notify fill:#4a235a,stroke:#9b59b6,color:#fff
  classDef printed fill:#2c3e50,stroke:#95a5a6,color:#fff
  classDef wh fill:#6c3483,stroke:#a569bd,color:#fff
  classDef ppic fill:#7d6608,stroke:#f1c40f,color:#fff
  classDef qc fill:#4a235a,stroke:#8e44ad,color:#fff
  classDef fg fill:#784212,stroke:#d35400,color:#fff

  class CON_SCAN,CON_OKP,BS_COLL,BS_CHKWT,MIX_SCAN,MIX_OKP,LP_CART,LP_OKP,QCPP_MIX,QCPP_BAKE,QCPP_SHT,QCPP_COOL,QCPP_PKG,QCPP_FGW,QCPS_CREAM auto
  class PPO,MR,WH_WO,WH_BSTB,CON_MATRES,CON_RPT,BS_GIA,BS_GIG,MIX_MATRES,LP_MORE,LP_LESS,LP_RPT,FGR sap
  class WH_TASK,CON_OPS,BS_RECOPS,BS_RPT,QCPS_RECYCLE,QCPS_CONCH,QCPS_RPT,MIX_OPS,MIX_RPT,LP_OPS,LP_QC,QCPP_MIXBS,QCPP_BAKEBS,QCPP_COOLBS,QCPP_PKGBS,QCPP_VIS,QCPP_RPT,QCI,IPQ1,IPQ2,QRL monitored
  class WH_CONF,CON_LACK,MIX_LACK,LP_TGTACH notify
  class BS_IDENT,QCPS_IDENT printed
  class WH_WO,WH_TASK,WH_BATCH,WH_CHKMAT,WH_BSTB,WH_CONF,WH_STAG wh
  class FGS,FGR fg
```

> **Legenda alur:** Garis putus-putus (`-.->`) = alur informasi/data/notifikasi. Garis solid (`-->`) = pergerakan fisik material atau alur proses utama.

---

## 3.2 Kapabilitas Sistem To-Be per Area Proses

Bagian ini merangkum apa yang diperoleh sistem MES di setiap area proses sebagai hasil implementasi to-be.

---

### 3.2.1 Plant Supporting — Proses Conching

**Ringkasan To-Be:** WO diterima H-1 dari SAP ke MES. MES membuat batch ID dan task untuk line produksi. Operator scan input RM ke mesin conching; jumlah pemakaian otomatis tersimpan real-time. Output cream dengan sensor volumetrik auto-input ke line process. Kekurangan material memicu notifikasi MES dan reservasi SAP. Akhir shift: laporan otomatis dan konfirmasi SAP.

| ID | Kapabilitas Sistem |
|:---:|:---|
| **1** | Sistem dapat menerima Work Order beserta perhitungan RPH & Stock secara otomatis |
| **2** | Sistem dapat membuat Batch ID secara otomatis |
| **3** | Sistem memberikan notifikasi saat material kurang |
| **4** | Sistem mencatat pemakaian RM secara real-time melalui scan barcode |
| **5** | Sistem auto-capture transaksi cream via sensor volumetrik |
| **6** | Sistem membuat laporan shift dan konfirmasi otomatis ke SAP |

---

### 3.2.2 Plant Production — Proses Mixing

**Ringkasan To-Be:** Alur WO H-1 sama seperti Conching. MES membuat job per batch dan lini. Operator scan RM per hopper. Operasi mixing dipantau oleh MES. Auto input dari otomasi jika tersedia. Notifikasi kekurangan material memicu reservasi SAP. Konfirmasi shift dilaporkan otomatis.

| ID | Kapabilitas Sistem |
|:---:|:---|
| **1** | Sistem dapat menerima Work Order beserta perhitungan RPH & Stock secara otomatis |
| **2** | Sistem dapat membuat Batch ID secara otomatis |
| **3** | Sistem memberikan notifikasi saat material kurang |
| **4** | Sistem mencatat pemakaian RM per hopper secara real-time melalui scan barcode |
| **5** | Sistem memantau aktivitas operasi mixing secara real-time |
| **6** | Sistem auto-input OKP, BS, dll. dari otomasi |
| **7** | Sistem membuat laporan shift dan konfirmasi otomatis |

---

### 3.2.3 Plant Production — Line Processing & Packaging

**Ringkasan To-Be:** WO dan batch ID diterapkan di awal. Aktivitas operasi Processing & Packaging dicatat. Auto input dari otomasi (OKP, BS, pemakaian, transaksi). Operasi cartoning dengan auto hitung FG untuk penutupan WO. Notifikasi pencapaian target memicu tindakan PPIC. Laporan SAP otomatis akhir shift.

| ID | Kapabilitas Sistem |
|:---:|:---|
| **1** | Sistem menerapkan WO & Batch ID di awal proses |
| **2** | Sistem mencatat seluruh aktivitas operasi Processing & Packaging |
| **3** | Sistem auto-capture OKP, BS, pemakaian, dan transaksi dari otomasi |
| **4** | Sistem menerima dan mencatat tindakan koreksi dari QC sampling |
| **5** | Sistem auto-hitung FG di operasi cartoning untuk penutupan WO |
| **6** | Sistem memberikan notifikasi pencapaian target; Lebih → PPIC tambah WO; Kurang → PPIC revisi RPH |
| **7** | Sistem membuat laporan shift dan auto report ke SAP |

---

### 3.2.4 Plant Supporting — BS & Recycling

**Ringkasan To-Be:** WO dan batch ID diterapkan. Berat BS auto-ditangkap via IoT. Parameter recycle dicek dan diinput dengan auto input dari otomasi. Identitas barang, status, dan pelabelan oleh QC, dicetak otomatis untuk keterlacakan. Kirim recycle ke Conching dengan tautan MES.

| ID | Kapabilitas Sistem |
|:---:|:---|
| **1** | Sistem auto-capture berat BS dari timbangan IoT |
| **2** | Sistem mencatat GI BS ke GA dan ke grinding |
| **3** | Sistem auto-capture parameter recycle dari otomasi |
| **4** | Sistem mencetak label identitas barang otomatis untuk keterlacakan |
| **5** | Sistem menghubungkan recycle BS ke WO Conching penerima |
| **6** | Sistem membuat laporan transaksi & konfirmasi |

---

### 3.2.5 In Process Quality Control — Plant Production

**Ringkasan To-Be:** QC terhubung ke WO & batch ID. Semua checkpoint didigitalisasi di MES. Auto input dari otomasi jika tersedia (berat, sensor). Input manual untuk organoleptik dan pengecekan visual.

| ID | Kapabilitas Sistem |
|:---:|:---|
| **1** | Sistem auto-input parameter mixing dari otomasi |
| **2** | Sistem auto-input parameter baking & creaming dari otomasi |
| **3** | Sistem auto-input berat sheet book dari otomasi |
| **4** | Sistem auto-input parameter cooling & cutting dari otomasi |
| **5** | Sistem auto-input parameter packaging & cartoning dari otomasi |
| **6** | Sistem auto-input berat FG dari otomasi |
| **7** | Sistem mendukung input manual untuk pengecekan fisik produk di pallet |
| **8** | Sistem membuat laporan & konfirmasi QC |

| Checkpoint | Parameter | Metode Capture |
|:---|:---|:---|
| Mixing | Parameter mixing, BS | ⚡ Auto IoT + 🔄 manual |
| Baking & Creaming | Parameter baking/creaming, BS, berat sheet book | ⚡ Auto IoT + 🔄 manual |
| Cooling & Cutting | Parameter cooling/cutting, BS | ⚡ Auto IoT + 🔄 manual |
| Packaging | Parameter packaging/cartoning, BS | ⚡ Auto IoT + 🔄 manual |
| Cartoning | Parameter cartoning, BS | ⚡ Auto IoT + 🔄 manual |
| Sampel pallet | Pengecekan fisik, kondisi produk pada pallet | 🔄 Input manual |
| Berat FG | Berat FG per karton | ⚡ Auto (counter/timbangan) |

---

### 3.2.6 In Process Quality Control — Plant Supporting

| ID | Kapabilitas Sistem |
|:---:|:---|
| **1** | Sistem mencatat pengecekan kondisi recycle (metal & filter) |
| **2** | Sistem mencetak label identitas barang otomatis untuk keterlacakan |
| **3** | Sistem mendukung scan & input material incoming conching |
| **4** | Sistem auto-input kondisi cream dari otomasi |
| **5** | Sistem membuat laporan & konfirmasi |

| Checkpoint | Parameter | Metode Capture |
|:---|:---|:---|
| Kondisi BS recycle | Kondisi metal & filter | 🔄 Input manual |
| Incoming conching | Scan & input material incoming conching | 🔄 Manual + scan barcode |
| Kondisi cream | Kondisi cream auto input dari otomasi | ⚡ Auto dari IoT |
| Identitas barang | Status & pelabelan, dicetak otomatis untuk keterlacakan | 🖨️ Cetak otomatis MES |

---

### 3.2.7 Quality Control — Incoming WH RMPM *(Nabati Internal Development)*

> **Catatan:** Pengembangan sistem label dan aplikasi untuk area ini ditangani oleh tim internal Nabati. Ruang lingkup vendor terbatas pada kesiapan integrasi dan dukungan perangkat.

| ID | Kapabilitas Sistem |
|:---:|:---|
| **1** | Sistem mendukung input verifikasi DO dengan CoA & inspeksi |
| **2** | Sistem auto-input sampling & penimbangan material dari otomasi |
| **3** | Sistem mencetak label identitas barang, status & lot otomatis |
| **4** | Sistem mengirimkan notifikasi status kualitas material yang diterima WH RMPM |

---

## 3.3 Ringkasan Alur Data MES–SAP

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

*← Kembali ke [index.md](../index.md)*
