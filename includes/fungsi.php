<?php
// Fungsi bantu untuk dashboard CRUD CORTIS.
require_once __DIR__ . "/../koneksi.php";

if (session_status() === PHP_SESSION_NONE) session_start();

$TABEL = require __DIR__ . "/../config/tables.php";

const UPLOAD_DIR = __DIR__ . "/../uploads/";

// Tabel dikelompokkan sesuai halaman website: Home, About, News, Tour, Music, Members, lalu Settings
function tabel_per_grup() {
  global $TABEL;
  $urut = [
    'home_banner',
    'about_content', 'about_content_translations', 'about_slides', 'members',
    'news', 'news_translations',
    'tours', 'tour_translations', 'tour_events', 'tour_event_translations',
    'songs', 'song_lyric_lines',
    'navigation_menus', 'navigation_menu_translations', 'social_links', 'languages', 'admins',
  ];
  $out = [];
  foreach ($urut as $nama) {
    if (isset($TABEL[$nama])) $out[$TABEL[$nama]['group']][$nama] = $TABEL[$nama];
  }
  return $out;
}

// Alamat gambar yang bisa dimuat browser dari path yang tersimpan di database
function url_gambar($path) {
  static $base = null;
  if ($base === null) $base = (require __DIR__ . "/../config/tampilan.php")['url_website'] ?? '';
  $path = (string) $path;
  if ($path === '') return '';
  if (preg_match('#^(https?:)?//#i', $path) || $path[0] === '/' || strpos($path, 'uploads/') === 0) return $path;
  return $base . $path;
}

// Aktivitas terbaru: baris yang paling baru diubah dari semua tabel yang punya kolom updated_at
function aktivitas_terbaru($n = 6) {
  global $pdo, $TABEL;
  $hasil = [];
  foreach ($TABEL as $nama => $cfg) {
    if (!isset($cfg['cols']['updated_at'])) continue;
    $pk = $cfg['pk'];
    $judul = $cfg['label_cols'][0] ?? null;
    if (!$judul) {
      foreach ($cfg['cols'] as $c => $s) if ($s['type'] === 'text' && $s['list']) { $judul = $c; break; }
    }
    $sel = "`$pk` AS id, `updated_at` AS waktu" . ($judul ? ", `$judul` AS judul" : "");
    foreach ($pdo->query("SELECT $sel FROM `$nama` ORDER BY `updated_at` DESC, `$pk` DESC LIMIT 2") as $r) {
      $teks = isset($r['judul']) ? (string) $r['judul'] : '';
      if (mb_strlen($teks) > 48) $teks = mb_substr($teks, 0, 45) . '…';
      $hasil[] = ['tabel' => $nama, 'label' => $cfg['label'], 'icon' => $cfg['icon'], 'id' => $r['id'],
                  'judul' => $teks, 'waktu' => $r['waktu']];
    }
  }
  usort($hasil, fn($a, $b) => strcmp((string) $b['waktu'], (string) $a['waktu']));
  return array_slice($hasil, 0, $n);
}

function h($s) {
  return htmlspecialchars((string) $s, ENT_QUOTES, 'UTF-8');
}

// Ambil konfigurasi tabel dari parameter ?t= (hanya nama yang ada di config yang diterima)
function ambil_tabel($nama) {
  global $TABEL;
  if (!is_string($nama) || !isset($TABEL[$nama])) {
    http_response_code(404);
    die("Tabel tidak ditemukan.");
  }
  return $TABEL[$nama];
}

// ---------- CSRF ----------
function csrf_token() {
  if (empty($_SESSION['csrf'])) $_SESSION['csrf'] = bin2hex(random_bytes(16));
  return $_SESSION['csrf'];
}
function csrf_cek() {
  $t = $_POST['csrf'] ?? '';
  if (!is_string($t) || !hash_equals($_SESSION['csrf'] ?? '', $t)) {
    http_response_code(400);
    die("Token tidak valid. Muat ulang halaman lalu coba lagi.");
  }
}

// ---------- Pesan sekali tampil ----------
function flash($tipe = null, $pesan = null) {
  if ($tipe !== null) { $_SESSION['flash'] = [$tipe, $pesan]; return null; }
  $f = $_SESSION['flash'] ?? null;
  unset($_SESSION['flash']);
  return $f;
}

// ---------- Label untuk dropdown relasi (foreign key) ----------
// Mengembalikan [id => "teks label"] dari tabel yang dirujuk.
function opsi_relasi($ref) {
  global $pdo, $TABEL;
  static $cache = [];
  if (isset($cache[$ref])) return $cache[$ref];
  $cfg = $TABEL[$ref];
  $pk = $cfg['pk'];
  $cols = array_merge([$pk], $cfg['label_cols']);
  $sql = "SELECT " . implode(",", array_map(fn($c) => "`$c`", $cols)) . " FROM `$ref` ORDER BY `$pk` ASC";
  $out = [];
  foreach ($pdo->query($sql) as $r) {
    $teks = "#" . $r[$pk];
    $bag = [];
    foreach ($cfg['label_cols'] as $c) {
      $v = (string) $r[$c];
      if (mb_strlen($v) > 60) $v = mb_substr($v, 0, 57) . "...";
      $bag[] = $v;
    }
    if ($bag) $teks .= " · " . implode(" · ", $bag);
    $out[$r[$pk]] = $teks;
  }
  return $cache[$ref] = $out;
}

// ---------- Upload gambar (JPG/PNG/GIF/WEBP, maks 2 MB) ----------
function simpan_gambar($file, &$error) {
  $error = "";
  if (!$file || ($file['error'] ?? UPLOAD_ERR_NO_FILE) === UPLOAD_ERR_NO_FILE) return null;
  if ($file['error'] !== UPLOAD_ERR_OK) { $error = "Upload gambar gagal."; return null; }
  if ($file['size'] > 2 * 1024 * 1024) { $error = "Ukuran gambar maksimal 2 MB."; return null; }
  $info = @getimagesize($file['tmp_name']);
  $ext = [IMAGETYPE_JPEG => 'jpg', IMAGETYPE_PNG => 'png', IMAGETYPE_GIF => 'gif', IMAGETYPE_WEBP => 'webp'];
  if (!$info || !isset($ext[$info[2]])) { $error = "Gambar harus berformat JPG, PNG, GIF, atau WEBP."; return null; }
  if (!is_dir(UPLOAD_DIR)) mkdir(UPLOAD_DIR, 0755, true);
  $nama = bin2hex(random_bytes(8)) . "." . $ext[$info[2]];
  if (!move_uploaded_file($file['tmp_name'], UPLOAD_DIR . $nama)) { $error = "Gambar gagal disimpan."; return null; }
  return "uploads/" . $nama;
}
// Hapus file hasil upload (hanya yang ada di folder uploads/)
function hapus_gambar($path) {
  if ($path && preg_match('#^uploads/[a-f0-9]{16}\.(jpg|png|gif|webp)$#', $path)) {
    $f = __DIR__ . "/../" . $path;
    if (is_file($f)) @unlink($f);
  }
}

// ---------- Pesan error database yang ramah ----------
function pesan_db(PDOException $e) {
  $m = $e->getMessage();
  if (stripos($m, 'duplicate') !== false || stripos($m, 'unique') !== false) {
    return "Data duplikat: nilai/kombinasi tersebut sudah ada (misalnya bahasa yang sama untuk data yang sama).";
  }
  if (stripos($m, 'foreign key') !== false) {
    return "Operasi ditolak oleh relasi tabel: data ini masih dipakai tabel lain, atau data induk yang dipilih tidak ada.";
  }
  if (stripos($m, 'cannot be null') !== false || stripos($m, 'not null') !== false) {
    return "Ada kolom wajib yang masih kosong.";
  }
  return "Kesalahan database: " . $m;
}

// ---------- Format nilai untuk tampilan tabel ----------
function tampil_nilai($spec, $val) {
  if ($val === null || $val === '') return '<span class="text-body-secondary">–</span>';
  switch ($spec['type']) {
    case 'bool':
      return $val ? '<span class="badge text-bg-success">Ya</span>' : '<span class="badge text-bg-secondary">Tidak</span>';
    case 'fk':
      $o = opsi_relasi($spec['ref']);
      return h($o[$val] ?? ('#' . $val));
    case 'image':
      // thumbnail; jika gambar tidak ditemukan, tampilkan path-nya sebagai teks
      return '<span class="cx-thumb-wrap"><img class="cx-thumb" loading="lazy" src="' . h(url_gambar($val)) . '" alt="' . h($val) . '" title="' . h($val) . '"'
           . ' onerror="this.replaceWith(document.createTextNode(this.alt))"></span>';
    case 'textarea':
    case 'text':
      $v = (string) $val;
      if (mb_strlen($v) > 70) return '<span title="' . h($v) . '">' . h(mb_substr($v, 0, 67)) . '…</span>';
      return h($v);
    case 'number':
      return h(is_numeric($val) ? number_format((float) $val, 0, ',', '.') : $val);
    default:
      return h($val);
  }
}

// Susun URL tabel.php dengan parameter tambahan
function url_tabel($t, array $p = []) {
  $p = array_filter(array_merge(['t' => $t], $p), fn($v) => $v !== '' && $v !== null);
  return 'tabel.php?' . http_build_query($p);
}
