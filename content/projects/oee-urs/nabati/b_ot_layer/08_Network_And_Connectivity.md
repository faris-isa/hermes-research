---
title: "Nabati — Part B: Network & Connectivity"
description: "Kebutuhan Jaringan, Konektivitas & Ketersediaan (NET-01 ~ NET-12)."
tags:
  - nabati
  - mes
  - urs
  - part-b
---

# Nabati MES Ecosystem (Part B) - Part 8: Network & Connectivity Requirements

### 4.1.3 Network, Connectivity, Availability & Documentation

| ID | Requirement | Our Solution | Explanation |
| :--- | :--- | :--- | :--- |
| **NET-01** | Infrastruktur harus mendukung konektivitas aman shopfloor-edge-MES-SAP-enterprise/cloud melalui jaringan IT/OT yang disepakati. | | |
| **NET-02** | Vendor harus menjelaskan network topology, single line diagram per device, IP/VLAN/subnet requirement, routing/firewall rule, port/protocol, dan connection flow untuk setiap integration point. | | |
| **NET-03** | Infrastruktur harus mempertimbangkan network segmentation antara IT, OT, MES, SAP, common plant data platform, dan cloud/SaaS untuk mengurangi risiko gangguan operasional dan keamanan. | | |
| **NET-04** | Vendor harus memastikan koneksi ke mesin/PLC/panel existing tidak mengganggu kontrol mesin dan mengikuti boundary akses yang disetujui Nabati. | | |
| **NET-05** | Vendor harus menjelaskan remote access mechanism untuk support, termasuk VPN/jump host/secure tunnel, approval flow, credential management, logging, dan akses sementara jika diperlukan. | | |
| **NET-06** | Infrastruktur harus mendukung secure communication sesuai desain, termasuk authentication, encryption, certificate/key management, dan credential rotation jika relevan. | | |
| **NET-07** | Infrastruktur harus memiliki backup, restore, restart/recovery, local buffering, dan data loss protection sesuai deployment approach. | | |
| **NET-08** | Vendor harus menjelaskan expected availability, failure scenario, recovery procedure, dan operational impact jika gateway, historian/cache, transactional database, local server, integration runtime, atau cloud connection terganggu. | | |
| **NET-09** | Vendor sebaiknya menyediakan basic monitoring untuk service availability, connection health, storage usage, data flow, gateway status, device connection status, database health, dan historian health. | | |
| **NET-10** | Vendor harus menyediakan technical documentation seperti architecture diagram, network topology, environment specification, device/network list, access flow, backup/restore procedure, DB/historian schema, API/topic list, dan as-built reference. | | |
| **NET-11** | Vendor harus menjelaskan data access mechanism dari common plant database/historian ke MES/vendor application (MES Ecosystem Part A), seperti API, database view, connector, MQTT topic, file exchange, atau approved method lain. | | |
| **NET-12** | Vendor harus menyediakan tag naming convention, data dictionary, schema/interface contract, source-device mapping, timestamp standard, dan data ownership boundary untuk data yang masuk ke transactional database atau historian. | | |


---
 
## Arsitektur Jaringan yang Diusulkan
 
> *Bagian ini diisi berdasarkan solusi vendor yang diusulkan*
 
### Segmentasi Jaringan
 
| Segmen | Deskripsi | VLAN | Subnet |
|:---|:---|:---|:---|
| IT Network (existing) | Jaringan kantor/enterprise Nabati yang ada | | |
| OT Network | Jaringan perangkat shopfloor, gateway, DAQ, sensor | | |
| MES Application Network | Jaringan server MES, DB, historian | | |
| DMZ / Integration Zone | Zona antarmuka MES–SAP, API gateway | | |
 
### Titik Integrasi Utama
 
| Dari | Ke | Protokol | Port | Keterangan |
|:---|:---|:---|:---|:---|
| OT Gateway | Historian / DB Server | MQTT / OPC-UA | | Data proses dari shopfloor |
| MES App Server | SAP | RFC / REST API | | Integrasi WO, BOM, konfirmasi |
| OT Gateway | MES App Server | HTTPS / MQTT | | Data real-time ke MES |
| Tablet / Scanner | MES App Server | HTTPS / Wi-Fi | | Input operator shopfloor |
| MES App Server | BI / Reporting | REST API / DB View | | Dashboard & analytics |
 
---
 
## Arsitektur Deployment per Area (dari URS 3.5)
 
### Konching
 
Komponen jaringan:
- OT Panel Buhler → Managed Switch → OT Gateway → IT Network
- OT Panel Storage Tank → Managed Switch → OT Gateway → IT Network
- Stationary scanner/HMI → IT Network langsung (Wi-Fi/LAN)
- Foreman & Inspector tablet → IT Network langsung (Wi-Fi)
### Mixing
 
Komponen jaringan:
- OT Panel Mixer → Managed Switch → OT Gateway → IT Network
- 4x Stationary scanner/HMI (per hopper) → IT Network langsung
- Foreman & Inspector tablet → IT Network langsung (Wi-Fi)
### Processing (Baking & Creaming)
 
Komponen jaringan:
- OT Panel Baking (PLC S7-1200 existing ×4) → Managed Switch → OT Gateway → IT Network
- OT Panel Creaming → Remote DAQ ×4 (RS-232) → OT Gateway → IT Network
- Hopper Level Sensor ×4 → OT Gateway
- Operator terminal & Inspector tablet → IT Network langsung
### Packaging & FG
 
Komponen jaringan:
- Primary Pack Panel → Remote DAQ ×12 → OT Gateway → IT Network
- Cartoning Counter ×2 → OT Gateway
- Foreman & Inspector tablet → IT Network langsung (Wi-Fi)
### BS & Recycle
 
Komponen jaringan:
- IoT System BS Weigher (RS-232/485) → IT Network langsung
- IoT System Recycle Weigher (RS-232/485) → IT Network langsung
- Recycle Labeler → IT Network langsung
### Incoming QC RMPM
 
Komponen jaringan:
- Inspector tablet → IT Network langsung (Wi-Fi/LAN)
- Label printer → IT Network langsung (tidak membutuhkan OT gateway)
---
 
*← Kembali ke [index.md](../index.md)*
