<?php
// Tempel lirik sekaligus: satu lagu, banyak baris lirik -> tabel song_lyric_lines.
// Format yang diterima:
//   [mm:ss.xx]teks lirik      (format LRC, waktu ikut terbaca)
//   teks lirik saja           (tanpa waktu: diberi jarak otomatis sesuai "Jarak antar baris")
require_once __DIR__ . "/includes/fungsi.php";
require_once __DIR__ . "/includes/layout.php";

$songs = $pdo->query("SELECT song_id, title FROM songs ORDER BY title")->fetchAll();
$song_id = (int) ($_POST['song_id'] ?? $_GET['song_id'] ?? 0);
$teks    = (string) ($_POST['lirik'] ?? '');
$mode    = ($_POST['mode'] ?? 'ganti') === 'tambah' ? 'tambah' : 'ganti';
$jarak   = max(1, min(30, (int) ($_POST['jarak'] ?? 4)));
$errors  = [];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  csrf_cek();
  $ada = $pdo->prepare("SELECT COUNT(*) FROM songs WHERE song_id = ?");
  $ada->execute([$song_id]);
  if (!$ada->fetchColumn()) $errors[] = "Pilih lagu terlebih dahulu.";

  // parse baris
  $baris = [];
  $waktu_terakhir = -$jarak * 1000;
  foreach (preg_split('/\r?\n/', $teks) as $b) {
    $b = trim($b);
    if ($b === '') continue;
    if (preg_match('/^\[(\d+):(\d+)(?:[.:](\d+))?\]\s*(.*)$/u', $b, $x)) {
      $isi = trim($x[4]);
      if ($isi === '') continue;
      $cs = ($x[3] ?? '') !== '' ? (int) str_pad(substr($x[3], 0, 2), 2, '0') : 0;
      $ms = ((int) $x[1] * 60 + (int) $x[2]) * 1000 + $cs * 10;
    } elseif (preg_match('/^\[[a-z]+:.*\]$/i', $b)) {
      continue; // tag LRC seperti [ar:...] / [ti:...] dilewati
    } else {
      $isi = $b;
      $ms = $waktu_terakhir + $jarak * 1000;
    }
    $waktu_terakhir = $ms;
    $baris[] = [$ms, mb_substr($isi, 0, 255)];
  }
  if (!$baris && !$errors) $errors[] = "Kolom lirik masih kosong.";

  if (!$errors) {
    try {
      $pdo->beginTransaction();
      $no = 0;
      if ($mode === 'ganti') {
        $pdo->prepare("DELETE FROM song_lyric_lines WHERE song_id = ?")->execute([$song_id]);
      } else {
        $st = $pdo->prepare("SELECT COALESCE(MAX(line_no), 0) FROM song_lyric_lines WHERE song_id = ?");
        $st->execute([$song_id]);
        $no = (int) $st->fetchColumn();
      }
      $ins = $pdo->prepare("INSERT INTO song_lyric_lines (song_id, line_no, start_time_ms, lyric_text) VALUES (?, ?, ?, ?)");
      foreach ($baris as [$ms, $isi]) $ins->execute([$song_id, ++$no, $ms, $isi]);
      $pdo->commit();
      flash('success', count($baris) . " baris lirik berhasil disimpan.");
      header("Location: " . url_tabel('song_lyric_lines', ['q' => '']));
      exit;
    } catch (PDOException $e) {
      if ($pdo->inTransaction()) $pdo->rollBack();
      $errors[] = pesan_db($e);
    }
  }
}

layout_atas("Tempel Lirik", 'song_lyric_lines', ['Music', ['Baris Lirik', url_tabel('song_lyric_lines')], 'Tempel Lirik'],
            "Isi banyak baris lirik sekaligus untuk satu lagu");
?>
<div class="card mb-4">
  <div class="card-header"><h3 class="card-title"><i class="bi bi-clipboard-plus me-1"></i> Tempel lirik</h3></div>
  <form method="post" action="lirik.php">
    <input type="hidden" name="csrf" value="<?= h(csrf_token()) ?>">
    <div class="card-body">
      <?php foreach ($errors as $e) { ?><div class="alert alert-danger py-2"><?= h($e) ?></div><?php } ?>

      <div class="mb-3">
        <label class="form-label fw-semibold">Lagu <span class="text-danger">*</span></label>
        <select name="song_id" class="form-select" required>
          <option value="">— pilih lagu —</option>
          <?php foreach ($songs as $s) { ?>
            <option value="<?= (int) $s['song_id'] ?>" <?= $song_id === (int) $s['song_id'] ? 'selected' : '' ?>>#<?= (int) $s['song_id'] ?> · <?= h($s['title']) ?></option>
          <?php } ?>
        </select>
      </div>

      <div class="mb-3">
        <label class="form-label fw-semibold">Lirik <span class="text-danger">*</span></label>
        <textarea name="lirik" rows="12" class="form-control font-monospace" placeholder="[00:01.50]baris pertama&#10;[00:05.20]baris kedua&#10;[00:09.00]baris ketiga" required><?= h($teks) ?></textarea>
        <div class="form-text">
          Satu baris lirik per baris. Pakai format <code>[menit:detik.persen]teks</code> supaya sinkron dengan lagu.
          Kalau tidak ada waktu, tiap baris diberi jarak otomatis.
        </div>
      </div>

      <div class="row g-3">
        <div class="col-md-6">
          <label class="form-label fw-semibold">Jika lagu sudah punya lirik</label>
          <select name="mode" class="form-select">
            <option value="ganti" <?= $mode === 'ganti' ? 'selected' : '' ?>>Ganti semua lirik lama</option>
            <option value="tambah" <?= $mode === 'tambah' ? 'selected' : '' ?>>Tambahkan di bawah lirik lama</option>
          </select>
        </div>
        <div class="col-md-6">
          <label class="form-label fw-semibold">Jarak antar baris (detik)</label>
          <input type="number" name="jarak" min="1" max="30" value="<?= (int) $jarak ?>" class="form-control">
          <div class="form-text">Hanya dipakai untuk baris yang tidak punya waktu.</div>
        </div>
      </div>
    </div>
    <div class="card-footer">
      <button type="submit" class="btn btn-primary"><i class="bi bi-check-lg me-1"></i> Simpan Lirik</button>
      <a href="<?= h(url_tabel('song_lyric_lines')) ?>" class="btn btn-outline-secondary">Batal</a>
    </div>
  </form>
</div>
<?php layout_bawah();
