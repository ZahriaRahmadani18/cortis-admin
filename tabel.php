<?php
// READ: daftar data satu tabel (cari, urut, halaman) + tombol tambah/ubah/hapus
require_once __DIR__ . "/includes/fungsi.php";
require_once __DIR__ . "/includes/layout.php";

$t   = $_GET['t'] ?? '';
$cfg = ambil_tabel($t);
$pk  = $cfg['pk'];
$cols = $cfg['cols'];

// kolom yang ditampilkan di tabel
$kolom_list = array_keys(array_filter($cols, fn($c) => $c['list']));

// ---------- parameter: cari, urut, ukuran & halaman ----------
$q    = trim($_GET['q'] ?? '');
$sort = $_GET['sort'] ?? $pk;
if (!in_array($sort, $kolom_list, true)) $sort = $pk;
$dir  = strtolower($_GET['dir'] ?? 'asc') === 'desc' ? 'desc' : 'asc';
$ukuran_ok = [10, 25, 50];
$size = (int) ($_GET['size'] ?? 10);
if (!in_array($size, $ukuran_ok, true)) $size = 10;
$page = max(1, (int) ($_GET['page'] ?? 1));
// Khusus Berita: pilih bahasa judul yang ditampilkan (ID = judul asli, EN/KO = dari news_translations)
$lang = ($t === 'news') ? ($_GET['lang'] ?? 'id') : 'id';
if (!in_array($lang, ['id', 'en', 'ko'], true)) $lang = 'id';

// ---------- WHERE pencarian (kolom teks + ID) ----------
$where = "";
$param = [];
if ($q !== '') {
  $like = "%" . str_replace(['!', '%', '_'], ['!!', '!%', '!_'], $q) . "%";
  $bag = ["CAST(`$pk` AS CHAR) LIKE ? ESCAPE '!'"];
  $param[] = $like;
  foreach ($cols as $n => $c) {
    if (in_array($c['type'], ['text', 'textarea', 'image', 'select'], true)) {
      $bag[] = "`$n` LIKE ? ESCAPE '!'";
      $param[] = $like;
    }
  }
  $where = " WHERE " . implode(" OR ", $bag);
}

// ---------- hitung total & ambil data satu halaman ----------
$st = $pdo->prepare("SELECT COUNT(*) FROM `$t`" . $where);
$st->execute($param);
$total = (int) $st->fetchColumn();
$total_hal = max(1, (int) ceil($total / $size));
if ($page > $total_hal) $page = $total_hal;
$offset = ($page - 1) * $size;

$sqlcols = implode(",", array_map(fn($c) => "`$c`", $kolom_list));
$order = "`$sort` " . strtoupper($dir) . ($sort !== $pk ? ", `$pk` ASC" : "");
$st = $pdo->prepare("SELECT $sqlcols FROM `$t`" . $where . " ORDER BY $order LIMIT $size OFFSET $offset");
$st->execute($param);
$rows = $st->fetchAll();

if ($t === 'news' && $lang !== 'id' && $rows) {
  $ids = array_column($rows, 'news_id');
  $in = implode(',', array_fill(0, count($ids), '?'));
  $st = $pdo->prepare("SELECT nt.news_id, nt.title FROM news_translations nt JOIN languages l ON l.language_id = nt.language_id WHERE l.code = ? AND nt.news_id IN ($in)");
  $st->execute(array_merge([$lang], $ids));
  $terjemah = [];
  foreach ($st->fetchAll() as $x) $terjemah[$x['news_id']] = $x['title'];
  foreach ($rows as &$rr) if (isset($terjemah[$rr['news_id']])) $rr['title'] = $terjemah[$rr['news_id']];
  unset($rr);
}

$dari = $total ? $offset + 1 : 0;
$sampai = min($offset + $size, $total);

function u(array $ubah = []) {
  global $t, $q, $sort, $dir, $size, $page, $lang;
  return url_tabel($t, array_merge(['q' => $q, 'sort' => $sort, 'dir' => $dir, 'size' => $size, 'page' => $page,
                                    'lang' => ($t === 'news' && $lang !== 'id') ? $lang : ''], $ubah));
}

// Tombol Ubah + Hapus (hapus lewat POST + token CSRF)
function tombol_aksi($t, $id, $kelas = '') {
  ob_start(); ?>
  <span class="<?= $kelas ?>">
    <a href="form.php?t=<?= h($t) ?>&id=<?= h($id) ?>" class="btn btn-sm btn-edit" title="Ubah" aria-label="Ubah">
      <i class="bi bi-pencil-square"></i> Ubah
    </a>
    <form method="post" action="hapus.php" class="d-inline"
          onsubmit="return confirm('Yakin hapus data ini? Data yang terhubung (anak tabel) bisa ikut terhapus.');">
      <input type="hidden" name="csrf" value="<?= h(csrf_token()) ?>">
      <input type="hidden" name="t" value="<?= h($t) ?>">
      <input type="hidden" name="id" value="<?= h($id) ?>">
      <button type="submit" class="btn btn-sm btn-hapus" title="Hapus" aria-label="Hapus"><i class="bi bi-trash"></i> Hapus</button>
    </form>
  </span>
  <?php return ob_get_clean();
}

layout_atas($cfg['label'], $t, [$cfg['group'], $cfg['label']], "Kelola data " . strtolower($cfg['label']) . " website CORTIS");
?>
<div class="card mb-4">
  <div class="card-header">
    <div class="row g-2 align-items-center">
      <div class="col-12 col-md-4">
        <h3 class="card-title"><i class="bi <?= h($cfg['icon']) ?> me-1"></i> Data <?= h($cfg['label']) ?>
          <small class="text-body-secondary">(<?= h($t) ?>)</small></h3>
      </div>
      <div class="col-12 col-md-8">
        <div class="d-flex flex-wrap justify-content-md-end gap-2">
          <?php if ($t === 'news') { ?>
            <div class="cx-lang" title="Bahasa judul berita yang ditampilkan">
              <?php foreach (['id' => 'ID', 'en' => 'EN', 'ko' => 'KO'] as $kode => $nama_bhs) { ?>
                <a href="<?= h(u(['lang' => $kode === 'id' ? '' : $kode, 'page' => 1])) ?>" class="<?= $lang === $kode ? 'on' : '' ?>"><?= $nama_bhs ?></a>
              <?php } ?>
            </div>
          <?php } ?>
          <form method="get" action="tabel.php" class="d-flex flex-wrap gap-2">
            <input type="hidden" name="t" value="<?= h($t) ?>">
            <?php if ($t === 'news' && $lang !== 'id') { ?><input type="hidden" name="lang" value="<?= h($lang) ?>"><?php } ?>
            <input type="hidden" name="sort" value="<?= h($sort) ?>">
            <input type="hidden" name="dir" value="<?= h($dir) ?>">
            <div class="input-group input-group-sm w-auto">
              <span class="input-group-text"><i class="bi bi-search"></i></span>
              <input type="search" name="q" class="form-control" placeholder="Cari data..." value="<?= h($q) ?>" style="width:180px">
            </div>
            <select name="size" class="form-select form-select-sm w-auto" onchange="this.form.submit()" aria-label="Jumlah baris">
              <?php foreach ($ukuran_ok as $s) { ?>
                <option value="<?= $s ?>" <?= $s === $size ? 'selected' : '' ?>><?= $s ?> / halaman</option>
              <?php } ?>
            </select>
            <?php if ($q !== '') { ?>
              <a href="<?= h(url_tabel($t)) ?>" class="btn btn-sm btn-outline-secondary">Reset</a>
            <?php } ?>
          </form>
          <?php if ($t === 'song_lyric_lines') { ?>
            <a href="lirik.php" class="btn btn-sm btn-outline-light"><i class="bi bi-clipboard-plus me-1"></i> Tempel Lirik</a>
          <?php } ?>
          <a href="form.php?t=<?= h($t) ?>" class="btn btn-sm btn-primary">
            <i class="bi bi-plus-lg me-1"></i> Tambah <?= h($cfg['label']) ?>
          </a>
        </div>
      </div>
    </div>
  </div>

  <?php if ($t === 'members') { ?>
  <!-- Tampilan kartu foto khusus Member -->
  <div class="card-body">
    <?php if (!$rows) { ?><p class="text-center text-body-secondary py-4 m-0">Data tidak ditemukan</p><?php } ?>
    <div class="row g-3">
      <?php foreach ($rows as $r) { ?>
        <div class="col-6 col-md-4 col-xl-3 col-xxl-2">
          <div class="cx-member">
            <div class="foto">
              <?php if ($r['photo_url']) { ?>
                <img src="<?= h(url_gambar($r['photo_url'])) ?>" alt="<?= h($r['stage_name']) ?>" loading="lazy"
                     onerror="this.replaceWith(document.createTextNode('<?= h(mb_substr($r['stage_name'], 0, 1)) ?>'))">
              <?php } else { echo h(mb_substr($r['stage_name'], 0, 1)); } ?>
            </div>
            <div class="info">
              <b><?= h($r['stage_name']) ?></b>
              <small><?= h(date('M j, Y', strtotime($r['birth_date']))) ?><?= $r['is_active'] ? '' : ' · nonaktif' ?></small>
              <?= tombol_aksi($t, $r[$pk], 'btns') ?>
            </div>
          </div>
        </div>
      <?php } ?>
    </div>
  </div>
  <?php } else { ?>
  <div class="card-body p-0">
    <div class="table-responsive">
      <table class="table table-hover align-middle m-0">
        <thead>
          <tr>
            <?php foreach ($kolom_list as $n) {
              $berikut = ($sort === $n && $dir === 'asc') ? 'desc' : 'asc';
              $ikon = $sort === $n ? ($dir === 'asc' ? 'bi-sort-up' : 'bi-sort-down') : 'bi-arrow-down-up'; ?>
              <th>
                <a href="<?= h(u(['sort' => $n, 'dir' => $berikut, 'page' => 1])) ?>" class="text-reset text-decoration-none">
                  <?= h($cols[$n]['label']) ?> <i class="bi <?= $ikon ?> small text-body-secondary"></i>
                </a>
              </th>
            <?php } ?>
            <th class="text-end">Aksi</th>
          </tr>
        </thead>
        <tbody>
          <?php if (!$rows) { ?>
            <tr><td colspan="<?= count($kolom_list) + 1 ?>" class="text-center text-body-secondary py-4">Data tidak ditemukan</td></tr>
          <?php } ?>
          <?php foreach ($rows as $r) { ?>
            <tr>
              <?php foreach ($kolom_list as $n) { ?>
                <td><?= tampil_nilai($cols[$n], $r[$n]) ?></td>
              <?php } ?>
              <td class="text-end text-nowrap"><?= tombol_aksi($t, $r[$pk]) ?></td>
            </tr>
          <?php } ?>
        </tbody>
      </table>
    </div>
  </div>
  <?php } ?>

  <div class="card-footer d-flex flex-wrap justify-content-between align-items-center gap-2">
    <div class="small text-body-secondary">Menampilkan <?= $dari ?>–<?= $sampai ?> dari <?= $total ?> data</div>
    <?php if ($total_hal > 1) {
      $awal = max(1, $page - 2); $akhir = min($total_hal, $page + 2); ?>
      <ul class="pagination pagination-sm m-0">
        <li class="page-item <?= $page <= 1 ? 'disabled' : '' ?>"><a class="page-link" href="<?= h(u(['page' => $page - 1])) ?>">«</a></li>
        <?php for ($i = $awal; $i <= $akhir; $i++) { ?>
          <li class="page-item <?= $i === $page ? 'active' : '' ?>"><a class="page-link" href="<?= h(u(['page' => $i])) ?>"><?= $i ?></a></li>
        <?php } ?>
        <li class="page-item <?= $page >= $total_hal ? 'disabled' : '' ?>"><a class="page-link" href="<?= h(u(['page' => $page + 1])) ?>">»</a></li>
      </ul>
    <?php } ?>
  </div>
</div>
<?php layout_bawah();