# SKENARIO TEST CASE

## Nama Proyek
Pembangunan Infrastruktur FTTH Desa Muhajirin Kampung 11

## Kelas
4G

## Kelompok 3

---

# POSITIVE TEST CASE

## TC-P01 – Uji Koneksi Internet Berhasil

Tujuan:
Memastikan pelanggan dapat terhubung ke internet dengan data yang valid.

Prasyarat:
- ONT aktif
- Kabel fiber terpasang dengan benar
- Akun PPPoE valid

Langkah Pengujian:
1. Hubungkan ONT ke jaringan FTTH.
2. Masukkan username dan password valid.
3. Klik Connect.

Hasil Yang Diharapkan:
Koneksi berhasil terhubung ke internet.

---

# NEGATIVE TEST CASE

## TC-N01 – Login PPPoE dengan Password Salah

Tujuan:
Memastikan sistem menolak login yang tidak valid.

Prasyarat:
- ONT aktif

Langkah Pengujian:
1. Masukkan username benar.
2. Masukkan password salah.
3. Klik Connect.

Hasil Yang Diharapkan:
Koneksi ditolak dan muncul pesan error.

---

# EDGE CASE

## TC-E01 – Redaman Mendekati Batas Maksimum

Tujuan:
Menguji stabilitas jaringan pada batas toleransi.

Prasyarat:
- ODP aktif

Data Uji:
-23.9 dBm

Hasil Yang Diharapkan:
Jaringan masih dapat digunakan tanpa gangguan.