# CORTIS Admin Dashboard + Website

Ini tugas Praktikum Pemrograman Web (Kelompok 6). Isinya dashboard admin pakai AdminLTE buat ngelola
18 tabel di database `cortis_db`, sama website CORTIS yang ngambil datanya dari database yang sama.

- **Dashboard admin** (CRUD semua tabel): folder utama
- **Website CORTIS** (nampilin data dari database): folder `website/`

## Cara Menjalankan (XAMPP)

1. Nyalain **Apache** dan **MySQL** di XAMPP.
2. Copy folder proyek ini ke `C:\xampp\htdocs\cortis-admin` (sesuaikan sama lokasi XAMPP-nya).
3. Buka phpMyAdmin (`http://localhost/phpmyadmin`), terus **import** file `database/cortis_db.sql`.
   Database `cortis_db` bakal kebuat otomatis lengkap sama 18 tabel dan data awalnya.
4. Kalau MySQL-nya pakai password, ubah dulu `koneksi.php` dan `website/koneksi.php`
   (bawaan XAMPP: user `root`, password kosong).
5. Buka di browser:
   - Dashboard admin: `http://localhost/cortis-admin/`
   - Website: `http://localhost/cortis-admin/website/`

### Soal lokasi folder
Folder proyeknya boleh dikasih nama lain, asal folder `website` tetap ada di dalam folder dashboard.
Pengaturannya ada di `website/config.php` (`url_admin` = `../`), supaya gambar yang diupload lewat
dashboard (`uploads/`) bisa muncul di website.

### Video nggak ikut di-upload
File video `video.mp4` dan `redred.mp4` ukurannya gede banget, jadi nggak saya upload ke GitHub.
Kalau mau videonya jalan, taruh filenya di `website/media/`. Kalau nggak ada, bagian lain
website tetap jalan normal, cuma video di Home dan lagu yang kosong.

## Hubungan Dashboard dan Website

Data yang diubah di dashboard langsung kelihatan di website setelah halamannya di-refresh.

| Menu dashboard | Tampil di website |
|---|---|
| Home (banner) | Video dan tanggal debut di Home |
| About: konten, slide, member | Deskripsi, slider foto, dan daftar member |
| News | Halaman News (3 bahasa) |
| Tour | Halaman Tour (3 bahasa) |
| Music: lagu dan baris lirik | Daftar lagu dan lirik di pemutar |
| Settings: menu, sosial media, bahasa | Menu navigasi dan ikon sosial media |

Lirik diisi lewat **Music → Baris Lirik → Tempel Lirik**. Pakai format `[mm:ss.xx]teks` biar
liriknya pas sama lagunya.

## Teknologi
PHP 8 (PDO, prepared statement), MySQL/MariaDB, AdminLTE 4 (Bootstrap 5), JavaScript.
Berita diambil lewat endpoint JSON `website/api/news.php`, sedangkan konten lainnya langsung
dirender PHP dari database.