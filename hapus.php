<?php
// DELETE: hapus satu baris (hanya lewat POST + token CSRF)
require_once __DIR__ . "/includes/fungsi.php";

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
  header("Location: index.php");
  exit;
}
csrf_cek();

$t   = $_POST['t'] ?? '';
$cfg = ambil_tabel($t);
$pk  = $cfg['pk'];
$id  = $_POST['id'] ?? '';

if (!ctype_digit((string) $id)) {
  flash('danger', 'ID tidak valid.');
  header("Location: " . url_tabel($t));
  exit;
}

try {
  // ambil dulu path gambar (jika ada) agar file upload ikut dibersihkan
  $gambar = [];
  foreach ($cfg['cols'] as $n => $c) if ($c['type'] === 'image') $gambar[] = $n;
  $lama = [];
  if ($gambar) {
    $st = $pdo->prepare("SELECT " . implode(",", array_map(fn($c) => "`$c`", $gambar)) . " FROM `$t` WHERE `$pk` = ?");
    $st->execute([$id]);
    $lama = $st->fetch() ?: [];
  }

  $st = $pdo->prepare("DELETE FROM `$t` WHERE `$pk` = ?");
  $st->execute([$id]);

  if ($st->rowCount() > 0) {
    foreach ($lama as $p) hapus_gambar($p);
    flash('success', "Data {$cfg['label']} #$id berhasil dihapus.");
  } else {
    flash('warning', "Data #$id tidak ditemukan.");
  }
} catch (PDOException $e) {
  flash('danger', pesan_db($e));
}
header("Location: " . url_tabel($t));
exit;
