# CORTIS Website — Tugas#6 Integrasi Database ke Frontend

Website CORTIS (Home, About, News, Tour, Music) sekarang membaca seluruh kontennya dari database `cortis_db`,
yang datanya dikelola lewat dashboard admin (`cortis-admin`). Mengubah data di dashboard langsung mengubah tampilan website.

| Bagian website | Tabel database |
|---|---|
| Menu navigasi (3 bahasa) | `navigation_menus`, `navigation_menu_translations` |
| Video & tanggal debut Home | `home_banner` |
| Slider foto & deskripsi About (3 bahasa) | `about_slides`, `about_content`, `about_content_translations` |
| Member | `members` |
| Berita (3 bahasa) | `news`, `news_translations` (lewat `api/news.php`) |
| Tour: nama, kota, venue, tanggal (3 bahasa) | `tours`, `tour_translations`, `tour_events`, `tour_event_translations` |
| Musik: daftar lagu, cover, audio, MV, jumlah stream | `songs` |
| Lirik | `song_lyric_lines` |
| Ikon sosial media di footer | `social_links` |
| Bahasa | `languages` |

## File
- `index.php` — pengganti `index.html`; mengambil data dari database dan merendernya.
- `script.js` — terjemahan, tour, dan berita memakai data dari database.
- `api/news.php` — endpoint JSON berita dari tabel `news`.
- `includes/fungsi.php` — fungsi pembaca data (prepared statement PDO).
- `koneksi.php`, `config.php` — koneksi database dan alamat folder admin.
- `database/impor_lirik.php` — impor lirik dari file lama ke tabel `song_lyric_lines` (sekali jalan).

## Cara menjalankan (XAMPP)
1. Import `cortis_db.sql` ke phpMyAdmin (sama seperti tugas sebelumnya).
2. Salin file di repositori ini ke folder website di `htdocs`, ganti `script.js` lama. Folder `images/`, `media/`, `styles.css` tetap dari website lama.
3. Ganti nama `index.html` lama menjadi `index_lama.html`.
4. Buka `http://localhost/<folder-website>/database/impor_lirik.php` satu kali untuk mengisi lirik ke database.
5. Buka `http://localhost/<folder-website>/index.php`.
