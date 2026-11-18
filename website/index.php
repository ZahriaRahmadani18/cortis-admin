<?php
// Halaman utama website CORTIS — seluruh kontennya dibaca dari database cortis_db.
$CONFIG = require __DIR__ . '/config.php';
require __DIR__ . '/koneksi.php';
require __DIR__ . '/includes/fungsi.php';

$bhs    = daftar_bahasa($pdo);
$menu   = ambil_menu($pdo, $bhs);
$banner = ambil_banner($pdo);
$about  = ambil_about($pdo, $bhs);
$slides = ambil_slides($pdo);
$members = ambil_members($pdo);
$social = ambil_social($pdo);
$tour   = ambil_tour($pdo, $bhs);
$lagu   = ambil_lagu($pdo);

function lbl($menu, $key, $def) { return $menu[$key]['label']['en'] ?? $def; }

// Data untuk JavaScript (terjemahan 3 bahasa dari database)
$DATA_JS = [
  'menus'   => array_map(fn($m) => $m['label'], $menu),
  'about'   => $about,
  'debut'   => $banner['debut_date'],
  'members' => array_map(fn($m) => ['name' => $m['stage_name'], 'birth' => $m['birth_date']], $members),
  'tour'    => ['name' => $tour['name'], 'events' => array_map(fn($e) => [
                 'city' => $e['city'], 'location' => $e['location'], 'venue' => $e['venue'], 'date' => $e['event_date']
               ], $tour['events'])],
];
?>
<!doctype html>
<html lang="id">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>CORTIS</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link
    href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,800;0,900;1,800;1,900&family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;1,400;1,600&display=swap"
    rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
  <link rel="stylesheet" href="styles.css" />
</head>

<body>
  <!-- ================= VIEW: HOME / ABOUT ================= -->
  <div id="view-home" class="app-view view-home-root active-view">
    <!-- NAVBAR -->
    <nav class="navbar">
      <div class="logo">
        <img src="images/logo.jpeg" alt="CORTIS Logo" onclick="scrollToSection('home')" />
      </div>

      <ul class="menu">
        <li class="active" onclick="scrollToSection('home')" data-nav="home" id="nav-home">
          <?= h(lbl($menu, 'home', 'HOME')) ?>
        </li>
        <li onclick="scrollToSection('about')" data-nav="about" id="nav-about">
          <?= h(lbl($menu, 'about', 'ABOUT')) ?>
        </li>
        <li onclick="switchView('news')" id="nav-news"><?= h(lbl($menu, 'news', 'NEWS')) ?></li>
        <li onclick="switchView('tour')" id="nav-tour"><?= h(lbl($menu, 'tour', 'TOUR')) ?></li>
        <li onclick="switchView('music')" id="nav-music"><?= h(lbl($menu, 'music', 'MUSIC')) ?></li>
        <li onclick="openOfficialShop(event)" id="nav-shop" title="Buka Toko Resmi (Tab Baru)"><?= h(lbl($menu, 'shop', 'SHOP')) ?> <i
            class="fa-solid fa-arrow-up-right-from-square"
            style="font-size: 0.72em; margin-left: 3px; vertical-align: baseline;"></i></li>
      </ul>

      <div class="language">
        <button class="lang-btn" id="home-langBtn">ENG ▼</button>
        <div class="language-menu" id="home-languageMenu">
          <p>🇬🇧 English</p>
          <p>🇮🇩 Indonesia</p>
          <p>🇰🇷 Korea</p>
        </div>
      </div>
    </nav>

    <!-- ══════════════ HOME ══════════════ -->
    <section id="home">
      <video id="myVideo" autoplay muted loop playsinline>
        <source src="<?= h(url_media($banner['video_url'])) ?>" type="video/mp4" />
      </video>

      <div class="home-overlay"></div>

      <div class="hero-content">
        <h1>CORTIS</h1>
        <p id="subtitle">DEBUT • <?= h(date('Y.m.d', strtotime($banner['debut_date']))) ?></p>
      </div>

      <button id="soundToggle" class="sound-btn">🔇</button>
    </section>

    <!-- ══════════════ ABOUT ══════════════ -->
    <section id="about">
      <!-- TITLE -->
      <div class="page-title">
        <h1 id="aboutTitle">ABOUT CORTIS</h1>
        <p id="aboutSubtitle">
          Discover the story behind CORTIS and meet the members.
        </p>
      </div>

      <!-- HERO SLIDER -->
      <div class="hero-slider">
        <div class="slider-track">
<?php foreach ($slides as $i => $sl) { ?>
          <div class="slide<?= $i === 0 ? ' active' : '' ?>"><img src="<?= h(url_media($sl['image_url'])) ?>" alt="CORTIS <?= $i + 1 ?>" /></div>
<?php } ?>
        </div>
        <button class="slider-btn prev" id="home-prevBtn">&#8249;</button>
        <button class="slider-btn next" id="home-nextBtn">&#8250;</button>
        <div class="slider-dots" id="sliderDots"></div>
      </div>

      <!-- DESCRIPTION -->
      <div class="about-description">
        <p id="aboutDesc"><?= h($about['en'] ?? '') ?></p>
      </div>

      <!-- MEMBERS -->
      <div class="members">
        <h2 id="memberTitle">MEMBER</h2>
        <div class="member-grid">
<?php foreach ($members as $m) { ?>
          <div class="member-card">
            <img src="<?= h(url_media($m['photo_url'])) ?>" alt="<?= h($m['stage_name']) ?>" />
            <h3 class="member-name"><?= h($m['stage_name']) ?></h3>
            <span class="member-birth"><?= h(date('F j. Y', strtotime($m['birth_date']))) ?></span>
          </div>
<?php } ?>
        </div>
      </div>
    </section>

    <footer>
      <p class="footer-label" data-id="Ikuti kami" data-en="Follow us" data-ko="팔로우하기">Follow us</p>
      <div class="social">
<?php foreach ($social as $sc) { ?>
        <a href="<?= h($sc['url']) ?>" target="_blank" rel="noopener noreferrer" aria-label="<?= h(ucfirst($sc['platform'])) ?>"
          class="social-link" data-url="<?= h($sc['url']) ?>"><i class="<?= h(ikon_social($sc['platform'])) ?>"></i></a>
<?php } ?>
      </div>
      <p class="footer-copy">© 2025 CORTIS · BIGHIT MUSIC</p>
    </footer>

  </div>

  <!-- ================= VIEW: NEWS ================= -->
  <div id="view-news" class="app-view view-news-root">

    <div class="bg-overlay"></div>

    <main class="news-page">

      <section class="news-header">
        <!-- Judul Utama dengan atribut translasi -->
        <h1 id="newsTitle" data-id="BERITA" data-en="NEWS" data-ko="뉴스">NEWS</h1>

        <div class="search-container">
          <input type="text" id="searchInput" placeholder="Search news...">
          <button type="button" class="search-btn">🔍</button>
        </div>
      </section>

      <section class="news-grid" id="newsGrid"></section>
    </main>


  </div>

  <!-- ================= VIEW: TOUR ================= -->
  <div id="view-tour" class="app-view view-tour-root">

    <!-- TOUR PAGE -->

    <section class="tour-page">

      <div class="tour-frame">

        <div class="tour-title-box">
          CORTIS
        </div>

        <h1 class="tour-title" id="tourTitle"><?= h($tour['name']['en'] ?? '') ?></h1>

        <h3 class="tour-subtitle" id="tourSubtitle">
          TOUR
        </h3>

        <div class="tour-list">
<?php foreach ($tour['events'] as $i => $ev) { $n = $i + 1; ?>
          <div class="tour-card">
            <h2 id="city<?= $n ?>"><?= h($ev['city']['en'] ?? '') ?></h2>
            <p id="location<?= $n ?>">📍 <?= h($ev['location']['en'] ?? '') ?></p>
            <p id="venue<?= $n ?>">🏟 <?= h($ev['venue']['en'] ?? '') ?></p>
            <p id="date<?= $n ?>">📅 <?= h(date('F j, Y', strtotime($ev['event_date']))) ?></p>
          </div>
<?php } ?>
        </div>

    </section>


  </div>

  <!-- ================= VIEW: MUSIC ================= -->
  <div id="view-music" class="app-view view-music-root">
    <video id="bgVideo" autoplay muted loop>
      <source src="" type="video/mp4" />
    </video>
    <div class="bg-overlay"></div>

    <section class="music-page">
      <h1>MUSIC PLAYLIST</h1>

      <div class="playlist">
<?php foreach ($lagu as $i => $sg) { ?>
        <div class="song-card" data-title="<?= h($sg['title']) ?>" data-artist="<?= h($sg['artist_name']) ?>" data-video="<?= h(url_media($sg['mv_url'])) ?>"
          data-audio="<?= h(url_media($sg['audio_url'])) ?>" data-cover="<?= h(url_media($sg['cover_url'])) ?>" data-release-date="<?= h(date('F j, Y', strtotime($sg['release_date']))) ?>"
          data-streams="<?= (int)$sg['stream_count'] ?>" data-lyrics="<?= h($sg['lrc']) ?>">
          <div class="cover-wrapper">
            <img src="<?= h(url_media($sg['cover_url'])) ?>" alt="cover" />
            <div class="play-overlay">▶</div>
          </div>
          <div class="song-info">
            <div class="song-title-row">
              <h3><?= h($sg['title']) ?></h3>
              <span class="song-rank-badge">#<?= $i + 1 ?></span>
            </div>
            <p class="song-artist"><?= h($sg['artist_name']) ?></p>
            <div class="song-meta">
              <span class="song-release"><i class="fa-regular fa-calendar-alt"></i> Release: <?= h(date('M j, Y', strtotime($sg['release_date']))) ?></span>
              <span class="song-streams"><i class="fa-solid fa-headphones"></i> <?= number_format((int)$sg['stream_count']) ?> streams</span>
            </div>
          </div>
        </div>
<?php } ?>
      </div>
    </section>

    <div id="playerModal">
      <div class="player-container">
        <video id="playerVideo" autoplay muted loop></video>
        <div class="player-overlay"></div>

        <button id="closeBtn">✕</button>

        <div class="player-left">
          <img id="playerCover" alt="cover" />
          <h2 id="playerTitle"></h2>
          <p id="playerArtist"></p>
          <div class="player-extra-meta">
            <span id="playerReleaseDate"><i class="fa-regular fa-calendar-alt"></i> Release Date: -</span>
            <span id="playerStreams" class="player-streams"><i class="fa-solid fa-headphones"></i> - streams</span>
          </div>
        </div>

        <div class="player-right">
          <div class="lyrics-box">
            <h3>Lyrics</h3>
            <div id="lyricsContent"></div>
          </div>

          <div class="controls">
            <div class="progress-container">
              <span id="currentTime">0:00</span>
              <input type="range" id="mainProgressBar" value="0" />
              <span id="duration">0:00</span>
            </div>
            <div class="buttons">
              <button id="shuffleBtn">🔀</button>
              <button id="prevBtn">⏮</button>
              <button id="playBtn">▶</button>
              <button id="nextBtn">⏭</button>
              <button id="repeatBtn">🔁</button>
            </div>
            <div class="volume-box">
              🔊
              <input type="range" id="volumeSlider" min="0" max="1" step="0.1" value="1" />
            </div>
          </div>
        </div>
      </div>
    </div>

    <audio id="audioPlayer"></audio>

  </div>

  <script>window.CORTIS = <?= json_encode($DATA_JS, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_HEX_TAG | JSON_HEX_AMP) ?>;</script>
  <script src="script.js"></script>
</body>

</html>