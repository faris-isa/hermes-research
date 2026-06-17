---
title: "Konimex — Business Requirements"
description: "Kebutuhan bisnis: integrasi PLC/HMI, dashboard, grafik & tabel, kepatuhan CPPOB (1.6.1–1.6.5)."
tags:
  - konimex
  - oee
  - urs
  - manufacturing
---

# Konimex URS - Part 1: Business Requirements

## 1.6 Business Requirements
Bagian ini mendefinisikan kebutuhan bisnis inti untuk penerapan sistem OEE Online di Line Hecrona 2 PT Konimex, mulai dari integrasi horizontal hingga kepatuhan terhadap regulasi industri farmasi/makanan.

| No | Requirement | Our Solution | Explanation |
| :---: | :--- | :---: | :--- |
| **1.6.1** | Sistem harus dapat mengambil, mengirim data ke PLC atau HMI dan menyimpannya di server untuk dapat diolah menggunakan aplikasi ERP, EBR dan Asset Management |  | Saat ini data diolah bukan oleh pihak ketiga atau aplikasi lain.|
| **1.6.2** | Sistem harus bisa menampilkan dashboard yang berisi: Availability, Performance, Quality, kondisi terkini setiap mesin seperti jika berhenti menggunakan warna merah, jika beroperasi menggunakan warna hijau | Module : OEE Monitoring | Dashboard -> Detail Per Mesin |
| **1.6.3** | Sistem harus bisa menampilkan Grafik dan Tabel untuk memudahkan pembacaan dan sebagai data pendukung dalam pengambilan keputusan | Module: Shopfloor, OEE Monitoring | Grafik OEE menampilkan sesuai perhitungan yang menggunakan metode waterfall. sedangkan untuk tabel merupakan tabel - tabel downtime list. Dalam bentuk lain, sistem menyediakan tabel dalam bentuk export excel yang menampilkan semua parameter yang digunakan dalam perhitungan parameter. |
| **1.6.4** | Sistem harus dapat terintegrasi dengan PLC dan HMI yang telah ada di Mesin seperti Omron, Schneider dan lain-lain | | Sistem terintegrasi dalam hal pengambilan data. Data dikirim menggunakan OPC-UA dari masing-masing device |
| **1.6.5** | Laporan dokumen yang dibuat harus sesuai dengan regulasi CPPOB agar data tidak dapat dimanipulasi | | CPPOB = Cara Pengelolahan Pangan yang Baik - Apa hubungan antara pembuatan report dengan formula tersebut dengan data yang tidak dapat dimanipulasi |
