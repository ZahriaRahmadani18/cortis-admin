<?php
// Impor lirik: memindahkan lirik dari index.html LAMA milik kamu (atribut data-lyrics pada tiap .song-card)
// ke tabel song_lyric_lines, supaya lirik di website sekarang dibaca dari database.
// Jalankan SEKALI lewat browser: http://localhost/<folder-website>/database/impor_lirik.php
// File index.html lama harus disalin ke folder website dengan nama: index_lama.html
header('Content-Type: text/plain; charset=utf-8');
require __DIR__ . '/../koneksi.php';

$file = __DIR__ . '/../index_lama.html';
if (!is_file($file)) { exit("File index_lama.html tidak ditemukan di folder website.\nSalin index.html lama ke sana dengan nama index_lama.html, lalu muat ulang halaman ini.\n"); }

$html = file_get_contents($file);
preg_match_all('/<div class="song-card"[^>]*?data-title="([^"]*)"[^>]*?data-lyrics="([^"]*)"/s', $html, $m, PREG_SET_ORDER);
if (!$m) exit("Tidak ada .song-card dengan data-lyrics di index_lama.html.\n");

$cari = $pdo->prepare("SELECT song_id FROM songs WHERE title = ?");
$hapus = $pdo->prepare("DELETE FROM song_lyric_lines WHERE song_id = ?");
$tambah = $pdo->prepare("INSERT INTO song_lyric_lines (song_id, line_no, start_time_ms, lyric_text) VALUES (?, ?, ?, ?)");

$pdo->beginTransaction();
try {
  foreach ($m as $kartu) {
    $judul = html_entity_decode($kartu[1], ENT_QUOTES, 'UTF-8');
    $cari->execute([$judul]);
    $id = $cari->fetchColumn();
    if (!$id) { echo "LEWAT   : lagu \"$judul\" tidak ada di tabel songs\n"; continue; }

    $hapus->execute([$id]);
    $no = 0;
    foreach (preg_split('/\r?\n/', html_entity_decode($kartu[2], ENT_QUOTES, 'UTF-8')) as $baris) {
      if (!preg_match('/\[(\d+):(\d+)(?:\.(\d+))?\]\s*(.*)$/u', trim($baris), $x)) continue;
      $teks = trim($x[4]);
      if ($teks === '') continue;
      $cs = isset($x[3]) && $x[3] !== '' ? (int)str_pad(substr($x[3], 0, 2), 2, '0') : 0;
      $ms = ((int)$x[1] * 60 + (int)$x[2]) * 1000 + $cs * 10;
      $tambah->execute([$id, ++$no, $ms, mb_substr($teks, 0, 255)]);
    }
    echo "BERHASIL: \"$judul\" -> $no baris lirik\n";
  }
  $pdo->commit();
  echo "\nSelesai. Muat ulang website, lirik sekarang dibaca dari database.\n";
} catch (Throwable $e) {
  $pdo->rollBack();
  echo "GAGAL, perubahan dibatalkan: " . $e->getMessage() . "\n";
}
