<?php
// API berita: membaca tabel `news` + `news_translations` dari cortis_db (menggantikan scraping IDN Times).
// Dipanggil oleh script.js lewat fetch('api/news.php').
header('Content-Type: application/json; charset=utf-8');
header('Cache-Control: no-store');

$CONFIG = require __DIR__ . '/../config.php';
require __DIR__ . '/../koneksi.php';
require __DIR__ . '/../includes/fungsi.php';

try {
  $bhs  = daftar_bahasa($pdo);
  $data = ambil_berita($pdo, $bhs, 15);
  echo json_encode(['status' => 'success', 'source' => 'database', 'total' => count($data), 'data' => $data],
                   JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
} catch (Throwable $e) {
  http_response_code(500);
  echo json_encode(['status' => 'error', 'message' => 'Gagal membaca database', 'data' => []]);
}
