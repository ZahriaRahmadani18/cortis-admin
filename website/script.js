// ============================================================
// VIEW SWITCHER & SHOP HANDLER
// ============================================================
const OFFICIAL_SHOP_URL = 'https://cortisofficial.us/';

// Buka toko resmi di tab baru tanpa menutup website utama.
function openOfficialShop(e) {
  if (e && e.preventDefault) e.preventDefault();
  const a = document.createElement('a');
  a.href = OFFICIAL_SHOP_URL;
  a.target = '_blank';
  a.rel = 'noopener noreferrer';
  document.body.appendChild(a);
  a.click();
  document.body.removeChild(a);
}
window.openOfficialShop = openOfficialShop;

function switchView(name) {
  if (name === 'shop') {
    openOfficialShop();
    return;
  }
  var target = document.getElementById('view-' + name);
  if (target) target.scrollIntoView({ behavior: 'smooth' });
}


/* ============================================================ */

// ============================================================
// SCRIPT VIEW: HOME / ABOUT (asalnya dari index.html)
// ============================================================
// ─── SCROLL TO SECTION ───
function scrollToSection(id) {
  const el = document.getElementById(id);
  if (el) el.scrollIntoView({ behavior: "smooth" });
}

// ─── ACTIVE NAV ON SCROLL ───
const sections = ["home", "about", "view-news", "view-tour", "view-music"];
const navItems = {
  home: document.getElementById("nav-home"),
  about: document.getElementById("nav-about"),
  "view-news": document.getElementById("nav-news"),
  "view-tour": document.getElementById("nav-tour"),
  "view-music": document.getElementById("nav-music"),
};

const observer = new IntersectionObserver(
  (entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        sections.forEach(
          (s) => navItems[s] && navItems[s].classList.remove("active"),
        );
        const id = entry.target.id;
        if (navItems[id]) navItems[id].classList.add("active");
      }
    });
  },
  { rootMargin: "-100px 0px -60% 0px", threshold: 0 },
);

sections.forEach((s) => {
  const el = document.getElementById(s);
  if (el) observer.observe(el);
});

// ─── VIDEO / SOUND ───
const video = document.getElementById("myVideo");
const soundBtn = document.getElementById("soundToggle");

window.onload = () => video.play();

soundBtn.onclick = () => {
  video.muted = !video.muted;
  video.volume = 1;
  soundBtn.innerHTML = video.muted ? "🔇" : "🔊";
};

// ─── LANGUAGE ───
const langBtn = document.getElementById("home-langBtn");
const languageMenu = document.getElementById("home-languageMenu");

langBtn.addEventListener("click", (e) => {
  e.stopPropagation();
  languageMenu.classList.toggle("show");
});

document.addEventListener("click", () =>
  languageMenu.classList.remove("show"),
);

const translations = {
  en: {
    langLabel: "ENG ▼",
    navHome: "HOME",
    navAbout: "ABOUT",
    navNews: "NEWS",
    navTour: "TOUR",
    navMusic: "MUSIC",
    navShop: "SHOP",
    subtitle: "DEBUT • 2025.08.18",
    aboutTitle: "ABOUT CORTIS",
    aboutSubtitle:
      "Discover the story behind CORTIS and meet the members.",
    aboutDesc:
      'CORTIS (MARTIN, JAMES, JUHOON, SEONGHYEON, and KEONHO) is the first boy band in 6 years to debut under BIGHIT MUSIC, the powerhouse label behind iconic global groups like BTS and TOMORROW X TOGETHER. The name CORTIS is an unconventional mix of six letters drawn from the phrase "COLOR OUTSIDE THE LINES," reflecting their determination to think beyond the boundaries defined by the world. True to their name, CORTIS is a crew of self-driven creatives who bring raw authenticity to everything they create, from music and choreography to video content. All five members draw from personal stories to showcase their inimitable creativity across songwriting, composition, performance, and videography. What sets them apart is their collaborative approach: rather than adhering to fixed roles, they work together as co-creators to bring their collective vision to life.',
    memberTitle: "MEMBER",
    members: ["KEONHO", "MARTIN", "JAMES", "SEONGHYEON", "JUHOON"],
    birth: [
      "February 14. 2009",
      "March 20. 2008",
      "October 14. 2005",
      "January 13. 2009",
      "January 3. 2008",
    ],
    newsTitle: "NEWS",
    searchPlaceholder: "Search news...",
    newsLang: "en",
  },
  id: {
    langLabel: "IND ▼",
    navHome: "BERANDA",
    navAbout: "TENTANG",
    navNews: "BERITA",
    navTour: "TUR",
    navMusic: "MUSIK",
    navShop: "TOKO",
    subtitle: "DEBUT • 18 AGUSTUS 2025",
    aboutTitle: "TENTANG CORTIS",
    aboutSubtitle:
      "Temukan kisah di balik CORTIS dan kenali para membernya.",
    aboutDesc:
      'CORTIS (MARTIN, JAMES, JUHOON, SEONGHYEON, dan KEONHO) adalah boy band pertama dalam 6 tahun yang debut di bawah BIGHIT MUSIC, label besar di balik grup global terkenal seperti BTS dan TOMORROW X TOGETHER. Nama CORTIS merupakan perpaduan unik dari enam huruf yang diambil dari kalimat "COLOR OUTSIDE THE LINES," yang mencerminkan tekad mereka untuk berpikir melampaui batas yang ditentukan oleh dunia. Sesuai dengan namanya, CORTIS adalah kumpulan kreator mandiri yang menghadirkan keaslian dalam setiap karya yang mereka buat, mulai dari musik, koreografi, hingga konten video. Kelima member mengambil cerita pribadi mereka untuk menunjukkan kreativitas unik dalam penulisan lagu, komposisi, penampilan, dan videografi. Hal yang membedakan mereka adalah pendekatan kolaboratif mereka: daripada mengikuti peran tetap, mereka bekerja bersama sebagai co-creator untuk mewujudkan visi kolektif mereka.',
    memberTitle: "MEMBER",
    members: ["KEONHO", "MARTIN", "JAMES", "SEONGHYEON", "JUHOON"],
    birth: [
      "14 Februari 2009",
      "20 Maret 2008",
      "14 Oktober 2005",
      "13 Januari 2009",
      "3 Januari 2008",
    ],
    newsTitle: "BERITA",
    searchPlaceholder: "Cari berita...",
    newsLang: "id",
  },
  kr: {
    langLabel: "KOR ▼",
    navHome: "홈",
    navAbout: "소개",
    navNews: "뉴스",
    navTour: "투어",
    navMusic: "음악",
    navShop: "상점",
    subtitle: "데뷔 • 2025년 08월 18일",
    aboutTitle: "CORTIS 소개",
    aboutSubtitle: "CORTIS의 이야기를 발견하고 멤버들을 만나보세요.",
    aboutDesc:
      'CORTIS(MARTIN, JAMES, JUHOON, SEONGHYEON, KEONHO)는 BTS와 TOMORROW X TOGETHER 같은 세계적인 그룹을 배출한 BIGHIT MUSIC에서 6년 만에 데뷔하는 첫 번째 보이 그룹입니다. CORTIS라는 이름은 "COLOR OUTSIDE THE LINES"라는 문구에서 가져온 여섯 글자의 독창적인 조합으로, 세상이 정해놓은 경계를 넘어 생각하려는 그들의 의지를 담고 있습니다. 이름처럼 CORTIS는 음악, 안무, 영상 콘텐츠 등 모든 창작물에 진정성을 담아내는 자기 주도적인 크리에이터 그룹입니다. 다섯 멤버는 개인적인 이야기를 바탕으로 작사, 작곡, 퍼포먼스, 영상 제작 등 다양한 분야에서 자신만의 창의성을 보여줍니다. 그들을 특별하게 만드는 것은 협업 방식이며, 정해진 역할에 얽매이지 않고 공동 창작자로서 함께 하나의 비전을 만들어갑니다.',
    memberTitle: "멤버",
    members: ["KEONHO", "MARTIN", "JAMES", "SEONGHYEON", "JUHOON"],
    birth: [
      "2009년 2월 14일",
      "2008년 3월 20일",
      "2005년 10월 14일",
      "2009년 1월 13일",
      "2008년 1월 3일",
    ],
    newsTitle: "뉴스",
    searchPlaceholder: "뉴스 검색...",
    newsLang: "ko",
  },
};

/* ===== INTEGRASI DATABASE: isi terjemahan dari cortis_db (window.CORTIS dibuat oleh index.php) ===== */
const CX_BULAN = {
  en: ["January","February","March","April","May","June","July","August","September","October","November","December"],
  id: ["Januari","Februari","Maret","April","Mei","Juni","Juli","Agustus","September","Oktober","November","Desember"],
};
// Format tanggal "YYYY-MM-DD" per bahasa (en/id/ko). gaya: "birth" | "tour"
function cxFormatDate(iso, lang, gaya) {
  const p = String(iso || "").slice(0, 10).split("-");
  if (p.length !== 3) return iso || "";
  const y = +p[0], m = +p[1], d = +p[2];
  if (lang === "ko") return y + "년 " + m + "월 " + d + "일";
  if (lang === "id") return d + " " + CX_BULAN.id[m - 1] + " " + y;
  return gaya === "birth" ? CX_BULAN.en[m - 1] + " " + d + ". " + y : CX_BULAN.en[m - 1] + " " + d + ", " + y;
}
function cxFormatDebut(iso, lang) {
  const p = String(iso || "").slice(0, 10).split("-");
  if (p.length !== 3) return "";
  if (lang === "ko") return "데뷔 • " + p[0] + "년 " + p[1] + "월 " + p[2] + "일";
  if (lang === "id") return "DEBUT • " + (+p[2]) + " " + CX_BULAN.id[+p[1] - 1].toUpperCase() + " " + p[0];
  return "DEBUT • " + p[0] + "." + p[1] + "." + p[2];
}
window.cxFormatDate = cxFormatDate;

(function applyDbContent() {
  const D = window.CORTIS;
  if (!D) return; // index.php tidak memuat data -> pakai teks bawaan
  const kodeDb = { en: "en", id: "id", kr: "ko" };
  const menuKeys = { navHome: "home", navAbout: "about", navNews: "news", navTour: "tour", navMusic: "music", navShop: "shop" };
  Object.keys(translations).forEach((k) => {
    const c = kodeDb[k], t = translations[k];
    const menu = D.menus || {};
    Object.keys(menuKeys).forEach((prop) => {
      const lab = menu[menuKeys[prop]] && menu[menuKeys[prop]][c];
      if (lab) t[prop] = lab;
    });
    if (D.about && D.about[c]) t.aboutDesc = D.about[c];
    if (D.members && D.members.length) {
      t.members = D.members.map((m) => m.name);
      t.birth = D.members.map((m) => cxFormatDate(m.birth, c, "birth"));
    }
    if (D.debut) t.subtitle = cxFormatDebut(D.debut, c);
  });
})();

function applyLanguage(lang) {
  const t = translations[lang];
  langBtn.textContent = t.langLabel;
  document.getElementById("nav-home").textContent = t.navHome;
  document.getElementById("nav-about").textContent = t.navAbout;
  document.getElementById("nav-news").textContent = t.navNews;
  document.getElementById("nav-tour").textContent = t.navTour;
  document.getElementById("nav-music").textContent = t.navMusic;
  const navShop = document.getElementById("nav-shop");
  if (navShop) {
    navShop.innerHTML = t.navShop + ' <i class="fa-solid fa-arrow-up-right-from-square" style="font-size: 0.72em; margin-left: 3px; vertical-align: baseline;"></i>';
  }
  document.getElementById("subtitle").textContent = t.subtitle;
  document.getElementById("aboutTitle").textContent = t.aboutTitle;
  document.getElementById("aboutSubtitle").textContent = t.aboutSubtitle;
  document.getElementById("aboutDesc").textContent = t.aboutDesc;
  document.getElementById("memberTitle").textContent = t.memberTitle;
  document
    .querySelectorAll(".member-name")
    .forEach((el, i) => (el.textContent = t.members[i]));
  document
    .querySelectorAll(".member-birth")
    .forEach((el, i) => (el.textContent = t.birth[i]));

  const footerLabel = document.querySelector(".footer-label");
  if (footerLabel) {
    const langKey = { en: "en", id: "id", kr: "ko" }[lang] || "en";
    footerLabel.textContent = footerLabel.getAttribute("data-" + langKey) || footerLabel.textContent;
  }

  languageMenu.classList.remove("show");

  // ─── SYNC BAHASA KE SEMUA VIEW LAIN (NEWS, TOUR, MUSIC) ───
  const legacyLang = { en: "eng", id: "indo", kr: "korea" }[lang];
  if (typeof window.newsChangeLang === "function") window.newsChangeLang(legacyLang);
  if (typeof window.tourChangeLang === "function") window.tourChangeLang(legacyLang);
  if (typeof window.musicChangeLang === "function") window.musicChangeLang(legacyLang);
}

document.querySelectorAll(".language-menu p").forEach((item, i) => {
  const langs = ["en", "id", "kr"];
  item.addEventListener("click", () => applyLanguage(langs[i]));
});

// ─── HERO SLIDER ───
const slides = document.querySelectorAll(".slide");
const dotsContainer = document.getElementById("sliderDots");
const prevBtn = document.getElementById("home-prevBtn");
const nextBtn = document.getElementById("home-nextBtn");
let current = 0;
let autoPlay;

slides.forEach((_, i) => {
  const dot = document.createElement("button");
  dot.classList.add("dot");
  if (i === 0) dot.classList.add("active");
  dot.addEventListener("click", () => {
    goTo(i);
    resetAuto();
  });
  dotsContainer.appendChild(dot);
});

const dots = () => document.querySelectorAll(".dot");

function goTo(index) {
  slides[current].classList.remove("active");
  dots()[current].classList.remove("active");
  current = (index + slides.length) % slides.length;
  slides[current].classList.add("active");
  dots()[current].classList.add("active");
}

prevBtn.addEventListener("click", () => {
  goTo(current - 1);
  resetAuto();
});
nextBtn.addEventListener("click", () => {
  goTo(current + 1);
  resetAuto();
});

function startAuto() {
  autoPlay = setInterval(() => goTo(current + 1), 3000);
}
function resetAuto() {
  clearInterval(autoPlay);
  startAuto();
}
startAuto();

// ─── SOCIAL MEDIA LINKS (ABOUT/HOME FOOTER) ───
// Fallback ini memastikan tombol sosmed tetap membuka akun official
// walau target="_blank" diblokir oleh browser/webview tertentu.
document.querySelectorAll(".social-link").forEach((link) => {
  link.addEventListener("click", (e) => {
    e.stopPropagation();
    const url = link.getAttribute("data-url") || link.getAttribute("href");
    if (!url) return;
    e.preventDefault();
    const newWindow = window.open(url, "_blank", "noopener,noreferrer");
    if (!newWindow) {
      // Popup diblokir browser -> buka di tab yang sama sebagai cadangan
      window.location.href = url;
    }
  });
});


/* ============================================================ */

// ============================================================
// SCRIPT VIEW: MUSIC (asalnya dari music.js)
// ============================================================
(function(){
  window.musicChangeLang = musicChangeLang;
/* =========================
   ELEMENTS & OTOMATIS SORTING
========================= */
const bgVideo = document.getElementById("bgVideo");

/* ===== Format tanggal rilis & jumlah putar per bahasa ===== */
const MUSIC_I18N = {
  eng:   { locale: "en-US", release: "Release", streams: "streams" },
  indo:  { locale: "id-ID", release: "Rilis",    streams: "kali diputar" },
  korea: { locale: "ko-KR", release: "발매일",    streams: "회 재생" },
};
function formatReleaseDate(str, lang) {
  const d = new Date(str);
  if (isNaN(d)) return str || "-";
  const t = MUSIC_I18N[lang] || MUSIC_I18N.eng;
  return d.toLocaleDateString(t.locale, { year: "numeric", month: "short", day: "numeric" });
}
function formatStreams(n, lang) {
  const t = MUSIC_I18N[lang] || MUSIC_I18N.eng;
  return Number(n || 0).toLocaleString(t.locale) + " " + t.streams;
}
function renderCardMeta(lang) {
  const t = MUSIC_I18N[lang] || MUSIC_I18N.eng;
  document.querySelectorAll(".view-music-root .song-card").forEach((card) => {
    const rel = card.querySelector(".song-release");
    const str = card.querySelector(".song-streams");
    if (rel) rel.innerHTML = `<i class="fa-regular fa-calendar-alt"></i> ${t.release}: ${formatReleaseDate(card.getAttribute("data-release-date"), lang)}`;
    if (str) str.innerHTML = `<i class="fa-solid fa-headphones"></i> ${formatStreams(card.getAttribute("data-streams"), lang)}`;
  });
}

// Urutkan otomatis: streaming terbanyak -> tersedikit (seri: rilis terbaru dulu)
const playlistContainer = document.querySelector(".view-music-root .playlist");
if (playlistContainer) {
  const cardList = Array.from(playlistContainer.querySelectorAll(".song-card"));
  cardList.sort((a, b) => {
    const sA = parseInt(a.getAttribute("data-streams") || "0", 10);
    const sB = parseInt(b.getAttribute("data-streams") || "0", 10);
    if (sB !== sA) return sB - sA;
    return new Date(b.getAttribute("data-release-date")) - new Date(a.getAttribute("data-release-date"));
  });
  cardList.forEach((card, index) => {
    playlistContainer.appendChild(card);
    const rankEl = card.querySelector(".song-rank-badge");
    if (rankEl) rankEl.textContent = `#${index + 1}`;
  });
  renderCardMeta("eng");
}

const cards = document.querySelectorAll(".song-card");
const modal = document.getElementById("playerModal");
const closeBtn = document.getElementById("closeBtn");
const playerCover = document.getElementById("playerCover");
const playerTitle = document.getElementById("playerTitle");
const playerArtist = document.getElementById("playerArtist");
const lyricsContent = document.getElementById("lyricsContent");
const audio = document.getElementById("audioPlayer");
const playerVideo = document.getElementById("playerVideo");

const playBtn = document.getElementById("playBtn");
const nextBtn = document.getElementById("nextBtn");
const prevBtn = document.getElementById("prevBtn");
const repeatBtn = document.getElementById("repeatBtn");
const shuffleBtn = document.getElementById("shuffleBtn");
const volumeSlider = document.getElementById("volumeSlider");

const progressBar = document.getElementById("mainProgressBar");
const currentTime = document.getElementById("currentTime");
const duration = document.getElementById("duration");

/* =========================
   STATE
========================= */
let currentSong = 0;
let isRepeat = false;
let isShuffle = false;
let currentLang = "eng";
let parsedLyrics = []; 

const uiTranslations = {
  eng: {
    title: "MUSIC PLAYLIST",
    lyricsHeader: "Lyrics",
    homeMenu: "HOME",
    aboutMenu: "ABOUT",
    newsMenu: "NEWS",
    tourMenu: "TOUR",
    musicMenu: "MUSIC",
    shopMenu: "SHOP",
    btnText: "ENG ▼",
    noLyrics: "Lyrics not available in karaoke format.",
  },
  indo: {
    title: "DAFTAR PUTAR MUSIK",
    lyricsHeader: "Lirik Lagu",
    homeMenu: "BERANDA",
    aboutMenu: "TENTANG",
    newsMenu: "BERITA",
    tourMenu: "KONSER",
    musicMenu: "MUSIK",
    shopMenu: "TOKO",
    btnText: "IND ▼",
    noLyrics: "Lirik tidak tersedia dalam format karaoke.",
  },
  korea: {
    title: "뮤직 플레이리스트",
    lyricsHeader: "가사",
    homeMenu: "홈",
    aboutMenu: "소개",
    newsMenu: "뉴스",
    tourMenu: "투어",
    musicMenu: "음악",
    shopMenu: "쇼핑",
    btnText: "KOR ▼",
    noLyrics: "가사가 가라오케 형식으로 제공되지 않습니다.",
  },
};

const songOffsets = {
  "REDRED": 6.0,       
  "GO!": 18.5,          
  "FaShioN": 5.0,      
  "JoyRide": 11.0,      
  "What You Want": 11.0 
};

const songs = [];
cards.forEach((card) => {
  const title = card.getAttribute("data-title") || "Untitled";
  const offset = songOffsets[title] !== undefined ? songOffsets[title] : 0;

  songs.push({
    title: title,
    artist: card.getAttribute("data-artist") || "Unknown",
    audio: card.getAttribute("data-audio") || "",
    cover: card.getAttribute("data-cover") || "",
    video: card.getAttribute("data-video") || "",
    rawLyrics: card.getAttribute("data-lyrics") || "",
    releaseDate: card.getAttribute("data-release-date") || "",
    streams: card.getAttribute("data-streams") || "",
    offset: offset 
  });
});

/* =========================
   FUNGSI LRC PARSER
========================= */
function parseLRC(lrcText, offsetValue = 0) {
  const lines = lrcText.split(/\\n|\n/);
  const result = [];
  const timeReg = /\[(\d+):(\d+)(?:\.(\d+))?\]/;

  lines.forEach((line) => {
    const match = timeReg.exec(line);
    if (match) {
      const minutes = parseInt(match[1]);
      const seconds = parseInt(match[2]);
      const ms = match[3] ? parseInt(match[3]) : 0;
      
      const time = (minutes * 60 + seconds + ms / 100) + offsetValue;
      const text = line.replace(timeReg, "").trim();
      if (text) result.push({ time, text });
    }
  });
  return result;
}

/* =========================
   GENERATE LIRIK
========================= */
function displayLyrics() {
  lyricsContent.innerHTML = "";
  if (!songs[currentSong]) return;
  
  const rawData = songs[currentSong].rawLyrics;
  const currentOffset = songs[currentSong].offset;
  
  parsedLyrics = parseLRC(rawData, currentOffset);

  if (parsedLyrics.length === 0) {
    const fallbackText = (uiTranslations[currentLang] && uiTranslations[currentLang].noLyrics)
      ? uiTranslations[currentLang].noLyrics
      : "Lyrics not available in karaoke format.";
    lyricsContent.innerHTML = "";
    const p = document.createElement("p");
    p.classList.add("lyrics-line");
    p.textContent = fallbackText;
    lyricsContent.appendChild(p);
    return;
  }

  parsedLyrics.forEach((item, index) => {
    const p = document.createElement("p");
    p.classList.add("lyrics-line");
    p.id = `line-${index}`;
    p.textContent = item.text;
    lyricsContent.appendChild(p);
  });
}

function formatTime(seconds) {
  if (isNaN(seconds)) return "0:00";
  const min = Math.floor(seconds / 60);
  const sec = Math.floor(seconds % 60);
  return min + ":" + (sec < 10 ? "0" + sec : sec);
}

function safePlay(mediaElement) {
  if (!mediaElement || !mediaElement.src) return;
  
  const playPromise = mediaElement.play();
  if (playPromise !== undefined) {
    playPromise.catch((error) => {
      console.log("Play request handled safely.");
    });
  }
}

/* =========================
   META PLAYER (TANGGAL RILIS & STREAMS)
========================= */
function updatePlayerMeta() {
  const song = songs[currentSong];
  if (!song) return;
  const t = MUSIC_I18N[currentLang] || MUSIC_I18N.eng;
  const rel = document.getElementById("playerReleaseDate");
  const str = document.getElementById("playerStreams");
  if (rel && song.releaseDate) rel.innerHTML = `<i class="fa-regular fa-calendar-alt"></i> ${t.release}: ${formatReleaseDate(song.releaseDate, currentLang)}`;
  if (str && song.streams) str.innerHTML = `<i class="fa-solid fa-headphones"></i> ${formatStreams(song.streams, currentLang)}`;
}

/* =========================
   LOAD SONG
========================= */
function loadSong(index) {
  currentSong = index;
  const song = songs[index];
  if (!song) return;

  playerTitle.textContent = song.title;
  playerArtist.textContent = song.artist;
  playerCover.src = song.cover;

  updatePlayerMeta();

  displayLyrics();

  audio.src = song.audio;
  playerVideo.src = song.video;
  audio.load();
  playerVideo.load();
}

/* =========================
   SINKRONISASI PROGRESS BAR & LIRIK
========================= */
audio.addEventListener("timeupdate", () => {
  if (progressBar) {
    progressBar.max = audio.duration || 0;
    progressBar.value = audio.currentTime;
  }
  currentTime.textContent = formatTime(audio.currentTime);
  duration.textContent = formatTime(audio.duration);

  if (parsedLyrics.length > 0) {
    const curTime = audio.currentTime;
    let activeIndex = -1;

    for (let i = 0; i < parsedLyrics.length; i++) {
      if (curTime >= parsedLyrics[i].time) {
        activeIndex = i;
      } else {
        break;
      }
    }

    if (activeIndex !== -1) {
      document.querySelectorAll(".lyrics-line").forEach((el) => {
        el.classList.remove("active-lyric");
      });

      const activeLineEl = document.getElementById(`line-${activeIndex}`);
      if (activeLineEl) {
        activeLineEl.classList.add("active-lyric");

        lyricsContent.scrollTo({
          top: activeLineEl.offsetTop - lyricsContent.offsetTop - 120,
          behavior: "smooth",
        });
      }
    }
  }
});

/* =========================
   CONTROLS EVENT LISTENERS
========================= */
cards.forEach((card, index) => {
  card.addEventListener("mouseenter", () => {
    const videoSrc = card.getAttribute("data-video");
    if (videoSrc) {
      bgVideo.src = videoSrc;
      bgVideo.style.opacity = "1";
      safePlay(bgVideo);
    }
  });
  
  card.addEventListener("mouseleave", () => {
    bgVideo.pause();
    bgVideo.style.opacity = "0";
    bgVideo.removeAttribute("src");
  });
  
  card.addEventListener("click", () => {
    loadSong(index);
    modal.style.display = "flex";
    document.documentElement.classList.add("modal-open");
    document.body.classList.add("modal-open");
    safePlay(audio);
    safePlay(playerVideo);
    playBtn.innerHTML = "⏸";
  });
});

playBtn.addEventListener("click", () => {
  if (audio.paused) {
    safePlay(audio);
    safePlay(playerVideo);
    playBtn.innerHTML = "⏸";
  } else {
    audio.pause();
    playerVideo.pause();
    playBtn.innerHTML = "▶";
  }
});

prevBtn.addEventListener("click", () => {
  currentSong = currentSong <= 0 ? songs.length - 1 : currentSong - 1;
  loadSong(currentSong);
  safePlay(audio);
  safePlay(playerVideo);
  playBtn.innerHTML = "⏸";
});

nextBtn.addEventListener("click", () => {
  currentSong = currentSong >= songs.length - 1 ? 0 : currentSong + 1;
  loadSong(currentSong);
  safePlay(audio);
  safePlay(playerVideo);
  playBtn.innerHTML = "⏸";
});

shuffleBtn.addEventListener("click", () => {
  isShuffle = !isShuffle;
  shuffleBtn.style.background = isShuffle ? "#ff2d55" : "white";
  shuffleBtn.style.color = isShuffle ? "white" : "black";
});

repeatBtn.addEventListener("click", () => {
  isRepeat = !isRepeat;
  audio.loop = isRepeat;
  playerVideo.loop = isRepeat;
  repeatBtn.style.background = isRepeat ? "#ff2d55" : "white";
  repeatBtn.style.color = isRepeat ? "white" : "black";
});

volumeSlider.addEventListener("input", () => {
  audio.volume = volumeSlider.value;
});

if (progressBar) {
  progressBar.addEventListener("input", () => {
    audio.currentTime = progressBar.value;
    playerVideo.currentTime = progressBar.value;
  });
}

audio.addEventListener("ended", () => {
  if (isRepeat) return;
  if (isShuffle) {
    loadSong(Math.floor(Math.random() * songs.length));
  } else {
    currentSong = currentSong >= songs.length - 1 ? 0 : currentSong + 1;
    loadSong(currentSong);
  }
  safePlay(audio);
  safePlay(playerVideo);
});

const closeModal = () => {
  modal.style.display = "none";
  document.documentElement.classList.remove("modal-open");
  document.body.classList.remove("modal-open");
  audio.pause();
  playerVideo.pause();
  playBtn.innerHTML = "▶";
};

closeBtn.addEventListener("click", closeModal);
window.addEventListener("click", (e) => {
  if (e.target === modal) closeModal();
});

// Cegah scroll tembus ke background saat cursor di dalam player modal (kecuali area lirik)
if (modal) {
  modal.addEventListener("wheel", (e) => {
    if (!e.target.closest("#lyricsContent")) {
      e.preventDefault();
    }
  }, { passive: false });
  modal.addEventListener("touchmove", (e) => {
    if (!e.target.closest("#lyricsContent")) {
      e.preventDefault();
    }
  }, { passive: false });
}

function musicChangeLang(lang) {
  window.musicChangeLang = musicChangeLang;
  currentLang = lang;
  if (!uiTranslations[lang]) return;

  renderCardMeta(lang);
  updatePlayerMeta();

  const musicLangBtn = document.getElementById("music-langBtn");
  if (musicLangBtn) musicLangBtn.textContent = uiTranslations[lang].btnText;

  const pageTitle = document.querySelector(".music-page h1");
  if (pageTitle) pageTitle.textContent = uiTranslations[lang].title;

  const lyricsHeader = document.querySelector(".lyrics-box h3");
  if (lyricsHeader) lyricsHeader.textContent = uiTranslations[lang].lyricsHeader;

  const musicLanguageMenu = document.getElementById("music-languageMenu");
  if (musicLanguageMenu) musicLanguageMenu.classList.remove("show");
}

const langBtn = document.getElementById("music-langBtn");
const languageMenu = document.getElementById("music-languageMenu");
if(langBtn && languageMenu) {
  langBtn.addEventListener("click", (e) => {
    e.stopPropagation();
    languageMenu.classList.toggle("show");
  });
}
window.addEventListener("click", () => {
  if(languageMenu) languageMenu.classList.remove("show");
});


function forceResetProgressBar() {
  if (progressBar) {
    progressBar.value = 0;
    progressBar.max = 0;
  }
  if (currentTime) currentTime.textContent = "0:00";
  if (duration) duration.textContent = "0:00";
}

document.addEventListener('DOMContentLoaded', forceResetProgressBar);

window.addEventListener('load', forceResetProgressBar);
})();



/* ============================================================ */

// ============================================================
// SCRIPT VIEW: NEWS (sumber: https://www.idntimes.com/tag/cortis)
// ============================================================
(function () {
  const NEWS_SOURCE_URL = 'https://www.idntimes.com/tag/cortis';
  const MAX_NEWS = 15; // 3 kolom x 5 baris
  const PROXIES = [
    (u) => 'https://api.allorigins.win/raw?url=' + encodeURIComponent(u),
    (u) => 'https://corsproxy.io/?' + encodeURIComponent(u),
  ];
  const LANG_MAP = { eng: 'en', indo: 'id', korea: 'ko', en: 'en', id: 'id', ko: 'ko', kr: 'ko' };
  const LOCALES = { en: 'en-US', id: 'id-ID', ko: 'ko-KR' };
  const PLACEHOLDER = 'data:image/svg+xml;utf8,' + encodeURIComponent(
    '<svg xmlns="http://www.w3.org/2000/svg" width="400" height="220"><rect width="100%" height="100%" fill="#130212"/></svg>'
  );

  let currentNewsLang = 'en';
  let newsItems = [];

  // ---------- DATA FALLBACK (dari https://www.idntimes.com/tag/cortis) ----------
  const mk = (date, id, en, ko, url) => ({ date, source: 'IDN Times', url, title: { id, en, ko }, image: null });
  const fallbackNews = [
    mk('2026-11-03',
      '[QUIZ] Kalau Kamu Masuk Tim Paskib Sekolah, Siapa Member CORTIS yang Jadi Dantonnya?',
      '[QUIZ] If You Join the School Flag-Raising Squad, Which CORTIS Member Is Your Commander?',
      '[퀴즈] 학교 국기게양 팀에 들어간다면, 대장은 어떤 CORTIS 멤버일까?',
      'https://www.idntimes.com/korea/kpop/quiz-kalau-kamu-masuk-tim-paskib-sekolah-siapa-member-cortis-yang-jadi-dantonnya-quiz-00-6x7yf-db87fp'),
    mk('2026-10-27',
      '[QUIZ] Member CORTIS yang Cocok Jadi Partner Traveling Akhir Tahun 2026?',
      '[QUIZ] Which CORTIS Member Is the Best Travel Partner for Year-End 2026?',
      '[퀴즈] 2026년 연말 여행 파트너로 어울리는 CORTIS 멤버는?',
      'https://www.idntimes.com/travel/destination/quiz-siapa-member-cortis-yang-cocok-jadi-partner-traveling-akhir-tahun-2026-quiz-00-z5hk4-68mj7h'),
    mk('2026-10-27',
      '[QUIZ] Siapa Member CORTIS yang Ajak Kamu Berburu Trick or Treat di Halloween Tahun Ini?',
      '[QUIZ] Which CORTIS Member Takes You Trick-or-Treating This Halloween?',
      '[퀴즈] 올해 할로윈에 함께 트릭 오어 트릿을 할 CORTIS 멤버는?',
      'https://www.idntimes.com/korea/kpop/quiz-siapa-member-cortis-yang-ajak-kamu-berburu-trick-or-treat-di-halloween-tahun-ini-quiz-00-hwff8-6g6qrp'),
    mk('2026-10-13',
      '[QUIZ] Siapa Grup Gen 5 yang Cocok Jadi Teman Mabar Mobile Legends-mu?',
      '[QUIZ] Which Gen 5 Group Is Your Best Mobile Legends Squad Mate?',
      '[퀴즈] 모바일 레전드를 함께할 5세대 그룹은 누구?',
      'https://www.idntimes.com/korea/kpop/quiz-siapa-grup-gen-5-yang-cocok-jadi-teman-mabar-mobile-legends-mu-quiz-00-6x7yf-t2j429'),
    mk('2026-10-05',
      '[QUIZ] Siapakah Night Ride Date-mu Diantara ke-5 Member CORTIS?',
      '[QUIZ] Who Among the 5 CORTIS Members Is Your Night Ride Date?',
      '[퀴즈] CORTIS 멤버 5명 중 나의 나이트 라이드 데이트 상대는?',
      'https://www.idntimes.com/korea/kpop/quiz-siapakah-night-ride-date-mu-diantara-ke-5-member-cortis-quiz-00-syg99-vnqsn0'),
    mk('2026-10-05',
      '[QUIZ] Kalau Jadi Ketua Ekskul Musik, Siapa Member CORTIS yang Kamu Ajak Join Band Sekolah?',
      '[QUIZ] As Music Club Leader, Which CORTIS Member Would You Invite to the School Band?',
      '[퀴즈] 음악 동아리 회장이라면 학교 밴드에 어떤 CORTIS 멤버를 영입할까?',
      'https://www.idntimes.com/korea/kpop/quiz-kalau-jadi-ketua-ekskul-musik-siapa-member-cortis-yang-kamu-ajak-join-band-sekolah-quiz-00-6x7yf-kbw0y9'),
    mk('2026-10-04',
      '[QUIZ] Siapa Member CORTIS yang Ajak Kamu Nonton Synchronize Festival 2026?',
      '[QUIZ] Which CORTIS Member Invites You to Synchronize Festival 2026?',
      '[퀴즈] Synchronize Festival 2026에 함께 갈 CORTIS 멤버는?',
      'https://www.idntimes.com/korea/kpop/quiz-siapa-member-cortis-yang-ajak-kamu-nonton-synchronize-festival-2026-quiz-00-syg99-87br42'),
    mk('2026-10-01',
      '[QUIZ] Kalau Kamu Pesan Ojol, Member CORTIS Mana yang Jadi Abang Sopirnya?',
      '[QUIZ] If You Book a Motorcycle Taxi, Which CORTIS Member Is Your Driver?',
      '[퀴즈] 오토바이 택시를 부르면 어떤 CORTIS 멤버가 기사님일까?',
      'https://www.idntimes.com/korea/kpop/quiz-kalau-kamu-pesan-ojol-member-cortis-mana-yang-jadi-abang-sopirnya-quiz-00-hwff8-yd0hqd'),
    mk('2026-09-27',
      'MC dan Lineup Music Bank Global Festival in Japan 2026, aespa hingga IVE',
      'MCs and Lineup for Music Bank Global Festival in Japan 2026, from aespa to IVE',
      '2026 뮤직뱅크 글로벌 페스티벌 인 재팬 MC 및 라인업, aespa부터 IVE까지',
      'https://www.idntimes.com/korea/kpop/mc-dan-line-up-music-bank-global-festival-in-japan-2026-00-6x7yf-hywdyw'),
    mk('2026-09-22',
      "9 Lagu Boy Group Sukses Charting Tinggi di Korea, Ada 'REDRED' CORTIS!",
      "9 Boy Group Songs That Charted High in Korea, Including CORTIS's 'REDRED'!",
      "한국 차트 상위권에 오른 보이그룹 노래 9곡, CORTIS의 'REDRED' 포함!",
      'https://www.idntimes.com/korea/kpop/lagu-boy-group-sukses-di-chart-di-korea-c1c2-01-2kxv1-9h8hdk'),
    mk('2026-09-20',
      'Daftar Penghargaan CORTIS usai Setahun Debut, Sudah Dapat 2 Daesang',
      "CORTIS's Awards After One Year Since Debut, Already Won 2 Daesang",
      '데뷔 1주년 CORTIS 수상 내역, 이미 대상 2회 수상',
      'https://www.idntimes.com/korea/kpop/daftar-penghargaan-cortis-usai-setahun-debut-sudah-dapat-2-daesang-c1c2-01-cccnm-rwl7bb'),
    mk('2026-09-19',
      'Daftar Pemenang The Fact Music Awards (TMA) 2026, CORTIS-ATEEZ Daesang',
      'The Fact Music Awards (TMA) 2026 Winners: CORTIS and ATEEZ Take Daesang',
      '2026 더 팩트 뮤직 어워즈(TMA) 수상자, CORTIS·ATEEZ 대상',
      'https://www.idntimes.com/korea/kpop/daftar-pemenang-the-fact-music-awards-tma-2026-00-dt824-zw0spt'),
    mk('2026-09-03',
      'CORTIS akan Kolaborasi sama Animasi Pororo, Kok Bisa?',
      'CORTIS to Collaborate with Pororo Animation, How Come?',
      'CORTIS, 애니메이션 뽀로로와 콜라보? 어떻게 가능했나',
      'https://www.idntimes.com/korea/kpop/kenapa-cortis-bisa-kolaborasi-sama-pororo-00-ffxpq-fr2n64'),
    mk('2026-09-02',
      'Daftar Pemenang Brand of the Year Awards 2026, XODIAC hingga CORTIS',
      'Brand of the Year Awards 2026 Winners, from XODIAC to CORTIS',
      '2026 브랜드 오브 더 이어 어워즈 수상자, XODIAC부터 CORTIS까지',
      'https://www.idntimes.com/korea/kpop/daftar-pemenang-brand-of-the-year-awards-2026-xodiac-hingga-cortis-00-syg99-g1sh78'),
    mk('2026-08-28',
      'Lineup dan Presenter di The Fact Music Awards 2026, Ada CORTIS!',
      'Lineup and Presenters at The Fact Music Awards 2026, Including CORTIS!',
      '2026 더 팩트 뮤직 어워즈 라인업 및 프레젠터, CORTIS 포함!',
      'https://www.idntimes.com/korea/knews/lineup-dan-presenter-the-fact-music-awards-2026-00-hwff8-5mv63y'),
  ];

  // ---------- HELPERS ----------
  function el(tag, cls, text) {
    const e = document.createElement(tag);
    if (cls) e.className = cls;
    if (text !== undefined) e.textContent = text;
    return e;
  }

  function formatNewsDate(iso, lang) {
    const d = new Date(iso);
    if (isNaN(d)) return iso || '';
    return d.toLocaleDateString(LOCALES[lang] || 'en-US', {
      year: 'numeric', month: 'long', day: 'numeric', timeZone: 'UTC',
    });
  }

  const MONTHS = { jan: 0, feb: 1, mar: 2, apr: 3, mei: 4, may: 4, jun: 5, jul: 6, agu: 7, ags: 7, aug: 7, sep: 8, okt: 9, oct: 9, nov: 10, des: 11, dec: 11 };
  function parseIdnDate(text) {
    const m = /(\d{1,2})\s+([A-Za-z]{3})[a-z]*\s+(\d{4})/.exec(text || '');
    if (!m) return null;
    const mo = MONTHS[m[2].toLowerCase()];
    if (mo === undefined) return null;
    return new Date(Date.UTC(+m[3], mo, +m[1])).toISOString().slice(0, 10);
  }

  const cleanUrl = (u) => u.split('#')[0].split('?')[0];

  // ---------- PARSER HALAMAN IDN TIMES ----------
  function parseIdnTimes(html) {
    const doc = new DOMParser().parseFromString(html, 'text/html');
    const h2s = Array.from(doc.querySelectorAll('h2'));
    const start = h2s.find((h) => /latest in cortis/i.test(h.textContent));
    const end = start ? h2s[h2s.indexOf(start) + 1] : null;

    const results = [];
    const seen = new Set();

    doc.querySelectorAll('li').forEach((li) => {
      if (start) {
        const after = start.compareDocumentPosition(li) & Node.DOCUMENT_POSITION_FOLLOWING;
        const before = !end || (end.compareDocumentPosition(li) & Node.DOCUMENT_POSITION_PRECEDING);
        if (!after || !before) return;
      }
      const anchors = Array.from(li.querySelectorAll('a[href]')).filter((a) => {
        try {
          const u = new URL(a.getAttribute('href'), NEWS_SOURCE_URL);
          return /(^|\.)idntimes\.com$/.test(u.hostname) && !/\/tag\//.test(u.pathname) && u.pathname.split('/').length > 3;
        } catch (e) { return false; }
      });
      if (!anchors.length) return;

      const best = anchors.sort((a, b) => b.textContent.trim().length - a.textContent.trim().length)[0];
      const title = best.textContent.trim().replace(/\s+/g, ' ');
      if (!title) return;
      const url = new URL(best.getAttribute('href'), NEWS_SOURCE_URL).href;
      const key = cleanUrl(url);
      if (seen.has(key)) return;

      const date = parseIdnDate(li.textContent);
      if (!date) return;
      if (!start && !/cortis|coer/i.test(title + ' ' + url)) return;

      const imgEl = li.querySelector('img');
      let image = imgEl && (imgEl.getAttribute('src') || imgEl.getAttribute('data-src'));
      if (image && (!/^https?:/i.test(image) || /logo|icon/i.test(image))) image = null;

      seen.add(key);
      results.push({ date, source: 'IDN Times', url, title: { id: title, en: title, ko: title }, image: image || null });
    });

    results.sort((a, b) => (a.date < b.date ? 1 : a.date > b.date ? -1 : 0));
    return results;
  }

  async function fetchText(url, ms) {
    const c = new AbortController();
    const t = setTimeout(() => c.abort(), ms || 7000);
    try {
      const r = await fetch(url, { signal: c.signal });
      if (!r.ok) throw new Error('HTTP ' + r.status);
      return await r.text();
    } finally { clearTimeout(t); }
  }

  async function loadLiveNews() {
    // 1. Coba ambil dari backend PHP lokal (bebas CORS & langsung terhubung ke IDN Times)
    try {
      const res = await fetch('api/news.php');
      if (res.ok) {
        const json = await res.json();
        const items = Array.isArray(json) ? json : (json.data || []);
        if (items && items.length > 0) return items;
      }
    } catch (e) {
      console.warn('Backend api/news.php belum dapat diakses, mencoba proxy eksternal:', e);
    }

    // 2. Fallback proxy eksternal jika PHP tidak aktif
    for (const build of PROXIES) {
      try {
        const html = await fetchText(build(NEWS_SOURCE_URL));
        const items = parseIdnTimes(html);
        if (items.length) return items;
      } catch (err) {
        console.warn('Proxy berita gagal, mencoba berikutnya:', err);
      }
    }
    return [];
  }

  // ---------- RENDER ----------
  function renderNewsCards() {
    const container = document.querySelector('.view-news-root .news-grid');
    if (!container) return;
    container.innerHTML = '';
    const lang = currentNewsLang;

    newsItems.slice(0, MAX_NEWS).forEach((item, index) => {
      const titleText = item.title[lang] || item.title.en || item.title.id || '';
      const fallbackImg = 'media/news' + ((index % 15) + 1) + '.jpg';

      const card = el('article', 'news-card');
      const badge = el('span', 'badge-news', item.source);

      const img = document.createElement('img');
      img.alt = titleText;
      img.src = item.image || fallbackImg;
      img.onerror = function () {
        if (!img.dataset.tried) { img.dataset.tried = '1'; img.src = fallbackImg; }
        else { img.onerror = null; img.src = PLACEHOLDER; }
      };

      const text = el('div', 'card-text');
      const meta = el('div', 'news-meta');
      meta.append(el('span', 'news-date', formatNewsDate(item.date, lang)), el('span', 'news-source', item.source));

      const a = el('a', 'news-title-link');
      a.href = item.url;
      a.target = '_blank';
      a.rel = 'noopener noreferrer';
      a.appendChild(el('h3', '', titleText));

      text.append(meta, a);
      card.append(badge, img, text);
      container.appendChild(card);
    });
    applyNewsFilter();
  }

  // ---------- PENCARIAN ----------
  function applyNewsFilter() {
    const input = document.getElementById('searchInput');
    const q = input ? input.value.toLowerCase().trim() : '';
    document.querySelectorAll('.view-news-root .news-card').forEach((card) => {
      const title = card.querySelector('.card-text h3')?.textContent.toLowerCase() || '';
      const source = (card.querySelector('.news-source')?.textContent || '').toLowerCase();
      card.style.display = !q || title.includes(q) || source.includes(q) ? 'flex' : 'none';
    });
  }
  const searchInput = document.getElementById('searchInput');
  if (searchInput) searchInput.addEventListener('input', applyNewsFilter);

  // ---------- BAHASA ----------
  function newsChangeLang(lang) {
    currentNewsLang = LANG_MAP[lang] || 'en';
    const newsTitle = document.getElementById('newsTitle');
    if (newsTitle) newsTitle.textContent = newsTitle.getAttribute('data-' + currentNewsLang) || newsTitle.textContent;
    if (searchInput) {
      searchInput.placeholder = { en: 'Search news...', id: 'Cari berita...', ko: '뉴스 검색...' }[currentNewsLang];
    }
    renderNewsCards();
  }
  window.newsChangeLang = newsChangeLang;

  // ---------- INIT ----------
  async function initNews() {
    // Berita dibaca dari database (api/news.php -> tabel news). Data bawaan hanya dipakai jika API tidak bisa diakses.
    let dariDb = null;
    try {
      const res = await fetch('api/news.php');
      if (res.ok) {
        const json = await res.json();
        if (json && json.status === 'success') dariDb = json.data || [];
      }
    } catch (e) {
      console.warn('api/news.php tidak dapat diakses, memakai data bawaan:', e);
    }
    newsItems = (dariDb !== null ? dariDb : fallbackNews).slice(0, MAX_NEWS);
    renderNewsCards();
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', initNews);
  else initNews();
})();



/* ============================================================ */

// ============================================================
// SCRIPT VIEW: SHOP (asalnya dari shop.js)
// ============================================================
(function(){
  window.shopChangeLang = shopChangeLang;
// 1. Logika untuk Membuka dan Menutup Dropdown Bahasa
const langBtn = document.getElementById('shop-langBtn');
const languageMenu = document.getElementById('shop-languageMenu');

if (langBtn && languageMenu) {
langBtn.addEventListener('click', (e) => {
    // Mencegah klik menembus ke document
    e.stopPropagation(); 
    // Menambah/menghapus class 'show' yang sudah Anda buat di CSS
    languageMenu.classList.toggle('show');
});
}

// Menutup dropdown otomatis jika pengguna mengklik di luar menu
document.addEventListener('click', () => {
    if (languageMenu) languageMenu.classList.remove('show');
});


// 2. Data Terjemahan (Kamus Bahasa)
const translations = {
    eng: {
        btnText: "ENG ▼",
        title: "CORTIS MERCH",
        button: "Visit Official Shop",
        subtitle: "Available via our official partner",
        homeMenu: "HOME",
        aboutMenu: "ABOUT",
        newsMenu: "NEWS",
        tourMenu: "TOUR",
        musicMenu: "MUSIC",
        shopMenu: "SHOP",
        badgeBestSeller: "⭐ BEST SELLER",
        badgeNew: "🔥 NEW",
    },
    indo: {
        btnText: "IND ▼",
        title: "MERCHANDISE CORTIS",
        button: "Kunjungi Toko Resmi",
        subtitle: "Tersedia melalui mitra resmi kami",
        homeMenu: "BERANDA",
        aboutMenu: "TENTANG",
        newsMenu: "BERITA",
        tourMenu: "TUR",
        musicMenu: "MUSIK",
        shopMenu: "TOKO",
        badgeBestSeller: "⭐ TERLARIS",
        badgeNew: "🔥 BARU",
    },
    korea: {
        btnText: "KOR ▼",
        title: "코르티스 제품",
        button: "공식 샵 방문하기",
        subtitle: "공식 파트너사를 통해 구매 가능합니다",
        homeMenu: "홈",
        aboutMenu: "소개",
        newsMenu: "뉴스",
        tourMenu: "투어",
        musicMenu: "음악",
        shopMenu: "쇼핑",
        badgeBestSeller: "⭐ 베스트셀러",
        badgeNew: "🔥 신상품",
    }
};

// 3. Fungsi untuk Mengubah Bahasa (Dipanggil dari atribut onclick di HTML)
function shopChangeLang(lang) {
    if (translations[lang]) {
        // Mengubah teks tombol utama
        if (langBtn) langBtn.innerHTML = translations[lang].btnText;

        // Mengubah konten teks di halaman Shop
        const shopTitle = document.getElementById('shopTitle');
        const shopButton = document.getElementById('shopButton');
        const shopSubtitle = document.getElementById('shopSubtitle');
        if (shopTitle) shopTitle.innerText = translations[lang].title;
        if (shopButton) shopButton.innerText = translations[lang].button;
        if (shopSubtitle) shopSubtitle.innerText = translations[lang].subtitle;

        // Mengubah teks badge produk (BEST SELLER / NEW)
        document.querySelectorAll('.badge.best-seller').forEach((el) => {
            el.textContent = translations[lang].badgeBestSeller;
        });
        document.querySelectorAll('.badge.new').forEach((el) => {
            el.textContent = translations[lang].badgeNew;
        });
    }

    // Sembunyikan kembali menu setelah memilih bahasa
    if (languageMenu) languageMenu.classList.remove('show');
}

// CATATAN: klik tombol "Visit Official Shop" dan kartu produk sudah ditangani
// oleh atribut onclick="openOfficialShop(event)" di HTML. Listener tambahan
// dihapus agar satu klik tidak membuka dua tab sekaligus.
})();



/* ============================================================ */

// ============================================================
// SCRIPT VIEW: TOUR (asalnya dari tour.html inline script + style.css)
// ============================================================
(function(){
  window.tourChangeLang = tourChangeLang;

const langBtn = document.getElementById("tour-langBtn");
const languageMenu = document.getElementById("tour-languageMenu");

if (langBtn && languageMenu) {
langBtn.onclick = function () {

  if (languageMenu.style.display == "block") {
    languageMenu.style.display = "none";
  } else {
    languageMenu.style.display = "block";
  }

};
}

const tourTitle = document.getElementById("tourTitle");
const tourSubtitle = document.getElementById("tourSubtitle");

// Data tour (nama tour + daftar event per bahasa) berasal dari database lewat window.CORTIS
function tourChangeLang(lang) {
  const D = window.CORTIS;
  if (!D || !D.tour) return;
  const c = { eng: "en", indo: "id", korea: "ko" }[lang] || "en";
  const label = { en: "ENG ▼", id: "INDO ▼", ko: "한국어 ▼" }[c];
  const subJudul = { en: "TOUR", id: "TUR", ko: "투어 일정" }[c];

  if (langBtn) langBtn.textContent = label;
  if (tourTitle && D.tour.name) tourTitle.textContent = D.tour.name[c] || D.tour.name.en || "";
  if (tourSubtitle) tourSubtitle.textContent = subJudul;

  (D.tour.events || []).forEach((ev, i) => {
    const n = i + 1;
    const set = (id, txt) => { const el = document.getElementById(id + n); if (el) el.textContent = txt; };
    set("city", ev.city[c] || ev.city.en || "");
    set("location", "📍 " + (ev.location[c] || ev.location.en || ""));
    set("venue", "🏟 " + (ev.venue[c] || ev.venue.en || ""));
    set("date", "📅 " + cxFormatDate(ev.date, c, "tour"));
  });

  if (languageMenu) languageMenu.style.display = "none";
}


})();