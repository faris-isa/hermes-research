---
title: "Nabati — Part B: Infrastructure & Data Platform"
description: "Kebutuhan Infrastruktur OT, Platform Data & Historian (INF + DBH)."
tags:
  - nabati
  - mes
  - urs
  - part-b
---

# Nabati MES Ecosystem (Part B) - Part 7: Infrastructure & Data Platform

## 4.1 Infrastructure, OT Deployment, Data Platform & Connectivity Requirements
Bagian ini mendefinisikan kebutuhan infrastruktur, penempatan panel OT, jaringan pabrik, serta platform data bersama (*Common Plant Data Platform*) seperti database transaksional dan software historian.

### 4.1.1 Infrastructure, OT Panel & Shopfloor Environment

| ID | Requirement | Our Solution | Explanation |
| :--- | :--- | :--- | :--- |
| **INF-01** | Vendor harus mengusulkan infrastructure design berdasarkan deployment model MES (MES Ecosystem Part A) yang disepakati, termasuk common plant server/edge runtime, historian/cache, transactional database, software historian, gateway, network, dan shopfloor device. | | |
| **INF-02** | Common Plant Infrastructure harus dapat berfungsi sebagai local app server (MES Ecosystem Part A) jika dibutuhkan, edge integration runtime, short-term historian/cache, buffering layer, transactional data layer, atau secure gateway ke cloud/SaaS. | | |
| **INF-03** | Vendor harus menjelaskan kebutuhan local historian/cache, termasuk jenis data yang disimpan, retention period, data granularity, buffering saat koneksi terganggu, dan sinkronisasi ke MES/SAP. | | |
| **INF-04** | Infrastruktur harus mencakup rack/cabinet, PDU, cable management, grounding, airflow/cooling provision, UPS, dan controlled shutdown jika server/local edge digunakan. | | |
| **INF-05** | Infrastruktur OT harus mendukung gateway, managed switch, remote DAQ/I/O, industrial cabling, terminal/printer/scanner connection, spare port, dan power management sesuai kebutuhan area. | | |
| **INF-06** | Setiap enclosure shopfloor harus menggunakan industrial cabinet dengan proteksi lingkungan yang sesuai, minimal mempertimbangkan dust, humidity, washdown risk, vibration, dan temperature area. | | |
| **INF-07** | Enclosure harus memiliki thermal management sesuai kondisi area, seperti ventilation fan, filter, heat dissipation, atau cabinet air conditioner jika area panas seperti Processing membutuhkan. | | |
| **INF-08** | Enclosure harus mencakup power management yang memadai, termasuk MCB/fuse, surge protection jika diperlukan, grounding, power supply, terminal block, dan cable gland/accessory. | | |
| **INF-09** | Perangkat kritikal seperti server, gateway, switch, terminal, printer, atau DAQ sebaiknya dilindungi UPS atau backup power dengan runtime yang disepakati untuk mencegah data loss saat power interruption. | | |
| **INF-10** | Vendor harus menjelaskan installation requirement per area, termasuk mounting, panel location, cable route, segregation power/data cable, safety access, dan maintenance accessibility. | | |
| **INF-11** | Vendor harus memastikan setiap gateway, DAQ, sensor, instrument, scanner, printer, tablet, dan shopfloor device yang dipasang memiliki required software, firmware, driver, runtime, connector, dan protocol license yang valid untuk mendukung commissioning dan operasi sesuai scope. | | |

---
 
## 4.1.2 Kebutuhan Platform Data Plant, Database Transaksional & Software Historian
 
| ID | Kebutuhan | Solusi Kami | Penjelasan |
|:---|:---|:---|:---|
| **DBH-01** | Vendor harus mengusulkan common plant data platform sebagai data landing layer untuk data dari gateway, DAQ/I/O, sensor, scanner, printer, tablet, IoT device, dan shopfloor interface lain yang masuk scope. | | |
| **DBH-02** | Vendor harus menyediakan atau mengusulkan transactional database layer untuk menyimpan data transaksi/event MES Ecosystem seperti device event, scan event, label event, material movement evidence, execution status, QC status, handover record, integration staging, dan audit-related reference jika in-scope. | | |
| **DBH-03** | Baseline transactional database yang diharapkan adalah PostgreSQL-compatible database. Jika vendor mengusulkan teknologi database lain, vendor harus menjelaskan justifikasi, compatibility, data access, backup/restore, export mechanism, dan long-term maintainability. | | |
| **DBH-04** | Vendor harus menyediakan atau mengusulkan software historian / time-series layer untuk menyimpan data timestamped dari gateway, DAQ, sensor, instrument, IoT device, atau PLC interface, termasuk raw tag, normalized tag, process value, quality/status flag, source device, dan timestamp. | | |
| **DBH-05** | Vendor harus menjelaskan apakah historian menggunakan PostgreSQL/TimescaleDB, dedicated historian, atau teknologi equivalent lain, termasuk alasan pemilihan, retention period, data granularity, compression/aggregation, backup, restore, archive, dan export mechanism. | | |
| **DBH-06** | Transactional database dan historian harus dapat menjadi data landing layer dari perangkat serta dapat diakses oleh MES, SAP/API integration, BI/reporting, atau cloud/SaaS connector sesuai security policy dan integration boundary yang disepakati. | | |
| **DBH-07** | Vendor harus menjelaskan integration runtime atau data broker yang digunakan jika dibutuhkan, seperti MQTT broker/client, API service, ETL/ELT job, OPC-UA/Modbus connector, file exchange, retry queue, data validation, dan data transformation. | | |
| **DBH-08** | Vendor harus menjelaskan data model atau schema design minimal untuk device event, tag data, material event, QC event, production event, label event, handover event, dan integration staging jika data tersebut masuk scope. | | |
| **DBH-09** | Vendor harus menjelaskan sizing database/historian/server/storage berdasarkan jumlah gateway, DAQ/I/O, sensor, scanner, printer, tablet, signal frequency, data retention, data growth, dashboard/query load, concurrent user, dan outgoing traffic per OT gateway. | | |
| **DBH-10** | Vendor harus menjelaskan mekanisme data synchronization, retry, reconciliation, dan error handling antara gateway/edge, transactional database, historian, MES application, SAP/API, dan reporting layer. | | |
| **DBH-11** | Vendor harus menjelaskan mekanisme data access untuk Nabati, termasuk role/access, API/view/export, data dictionary, tag naming convention, timestamp standard, source-device mapping, dan data ownership boundary. | | |
| **DBH-12** | Vendor harus menjelaskan backup, restore, retention, purge/archive, monitoring, and disaster recovery approach untuk transactional database, historian, integration runtime, dan supporting service yang masuk scope. | | |
| **DBH-13** | Vendor harus menjelaskan software license, runtime license, tag/user/device count, CAL/subscription, and support coverage untuk OS server, software historian, transactional database, gateway runtime, protocol driver, connector, and integration service yang masuk scope Part B. | | |
 
---
 
## Referensi Bill of Material Infrastruktur OT (dari URS 3.6.1)
 
### B0 — Infrastruktur Umum Plant
 
| No Item | Nama Item | Deskripsi | Merek Preferensi | Qty | UoM |
|:---|:---|:---|:---|:---:|:---|
| OT-COM.01 | MES Application / Virtualization Server | Server on-premise untuk tier aplikasi/web/API MES dan virtualisasi ringan. Intel Xeon class, min. ~6TB SSD, ~128GB RAM. | Nutanix NX, Dell PowerEdge R, Lenovo SR | 1 | Unit |
| OT-COM.02 | MES Database & Historian Server | Server dedicated untuk database transaksional MES dan historian. Intel Xeon class, min. ~12TB SSD, ~128GB RAM. | Nutanix NX, Dell PowerEdge R, Lenovo SR | 1 | Unit |
| OT-COM.03 | Historian & DB Software dengan OS | Paket software server OS, software historian/SCADA historian, database PostgreSQL-compatible, ekstensi/runtime DB, dan connector/API service. | Advantech Webaccess, PostgreSQL, Windows Server Enterprise | 1 | Lot |
 
### B1 — Infrastruktur OT: Plant Supporting Conching
 
| No Item | Nama Item | Deskripsi | Merek Preferensi | Qty | UoM |
|:---|:---|:---|:---|:---:|:---|
| OT-CON.01 | OT Gateway | Edge gateway untuk panel OT Buhler dan storage tank untuk capture sinyal mesin/proses via MQTT/Modbus/OPC-UA/dry contact. | Advantech UNO, Moxa UC, Beckhoff CX | 2 | Unit |
| OT-CON.02 | Industrial Managed Switch | DIN-rail managed switch per panel OT. Min. 8 port. | Advantech EKI, Moxa EDS, Allen Bradley Stratix | 2 | Unit |
| OT-CON.03 | Enclosure & Power Management | Industrial cabinet IP54+ dengan UPS backup ≥15 menit beserta aksesori panel. | UPS: APC Schneider, Panel: Rittal / Custom | 2 | Lot |
| OT-CON.04 | Gateway Runtime & Protocol Driver Software | Runtime, driver, connector, dan software protokol untuk operasi OT gateway termasuk MQTT/Modbus/OPC-UA/dry contact/serial interface support. | Kepware, open source | 2 | Lot |
 
### B2 — Infrastruktur OT: Plant Production Mixing
 
| No Item | Nama Item | Deskripsi | Merek Preferensi | Qty | UoM |
|:---|:---|:---|:---|:---:|:---|
| OT-MIX.01 | OT Gateway | Edge gateway untuk panel OT Mixing guna capture sinyal mixer dan publish ke MES. | Advantech UNO, Moxa UC, Beckhoff CX | 1 | Unit |
| OT-MIX.02 | Industrial Managed Switch | DIN-rail managed switch, min. 12 port. | Advantech EKI, Moxa EDS, Allen Bradley Stratix | 1 | Unit |
| OT-MIX.03 | Enclosure & Power Management | Industrial cabinet IP54+ dengan UPS backup ≥15 menit beserta aksesori panel. | UPS: APC Schneider, Panel: Rittal / Custom | 1 | Lot |
| OT-MIX.04 | Gateway Runtime & Protocol Driver Software | Runtime, driver, connector, dan software protokol untuk operasi OT gateway. | Kepware, open source | 1 | Lot |
 
### B3 — Infrastruktur OT: Plant Production Processing
 
| No Item | Nama Item | Deskripsi | Merek Preferensi | Qty | UoM |
|:---|:---|:---|:---|:---:|:---|
| OT-PRO.01 | OT Gateway | Edge gateway untuk panel OT Processing guna capture sinyal baking/creaming dan publish ke MES. | Advantech UNO, Moxa UC, Beckhoff CX | 1 | Unit |
| OT-PRO.02 | Industrial Managed Switch | DIN-rail managed switch, min. 12 port. | Advantech EKI, Moxa EDS, Allen Bradley Stratix | 1 | Unit |
| OT-PRO.03 | Enclosure & Power Management | Industrial cabinet IP54+ dengan UPS backup ≥15 menit. | UPS: APC Schneider, Panel: Rittal / Custom | 1 | Lot |
| OT-PRO.04 | Gateway Runtime & Protocol Driver Software | Runtime, driver, connector, dan software protokol untuk operasi OT gateway. | Kepware, open source | 1 | Lot |
 
### B4 — Infrastruktur OT: Packaging & FG
 
| No Item | Nama Item | Deskripsi | Merek Preferensi | Qty | UoM |
|:---|:---|:---|:---|:---:|:---|
| OT-PFG.01 | OT Gateway | Single shared edge gateway untuk area Packaging & FG; capture sinyal primary pack dan cartoning/FG. | Advantech UNO, Moxa UC, Beckhoff CX | 1 | Unit |
| OT-PFG.02 | Industrial Managed Switch | DIN-rail managed switch untuk area Packaging & FG bersama. Min. 18 port. | Advantech EKI, Moxa EDS, Allen Bradley Stratix | 1 | Unit |
| OT-PFG.03 | Enclosure & Power Management | Industrial cabinet IP54+ dengan UPS backup ≥15 menit. | UPS: APC Schneider, Panel: Rittal / Custom | 1 | Lot |
| OT-PFG.04 | Gateway Runtime & Protocol Driver Software | Runtime, driver, connector, dan software protokol untuk operasi OT gateway. | Kepware, open source | 1 | Lot |
 
---
 
*← Kembali ke [index.md](../index.md)*
