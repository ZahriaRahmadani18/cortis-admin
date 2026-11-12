<?php
require_once __DIR__ . "/includes/fungsi.php";
require_once __DIR__ . "/includes/layout.php";

function jumlah($tabel) {
  global $pdo;
  return (int) $pdo->query("SELECT COUNT(*) FROM `$tabel`")->fetchColumn();
}
$stat = [
  ['News',    'cx-stat-news',   'bi-newspaper',       'news',        'Berita'],
  ['Tour',    'cx-stat-tour',   'bi-calendar-event',  'tour_events', 'Jadwal Tour'],
  ['Music',   'cx-stat-music',  'bi-music-note-beamed', 'songs',     'Lagu'],
  ['Members', 'cx-stat-member', 'bi-people-fill',     'members',     'Member'],
];
$aktivitas = aktivitas_terbaru(6);
$warna = ['Home' => 'danger', 'About' => 'primary', 'News' => 'info', 'Tour' => 'warning', 'Music' => 'success', 'Members' => 'primary', 'Settings' => 'secondary'];

layout_atas("Dashboard", "index", [], "Selamat datang kembali, Admin!");
?>
<div class="row g-3 mb-4">
  <?php foreach ($stat as [$en, $kelas, $ikon, $tabel, $label]) { ?>
    <div class="col-6 col-xl-3">
      <a href="<?= h(url_tabel($tabel)) ?>" class="cx-stat <?= $kelas ?>">
        <i class="bi <?= $ikon ?>"></i>
        <div><span><?= h($en) ?> · <?= h($label) ?></span><b><?= jumlah($tabel) ?></b></div>
      </a>
    </div>
  <?php } ?>
</div>

<div class="row g-3 mb-2">
  <div class="col-lg-7">
    <div class="card h-100">
      <div class="card-header"><h3 class="card-title">Aktivitas Terbaru</h3></div>
      <ul class="cx-activity">
        <?php foreach ($aktivitas as $a) { ?>
          <li>
            <span class="ic"><i class="bi <?= h($a['icon']) ?>"></i></span>
            <div class="flex-grow-1">
              <a href="<?= h('form.php?t=' . $a['tabel'] . '&id=' . $a['id']) ?>" class="text-reset text-decoration-none">
                <?= h($a['label']) ?> diperbarui<?= $a['judul'] !== '' ? ': “' . h($a['judul']) . '”' : ' (#' . h($a['id']) . ')' ?>
              </a>
              <small><?= h(date('d/m/Y H:i', strtotime($a['waktu']))) ?></small>
            </div>
          </li>
        <?php } ?>
        <?php if (!$aktivitas) { ?><li class="text-body-secondary">Belum ada aktivitas.</li><?php } ?>
      </ul>
    </div>
  </div>
  <div class="col-lg-5">
    <div class="cx-hero">
      <img src="<?= h(url_gambar('images/group.jpg')) ?>" alt="" onerror="this.remove()">
      <div class="cap"><b>CORTIS</b><span>COLOR OUTSIDE THE LINES</span></div>
    </div>
  </div>
</div>

<?php foreach (tabel_per_grup() as $nama_grup => $items) {
  $w = $warna[$nama_grup] ?? 'primary'; ?>
  <h5 class="cx-grouptitle"><?= h($nama_grup) ?></h5>
  <div class="row">
    <?php foreach ($items as $nama => $cfg) { ?>
      <div class="col-12 col-sm-6 col-lg-4 col-xl-3">
        <a href="<?= h(url_tabel($nama)) ?>" class="text-decoration-none text-reset">
          <div class="info-box">
            <span class="info-box-icon text-bg-<?= $w ?> shadow-sm"><i class="bi <?= h($cfg['icon']) ?>"></i></span>
            <div class="info-box-content">
              <span class="info-box-text"><?= h($cfg['label']) ?></span>
              <span class="info-box-number"><?= jumlah($nama) ?> data</span>
              <small><?= h($nama) ?></small>
            </div>
          </div>
        </a>
      </div>
    <?php } ?>
  </div>
<?php }
layout_bawah();
