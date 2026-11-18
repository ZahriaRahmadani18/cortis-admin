<?php
// Fungsi bantu untuk membaca data website dari database cortis_db.
// Semua query memakai prepared statement (PDO).

function h($s) { return htmlspecialchars((string)$s, ENT_QUOTES, 'UTF-8'); }

// Path media dari database -> URL yang bisa dibuka browser.
// "images/..." dan "media/..." ada di folder website; "uploads/..." berasal dari dashboard admin.
function url_media($path) {
  global $CONFIG;
  $path = trim((string)$path);
  if ($path === '') return '';
  if (preg_match('#^(https?:)?//#i', $path) || $path[0] === '/') return $path;
  if (strpos($path, 'uploads/') === 0) return rtrim($CONFIG['url_admin'], '/') . '/' . $path;
  return $path;
}

// Kode bahasa di database: en, id, ko. Ambil id bahasa -> kode.
function daftar_bahasa(PDO $pdo) {
  $out = [];
  foreach ($pdo->query("SELECT language_id, code FROM languages") as $r) $out[$r['language_id']] = $r['code'];
  return $out;
}

// Menu navigasi: ['home' => ['en'=>'HOME','id'=>'BERANDA','ko'=>'홈'], ...] urut sort_order
function ambil_menu(PDO $pdo, array $bhs) {
  $menu = [];
  $sql = "SELECT m.menu_key, m.url, m.is_external, t.language_id, t.label
          FROM navigation_menus m
          LEFT JOIN navigation_menu_translations t ON t.menu_id = m.menu_id
          WHERE m.is_active = 1 ORDER BY m.sort_order, m.menu_id";
  foreach ($pdo->query($sql) as $r) {
    $k = $r['menu_key'];
    if (!isset($menu[$k])) $menu[$k] = ['url' => $r['url'], 'external' => (int)$r['is_external'], 'label' => []];
    if ($r['language_id'] !== null && isset($bhs[$r['language_id']])) $menu[$k]['label'][$bhs[$r['language_id']]] = $r['label'];
  }
  return $menu;
}

function ambil_banner(PDO $pdo) {
  $r = $pdo->query("SELECT * FROM home_banner WHERE is_active = 1 ORDER BY banner_id DESC LIMIT 1")->fetch();
  return $r ?: ['video_url' => 'media/video.mp4', 'debut_date' => '2025-08-18'];
}

// Deskripsi About per bahasa
function ambil_about(PDO $pdo, array $bhs) {
  $out = [];
  $sql = "SELECT t.language_id, t.description FROM about_content_translations t
          JOIN about_content a ON a.about_id = t.about_id ORDER BY a.about_id";
  foreach ($pdo->query($sql) as $r) {
    if (isset($bhs[$r['language_id']]) && !isset($out[$bhs[$r['language_id']]])) $out[$bhs[$r['language_id']]] = $r['description'];
  }
  return $out;
}

function ambil_slides(PDO $pdo) {
  return $pdo->query("SELECT image_url FROM about_slides WHERE is_active = 1 ORDER BY sort_order, slide_id")->fetchAll();
}

function ambil_members(PDO $pdo) {
  return $pdo->query("SELECT stage_name, birth_date, photo_url FROM members WHERE is_active = 1 ORDER BY sort_order, member_id")->fetchAll();
}

function ambil_social(PDO $pdo) {
  return $pdo->query("SELECT platform, url FROM social_links WHERE is_active = 1 ORDER BY sort_order, link_id")->fetchAll();
}

// Ikon Font Awesome untuk tiap platform
function ikon_social($platform) {
  $peta = ['youtube' => 'fab fa-youtube', 'x' => 'fab fa-x-twitter', 'twitter' => 'fab fa-x-twitter',
           'instagram' => 'fab fa-instagram', 'tiktok' => 'fab fa-tiktok', 'facebook' => 'fab fa-facebook',
           'spotify' => 'fab fa-spotify', 'weverse' => 'fa-solid fa-globe'];
  return $peta[strtolower($platform)] ?? 'fa-solid fa-link';
}

// Tour aktif pertama: nama per bahasa + daftar event (kota/lokasi/venue per bahasa)
function ambil_tour(PDO $pdo, array $bhs) {
  $tour = $pdo->query("SELECT tour_id FROM tours WHERE is_active = 1 ORDER BY tour_id LIMIT 1")->fetch();
  if (!$tour) return ['name' => [], 'events' => []];
  $tid = (int)$tour['tour_id'];

  $name = [];
  $st = $pdo->prepare("SELECT language_id, tour_name FROM tour_translations WHERE tour_id = ?");
  $st->execute([$tid]);
  foreach ($st->fetchAll() as $r) if (isset($bhs[$r['language_id']])) $name[$bhs[$r['language_id']]] = $r['tour_name'];

  $st = $pdo->prepare("SELECT event_id, event_date FROM tour_events WHERE tour_id = ? AND is_active = 1 ORDER BY sort_order, event_id");
  $st->execute([$tid]);
  $events = [];
  foreach ($st->fetchAll() as $e) {
    $e['city'] = $e['location'] = $e['venue'] = [];
    $events[$e['event_id']] = $e;
  }
  if ($events) {
    $in = implode(',', array_fill(0, count($events), '?'));
    $st = $pdo->prepare("SELECT event_id, language_id, city_name, location_text, venue_name FROM tour_event_translations WHERE event_id IN ($in)");
    $st->execute(array_keys($events));
    foreach ($st->fetchAll() as $r) {
      if (!isset($bhs[$r['language_id']])) continue;
      $c = $bhs[$r['language_id']];
      $events[$r['event_id']]['city'][$c] = $r['city_name'];
      $events[$r['event_id']]['location'][$c] = $r['location_text'];
      $events[$r['event_id']]['venue'][$c] = $r['venue_name'];
    }
  }
  return ['name' => $name, 'events' => array_values($events)];
}

// Lagu aktif + lirik (format LRC "[mm:ss.cc]teks" dari tabel song_lyric_lines)
function ambil_lagu(PDO $pdo) {
  $songs = $pdo->query("SELECT * FROM songs WHERE is_active = 1 ORDER BY stream_count DESC, release_date DESC, song_id")->fetchAll();
  $lirik = [];
  foreach ($pdo->query("SELECT song_id, start_time_ms, lyric_text FROM song_lyric_lines ORDER BY song_id, line_no") as $r) {
    $ms = (int)$r['start_time_ms'];
    $lrc = sprintf("[%02d:%02d.%02d]%s", intdiv($ms, 60000), intdiv($ms % 60000, 1000), intdiv($ms % 1000, 10), $r['lyric_text']);
    $lirik[$r['song_id']][] = $lrc;
  }
  foreach ($songs as &$s) $s['lrc'] = implode("\n", $lirik[$s['song_id']] ?? []);
  unset($s);
  return $songs;
}

// Berita aktif (judul asli = Indonesia; EN/KO dari news_translations)
function ambil_berita(PDO $pdo, array $bhs, $batas = 15) {
  $batas = max(1, (int)$batas);
  $rows = $pdo->query("SELECT news_id, source_name, title, thumbnail_url, article_url, published_at
                       FROM news WHERE is_active = 1 ORDER BY published_at DESC, news_id DESC LIMIT $batas")->fetchAll();
  $trans = [];
  if ($rows) {
    $ids = array_column($rows, 'news_id');
    $in = implode(',', array_fill(0, count($ids), '?'));
    $st = $pdo->prepare("SELECT news_id, language_id, title FROM news_translations WHERE news_id IN ($in)");
    $st->execute($ids);
    foreach ($st->fetchAll() as $r) if (isset($bhs[$r['language_id']])) $trans[$r['news_id']][$bhs[$r['language_id']]] = $r['title'];
  }
  $out = [];
  foreach ($rows as $r) {
    $t = $trans[$r['news_id']] ?? [];
    $out[] = [
      'date'   => substr((string)$r['published_at'], 0, 10),
      'source' => $r['source_name'] ?: 'News',
      'url'    => $r['article_url'],
      'title'  => ['id' => $t['id'] ?? $r['title'], 'en' => $t['en'] ?? $r['title'], 'ko' => $t['ko'] ?? $r['title']],
      'image'  => $r['thumbnail_url'] ? url_media($r['thumbnail_url']) : null,
    ];
  }
  return $out;
}
