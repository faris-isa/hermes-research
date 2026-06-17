---
title: "Nabati — Part B: Data Capture & Shopfloor"
description: "Kebutuhan Pengambilan Data & Perangkat Shopfloor (DSA, ACQ, DVC, DAT)."
tags:
  - nabati
  - mes
  - urs
  - part-b
---

# Nabati MES Ecosystem (Part B) - Part 9: Data Capture & Shopfloor Devices

## 4.2 Data Capture, Interface & Shopfloor Device Requirements
Bagian ini mendefinisikan fungsionalitas akuisisi data otomatis dari sinyal elektrik mesin (*OT Signal*) dan integrasi perangkat fisik yang ada di lantai produksi.

### 4.2.1 Data Point & Capture Assessment

| ID | Requirement | Our Solution | Explanation |
| :--- | :--- | :--- | :--- |
| **DSA-01** | Vendor harus melakukan assessment sumber data existing per area, termasuk PLC/panel mesin, sinyal mesin, sensor, weighing scale, counter, scanner, printer, tablet/terminal, dan manual record. | | |
| **DSA-02** | Vendor harus menyediakan data point list yang menjelaskan nama data, area/proses, sumber data, tujuan penggunaan, capture method, frequency, format, UoM, dan dependency teknis. | | |
| **DSA-03** | Vendor harus mengklasifikasikan metode capture untuk setiap data point sebagai automatic capture, semi-automatic capture, digital manual input, atau not feasible pada tahap awal. | | |
| **DSA-04** | Vendor harus mengidentifikasi data source yang membutuhkan retrofit, tambahan interface, signal tapping, remote DAQ/I/O, sensor tambahan, temporary device, atau fallback manual input. | | |
| **DSA-05** | Vendor harus mengklasifikasikan connectivity path setiap device/data source, seperti direct existing network, remote I/O &rarr; gateway &rarr; network, direct PLC TCP/IP &rarr; gateway &rarr; network, atau cloud/SaaS path jika disepakati. | | |
| **DSA-06** | Vendor sebaiknya memberikan prioritas data capture berdasarkan operational impact, technical feasibility, implementation effort, dan relevansi terhadap Production, Inventory, dan IPQC. | | |
| **DSA-07** | Vendor harus menjelaskan target data landing untuk setiap device/data source, termasuk apakah data masuk ke transactional database, software historian, MES (MES Ecosystem Part A) application database, SAP/API interface, atau kombinasi. | | |

### 4.2.2 Signal Acquisition & Instrument Interface

| ID | Requirement | Our Solution | Explanation |
| :--- | :--- | :--- | :--- |
| **ACQ-01** | Data capture layer harus dapat menerima sinyal dari PLC/panel mesin, remote DAQ/I/O, dry contact, sensor, counter, weighing scale, scanner, printer, terminal, atau device lain sesuai scope. | | |
| **ACQ-02** | Vendor harus menjelaskan metode/protokol interface yang digunakan, seperti MQTT, Modbus, OPC-UA, RS-232/RS-485, Ethernet, Wi-Fi/LAN, dry contact, API, file exchange, atau metode lain yang disepakati. | | |
| **ACQ-03** | Integrasi sinyal dari mesin/panel existing harus bersifat non-intrusive sejauh memungkinkan dan tidak boleh mengganggu fungsi kontrol, safety interlock, recipe control, atau operasi mesin existing. | | |
| **ACQ-04** | Jika PLC/mesin dapat diakses secara aman, data dapat ditarik langsung melalui TCP/IP atau protokol yang disepakati ke gateway tanpa remote I/O. | | |
| **ACQ-05** | Jika PLC locked atau akses terbatas, vendor harus menggunakan remote DAQ/I/O, signal tapping, atau metode alternatif yang aman. | | |
| **ACQ-06** | Vendor harus menjelaskan kebutuhan signal conditioning, converter, isolator, serial-to-Ethernet gateway, I/O module, sensor mounting, atau accessories lain jika dibutuhkan untuk akuisisi data. | | |
| **ACQ-07** | Instrument seperti weighing scale, level sensor, flowmeter, counter/scanner, atau sensor lain harus memiliki metode pembacaan, satuan data, akurasi, calibration requirement, dan interface yang jelas. | | |
| **ACQ-08** | Vendor sebaiknya mengusulkan standard interface/device yang scalable dan reusable untuk rollout ke line, area, atau plant lain. | | |
| **ACQ-09** | Vendor harus menjelaskan mekanisme transfer data dari gateway/edge/device menuju target data landing, termasuk topic/API/table/file format, timestamp handling, retry, and error handling jika relevan. | | |

---
 
## 4.2.3 Perangkat Input, Scanning & Printing Shopfloor
 
| ID | Kebutuhan | Solusi Kami | Penjelasan |
|:---|:---|:---|:---|
| **DVC-01** | Perangkat shopfloor harus mendukung digital input untuk aktivitas yang disepakati, seperti material tipping, QC inspection, downtime entry, handover, BS/recycle recording, dan FG/label event. | | |
| **DVC-02** | Perangkat input dapat berupa stationary tablet with integrated scanner, HMI terminal, panel PC, rugged tablet, handheld terminal, atau workstation sesuai kebutuhan area dan kondisi lingkungan. | | |
| **DVC-03** | Perangkat input, HMI/terminal, tablet, scanner, dan printer dapat terhubung langsung ke existing IT network, termasuk Wi-Fi/LAN yang tersedia, sehingga dapat digunakan secara mobile atau tanpa gateway jika tidak membutuhkan akuisisi sinyal OT. | | |
| **DVC-04** | Scanner/barcode/QR device harus mendukung identifikasi material, staging/tipping, handover, WIP/SFG, BS/recycle, FG/carton/pallet, dan traceability sesuai scope proses. | | |
| **DVC-05** | Printer/labeling device harus mendukung kebutuhan label/document printing untuk RM, SFG/WIP, BS/recycle, FG, incoming QC/RMPM document, atau kebutuhan lain sesuai desain label, dengan koneksi via existing IT network jika feasible. | | |
| **DVC-06** | Device untuk QC inspector harus mendukung input inspection result, parameter check, evidence entry, status release/hold/reject, dan verifikasi sesuai proses QC yang disepakati. | | |
| **DVC-07** | Perangkat shopfloor harus mempertimbangkan ergonomi, mounting, charging/power, cleaning, protection, akses user, dan visibility di area kerja. | | |
| **DVC-08** | Visual display untuk line status, alarm, OEE/performance, atau operational visibility dapat digunakan jika dibutuhkan pada area tertentu. | | |
 
---
 
## 4.2.4 Antarmuka Data, Validasi & Fallback
 
| ID | Kebutuhan | Solusi Kami | Penjelasan |
|:---|:---|:---|:---|
| **DAT-01** | Setiap data hasil capture harus memiliki timestamp, source/device ID, process area, dan referensi proses/material/WO/batch jika relevan. | | |
| **DAT-02** | Data dari automatic, semi-automatic, dan manual input harus dapat dibedakan agar kualitas data dan level automation dapat ditelusuri. | | |
| **DAT-03** | Data manual harus traceable berdasarkan user, waktu input, area, device, dan referensi proses terkait. | | |
| **DAT-04** | Interface data harus mendukung validasi dasar seperti mandatory field, dropdown/master data reference, range/spec check, duplicate check, dan status confirmation jika relevan. | | |
| **DAT-05** | Data capture layer harus memiliki fallback dan/atau local buffering di gateway/edge/local runtime jika automatic capture belum tersedia, koneksi IT/Wi-Fi terganggu, cloud/SaaS connection belum reachable, atau target database/historian belum reachable. | | |
| **DAT-06** | Vendor harus menjelaskan rule handling untuk missing data, invalid data, duplicated data, delayed data, re-send/retry mechanism, dan manual override. | | |
| **DAT-07** | Data status indicator seperti captured, edited, estimated, pending confirmation, synchronized, failed, atau manual override sebaiknya tersedia jika relevan. | | |
| **DAT-08** | Data dari perangkat Part C harus memiliki mapping ke target penyimpanan yang disepakati, minimal apakah masuk ke transactional database, software historian, MES application database (MES Ecosystem Part A), SAP/API interface, atau kombinasi. | | |
 
---
 
## Referensi Bill of Material Sensor & Digitisasi per Area (dari URS 3.6.2)
 
### C1 — Sensor & Digitisasi: Plant Supporting Conching
 
| No Item | Nama Item | Deskripsi | Merek Preferensi | Qty | UoM |
|:---|:---|:---|:---|:---:|:---|
| PSI-CON.01 | Integrasi Process Monitoring | Remote DAQ/I/O untuk mesin conching, sinyal flowmeter, dan data level storage tank. Mendukung DI/DO + RS-485 + AI/AO. | Advantech WISE, Moxa ioLogik | 5 | Unit |
| PSI-CON.02 | Operator Stationary Material Input | Tablet operator fixed-mounted di dekat hopper untuk konfirmasi tipping material dan input MES. | Zebra ET, Honeywell RT, Advantech AIM | 2 | Unit |
| PSI-CON.03 | Material Input Integrated Scanner | Handheld untuk validasi barcode RM dari label kantong material. | Zebra Handheld DS, Unitech MS Scanner | 2 | Unit |
| PSI-CON.04 | Foreman Input & Monitor Tablet | Tablet rugged untuk input foreman, monitoring, status WO/batch, dan follow-up issue. | Zebra ET, Honeywell RT, Advantech AIM | 1 | Unit |
| PSI-CON.05 | Inspector Input & Monitor Tablet | Tablet rugged untuk input dan monitoring inspector/QC. | Zebra ET, Honeywell RT, Advantech AIM | 1 | Unit |
| PSI-CON.06 | Cream / Tank Level Sensor | Capture level cream tank/storage untuk keterlacakan material dan rekonsiliasi inventori. | Endress+Hauser Micropilot FMR, Honeywell SLN, APG TRUE ECHO | 2 | Unit |
| PSI-CON.07 | Kabel & Aksesori — Bulk | Kabel bulk dan aksesori kecil untuk integrasi sensor/DAQ/terminal Conching. | — | 1 | Lot |
 
### C2 — Sensor & Digitisasi: Plant Production Mixing
 
| No Item | Nama Item | Deskripsi | Merek Preferensi | Qty | UoM |
|:---|:---|:---|:---|:---:|:---|
| PSI-MIX.01 | Integrasi Process Monitoring | Remote DAQ/I/O untuk sinyal start/stop/status/fault/counter mixer. | Advantech WISE, Moxa ioLogik | 1 | Unit |
| PSI-MIX.02 | Operator Stationary Material Input | Tablet operator fixed-mounted di dekat hopper untuk konfirmasi tipping material dan input MES. | Zebra ET, Honeywell RT, Advantech AIM | 4 | Unit |
| PSI-MIX.03 | Material Input Integrated Scanner | Handheld untuk validasi barcode RM dari label kantong material. | Zebra Handheld DS, Unitech MS Scanner | 4 | Unit |
| PSI-MIX.04 | Foreman Input & Monitor Tablet | Tablet rugged untuk input foreman, monitoring, status WO/batch, dan follow-up issue. | Zebra ET, Honeywell RT, Advantech AIM | 1 | Unit |
| PSI-MIX.05 | Inspector Input & Monitor Tablet | Tablet rugged untuk input dan monitoring inspector/QC. | Zebra ET, Honeywell RT, Advantech AIM | 1 | Unit |
| PSI-MIX.06 | Kabel & Aksesori — Bulk | Kabel bulk dan aksesori kecil untuk integrasi sensor/DAQ/terminal Mixing. | — | 1 | Lot |
 
### C3 — Sensor & Digitisasi: Plant Production Processing
 
| No Item | Nama Item | Deskripsi | Merek Preferensi | Qty | UoM |
|:---|:---|:---|:---|:---:|:---|
| PSI-PRO.01 | Integrasi Process Monitoring | Remote DAQ/I/O untuk sinyal creaming dan proses relevan lainnya; antarmuka PLC baking divalidasi terpisah. | Advantech WISE/ADAM, Moxa ioLogik | 4 | Unit |
| PSI-PRO.02 | Operator Stationary Input Terminal | Terminal operator fixed untuk input data processing, entry DT, status WO/batch, dan guided execution. | Zebra ET, Honeywell RT, Advantech AIM | 1 | Unit |
| PSI-PRO.03 | Inspector Input & Monitor Tablet | Tablet rugged untuk input dan monitoring inspector/QC parameter processing. | Zebra ET, Honeywell RT, Advantech AIM | 1 | Unit |
| PSI-PRO.04 | Hopper Cream Level Sensor | Capture level cream hopper / konsumsi cream untuk keterlacakan material dan rekonsiliasi. | Endress+Hauser Micropilot FMR, Honeywell SLN, APG TRUE ECHO | 4 | Unit |
| PSI-PRO.05 | Kabel & Aksesori — Bulk | Kabel bulk dan aksesori kecil untuk integrasi sensor/DAQ/terminal Processing. | — | 1 | Lot |
 
### C4 — Sensor & Digitisasi: Packaging & Plant FG
 
| No Item | Nama Item | Deskripsi | Merek Preferensi | Qty | UoM |
|:---|:---|:---|:---|:---:|:---|
| PSI-PFG.01 | Integrasi Process Monitoring Primary Pack | Remote DAQ/I/O untuk mesin primary packaging dan sinyal Andon/counter. | Advantech ADAM, Moxa ioLogik | 12 | Unit |
| PSI-PFG.02 | Integrasi Process Monitoring Cartoning & FG | Remote DAQ/I/O untuk mesin cartoning dan counter FG/palletizing. | Advantech EKI, Moxa NPort IA | 2 | Unit |
| PSI-PFG.03 | Carton Counter Sensor / Scanner | Counter atau fixed scan input untuk output karton dan keterlacakan FG. | Zebra DS, Datalogic Gryphon, Newland FM430 | 2 | Unit |
| PSI-PFG.04 | Foreman Input & Monitor Tablet | Tablet rugged untuk input dan monitoring foreman di area Packaging & FG. | Zebra ET, Honeywell RT, Advantech AIM | 1 | Unit |
| PSI-PFG.05 | Inspector Input & Monitor Tablet | Tablet rugged untuk input dan monitoring inspector/QC di area Packaging & FG. | Zebra ET, Honeywell RT, Advantech AIM | 1 | Unit |
| PSI-PFG.06 | Kabel & Aksesori — Bulk | Kabel bulk dan aksesori kecil untuk integrasi sensor/DAQ/terminal Packaging & FG. | — | 1 | Lot |
 
### C5 — Sensor & Digitisasi: Plant Supporting BS & Recycle
 
| No Item | Nama Item | Deskripsi | Merek Preferensi | Qty | UoM |
|:---|:---|:---|:---|:---:|:---|
| PSI-BSR.01 | BS Weigher IoT System | Integrasi RS-232/RS-485 atau Ethernet untuk capture data timbangan BS ke jaringan Nabati dengan monitoring lokal. | Advantech Wise Wireless, Moxa NPort IA | 2 | Unit |
| PSI-BSR.02 | Batch Labelling System | Thermal printer + stok label/ribbon untuk label recycle BS (lini, shift, jenis material/recycle). | Zebra ZD, Brother TD, Bixolon XM7 | 1 | Lot |
| PSI-BSR.03 | Kabel & Aksesori — Bulk | Kabel bulk dan aksesori kecil untuk integrasi timbangan/labeler/terminal BS & Recycle. | — | 1 | Lot |
 
### C6 — Sensor & Digitisasi: Incoming QC RMPM *(Nabati Internal Development)*
 
| No Item | Nama Item | Deskripsi | Merek Preferensi | Qty | UoM |
|:---|:---|:---|:---|:---:|:---|
| PSI-IQC.01 | Incoming QC Document & Label Printing System | Thermal printer untuk dokumen dan label incoming QC/RMPM. Terhubung langsung ke IT network; tidak membutuhkan OT gateway. | Zebra ZD, Brother TD, Bixolon XM7 | 1 | Lot |
| PSI-IQC.02 | Inspector Input & Monitor Tablet | Tablet rugged untuk input dan monitoring inspector incoming QC. Terhubung langsung ke IT network. | Zebra ET, Honeywell RT, Advantech AIM | 1 | Unit |
| PSI-IQC.03 | Kabel & Aksesori Lokal — Bulk | IT drop lokal dan aksesori kecil untuk charging/mounting printer/tablet di Incoming QC RMPM. | — | 1 | Lot |
 
---
 
*← Kembali ke [index.md](../index.md)*
