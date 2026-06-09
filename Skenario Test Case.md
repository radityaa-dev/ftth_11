# **Dokumen Skenario Test Case**

**Nama Proyek:** Pembangunan Infrastruktur FTTH Desa Muhajirin Kampung 11  
**Kelas:** Empat G  
**Anggota Tim:**

1. Raditya Dwi Putra (701240214) - Manajer Proyek
2. Sherina Wardana (701240209) - Lead Surveyor
3. Afifah Ariyani Dwi Mitra (701240214) - Lead Technician
4. Iftahul Mar'ah (701240194) - Network Engineer (NOC)
5. Rahmad Kuncoro (701240000) - Technician 2

## **1. POSITIVE TEST CASE (Jalur Sukses)**

**Tujuan:** Memverifikasi bahwa sistem memberikan *output* yang benar ketika menerima *input* dan konfigurasi yang valid.

| Field | Description / Example |
| :---- | :---- |
| **Test Case ID** | TC-FTTH-POS-01 |
| **Title** | Distribusi IP dan Autentikasi Pelanggan (PPPoE) Berhasil |
| **Objective** | Memastikan MikroTik berhasil mendistribusikan IP ke pelanggan melalui PPPoE menggunakan kredensial yang valid. |
| **Precondition** | Konfigurasi VLAN dan PPPoE Server pada MikroTik selesai, integrasi OLT aktif. |
| **Test Data** | Username: user\_rumah1, Password: password123 (Akun Terdaftar) |
| **Steps** | 1\. Hubungkan perangkat pelanggan (router/modem) ke jaringan ODP. 2\. Masukkan kredensial PPPoE pada sisi pelanggan. 3\. Cek status koneksi pada *dashboard* MikroTik dan sistem *monitoring* web. |
| **Expected Result** | MikroTik berhasil memproses autentikasi, mendistribusikan IP ke pelanggan, dan status OLT terdeteksi *online* pada sistem *monitoring* web. |
| **Expected Result** | MikroTik berhasil memproses autentikasi, mendistribusikan IP ke pelanggan, dan status OLT terdeteksi online pada sistem monitoring web. |
| **Actual Result** | Berhasil mendapatkan IP address dari MikroTik, koneksi internet aktif, dan status OLT terdeteksi online pada sistem monitoring. |
| **Status (Pass/Fail)** | PASS |

## **2\. NEGATIVE TEST CASE (Jalur Gagal/Penanganan Error)**

**Tujuan:** Memverifikasi ketahanan sistem (*robustness*) dan penanganan kesalahan (*error handling*) ketika menerima *input* yang tidak valid.

|Field|Description / Example|
|-|-|
|**Test Case ID**|TC-FTTH-NEG-01|
|**Title**|Penolakan Autentikasi Kredensial PPPoE Tidak Valid|
|**Objective**|Memastikan sistem keamanan MikroTik menolak akses dari kredensial *login* PPPoE yang salah dan tidak *crash*.|
|**Precondition**|PPPoE Server MikroTik aktif, *router* pelanggan terhubung ke ODP.|
|**Test Data**|Username: user\_rumah1, Password: salahpassword123 (Password Salah)|
|**Steps**|1. Masukkan kredensial PPPoE yang salah pada *router* pelanggan. 2. Coba akses internet dari *router* pelanggan. 3. Pantau log sistem pada MikroTik.|
|**Expected Result**|Sistem MikroTik secara otomatis menolak permintaan koneksi, internet pelanggan tidak aktif, dan tercatat peringatan *authentication failed* pada sistem log.|
|**Actual Result**|*Sistem menolak akses masuk. Router pelanggan gagal terhubung ke internet (status timeout). Pada log sistem MikroTik muncul peringatan "PPPoE connection authentication failed for user\_rumah1". Sistem router utama tetap berjalan normal dan tidak terjadi crash.*|
|**Status (Pass/Fail)**|*Statusnya "PASS" karena sistem berhasil/lulus dalam menolak akses yang salah).*|
|**Remarks/Notes**|Pastikan tidak ada pesan *error* teknis atau *script* yang bocor ke sisi pelanggan.|

## **3. EDGE CASE (Kasus Ekstrem)**

**Tujuan:** Menguji stabilitas sistem jaringan dan perangkat keras pada kondisi ekstrem atau batas maksimal kapasitas.

|Field|Description / Example|
|-|-|
|**Test Case ID**|TC-FTTH-EDG-01|
|**Title**|Uji Beban Jaringan Serentak pada Batas Redaman Maksimal|
|**Objective**|Memastikan kualitas koneksi (Quality Control) tetap stabil meskipun redaman kabel berada di batas ambang toleransi tertinggi dan diakses serentak.|
|**Precondition**|Splicing \& terminasi selesai dengan hasil redaman di 5 ODP pelanggan sampel berada di ambang batas maksimal (misal: -23.9 dBm).|
|**Test Data**|Pengujian *download/upload* file ukuran ekstrem secara bersamaan di 5 titik.|
|**Steps**|1. Pastikan redaman di 5 ODP berada di angka mendekati -24 dBm (menggunakan OPM/OTDR). 2. Lakukan *speedtest* dan *continuous ping* pada kelima rumah sampel pelanggan secara bersamaan selama 10 menit.|
|**Expected Result**|Sistem tetap stabil (MikroTik/OLT tidak *hang*), kecepatan internet tetap sesuai paket layanan (tidak terputus total), dan *packet loss* sangat minim (wajar).|
|**Actual Result**|*(Diisi setelah pengujian dilakukan di lapangan)*|
|**Status (Pass/Fail)**|*(Diisi setelah pengujian dilakukan di lapangan)*|
|**Remarks/Notes**|Pemantauan CPU dan RAM *Load* pada MikroTik RB4011 selama proses uji coba.|



