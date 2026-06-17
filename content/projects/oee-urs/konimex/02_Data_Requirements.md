---
title: "Konimex — Data Requirements"
description: "Kebutuhan data: integritas data, ALCOA+, audit trail, format laporan (1.7.1–1.7.14)."
tags:
  - konimex
  - oee
  - urs
  - manufacturing
---

# Konimex URS - Part 2: Data Requirements

## 1.7 Data Requirements
Kebutuhan manajemen data, integritas data (ALCOA+), kepatuhan pelacakan (Audit Trail), serta standarisasi pelaporan data mesin secara real-time.

| No | Requirement | Our Solution | Explanation |
| :---: | :--- | :---: | :--- |
| **1.7.1** | Sistem harus dapat diupgrade jika nantinya diperlukan data tambahan |  | Sistem dapat terus diupgrade, tetapi untuk mendapati parameter tambahan atau data baru, diperlukan proses upgrade yang lebih kompleks untuk dapat tampil pada UI dan tetap memerlukan seorang developer |
| **1.7.2** | Sistem harus kompatibel dengan sistem ERP / EBR yang sudah ada | | |
| **1.7.3** | Sistem harus dapat mencegah duplikasi atau kesalahan dalam mentransfer / menyimpan data | | |
| **1.7.4** | Sistem harus mampu merespon komunikasi data dengan cepat sesuai dengan kebutuhan komunikasi antar sistem | | |
| **1.7.5** | Sistem harus mampu mencegah kesalahan pengguna seperti salah input, klik tidak disengaja dan lainnya serta bisa menangani secara sistematis | | |
| **1.7.6** | Sistem harus mampu mencatat aktivitas mesin dari awal dihidupkan sampai dengan mesin dimatikan | | Untuk saat ini aktivitas mesin hanya dicatat dari sisi hardware sehingga laporan aktivitas mesin terdapat pada sistem yang berbeda. |
| **1.7.7** | Sistem harus menyediakan fitur approval data correction untuk mengubah data jika terjadi koreksi | | Sistem belum memiliki fitur apabila terjadi perubahan data, data yang dirubah tersebut harus mengalami approval terlebih dahulu. Untuk data correction, saat ini fitur yang ada hanyalah untuk penambahan nilai dan bukan pengurangan nilai.  |
| **1.7.8** | Sistem harus memenuhi prinsip ALCOA+ (Attributable, Legible, Contemporaneous, Original, Accurate, Complete, Consistent, Enduring, Available) | | Beberapa point dari ALCOA+ masih belum terpenuhi [alcoa+](#glossary)  |
| **1.7.9** | Sistem harus memiliki Audit Trail yang tidak dapat dihapus/dimodifikasi untuk seluruh aktivitas user (login, input, edit, delete, approval) | | Untuk saat ini apa yang sudah didevelop dan deploy tidak memiliki user log activity|
| **1.7.10** | Setiap perubahan data harus mencatat: siapa, kapan, apa yang diubah, nilai lama, nilai baru, dan alasan perubahan | | Menyambung dari poin sebelumnya, untuk saat ini sistem tidak mampu untuk mencatat semua log aktivitas user dan perubahan - perubahan yang dilakukan |
| **1.7.11** | Sistem harus dapat memberikan data aktivitas mesin yang bisa diunduh minimal dalam bentuk excel, pdf, CSV atau format lain yang bisa diakses dengan mudah | | **sama dengan point number 1.7.6** |
| **1.7.12** | Sistem harus menyediakan standard report: Daily OEE Report, Weekly/Monthly Trend, Downtime Pareto, Loss Analysis, dsb (bisa sesuai kebutuhan) | Module: OEE Monitoring - Report | Sistem sudah memiliki standard report, namun untuk permulaannya. semua sistem perhitungan didasarkan pada perhitungan shift yang selanjutnya dinaikkan tingkatannya menjadi daily |
| **1.7.13** | Sistem harus menyediakan fitur scheduled report yang dapat dikirim otomatis via email (jika dibutuhkan) | | Fitur ini perlu melakukan setup mail server. |
| **1.7.14** | Setiap report yang dicetak harus mencantumkan: timestamp, user pencetak, dan watermark (untuk traceability) | | Report yang dibuat saat ini berdasarkan scheduler dari sistem. sehingga tidak terdapat data user pencetak *(kecuali cetak yang dimaksud disini merupakan fitur dari print out maka hal ini dapat dilakukan walaupun **belum tersedia**)* |


## Glossary

* ALCOA+
  1. Attributable: Record the individual or system responsible for each action performed.
  2. Legible: Ensure that data is readable troughtout the entie lifecycle of the record.
  3. Contemporaneous: Document data duting the activity to reflect true conditions.
  4. Original: Maintain record as original documents or certified true copies.
  5. Accurate: Avoid editing errors without appropriate documentation of amendments.
  6. Complete: Document all data, including tests, repetitions, or reanalysis, to ensure thorough records.
  7. Consistent: Follow a systematic approach in documenting all analysis components, ensuring a logical sequence of events.
  8. Enduring: Create sustainable records that are systematically documented within a validated system. 
  9. Available: Ensure data can be accessed for review, audits, or inspections throughout its entire lifecycle.
  10. Traceability: Ensure that data is traceable throughout the entire process and its lifecycle, including all changes made.
