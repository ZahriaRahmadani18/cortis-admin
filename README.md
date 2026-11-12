# CORTIS Admin Dashboard (AdminLTE)

Dashboard admin untuk mengelola seluruh 18 tabel database `cortis_db` (website CORTIS):
**Create** (tambah), **Read** (lihat, cari, urut, halaman), **Update** (ubah), dan **Delete** (hapus).
Tampilan memakai template **AdminLTE 4** (Bootstrap 5) dengan tema gelap + magenta CORTIS.

## Cara menjalankan (XAMPP)

1. Nyalakan **Apache** dan **MySQL** di XAMPP Control Panel.
2. Impor database: buka `localhost/phpmyadmin` > tab **Impor** > pilih `database/cortis_db.sql` > Kirim.
3. Salin folder ini ke `C:\xampp\htdocs\cortis-admin`.
4. Buka `http://localhost/cortis-admin/` di browser.

Jika MySQL-mu memakai password, ubah di `koneksi.php`. Perlu koneksi internet agar ikon dan font AdminLTE tampil (dimuat dari CDN).

## Struktur file

| File | Fungsi |
|---|---|
| `index.php` | Dashboard: kartu 18 tabel beserta jumlah datanya |
| `tabel.php` | **Read**: daftar data satu tabel (cari, urut kolom, paginasi) + tombol Ubah dan Hapus |
| `form.php` | **Create** dan **Update**: formulir tambah/ubah untuk semua tabel |
| `hapus.php` | **Delete**: hapus satu baris (POST + token CSRF) |
| `koneksi.php` | Koneksi database (PDO) |
| `config/tables.php` | Daftar 18 tabel, kolom, tipe, dan relasi (foreign key) |
| `includes/` | Fungsi bantu dan kerangka halaman AdminLTE |
| `css/adminlte.css` | Stylesheet AdminLTE |
| `css/cortis-theme.css` | Tema gelap + magenta (ubah warna di blok `:root` paling atas) |
| `config/tampilan.php` | Lokasi folder website agar foto/cover/logo tampil di dashboard |
| `uploads/` | Tujuan unggah gambar dari form |
| `database/cortis_db.sql` | Struktur 18 tabel + data awal |

## Fitur

- Satu set halaman untuk semua tabel (berdasarkan `config/tables.php`).
- Kolom relasi (foreign key) tampil sebagai **dropdown** berisi data tabel induknya.
- Validasi sisi server (wajib diisi, angka, tanggal, panjang teks, pilihan).
- Pesan error yang jelas saat data duplikat atau saat data masih dipakai tabel lain.
- Kolom gambar: isi path gambar atau unggah file baru (JPG/PNG/GIF/WEBP, maks. 2 MB).
- Password admin disimpan sebagai hash bcrypt.
- Query memakai prepared statement; hapus memakai POST dan token CSRF.

## Menampilkan foto, cover, dan logo

Database menyimpan path seperti `images/member1.jpg`. Agar gambarnya tampil di dashboard, pilih salah satu:

1. Salin folder `images/` (dan `media/`) dari website ke dalam folder `cortis-admin/`, atau
2. Isi `url_website` di `config/tampilan.php`, misalnya `'../cortis/'` jika website ada di `htdocs/cortis`.

Logo opsional: letakkan `images/logo.jpeg`. Foto hero dashboard: `images/group.jpg`.
