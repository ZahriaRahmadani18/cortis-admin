<?php
// Kerangka halaman AdminLTE (header, sidebar, footer) untuk dashboard CORTIS.
// Tema gelap + magenta: lihat css/cortis-theme.css

function layout_atas($judul, $aktif = '', array $breadcrumb = [], $sub = '') {
  $grup = tabel_per_grup();
  $flash = flash();
  ?>
<!doctype html>
<html lang="id" data-bs-theme="dark" data-lte-color-mode="off">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="color-scheme" content="dark" />
  <title><?= h($judul) ?> | CORTIS Admin</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fontsource/source-sans-3@5.0.12/index.css" crossorigin="anonymous" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.11.0/styles/overlayscrollbars.min.css" crossorigin="anonymous" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css" crossorigin="anonymous" />
  <link rel="stylesheet" href="./css/adminlte.css" />
  <link rel="stylesheet" href="./css/cortis-theme.css" />
</head>
<body class="layout-fixed sidebar-expand-lg">
<div class="app-wrapper">

  <nav class="app-header navbar navbar-expand">
    <div class="container-fluid">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="#" role="button" id="tombol-sidebar" aria-label="Buka/tutup menu">
            <i class="bi bi-list fs-4"></i>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <span class="cx-admin-chip"><span class="cx-avatar" style="width:30px;height:30px;flex-basis:30px;font-size:.8rem">A</span> Admin</span>
        </li>
      </ul>
    </div>
  </nav>

  <aside class="app-sidebar shadow">
    <div class="sidebar-brand">
      <a href="index.php" class="brand-link">
        <span class="cx-logo"><b>C</b><img src="<?= h(url_gambar('images/logo.jpeg')) ?>" alt="" onerror="this.remove()"></span>
        <span class="cx-brand-text">CORTIS</span>
      </a>
    </div>
    <div class="sidebar-wrapper">
      <div class="cx-profile">
        <span class="cx-avatar">A</span>
        <div><b>Admin</b><small>Administrator</small></div>
      </div>
      <nav class="mt-2">
        <ul class="nav sidebar-menu flex-column" role="menu">
          <li class="nav-item">
            <a href="index.php" class="nav-link <?= $aktif === 'index' ? 'active' : '' ?>">
              <i class="nav-icon bi bi-house-door-fill"></i><p>Dashboard</p>
            </a>
          </li>
        </ul>
        <?php foreach ($grup as $nama_grup => $items) { ?>
          <?php if (count($items) === 1) { // grup berisi satu tabel: tautan langsung (mis. Home, Members)
            $nama = array_key_first($items); $cfg = $items[$nama]; ?>
            <ul class="nav sidebar-menu flex-column" role="menu">
              <li class="nav-item">
                <a href="<?= h(url_tabel($nama)) ?>" class="nav-link <?= $aktif === $nama ? 'active' : '' ?>">
                  <i class="nav-icon bi <?= h($cfg['icon']) ?>"></i><p><?= h($nama_grup) ?></p>
                </a>
              </li>
            </ul>
            <?php continue; } ?>
          <details class="cx-group" <?= isset($items[$aktif]) ? 'open' : '' ?>>
            <summary><?= h($nama_grup) ?></summary>
            <ul class="nav sidebar-menu flex-column" role="menu">
              <?php foreach ($items as $nama => $cfg) { ?>
                <li class="nav-item">
                  <a href="<?= h(url_tabel($nama)) ?>" class="nav-link <?= $aktif === $nama ? 'active' : '' ?>">
                    <i class="nav-icon bi <?= h($cfg['icon']) ?>"></i><p><?= h($cfg['label']) ?></p>
                  </a>
                </li>
              <?php } ?>
            </ul>
          </details>
        <?php } ?>
      </nav>
    </div>
  </aside>

  <main class="app-main">
    <div class="app-content-header">
      <div class="container-fluid">
        <div class="row align-items-end">
          <div class="col-sm-7">
            <h1 class="mb-0"><?= h($judul) ?></h1>
            <?php if ($sub !== '') { ?><p class="cx-sub"><?= h($sub) ?></p><?php } ?>
          </div>
          <div class="col-sm-5">
            <ol class="breadcrumb float-sm-end mb-0">
              <li class="breadcrumb-item"><a href="index.php">Beranda</a></li>
              <?php foreach ($breadcrumb as $b) { ?>
                <?php if (is_array($b)) { ?>
                  <li class="breadcrumb-item"><a href="<?= h($b[1]) ?>"><?= h($b[0]) ?></a></li>
                <?php } else { ?>
                  <li class="breadcrumb-item active" aria-current="page"><?= h($b) ?></li>
                <?php } ?>
              <?php } ?>
            </ol>
          </div>
        </div>
      </div>
    </div>
    <div class="app-content">
      <div class="container-fluid">
        <?php if ($flash) { ?>
          <div class="alert alert-<?= h($flash[0]) ?> alert-dismissible fade show" role="alert">
            <?= h($flash[1]) ?>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Tutup"></button>
          </div>
        <?php } ?>
<?php
}

function layout_bawah() {
  ?>
      </div>
    </div>
  </main>

  <footer class="app-footer">
    <div class="float-end d-none d-sm-inline">Praktikum Pemrograman Web</div>
    <strong>CORTIS Admin Dashboard</strong> · AdminLTE 4
  </footer>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
<script>
  // Tombol buka/tutup sidebar (tanpa bergantung pada js/adminlte.js)
  document.getElementById('tombol-sidebar').addEventListener('click', function (e) {
    e.preventDefault();
    document.body.classList.toggle(window.innerWidth >= 992 ? 'sidebar-collapse' : 'sidebar-open');
  });
</script>
</body>
</html>
<?php
}
