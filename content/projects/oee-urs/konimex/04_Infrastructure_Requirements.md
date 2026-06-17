---
title: "Konimex — Infrastructure Requirements"
description: "Kebutuhan infrastruktur: spesifikasi server, jaringan, SSO/RBAC, VPN, Linux/PostgreSQL (1.9.1–1.9.6)."
tags:
  - konimex
  - oee
  - urs
  - manufacturing
---

# Konimex URS - Part 4: Infrastructure Requirements

## 1.9 Infrastructure Requirements
Spesifikasi arsitektur jaringan, standar keamanan IT (SSO & RBAC), kapasitas hardware server, serta optimasi infrastruktur pusat.

| No | Requirement | Our Solution | Explanation |
| :--- | :--- | :--: | :--- |
| **1.9.1** | Sistem harus punya pengaman yang mengikuti standar keamanan di Konimex, semua akses diatur melalui SSO dan RBAC, untuk remote akses bisa menggunakan VPN | Keycloak SSO | Untuk RBAC tiap feature masih belum didetailkan, sehingga masih terbatas hanya tiap module dan aksinya.
| **1.9.2** | Sistem mampu berjalan lancar dengan jaringan pada rata-rata kecepatan maksimal: 1 Gbps | | |
| **1.9.3** | Sistem dapat berjalan dengan lancar dengan spesifikasi part sebagai berikut:<br>1. Server: Mengikuti server pusat yang digunakan di PT Konimex.<br>2. Prosessor: minimum intel xeon gold yang support >3GHZ, dan min. 12 core.<br>3. Kabel Jaringan FO atau kabel ethernet Cat6.<br>4. Database: Postgre atau NoSQL.<br>5. OS: Linux. | | |
| **1.9.4** | Akses dashboard bisa dilakukan melalui web browser | Web Application | Belum mengetahui versi terendah untuk dapat membuka browser, relatif issue terhadap css apabila diakses > 1 tahun tidak update |
| **1.9.5** | Sistem bisa menggunakan 1 server central yang sudah tersedia, tidak perlu menggunakan server lokal di bagian Produksi | | |
| **1.9.6** | Software dan hardware di sistem OEE harus mudah dikonfigurasi untuk mengakomodasi perubahan perangkat seperti HMI, PLC atau yang lainnya | | Saat ini konfigurasi masih dilakukan secara manual oleh developer, termasuk menyesuaikan urutan dari mesin |
