<?php
// CREATE (tambah) dan UPDATE (ubah) satu baris, untuk semua tabel (berdasarkan config/tables.php)
require_once __DIR__ . "/includes/fungsi.php";
require_once __DIR__ . "/includes/layout.php";

$t   = $_GET['t'] ?? ($_POST['t'] ?? '');
$cfg = ambil_tabel($t);
$pk  = $cfg['pk'];
$cols = $cfg['cols'];
$fields = array_filter($cols, fn($c) => $c['form']);

$id = $_GET['id'] ?? ($_POST['id'] ?? '');
$edit = ($id !== '' && ctype_digit((string) $id));

// data lama (mode ubah)
$row = null;
if ($edit) {
  $st = $pdo->prepare("SELECT * FROM `$t` WHERE `$pk` = ?");
  $st->execute([$id]);
  $row = $st->fetch();
  if (!$row) {
    flash('warning', "Data #$id tidak ditemukan.");
    header("Location: " . url_tabel($t));
    exit;
  }
}

$errors = [];
$old = [];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  csrf_cek();
  $data = [];       // kolom => nilai yang akan disimpan
  $baru = [];       // file yang baru diunggah (dibersihkan jika gagal)

  foreach ($fields as $n => $c) {
    $key = 'f_' . $n;
    $in = $_POST[$key] ?? '';
    $in = is_string($in) ? trim($in) : '';
    $lbl = $c['label'];

    if ($c['type'] === 'bool') {
      $old[$n] = isset($_POST[$key]) ? 1 : 0;
      $data[$n] = $old[$n];
      continue;
    }

    if ($c['type'] === 'password') {
      if ($in === '') {
        if (!$edit) $errors[$n] = "$lbl wajib diisi.";
      } elseif (mb_strlen($in) < 6) {
        $errors[$n] = "$lbl minimal 6 karakter.";
      } else {
        $data[$n] = password_hash($in, PASSWORD_BCRYPT);
      }
      continue;
    }

    if ($c['type'] === 'image') {
      $up = simpan_gambar($_FILES['file_' . $n] ?? null, $errUp);
      if ($errUp) $errors[$n] = $errUp;
      if ($up) { $baru[] = $up; $in = $up; }
    }

    $old[$n] = $in;

    if ($in === '') {
      if ($c['required']) {
        if (!isset($errors[$n])) $errors[$n] = "$lbl wajib diisi."; // jangan timpa pesan error upload
      } elseif ($c['null']) {
        $data[$n] = null;
      } elseif ($edit && $c['default'] !== null && $c['default'] !== 'CURRENT_TIMESTAMP') {
        $data[$n] = $c['default'];
      }
      // tambah + kolom punya default: dilewati agar default database dipakai
      continue;
    }

    switch ($c['type']) {
      case 'number':
        if (!preg_match('/^-?\d+$/', $in)) $errors[$n] = "$lbl harus berupa bilangan bulat.";
        else $data[$n] = $in;
        break;
      case 'fk':
        if (!ctype_digit($in) || !isset(opsi_relasi($c['ref'])[$in])) $errors[$n] = "$lbl: pilihan tidak valid.";
        else $data[$n] = $in;
        break;
      case 'select':
        if (!in_array($in, $c['options'], true)) $errors[$n] = "$lbl: pilihan tidak valid.";
        else $data[$n] = $in;
        break;
      case 'date':
        if (!preg_match('/^(\d{4})-(\d{2})-(\d{2})$/', $in, $m) || !checkdate((int) $m[2], (int) $m[3], (int) $m[1]))
          $errors[$n] = "$lbl harus berupa tanggal yang valid.";
        else $data[$n] = $in;
        break;
      case 'datetime':
        $x = str_replace('T', ' ', $in);
        if (preg_match('/^\d{4}-\d{2}-\d{2} \d{2}:\d{2}$/', $x)) $x .= ':00';
        if (!preg_match('/^(\d{4})-(\d{2})-(\d{2}) \d{2}:\d{2}:\d{2}$/', $x, $m) || !checkdate((int) $m[2], (int) $m[3], (int) $m[1]))
          $errors[$n] = "$lbl harus berupa tanggal dan jam yang valid.";
        else $data[$n] = $x;
        break;
      default: // text, textarea, image
        if ($c['max'] && mb_strlen($in) > $c['max']) $errors[$n] = "$lbl maksimal {$c['max']} karakter.";
        elseif (mb_strlen($in) > 60000) $errors[$n] = "$lbl terlalu panjang.";
        else $data[$n] = $in;
    }
  }

  if (!$errors) {
    try {
      if ($edit) {
        $set = implode(", ", array_map(fn($n) => "`$n` = ?", array_keys($data)));
        $stmt = $pdo->prepare("UPDATE `$t` SET $set WHERE `$pk` = ?");
        $stmt->execute(array_merge(array_values($data), [$id]));
        // gambar lama yang diganti oleh upload baru ikut dibersihkan
        foreach ($cols as $n => $c) {
          if ($c['type'] === 'image' && isset($data[$n]) && $row[$n] && $row[$n] !== $data[$n]) hapus_gambar($row[$n]);
        }
        flash('success', "Data {$cfg['label']} #$id berhasil diperbarui.");
      } else {
        $nama = implode(",", array_map(fn($n) => "`$n`", array_keys($data)));
        $tanya = implode(",", array_fill(0, count($data), "?"));
        $stmt = $pdo->prepare("INSERT INTO `$t` ($nama) VALUES ($tanya)");
        $stmt->execute(array_values($data));
        flash('success', "Data {$cfg['label']} baru berhasil ditambahkan (ID " . $pdo->lastInsertId() . ").");
      }
      header("Location: " . url_tabel($t));
      exit;
    } catch (PDOException $e) {
      $errors['_db'] = pesan_db($e);
    }
  }
  foreach ($baru as $p) hapus_gambar($p); // simpan gagal: buang file yang baru diunggah
}

// nilai awal untuk tampilan form
function nilai_form($n, $c) {
  global $old, $row, $edit;
  if ($old && array_key_exists($n, $old)) return $old[$n];
  if ($edit && $row) {
    $v = $row[$n];
    if ($c['type'] === 'datetime' && $v) return str_replace(' ', 'T', $v);
    return $v;
  }
  if ($c['type'] === 'bool') return ($c['default'] ?? '0') === '1' ? 1 : 0;
  return $c['default'] === 'CURRENT_TIMESTAMP' ? '' : ($c['default'] ?? '');
}

$judul = ($edit ? "Ubah " : "Tambah ") . $cfg['label'];
layout_atas($judul, $t, [[$cfg['label'], url_tabel($t)], $edit ? "Ubah #$id" : "Tambah"]);
?>
<div class="row">
  <div class="col-lg-8">
    <div class="card card-primary card-outline mb-4">
      <div class="card-header"><h3 class="card-title"><?= h($judul) ?> <?= $edit ? '(ID ' . h($id) . ')' : '' ?></h3></div>
      <form method="post" action="form.php?t=<?= h($t) ?>" enctype="multipart/form-data" novalidate>
        <input type="hidden" name="csrf" value="<?= h(csrf_token()) ?>">
        <input type="hidden" name="t" value="<?= h($t) ?>">
        <?php if ($edit) { ?><input type="hidden" name="id" value="<?= h($id) ?>"><?php } ?>

        <div class="card-body">
          <?php if (!empty($errors['_db'])) { ?>
            <div class="alert alert-danger"><?= h($errors['_db']) ?></div>
          <?php } ?>

          <?php foreach ($fields as $n => $c) {
            $v = nilai_form($n, $c);
            $err = $errors[$n] ?? '';
            $idf = 'f_' . $n;
            $kelas = 'form-control' . ($err ? ' is-invalid' : '');
            $wajib = $c['required'] && !($c['type'] === 'password' && $edit); ?>
            <div class="mb-3">
              <?php if ($c['type'] === 'bool') { ?>
                <div class="form-check form-switch">
                  <input class="form-check-input" type="checkbox" role="switch" id="<?= $idf ?>" name="<?= $idf ?>" value="1" <?= $v ? 'checked' : '' ?>>
                  <label class="form-check-label" for="<?= $idf ?>"><?= h($c['label']) ?></label>
                </div>
              <?php } else { ?>
                <label for="<?= $idf ?>" class="form-label"><?= h($c['label']) ?><?= $wajib ? ' <span class="text-danger">*</span>' : '' ?></label>

                <?php if ($c['type'] === 'textarea') { ?>
                  <textarea class="<?= $kelas ?>" id="<?= $idf ?>" name="<?= $idf ?>" rows="5"><?= h($v) ?></textarea>

                <?php } elseif ($c['type'] === 'fk') { $o = opsi_relasi($c['ref']); ?>
                  <select class="form-select<?= $err ? ' is-invalid' : '' ?>" id="<?= $idf ?>" name="<?= $idf ?>">
                    <option value="">— pilih <?= h($TABEL[$c['ref']]['label']) ?> —</option>
                    <?php foreach ($o as $ov => $ot) { ?>
                      <option value="<?= h($ov) ?>" <?= (string) $v === (string) $ov ? 'selected' : '' ?>><?= h($ot) ?></option>
                    <?php } ?>
                  </select>

                <?php } elseif ($c['type'] === 'select') { ?>
                  <select class="form-select<?= $err ? ' is-invalid' : '' ?>" id="<?= $idf ?>" name="<?= $idf ?>">
                    <?php foreach ($c['options'] as $op) { ?>
                      <option value="<?= h($op) ?>" <?= (string) $v === $op || ($v === '' && $op === 'editor') ? 'selected' : '' ?>><?= h($op) ?></option>
                    <?php } ?>
                  </select>

                <?php } elseif ($c['type'] === 'password') { ?>
                  <input type="password" class="<?= $kelas ?>" id="<?= $idf ?>" name="<?= $idf ?>" autocomplete="new-password"
                         placeholder="<?= $edit ? 'Kosongkan jika tidak diganti' : 'Minimal 6 karakter' ?>">

                <?php } elseif ($c['type'] === 'image') { ?>
                  <input type="text" class="<?= $kelas ?>" id="<?= $idf ?>" name="<?= $idf ?>" maxlength="<?= (int) $c['max'] ?>"
                         value="<?= h($v) ?>" placeholder="mis. images/member1.jpg">
                  <div class="mt-2">
                    <input type="file" class="form-control form-control-sm" name="file_<?= h($n) ?>" accept="image/*">
                    <div class="form-text">Isi path gambar yang sudah ada di folder website, atau unggah file baru (JPG/PNG/GIF/WEBP, maks. 2 MB).</div>
                  </div>
                  <?php if ($v) { ?>
                    <img src="<?= h(url_gambar($v)) ?>" alt="Pratinjau" class="img-thumbnail mt-2" style="max-height:120px" onerror="this.style.display='none'">
                  <?php } ?>

                <?php } else {
                  $tipe = ['number' => 'number', 'date' => 'date', 'datetime' => 'datetime-local'][$c['type']] ?? 'text'; ?>
                  <input type="<?= $tipe ?>" class="<?= $kelas ?>" id="<?= $idf ?>" name="<?= $idf ?>"
                         value="<?= h($v) ?>" <?= $c['max'] ? 'maxlength="' . (int) $c['max'] . '"' : '' ?>
                         <?= $c['type'] === 'datetime' ? 'step="1"' : '' ?>>
                <?php } ?>

                <?php if ($err) { ?><div class="invalid-feedback d-block"><?= h($err) ?></div><?php } ?>
              <?php } ?>
            </div>
          <?php } ?>

          <?php if (!$fields) { ?><p class="text-body-secondary">Tabel ini tidak punya kolom yang bisa diisi.</p><?php } ?>
        </div>

        <div class="card-footer d-flex gap-2">
          <button type="submit" class="btn btn-primary"><i class="bi bi-check-lg me-1"></i><?= $edit ? 'Simpan Perubahan' : 'Simpan' ?></button>
          <a href="<?= h(url_tabel($t)) ?>" class="btn btn-outline-secondary">Batal</a>
        </div>
      </form>
    </div>
  </div>
</div>
<?php layout_bawah();
