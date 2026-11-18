-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Nov 2026 pada 13.14
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cortis_db`
--
CREATE DATABASE IF NOT EXISTS `cortis_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `cortis_db`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `about_content`
--

DROP TABLE IF EXISTS `about_content`;
CREATE TABLE `about_content` (
  `about_id` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `about_content`
--

INSERT INTO `about_content` (`about_id`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, '2026-11-11 07:18:37', '2026-11-11 07:18:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `about_content_translations`
--

DROP TABLE IF EXISTS `about_content_translations`;
CREATE TABLE `about_content_translations` (
  `about_trans_id` int(11) NOT NULL,
  `about_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `about_content_translations`
--

INSERT INTO `about_content_translations` (`about_trans_id`, `about_id`, `language_id`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'CORTIS (MARTIN, JAMES, JUHOON, SEONGHYEON, and KEONHO) is the first boy band in 6 years to debut under BIGHIT MUSIC, the powerhouse label behind iconic global groups like BTS and TOMORROW X TOGETHER. The name CORTIS is an unconventional mix of six letters drawn from the phrase \"COLOR OUTSIDE THE LINES,\" reflecting their determination to think beyond the boundaries defined by the world. True to their name, CORTIS is a crew of self-driven creatives who bring raw authenticity to everything they create, from music and choreography to video content. All five members draw from personal stories to showcase their inimitable creativity across songwriting, composition, performance, and videography. What sets them apart is their collaborative approach: rather than adhering to fixed roles, they work together as co-creators to bring their collective vision to life.', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(2, 1, 2, 'CORTIS (MARTIN, JAMES, JUHOON, SEONGHYEON, dan KEONHO) adalah boy band pertama dalam 6 tahun yang debut di bawah BIGHIT MUSIC, label besar di balik grup global terkenal seperti BTS dan TOMORROW X TOGETHER. Nama CORTIS merupakan perpaduan unik dari enam huruf yang diambil dari kalimat \"COLOR OUTSIDE THE LINES,\" yang mencerminkan tekad mereka untuk berpikir melampaui batas yang ditentukan oleh dunia. Sesuai dengan namanya, CORTIS adalah kumpulan kreator mandiri yang menghadirkan keaslian dalam setiap karya yang mereka buat, mulai dari musik, koreografi, hingga konten video. Kelima member mengambil cerita pribadi mereka untuk menunjukkan kreativitas unik dalam penulisan lagu, komposisi, penampilan, dan videografi. Hal yang membedakan mereka adalah pendekatan kolaboratif mereka: daripada mengikuti peran tetap, mereka bekerja bersama sebagai co-creator untuk mewujudkan visi kolektif mereka.', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(3, 1, 3, 'CORTIS(MARTIN, JAMES, JUHOON, SEONGHYEON, KEONHO)는 BTS와 TOMORROW X TOGETHER 같은 세계적인 그룹을 배출한 BIGHIT MUSIC에서 6년 만에 데뷔하는 첫 번째 보이 그룹입니다. CORTIS라는 이름은 \"COLOR OUTSIDE THE LINES\"라는 문구에서 가져온 여섯 글자의 독창적인 조합으로, 세상이 정해놓은 경계를 넘어 생각하려는 그들의 의지를 담고 있습니다. 이름처럼 CORTIS는 음악, 안무, 영상 콘텐츠 등 모든 창작물에 진정성을 담아내는 자기 주도적인 크리에이터 그룹입니다. 다섯 멤버는 개인적인 이야기를 바탕으로 작사, 작곡, 퍼포먼스, 영상 제작 등 다양한 분야에서 자신만의 창의성을 보여줍니다. 그들을 특별하게 만드는 것은 협업 방식이며, 정해진 역할에 얽매이지 않고 공동 창작자로서 함께 하나의 비전을 만들어갑니다.', '2026-11-11 07:18:37', '2026-11-11 07:18:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `about_slides`
--

DROP TABLE IF EXISTS `about_slides`;
CREATE TABLE `about_slides` (
  `slide_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `about_slides`
--

INSERT INTO `about_slides` (`slide_id`, `image_url`, `sort_order`, `is_active`, `created_at`, `updated_at`) VALUES
(12, 'uploads/eb099171fd91295f.png', 1, 1, '2026-11-18 10:03:28', '2026-11-18 12:59:26'),
(13, 'uploads/cd8505ab9345433d.png', 2, 1, '2026-11-18 10:09:12', '2026-11-18 12:59:35'),
(14, 'uploads/2f720c3f50a6e259.png', 3, 1, '2026-11-18 10:21:46', '2026-11-18 12:59:54'),
(15, 'uploads/079a39732bd6ff4e.jpg', 4, 1, '2026-11-18 10:21:59', '2026-11-18 10:21:59'),
(16, 'uploads/cb915379f175bcc4.png', 5, 1, '2026-11-18 10:22:11', '2026-11-18 13:00:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'editor',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `last_login_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `admins`
--

INSERT INTO `admins` (`admin_id`, `username`, `email`, `password_hash`, `role`, `is_active`, `last_login_at`, `created_at`, `updated_at`) VALUES
(1, 'zah', 'admin@cortis.local', '$2y$10$bmK2PaM96EZfl5KU/EWPoes3Luafpy1c69sRDW3a2Qs0KVTDQ2yki', 'superadmin', 1, NULL, '2026-11-05 13:13:31', '2026-11-11 14:19:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `home_banner`
--

DROP TABLE IF EXISTS `home_banner`;
CREATE TABLE `home_banner` (
  `banner_id` int(11) NOT NULL,
  `video_url` varchar(255) NOT NULL,
  `fallback_image_url` varchar(255) DEFAULT NULL,
  `debut_date` date NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `home_banner`
--

INSERT INTO `home_banner` (`banner_id`, `video_url`, `fallback_image_url`, `debut_date`, `is_active`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'media/mv money.mp4', NULL, '2025-08-18', 1, 1, '2026-11-11 07:18:37', '2026-11-18 10:53:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `languages`
--

DROP TABLE IF EXISTS `languages`;
CREATE TABLE `languages` (
  `language_id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `languages`
--

INSERT INTO `languages` (`language_id`, `code`, `name`, `is_default`) VALUES
(1, 'en', 'English', 1),
(2, 'id', 'Indonesia', 0),
(3, 'ko', '한국어', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `members`
--

DROP TABLE IF EXISTS `members`;
CREATE TABLE `members` (
  `member_id` int(11) NOT NULL,
  `stage_name` varchar(50) NOT NULL,
  `birth_date` date NOT NULL,
  `photo_url` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `members`
--

INSERT INTO `members` (`member_id`, `stage_name`, `birth_date`, `photo_url`, `sort_order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'KEONHO', '2009-02-14', 'uploads/cc3fe7eecb97ef46.png', 1, 1, '2026-11-11 07:18:37', '2026-11-18 12:17:34'),
(2, 'MARTIN', '2008-03-20', 'uploads/db714749e8482204.jpg', 2, 1, '2026-11-11 07:18:37', '2026-11-18 12:34:56'),
(3, 'JAMES', '2005-10-14', 'uploads/860f8367c433c194.jpg', 3, 1, '2026-11-11 07:18:37', '2026-11-18 12:36:01'),
(4, 'SEONGHYEON', '2009-01-13', 'uploads/d72e4341c5a7c624.jpg', 4, 1, '2026-11-11 07:18:37', '2026-11-18 12:36:15'),
(5, 'JUHOON', '2008-01-03', 'uploads/dca5a568ac7a30dc.png', 5, 1, '2026-11-11 07:18:37', '2026-11-18 12:18:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `navigation_menus`
--

DROP TABLE IF EXISTS `navigation_menus`;
CREATE TABLE `navigation_menus` (
  `menu_id` int(11) NOT NULL,
  `menu_key` varchar(30) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `is_external` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `navigation_menus`
--

INSERT INTO `navigation_menus` (`menu_id`, `menu_key`, `url`, `is_external`, `sort_order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'home', '/', 0, 1, 1, '2026-11-05 09:56:14', '2026-11-05 13:55:20'),
(2, 'about', '/about', 0, 2, 1, '2026-11-05 09:56:14', '2026-11-05 09:56:14'),
(3, 'news', '/news', 0, 3, 1, '2026-11-05 09:56:14', '2026-11-05 09:56:14'),
(4, 'tour', '/tour', 0, 4, 1, '2026-11-05 09:56:14', '2026-11-05 09:56:14'),
(5, 'music', '/music', 0, 5, 1, '2026-11-05 09:56:14', '2026-11-05 09:56:14'),
(6, 'shop', NULL, 1, 6, 1, '2026-11-05 09:56:14', '2026-11-05 09:56:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `navigation_menu_translations`
--

DROP TABLE IF EXISTS `navigation_menu_translations`;
CREATE TABLE `navigation_menu_translations` (
  `menu_trans_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `label` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `navigation_menu_translations`
--

INSERT INTO `navigation_menu_translations` (`menu_trans_id`, `menu_id`, `language_id`, `label`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'ABOUT', '2026-11-05 13:57:57', '2026-11-05 13:57:57'),
(2, 1, 1, 'HOME', '2026-11-05 13:57:57', '2026-11-05 13:57:57'),
(3, 5, 1, 'MUSIC', '2026-11-05 13:57:57', '2026-11-05 13:57:57'),
(4, 3, 1, 'NEWS', '2026-11-05 13:57:57', '2026-11-05 13:57:57'),
(5, 6, 1, 'SHOP', '2026-11-05 13:57:57', '2026-11-05 13:57:57'),
(6, 4, 1, 'TOUR', '2026-11-05 13:57:57', '2026-11-05 13:57:57'),
(7, 2, 2, 'TENTANG', '2026-11-05 13:57:57', '2026-11-05 13:57:57'),
(8, 1, 2, 'BERANDA', '2026-11-05 13:57:57', '2026-11-05 13:57:57'),
(9, 5, 2, 'MUSIK', '2026-11-05 13:57:57', '2026-11-05 13:57:57'),
(10, 3, 2, 'BERITA', '2026-11-05 13:57:57', '2026-11-05 13:57:57'),
(11, 6, 2, 'TOKO', '2026-11-05 13:57:57', '2026-11-05 13:57:57'),
(12, 4, 2, 'TUR', '2026-11-05 13:57:57', '2026-11-05 13:57:57'),
(13, 2, 3, '소개', '2026-11-05 13:57:57', '2026-11-05 13:57:57'),
(14, 1, 3, '홈', '2026-11-05 13:57:57', '2026-11-05 13:57:57'),
(15, 5, 3, '음악', '2026-11-05 13:57:57', '2026-11-05 13:57:57'),
(16, 3, 3, '뉴스', '2026-11-05 13:57:57', '2026-11-05 13:57:57'),
(17, 6, 3, '상점', '2026-11-05 13:57:57', '2026-11-05 13:57:57'),
(18, 4, 3, '투어', '2026-11-05 13:57:57', '2026-11-05 13:57:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `external_id` varchar(100) NOT NULL,
  `source_name` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `thumbnail_url` varchar(255) DEFAULT NULL,
  `article_url` varchar(500) NOT NULL,
  `published_at` datetime NOT NULL,
  `fetched_at` datetime NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `news`
--

INSERT INTO `news` (`news_id`, `external_id`, `source_name`, `title`, `thumbnail_url`, `article_url`, `published_at`, `fetched_at`, `created_at`, `updated_at`, `is_active`) VALUES
(1, '8cd0c763e8638c6f133809f8e562c6e4ce5fc6fa', 'IDN Times', '[QUIZ] Kalau Kamu Masuk Tim Paskib Sekolah, Siapa Member CORTIS yang Jadi Dantonnya?', 'https://image.idntimes.com/post/20261102/1_f7a75b82-06b2-4c81-9aa2-5e79640d02a4.jpg', 'https://www.idntimes.com/korea/kpop/quiz-kalau-kamu-masuk-tim-paskib-sekolah-siapa-member-cortis-yang-jadi-dantonnya-quiz-00-6x7yf-db87fp', '2026-11-03 00:00:00', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37', 1),
(2, '705ee2f9c53f17b24012f13aa1bf11035fafc21a', 'IDN Times', '[QUIZ] Siapa Member CORTIS yang Ajak Kamu Berburu Trick or Treat di Halloween Tahun Ini?', 'https://image.idntimes.com/post/20260824/img_8787_b858c5a0-28b5-4493-a1fa-7d1d8ff22ad6.png', 'https://www.idntimes.com/korea/kpop/quiz-siapa-member-cortis-yang-ajak-kamu-berburu-trick-or-treat-di-halloween-tahun-ini-quiz-00-hwff8-6g6qrp', '2026-10-27 00:00:00', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37', 1),
(3, '9220ee60c7859265ea0beb3cb863938a583d77a8', 'IDN Times', '[QUIZ] Member CORTIS yang Cocok Jadi Partner Traveling Akhir Tahun 2026?', 'https://image.idntimes.com/post/20260902/whatsapp-image-2026-09-02-at-19_ecb78e27-fbd5-47ef-b092-5adeda43e417.jpeg', 'https://www.idntimes.com/travel/destination/quiz-siapa-member-cortis-yang-cocok-jadi-partner-traveling-akhir-tahun-2026-quiz-00-z5hk4-68mj7h', '2026-10-27 00:00:00', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37', 1),
(4, 'b11d8c1e5d20133a5c9af4029672299a4c9cc14d', 'IDN Times', '[QUIZ] Siapakah Night Ride Date-mu Diantara ke-5 Member CORTIS?', 'https://image.idntimes.com/post/20260916/img_0149_76134283-81e7-4c97-bb85-78f0eaa568af.png', 'https://www.idntimes.com/korea/kpop/quiz-siapakah-night-ride-date-mu-diantara-ke-5-member-cortis-quiz-00-syg99-vnqsn0', '2026-10-05 00:00:00', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37', 1),
(5, 'd36940d1a6b6266790ca818c57a5f67c5b8c1970', 'IDN Times', '[QUIZ] Siapa Grup Gen 5 yang Cocok Jadi Teman Mabar Mobile Legends-mu?', 'https://image.idntimes.com/post/20261012/4_78cabc2d-8737-4bb3-9625-09f2277d68d3.jpg', 'https://www.idntimes.com/korea/kpop/quiz-siapa-grup-gen-5-yang-cocok-jadi-teman-mabar-mobile-legends-mu-quiz-00-6x7yf-t2j429', '2026-10-13 00:00:00', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37', 1),
(6, '57e284332ca4df36ba97e41618397ec13e929197', 'IDN Times', '[QUIZ] Kalau Jadi Ketua Ekskul Musik, Siapa Member CORTIS yang Kamu Ajak Join Band Sekolah?', 'https://image.idntimes.com/post/20260928/1_07d90efa-4c22-4cfc-808d-9e7f35388b9e.jpg', 'https://www.idntimes.com/korea/kpop/quiz-kalau-jadi-ketua-ekskul-musik-siapa-member-cortis-yang-kamu-ajak-join-band-sekolah-quiz-00-6x7yf-kbw0y9', '2026-10-05 00:00:00', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37', 1),
(7, '274d8ec2aaa6cb1892338e4b5e0a19473b15f3ac', 'IDN Times', '[QUIZ] Siapa Member CORTIS yang Ajak Kamu Nonton Synchronize Festival 2026?', 'https://image.idntimes.com/post/20260819/img_8406_7e638e0d-a878-44e9-9bab-9ab9d4d9c3e0.png', 'https://www.idntimes.com/korea/kpop/quiz-siapa-member-cortis-yang-ajak-kamu-nonton-synchronize-festival-2026-quiz-00-syg99-87br42', '2026-10-04 00:00:00', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37', 1),
(8, 'bb25cb56859fa1f4b972ccdaeb5f5406702b5d9d', 'IDN Times', '[QUIZ] Kalau Kamu Pesan Ojol, Member CORTIS Mana yang Jadi Abang Sopirnya?', 'https://image.idntimes.com/post/20261001/chatgpt-image-oct-1-2026-03_58_52-pm_0f160372-2953-4b8a-a483-b72ecd7ed885.png', 'https://www.idntimes.com/korea/kpop/quiz-kalau-kamu-pesan-ojol-member-cortis-mana-yang-jadi-abang-sopirnya-quiz-00-hwff8-yd0hqd', '2026-10-01 00:00:00', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37', 1),
(9, '33277468804f41cb8ac3872bd7dad03025535c54', 'IDN Times', '[QUIZ] Kalau Kamu Pingsan Pas Upacara Senin, Siapa Member CORTIS yang Bawa Kamu ke UKS?', 'https://image.idntimes.com/post/20260911/1_57455905-038b-48f8-838a-1c8b29164c44.jpg', 'https://www.idntimes.com/korea/kpop/quiz-kalau-kamu-pingsan-pas-upacara-hari-senin-siapa-member-cortis-yang-bawa-kamu-ke-uks-quiz-00-hwff8-k0r345', '2026-09-27 00:00:00', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37', 1),
(10, '6b7e145d698992b1f52440cb28f841aa96cc8596', 'IDN Times', 'MC dan Lineup Music Bank Global Festival in Japan 2026, aespa hingga IVE', 'https://image.idntimes.com/post/20260927/1_87d18fc8-6cb1-45cd-bea3-006bc584225e.jpg', 'https://www.idntimes.com/korea/kpop/mc-dan-line-up-music-bank-global-festival-in-japan-2026-00-6x7yf-hywdyw', '2026-09-27 00:00:00', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37', 1),
(11, '43c2f4b9fc1ad1c4a2312a91b656cc487711cd15', 'IDN Times', '[QUIZ] Nonton Pestapora 2026 Sendirian? Ini Boygrup Gen 5 yang Siap Nemenin!', 'https://image.idntimes.com/post/20260820/1_cdc669e5-ca8f-43cf-8344-2d1b8e90d784.jpg', 'https://www.idntimes.com/korea/kpop/quiz-nonton-pestapora-2026-sendirian-ini-boygrup-gen-5-yang-siap-nemenin-quiz-00-6x7yf-ldxcm0', '2026-09-24 00:00:00', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37', 1),
(12, 'ce91d8f8d3f9c8758d45f083759f5411a0e1edcf', 'IDN Times', '9 Lagu Boy Group Sukses Charting Tinggi di Korea, Ada \'REDRED\' CORTIS!', 'https://image.idntimes.com/post/20260918/1000020505_26cc44ae-e9cf-4cea-bfc9-2c2d446c3d81.jpg', 'https://www.idntimes.com/korea/kpop/lagu-boy-group-sukses-di-chart-di-korea-c1c2-01-2kxv1-9h8hdk', '2026-09-22 00:00:00', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37', 1),
(13, 'ebe30e8b0684ce2f6468821295d05eabc13382ea', 'IDN Times', 'Daftar Penghargaan CORTIS usai Setahun Debut, Sudah Dapat 2 Daesang', 'https://image.idntimes.com/post/20260920/hsnxs6mbqaahfzm_5e793764-cad3-4181-8c1d-fcc2d51bb5a9.jpg', 'https://www.idntimes.com/korea/kpop/daftar-penghargaan-cortis-usai-setahun-debut-sudah-dapat-2-daesang-c1c2-01-cccnm-rwl7bb', '2026-09-20 00:00:00', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37', 1),
(14, 'f2152ddc4702a76920e93d822a97b142742460bd', 'IDN Times', 'Daftar Pemenang The Fact Music Awards (TMA) 2026, CORTIS-ATEEZ Daesang', 'https://image.idntimes.com/post/20260919/atez_3c953216-5a72-49ec-9621-e3e289f42faa.png', 'https://www.idntimes.com/korea/kpop/daftar-pemenang-the-fact-music-awards-tma-2026-00-dt824-zw0spt', '2026-09-19 00:00:00', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37', 1),
(15, '47ae4391f7448ae496abfae0f3af66d73d6c4253', 'IDN Times', '[QUIZ] Seberapa Jeli Matamu Menebak Member CORTIS? Buktikan Kamu Beneran COER', 'https://image.idntimes.com/post/20251123/upload_27d11e2f751d08633257c940ffd5cde2_6133c36a-0f18-4ef1-8810-c3e0342263d6.jpeg', 'https://www.idntimes.com/korea/kpop/quiz-seberapa-jeli-matamu-menebak-member-cortis-buktikan-kamu-beneran-coer-q9t01-quiz-00-9n2b6-vpn63l', '2026-09-19 00:00:00', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `news_translations`
--

DROP TABLE IF EXISTS `news_translations`;
CREATE TABLE `news_translations` (
  `news_trans_id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `translated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `news_translations`
--

INSERT INTO `news_translations` (`news_trans_id`, `news_id`, `language_id`, `title`, `translated_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '[QUIZ] If You Join the School Flag-Raising Squad, Which CORTIS Member Is Your Commander?', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(2, 1, 2, '[QUIZ] Kalau Kamu Masuk Tim Paskib Sekolah, Siapa Member CORTIS yang Jadi Dantonnya?', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(3, 1, 3, '[퀴즈] 학교 국기게양 팀에 들어간다면, 대장은 어떤 CORTIS 멤버일까?', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(4, 2, 1, '[QUIZ] Which CORTIS Member Takes You Trick-or-Treating This Halloween?', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(5, 2, 2, '[QUIZ] Siapa Member CORTIS yang Ajak Kamu Berburu Trick or Treat di Halloween Tahun Ini?', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(6, 2, 3, '[퀴즈] 올해 할로윈에 함께 트릭 오어 트릿을 할 CORTIS 멤버는?', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(7, 3, 1, '[QUIZ] Which CORTIS Member Is the Best Travel Partner for Year-End 2026?', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(8, 3, 2, '[QUIZ] Member CORTIS yang Cocok Jadi Partner Traveling Akhir Tahun 2026?', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(9, 3, 3, '[퀴즈] 2026년 연말 여행 파트너로 어울리는 CORTIS 멤버는?', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(10, 4, 1, '[QUIZ] Who Among the 5 CORTIS Members Is Your Night Ride Date?', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(11, 4, 2, '[QUIZ] Siapakah Night Ride Date-mu Diantara ke-5 Member CORTIS?', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(12, 4, 3, '[퀴즈] CORTIS 멤버 5명 중 나의 나이트 라이드 데이트 상대는?', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(13, 5, 1, '[QUIZ] Which Gen 5 Group Is Your Best Mobile Legends Squad Mate?', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(14, 5, 2, '[QUIZ] Siapa Grup Gen 5 yang Cocok Jadi Teman Mabar Mobile Legends-mu?', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(15, 5, 3, '[퀴즈] 모바일 레전드를 함께할 5세대 그룹은 누구?', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(16, 6, 1, '[QUIZ] As Music Club Leader, Which CORTIS Member Would You Invite to the School Band?', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(17, 6, 2, '[QUIZ] Kalau Jadi Ketua Ekskul Musik, Siapa Member CORTIS yang Kamu Ajak Join Band Sekolah?', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(18, 6, 3, '[퀴즈] 음악 동아리 회장이라면 학교 밴드에 어떤 CORTIS 멤버를 영입할까?', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(19, 7, 1, '[QUIZ] Which CORTIS Member Invites You to Synchronize Festival 2026?', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(20, 7, 2, '[QUIZ] Siapa Member CORTIS yang Ajak Kamu Nonton Synchronize Festival 2026?', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(21, 7, 3, '[퀴즈] Synchronize Festival 2026에 함께 갈 CORTIS 멤버는?', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(22, 8, 1, '[QUIZ] If You Book a Motorcycle Taxi, Which CORTIS Member Is Your Driver?', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(23, 8, 2, '[QUIZ] Kalau Kamu Pesan Ojol, Member CORTIS Mana yang Jadi Abang Sopirnya?', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(24, 8, 3, '[퀴즈] 오토바이 택시를 부르면 어떤 CORTIS 멤버가 기사님일까?', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(25, 9, 1, '[QUIZ] Kalau Kamu Pingsan Pas Upacara Senin, Siapa Member CORTIS yang Bawa Kamu ke UKS?', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(26, 9, 2, '[QUIZ] Kalau Kamu Pingsan Pas Upacara Senin, Siapa Member CORTIS yang Bawa Kamu ke UKS?', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(27, 9, 3, '[QUIZ] Kalau Kamu Pingsan Pas Upacara Senin, Siapa Member CORTIS yang Bawa Kamu ke UKS?', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(28, 10, 1, 'MC dan Lineup Music Bank Global Festival in Japan 2026, aespa hingga IVE', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(29, 10, 2, 'MC dan Lineup Music Bank Global Festival in Japan 2026, aespa hingga IVE', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(30, 10, 3, 'MC dan Lineup Music Bank Global Festival in Japan 2026, aespa hingga IVE', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(31, 11, 1, '[QUIZ] Nonton Pestapora 2026 Sendirian? Ini Boygrup Gen 5 yang Siap Nemenin!', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(32, 11, 2, '[QUIZ] Nonton Pestapora 2026 Sendirian? Ini Boygrup Gen 5 yang Siap Nemenin!', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(33, 11, 3, '[QUIZ] Nonton Pestapora 2026 Sendirian? Ini Boygrup Gen 5 yang Siap Nemenin!', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(34, 12, 1, '9 Boy Group Songs That Charted High in Korea, Including CORTIS\'s \'REDRED\'!', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(35, 12, 2, '9 Lagu Boy Group Sukses Charting Tinggi di Korea, Ada \'REDRED\' CORTIS!', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(36, 12, 3, '한국 차트 상위권에 오른 보이그룹 노래 9곡, CORTIS의 \'REDRED\' 포함!', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(37, 13, 1, 'CORTIS\'s Awards After One Year Since Debut, Already Won 2 Daesang', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(38, 13, 2, 'Daftar Penghargaan CORTIS usai Setahun Debut, Sudah Dapat 2 Daesang', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(39, 13, 3, '데뷔 1주년 CORTIS 수상 내역, 이미 대상 2회 수상', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(40, 14, 1, 'The Fact Music Awards (TMA) 2026 Winners: CORTIS and ATEEZ Take Daesang', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(41, 14, 2, 'Daftar Pemenang The Fact Music Awards (TMA) 2026, CORTIS-ATEEZ Daesang', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(42, 14, 3, '2026 더 팩트 뮤직 어워즈(TMA) 수상자, CORTIS·ATEEZ 대상', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(43, 15, 1, '[QUIZ] Seberapa Jeli Matamu Menebak Member CORTIS? Buktikan Kamu Beneran COER', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(44, 15, 2, '[QUIZ] Seberapa Jeli Matamu Menebak Member CORTIS? Buktikan Kamu Beneran COER', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(45, 15, 3, '[QUIZ] Seberapa Jeli Matamu Menebak Member CORTIS? Buktikan Kamu Beneran COER', '2026-11-05 08:41:24', '2026-11-11 07:18:37', '2026-11-11 07:18:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `social_links`
--

DROP TABLE IF EXISTS `social_links`;
CREATE TABLE `social_links` (
  `link_id` int(11) NOT NULL,
  `platform` varchar(30) NOT NULL,
  `url` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `social_links`
--

INSERT INTO `social_links` (`link_id`, `platform`, `url`, `sort_order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'youtube', 'https://youtube.com/@cortis_bighit?si=tDK2Ba38xkirYd6N', 1, 1, '2026-11-05 13:57:57', '2026-11-18 12:40:58'),
(2, 'x', 'https://x.com/cortis_bighit', 2, 1, '2026-11-05 13:57:57', '2026-11-05 13:57:57'),
(3, 'instagram', 'https://www.instagram.com/cortis?igsh=bWhrc2l4enk5YTFw', 3, 1, '2026-11-05 13:57:57', '2026-11-05 13:57:57'),
(4, 'tiktok', 'https://www.tiktok.com/@cortis_bighit?is_from_webapp=1&sender_device=pc', 4, 1, '2026-11-05 13:57:57', '2026-11-05 13:57:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `songs`
--

DROP TABLE IF EXISTS `songs`;
CREATE TABLE `songs` (
  `song_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `artist_name` varchar(100) NOT NULL DEFAULT 'CORTIS',
  `release_date` date NOT NULL,
  `stream_count` bigint(20) NOT NULL DEFAULT 0,
  `cover_url` varchar(255) NOT NULL,
  `audio_url` varchar(255) NOT NULL,
  `mv_url` varchar(255) NOT NULL,
  `hover_background_url` varchar(255) DEFAULT NULL,
  `duration_seconds` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `songs`
--

INSERT INTO `songs` (`song_id`, `title`, `artist_name`, `release_date`, `stream_count`, `cover_url`, `audio_url`, `mv_url`, `hover_background_url`, `duration_seconds`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'REDRED', 'CORTIS', '2026-04-20', 85210000, 'uploads/5e872bea6e5e1f85.jpg', 'media/redred.mp3', 'media/redred.mp4', 'uploads/6afaa5af32c109ed.jpg', 150, 1, '2026-11-11 07:18:37', '2026-11-12 12:21:30'),
(2, 'GO!', 'CORTIS', '2026-04-20', 98450000, 'uploads/f724ca86d226ac1e.jpg', 'media/go.mp3', 'media/go.mp4', 'uploads/fea14754edcb18bd.jpg', 164, 1, '2026-11-11 07:18:37', '2026-11-12 12:21:58'),
(3, 'FaShioN', 'CORTIS', '2025-08-18', 64890000, 'uploads/3fb7b65528fc5213.jpg', 'media/fashion.mp3', 'media/fashion.mp4', 'uploads/a344f6d738f899f4.jpg', 97, 1, '2026-11-11 07:18:37', '2026-11-12 12:22:23'),
(4, 'JoyRide', 'CORTIS', '2026-04-20', 39780000, 'uploads/5ebe8cea61309f9a.jpg', 'media/joyride.mp3', 'media/joyride.mp4', 'uploads/4743a380c000f79f.jpg', 87, 1, '2026-11-11 07:18:37', '2026-11-12 12:22:34'),
(5, 'What You Want', 'CORTIS', '2025-08-18', 52140000, 'uploads/359be72659c7c4f5.jpg', 'media/whatyouwant.mp3', 'media/whatyouwant.mp4', 'uploads/2e625909f0ed04fd.jpg', 104, 1, '2026-11-11 07:18:37', '2026-11-12 12:22:47'),
(6, 'MoneyMoneyMoney', 'CORTIS', '2026-08-24', 0, 'uploads/7f288a0d6759c32a.jpg', 'media/audio money.mp3', 'media/mv money.mp4', 'uploads/776c0a3096d0e0bb.jpg', 140, 1, '2026-11-18 10:52:30', '2026-11-18 10:52:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `song_lyric_lines`
--

DROP TABLE IF EXISTS `song_lyric_lines`;
CREATE TABLE `song_lyric_lines` (
  `line_id` int(11) NOT NULL,
  `song_id` int(11) NOT NULL,
  `line_no` int(11) NOT NULL,
  `start_time_ms` int(11) NOT NULL,
  `lyric_text` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `song_lyric_lines`
--

INSERT INTO `song_lyric_lines` (`line_id`, `song_id`, `line_no`, `start_time_ms`, `lyric_text`, `created_at`, `updated_at`) VALUES
(16, 1, 1, 800, 'Green, green', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(17, 1, 2, 2400, '따바라 한 모금 sip (Ooh)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(18, 1, 3, 4100, 'Caffeine 또 kickin\' in', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(19, 1, 4, 5900, '어젯밤에 만들던 beat', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(20, 1, 5, 7700, '내 폰에다 담아서 거리로 나가서', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(21, 1, 6, 9900, '다섯이 고개를 빙빙', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(22, 1, 7, 11700, '입꼬린 올라가, 히히', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(23, 1, 8, 13500, '핸드폰 바꿔 놔 D-N-D', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(24, 1, 9, 15200, 'Seeing all kinds of green, green', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(25, 1, 10, 17100, '쉿, 한파에 (한파에)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(26, 1, 11, 19000, 'I put my hands in my pocket (Pocket)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(27, 1, 12, 20900, 'Outside, 한 밤에 (한 밤에)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(28, 1, 13, 22700, '사람 없는 스팟으로 빨리 (Brr)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(29, 1, 14, 24600, 'I\'ll do that shit all with my team (Team)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(30, 1, 15, 26400, '누군가 싫어할 짓 (짓)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(31, 1, 16, 28250, '알 바가 아니여 get it, get it', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(32, 1, 17, 30100, '신호등 바뀌었어 green, green', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(33, 1, 18, 32000, '팔랑귀 팔랑귀 (That\'s red, red)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(34, 1, 19, 33800, '눈치나 살피기 (That\'s red, red)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(35, 1, 20, 35700, '도가니 사리기 (That\'s red, red)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(36, 1, 21, 37550, '넘어가 울타리 green, green', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(37, 1, 22, 39400, '궁뎅이 가리기 (That\'s red, red)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(38, 1, 23, 41200, '주변을 살피기 (That\'s red, red)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(39, 1, 24, 43100, '쿨한 척 척하기 (That\'s red, red)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(40, 1, 25, 44900, 'You should come mess with the team', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(41, 1, 26, 46850, '내 친구들 전부 한 트럭에다 담아서', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(42, 1, 27, 49000, '거리로 나가서 빙빙', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(43, 1, 28, 50850, '거리서 돌다가 돌아가 studio', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(44, 1, 29, 52650, 'Cookin\' up \'til we get stinky', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(45, 1, 30, 54500, '팔랑귀 팔랑귀 (That\'s red, red)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(46, 1, 31, 56350, '눈치나 살피기 (That\'s red, red)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(47, 1, 32, 58200, '도가니 사리기 (That\'s red, red)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(48, 1, 33, 60000, 'You should come mess with the team', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(49, 1, 34, 61900, 'They called me a freak, 홀린 듯이, yeah', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(50, 1, 35, 63850, '만들던 tracks, yeah, 듣고 모인 friends, yeah', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(51, 1, 36, 65700, '하루가 갈수록 늘어가 pack', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(52, 1, 37, 67500, '진짜배기처럼 밟아가 step (Ah)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(53, 1, 38, 69400, 'Screaming loud like yeah, yeah', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(54, 1, 39, 71250, '고개 까딱여 like yeah, yeah', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(55, 1, 40, 73100, 'F1,들지 마 red flag', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(56, 1, 41, 74950, 'You should come mess with the team (Tell me what\'s red)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(57, 1, 42, 76950, '차갑게 방치된 city (That\'s red)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(58, 1, 43, 78750, '먼지가 쌓인 그 CD (That\'s red)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(59, 1, 44, 80600, '정숙한 무대는 시시해', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(60, 1, 45, 82300, '답답해 정수리 시뻘게지지 (That\'s red)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(61, 1, 46, 84400, 'We gotta pop out to show how', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(62, 1, 47, 86200, '다시 배워 봐, you gotta note down', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(63, 1, 48, 88050, '불러와 버려 두 번째 혼란', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(64, 1, 49, 89900, '신호등 바뀌었어 green, green', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(65, 1, 50, 91750, '팔랑귀 팔랑귀 (That\'s red, red)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(66, 1, 51, 93650, '눈치나 살피기 (That\'s red, red)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(67, 1, 52, 95500, '도가니 사리기 (That\'s red, red)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(68, 1, 53, 97350, '넘어가 울타리 green, green', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(69, 1, 54, 99250, '궁뎅이 가리기 (That\'s red, red)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(70, 1, 55, 101100, '주변을 살피기 (That\'s red, red)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(71, 1, 56, 102950, '쿨한 척 척하기 (That\'s red, red)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(72, 1, 57, 104800, 'You should come mess with the team', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(73, 1, 58, 106700, 'Ayy (Yeah, yeah)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(74, 1, 59, 108500, 'Turn it up, ayy', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(75, 1, 60, 110350, 'I told you to turn it up', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(76, 1, 61, 112150, 'I don\'t mess with no stupid red signs', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(77, 1, 62, 114100, '신호등 바뀌었어 green, green', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(78, 1, 63, 115950, '팔랑귀 팔랑귀 (That\'s red, red)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(79, 1, 64, 117850, '눈치나 살피기 (That\'s red, red)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(80, 1, 65, 119700, '도가니 사리기 (That\'s red, red)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(81, 1, 66, 121500, '넘어가 울타리 green, green', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(82, 1, 67, 123400, '궁뎅이 가리기 (That\'s red, red)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(83, 1, 68, 125250, '주변을 살피기 (That\'s red, red)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(84, 1, 69, 127100, '쿨한 척 척하기 (That\'s red, red)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(85, 1, 70, 128900, 'You should come mess with the team', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(86, 1, 71, 130850, '내 친구들 전부 한 트럭에다 담아서', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(87, 1, 72, 132900, '거리로 나가서 빙빙', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(88, 1, 73, 134750, '거리서 돌다가 돌아가 studio', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(89, 1, 74, 136600, 'Cookin\' up \'til we get stinky', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(90, 1, 75, 138400, '팔랑귀 팔랑귀 (That\'s red, red)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(91, 1, 76, 140300, '눈치나 살피기 (That\'s red, red)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(92, 1, 77, 142150, '도가니 사리기 (That\'s red, red)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(93, 1, 78, 144000, 'You should come mess with the team', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(94, 2, 1, 1000, '우린 필요 없어 다른 sign', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(95, 2, 2, 3250, 'Paint the town, 초록색의 lights', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(96, 2, 3, 3950, '페달에 발을 올려, 마치 bike', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(97, 2, 4, 5800, 'I just gotta get it', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(98, 2, 5, 7650, 'Watch me go, go, go, go, go, go', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(99, 2, 6, 71400, 'I just gotta get it', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(100, 2, 7, 73250, 'Watch me go, go, go, go, go, go', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(101, 2, 8, 76950, 'I just gotta get it', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(102, 2, 9, 78850, '가져와 new beat, 가져와 new hit', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(103, 2, 10, 80700, '가져와 new sheet, 만들어 new shit', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(104, 2, 11, 82550, '가져와 new beat, 가져와 new hit', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(105, 2, 12, 84400, '가져와 new sheet, I\'m on the new shit', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(106, 2, 13, 86250, 'Drippy, 고장 난 듯 배수관이, yeah, yeah', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(107, 2, 14, 88150, '불러와 new wave, Poseidon 같이 (uh, uh)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(108, 2, 15, 90000, 'Martin (that\'s on fire), play that beat (that\'s on fire)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(109, 2, 16, 91850, 'Yeah, 작업실에서 불을 피워 밤도 대낮같이 (yeah)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(110, 2, 17, 93700, '우린 오늘 만들었지 and this track is so sick', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(111, 2, 18, 95550, '레벨 좀 더 키워 이 노래는 달려 도시를 (도시, yeah)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(112, 2, 19, 97400, '우린 필요 없어 다른 sign (okay, okay)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(113, 2, 20, 99250, 'Paint the town, 초록색의 lights (yeah, lights)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(114, 2, 21, 101150, '페달에 발을 올려, 마치 bike (yeah, yeah)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(115, 2, 22, 103000, 'I just gotta get it', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(116, 2, 23, 104850, 'Watch me go, go, go, go, go, go', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(117, 2, 24, 108550, 'I just gotta get it', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(118, 2, 25, 110450, 'Watch me go, go, go, go, go, go', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(119, 2, 26, 114100, 'I just gotta get it', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(120, 2, 27, 116000, '어렸을 때부터 난 동네서 좀 특이했어 (pow, pow, pow, pow, pow)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(121, 2, 28, 119700, 'Yeah, 맘은 이미 pop star back at 중이 때 (yeah, yeah, yeah, yeah)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(122, 2, 29, 123400, '우린 모자 눌러쓰고 new era 추진해 (ay, ay)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(123, 2, 30, 125250, '우릴 보고 엄지 들어 모든 구시대, yeah', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(124, 2, 31, 127150, 'Watch me, I\'m gon\' spit it, pop and pop, 난 지금 hit mode', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(125, 2, 32, 129000, 'Hitman처럼 hit 만들고 싶어서 난 reload (reload)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(126, 2, 33, 130850, '치키치키 reload, uh-uh, reload (ay)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(127, 2, 34, 132700, '신호 주면 바로 던져넣어, 마치 free throw', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(128, 2, 35, 134550, '우린 필요 없어 다른 sign', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(129, 2, 36, 136400, 'Paint the town, 초록색의 lights', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(130, 2, 37, 138250, '페달에 발을 올려, 마치 bike', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(131, 2, 38, 140100, 'I just gotta get it', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(132, 2, 39, 141950, 'Watch me go, go, go, go, go, go', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(133, 2, 40, 145700, 'I just gotta get it', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(134, 2, 41, 147550, 'Watch me go, go, go, go, go, go', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(135, 2, 42, 151250, 'I just gotta get it', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(136, 2, 43, 153150, '가져와 new beat, 가져와 new hit', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(137, 2, 44, 155000, '가져와 new sheet, 만들어 new shit', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(138, 2, 45, 156850, '가져와 new beat, 가져와 new hit', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(139, 2, 46, 158700, '가져와 new sheet, I\'m on the new shit', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(140, 3, 1, 350, '내 티, five bucks, 바지는 만원', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(141, 3, 2, 2200, 'My vision 몇 억s, 몇 조s, Bezos', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(142, 3, 3, 4050, '동묘, what\'s up? 홍대, what\'s up? (워워)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(143, 3, 4, 5850, 'I make \'em famous, I call that, \'Fashion\' (워워)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(144, 3, 5, 7750, 'Fashion, fashion, fashion, fashion (워, let\'s go)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(145, 3, 6, 9600, 'Fashion, fashion, fashion, fashion (what, what, what?)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(146, 3, 7, 11450, '내 티, five bucks, 바지는 만원', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(147, 3, 8, 13300, 'Let\'s get it (yeah), let\'s go, fashion, fashion (huh, huh)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(148, 3, 9, 15150, '안건호, 내가 산 옷 보고 뭐라고 말해도, 지켜 내 고집 (yeah)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(149, 3, 10, 17000, '후르츠 찜해 놓은 상품에 있었던 벨트는, now on my 허리, huh', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(150, 3, 11, 18850, 'Sorry, my granny, 요즘 왜 안 오니? 섭하신 동묘 할머니', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(151, 3, 12, 20700, '여긴 비행기, huh, L.A.에서 앨범을 끝내고, 멋있게 돌아와, back on my swag', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(152, 3, 13, 22550, 'Huh, huh, 외화 talk, huh, 환율 올라 매일 (빠빠)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(153, 3, 14, 24400, '구제 판, got me looking fresh (빠빠)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(154, 3, 15, 26250, 'Pull up, boys, 샥샥 긁어내 (skrrt, skrrt)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(155, 3, 16, 28100, '빈티지져스 (지져스)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(156, 3, 17, 29050, '동묘에서 모여, 마치 세미나', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(157, 3, 18, 29950, '홍대에서 모여, 우린 set it off (set it off)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(158, 3, 19, 31800, '청-청-청담동 한가운데까지, spreading out (yeah, brr)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(159, 3, 20, 33650, 'Squad is on the way, but we can\'t wrap it up (yeah)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(160, 3, 21, 35500, '내 티, five bucks, 바지는 만원', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(161, 3, 22, 37350, 'My vision 몇 억s, 몇 조s, Bezos', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(162, 3, 23, 39200, '동묘, what\'s up? 홍대, what\'s up? (워워)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(163, 3, 24, 41050, 'I make \'em famous, I call that, \'Fashion\' (워워)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(164, 3, 25, 42900, 'Fashion, fashion, fashion, fashion (brr, let\'s go)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(165, 3, 26, 44750, 'Fashion, fashion, fashion, fashion (what, what, what?)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(166, 3, 27, 46600, '내 티, five bucks, 바지는 만원 (yeah)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(167, 3, 28, 48450, 'Let\'s get it, let\'s go (let\'s go), fashion, fashion', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(168, 3, 29, 50300, 'Yeah, sim장이 pop out, 첫눈에 바로 cop-cop', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(169, 3, 30, 52150, 'Okay, 구제 짬밥 삼만원짜리 잠바', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(170, 3, 31, 54000, 'Ay-yay-yay, feel like rock star, 확 met gala로 갈라, let\'s go', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(171, 3, 32, 55850, 'Top designers, 홍대 맛보고, 환장 fashion', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(172, 3, 33, 57700, 'Come and try, 동묘 生活에서, 난', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(173, 3, 34, 59100, '체력을 많이 닦아 놔, mosh pit 하는 법 배워 놔', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(174, 3, 35, 60950, '배워봐, 배워봐, 너도 빨리 배워 봐', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(175, 3, 36, 62800, '옷 무덤 속 다시 태어나, 빈티지져스 came alive', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(176, 3, 37, 64650, '동묘에서 모여, 마치 세미나', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(177, 3, 38, 65600, '홍대에서 모여, 우린 set it off (set it off)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(178, 3, 39, 67450, '청-청-청담동 한가운데까지, spreading out (yeah, brr)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(179, 3, 40, 69300, 'Squad is on the way, but we can\'t wrap it up (yeah, skrrt)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(180, 3, 41, 71150, '내 티, five bucks, 바지는 만원', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(181, 3, 42, 73000, 'My vision 몇 억s, 몇 조s, Bezos', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(182, 3, 43, 74850, '동묘, what\'s up? 홍대, what\'s up? (워워)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(183, 3, 44, 76700, 'I make \'em famous, I call that, \'Fashion\'', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(184, 3, 45, 78550, 'Fashion, fashion, fashion, fashion (워, let\'s go)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(185, 3, 46, 80400, 'Fashion, fashion, fashion, fashion', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(186, 3, 47, 82250, 'Fashion, fashion, fashion, fashion (워, let\'s go)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(187, 3, 48, 84100, 'Fashion, fashion, fashion, fashion (what, what?)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(188, 3, 49, 85950, 'Fashion, fashion, fashion, fashion (let\'s go)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(189, 3, 50, 87800, 'Fashion, fashion, fashion, fashion', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(190, 3, 51, 89650, 'Fashion, fashion, fashion, fashion (워, let\'s go)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(191, 3, 52, 91500, 'Fashion, fashion, fashion, fashion (what? Fashion)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(192, 4, 1, 400, 'Ooh, ooh, ooh', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(193, 4, 2, 3800, '갇혀 이 건물 속에 밤새', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(194, 4, 3, 5950, 'No sun, no sky, 얼굴은 창백 all day', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(195, 4, 4, 8300, '미쳐 난 flipping 마치 fried eggs, pancakes', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(196, 4, 5, 10700, 'Bloodshot eyes tonight, 도망가 여길 벗어나', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(197, 4, 6, 13100, 'Cause, ooh', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(198, 4, 7, 14800, '우리는 꿈꿔왔지 찰나의 해방', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(199, 4, 8, 17250, '달려 부릉', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(200, 4, 9, 18500, '트렁크에다 콜라 채워, 얼른 밟아 그 pedal', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(201, 4, 10, 20750, '이 자릴 떠 지도는 집어치워 \'cause we\'re on a joyride', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(202, 4, 11, 23750, '더 세게 speed it up 지금 기분 so high', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(203, 4, 12, 26250, 'Driving so fast, 가로질러 긴 밤', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(204, 4, 13, 28750, 'Day to night, ride, we\'re on a joyride', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(205, 4, 14, 31250, 'Yeah, yeah, yeah, we\'re on a joyride', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(206, 4, 15, 33750, 'Yeah, yeah, yeah, we\'re on a joyride', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(207, 4, 16, 36250, 'Driving so fast, 가로질러 긴 밤', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(208, 4, 17, 38750, 'Day to night, ride, we\'re on a joyride', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(209, 4, 18, 41400, '범생이는 나의 past tense', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(210, 4, 19, 43500, '학교는 찍먹 아지트로 came back', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(211, 4, 20, 45950, '開세상이 폭풍이면 난', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(212, 4, 21, 47500, '내 drip 아래 춰 rain dance', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(213, 4, 22, 49550, '종일 뛰었었지', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(214, 4, 23, 50700, '폭주는 내 personality', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(215, 4, 24, 51950, '마치 MJ, ever since \'23', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(216, 4, 25, 53950, 'Rat snakes, 담을 넘었지', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(217, 4, 26, 55800, 'Cause, ooh', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(218, 4, 27, 57250, '우리는 꿈꿔왔지 찰나의 해방', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(219, 4, 28, 59750, '달려 부릉', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(220, 4, 29, 61000, '트렁크에다 콜라 채워, 얼른 밟아 그 pedal', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(221, 4, 30, 63250, '이 자릴 떠 지도는 집어치워 \'cause we\'re on a joyride', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(222, 4, 31, 66250, '더 세게 speed it up 지금 기분 so high', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(223, 4, 32, 68750, 'Driving so fast, 가로질러 긴 밤', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(224, 4, 33, 71250, 'Day to night, ride, we\'re on a joyride', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(225, 4, 34, 73750, 'Yeah, yeah, yeah, we\'re on a joyride', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(226, 4, 35, 76250, 'Yeah, yeah, yeah, we\'re on a joyride', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(227, 4, 36, 78750, 'Driving so fast, 가로질러 긴 밤', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(228, 4, 37, 81250, 'Day to night, ride, we\'re on a joyride', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(229, 5, 1, 100, 'Crash, smash, rock, mash up', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(230, 5, 2, 1750, 'Ooh, take what you want', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(231, 5, 3, 3550, '돈, 멋, 명예, love and what?', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(232, 5, 4, 5350, 'Ooh, take what you want', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(233, 5, 5, 7750, 'Life\'s too fast, 뭘 더 참아, 이젠 됐어 (What you want?)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(234, 5, 6, 10450, 'I want to see the whole world', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(235, 5, 7, 12200, '도장 찍어, 나의 passport (What you want?)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(236, 5, 8, 14550, 'Well, 이마에 피도 안 말랐을 때 계획한 행보 (What you want?)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(237, 5, 9, 16950, '바라던 걸 찾아 집을 떠나 what we came for', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(238, 5, 10, 19350, 'Crash, smash, rock, mash up', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(239, 5, 11, 21150, 'Ooh, take what you want', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(240, 5, 12, 22950, '돈, 멋, 명예, love and what?', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(241, 5, 13, 24750, 'Ooh, take what you want', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(242, 5, 14, 26800, '적당히론 배가 차지 않아 (않아)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(243, 5, 15, 28550, '들이켜, yuh, 마치 하마 (하마)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(244, 5, 16, 30350, 'Smelling like a teen, 마치 Nirvana (Nirvana)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(245, 5, 17, 32200, '소리쳐, yuh, \'cause we wanna', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(246, 5, 18, 34600, 'That\'s what we all looking for', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(247, 5, 19, 36450, 'That\'s what we all looking for', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(248, 5, 20, 38250, 'That\'s what we all looking for', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(249, 5, 21, 40050, 'That\'s what we all looking (One, two, three) for', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(250, 5, 22, 42450, '난 걍 돌아갈 바엔 바로 넘어버려 담장 (What you want?)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(251, 5, 23, 45150, '난 원해 다시 뛰게 할 무언갈, 나의 심장 (What you want?)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(252, 5, 24, 47550, '야밤, 새벽 배송 같은 fresh song, I need that (What you want?)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(253, 5, 25, 59950, 'I want the whole world to wake up and realize', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(254, 5, 26, 62350, 'Some people want this, some people want that', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(255, 5, 27, 64200, '나도 똑같아 17년 평생', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(256, 5, 28, 66000, '쫓았었던 love, 쫓았었던 fame', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(257, 5, 29, 67800, 'So now, I want the whole world to know my name', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(258, 5, 30, 70250, 'Crash, smash, rock, mash up', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(259, 5, 31, 72050, 'Ooh, take what you want', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(260, 5, 32, 73850, '돈, 멋, 명예, love and what?', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(261, 5, 33, 75650, 'Ooh, take what you want', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(262, 5, 34, 77750, '적당히론 배가 차지 않아 (않아)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(263, 5, 35, 79500, '들이켜, yuh, 마치 하마 (하마)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(264, 5, 36, 81300, 'Smelling like a teen, 마치 Nirvana (Nirvana)', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(265, 5, 37, 83150, '소리쳐, yuh, \'cause we wanna', '2026-11-18 09:53:14', '2026-11-18 09:53:14'),
(266, 5, 38, 85550, 'That\'s what we all looking for', '2026-11-18 09:53:15', '2026-11-18 09:53:15'),
(267, 5, 39, 87400, 'That\'s what we all looking for', '2026-11-18 09:53:15', '2026-11-18 09:53:15'),
(268, 5, 40, 89200, '(That\'s what we all—) Da-ra-da-ra-ra', '2026-11-18 09:53:15', '2026-11-18 09:53:15'),
(269, 5, 41, 91000, 'That\'s what we all looking (One, two, three) for', '2026-11-18 09:53:15', '2026-11-18 09:53:15'),
(270, 5, 42, 93400, 'What you want?', '2026-11-18 09:53:15', '2026-11-18 09:53:15'),
(271, 5, 43, 94650, 'What you want?', '2026-11-18 09:53:15', '2026-11-18 09:53:15'),
(272, 5, 44, 95850, 'What you want?', '2026-11-18 09:53:15', '2026-11-18 09:53:15'),
(273, 5, 45, 97050, 'What you want?', '2026-11-18 09:53:15', '2026-11-18 09:53:15'),
(274, 5, 46, 98300, 'What you want?', '2026-11-18 09:53:15', '2026-11-18 09:53:15'),
(275, 6, 1, 1210, 'I got my money, ayy', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(276, 6, 2, 2790, '돈이 없어서 행북할수 있', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(277, 6, 3, 6210, '(hahahaha)', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(278, 6, 4, 8410, '근데 돈이 없으면 뭘 하십니까?', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(279, 6, 5, 11510, 'Money coin', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(280, 6, 6, 12050, 'Money, money (Yeah, uh, yeah), money, money (Yeah, uh), money, money (Yeah, shh, uh), money, money (Yeah)', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(281, 6, 7, 15190, 'Money, money (Yeah, uh, yeah), money, money (Yeah, uh), money, money (Yeah, shh, uh), money, money (Uh)', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(282, 6, 8, 18350, 'Money, money (Yeah, uh, yeah), money, money (Yeah, uh), money, money (Yeah, shh, uh), money, money (Uh, yeah)', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(283, 6, 9, 21430, 'Money, money (Yеah, uh, yeah), money, money (Yеah, uh), money, money (Yeah, shh, uh), money, money (Yeah)', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(284, 6, 10, 24200, 'I got money in my pocket, 이제 bus 못 탈, 쉐키', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(285, 6, 11, 27100, '못 탈 바엔 money maxing, 유골 가루 될 때까지 make (Yeah)', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(286, 6, 12, 30510, 'Money, money, money, money, money, money, money, yeah', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(287, 6, 13, 33520, 'Money, money, money, money money, money, money, yeah', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(288, 6, 14, 36720, 'Economy에서 business pullin\' up', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(289, 6, 15, 39440, '저린 엉덩이로 business하러 walkin\' out (Walkin\' out)', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(290, 6, 16, 42560, 'Boy, you gotta run it (Woo), run it (Woo), run it (Woo), run it up', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(291, 6, 17, 45550, 'Three job, flying, business, running, 거의 철인 삼종', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(292, 6, 18, 48410, '난 될래 놀며 돈을 버는 사람 뽀로로 (Ah, ah)', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(293, 6, 19, 51450, '통장에 영에 영을 더해 마치 한로로 (Yeah)', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(294, 6, 20, 54510, '저능해진다더니 다들 침을 호로록 (Uh, yeah)', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(295, 6, 21, 58610, 'Turn the speakers up (Yeah), turn the speakers up (Yeah)', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(296, 6, 22, 61310, 'Money, money (Yeah, uh, yeah), money, money (Yeah, uh), money, money (Yeah, shh, uh), money, money (Yeah)', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(297, 6, 23, 64130, 'Money, money (Yeah, uh, yeah), money, money (Yeah, uh), money, money (Yeah, shh, uh), money, money (Uh)', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(298, 6, 24, 67380, 'Money, money (Yeah, uh, yeah), money, money (Yeah, uh), money, money (Yeah, shh, uh), money, money (Uh, yeah)', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(299, 6, 25, 70130, 'Money, money (Yeah, uh, yeah), money, money (Yeah, uh), money, money (Yeah, shh, uh), money, money (Yeah)', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(300, 6, 26, 73250, 'I got money in my pocket, 이제 bus 못 탈, 쉐키', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(301, 6, 27, 76320, '못 탈 바엔 money maxing, 유골 가루 될 때까지 make (Yeah)', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(302, 6, 28, 79840, 'Money, money, money, money, money, money, money, yeah', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(303, 6, 29, 82910, 'Money, money, money, money money, money, money, yeah', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(304, 6, 30, 85690, 'Fashion Week Paris때, 업어온 명품백 (Oh)', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(305, 6, 31, 88610, '공항서 관세 떼 (Ah), 너무너무 놀랐네', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(306, 6, 32, 91790, '간이 똑 on the ground, 사백칠십 on the ground', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(307, 6, 33, 94750, '다시 땜빵하러 가자 모여, 하나, 둘, 셋 (Ayy, oh)', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(308, 6, 34, 97770, '난 지금 초록종이 모아서 해 뽀-뽀-뽀 (Ayy, yo)', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(309, 6, 35, 100790, '통장에 영에 영을 더해 마치 한로로 (Woo, yeah)', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(310, 6, 36, 103880, '난 잘 때 돈 버는 주파수로 잠 소로록 (Woo, yeah)', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(311, 6, 37, 107980, 'Turn the speakers up, turn the speakers up (Turn the speakers up)', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(312, 6, 38, 110520, 'Money, money (Yeah, uh, yeah), money, money (Yeah, uh), money, money (Yeah, shh, uh), money, money (Yeah)', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(313, 6, 39, 113640, 'Money, money (Yeah, uh, yeah), money, money (Yeah, uh), money, money (Yeah, shh, uh), money, money (Uh)', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(314, 6, 40, 116670, 'Money, money (Yeah, uh, yeah), money, money (Yeah, uh), money, money (Yeah, shh, uh), money, money (Uh, yeah)', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(315, 6, 41, 119580, 'Money, money (Yeah, uh, yeah), money, money (Yeah, uh), money, money (Yeah, shh, uh), money, money (Yeah)', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(316, 6, 42, 122510, 'I got money in my pocket, 이제 bus 못 탈, 쉐키 (Yeah)', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(317, 6, 43, 125680, '못 탈 바엔 money maxing, 유골 가루 될 때까지 make (Yeah)', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(318, 6, 44, 129900, 'Money, money, money, money, money, money, money, yeah', '2026-11-18 11:51:24', '2026-11-18 11:51:24'),
(319, 6, 45, 132140, 'Money, money, money, money money, money, money, yeah', '2026-11-18 11:51:24', '2026-11-18 11:51:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tours`
--

DROP TABLE IF EXISTS `tours`;
CREATE TABLE `tours` (
  `tour_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tours`
--

INSERT INTO `tours` (`tour_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, '2026-11-11 07:18:37', '2026-11-11 07:18:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tour_events`
--

DROP TABLE IF EXISTS `tour_events`;
CREATE TABLE `tour_events` (
  `event_id` int(11) NOT NULL,
  `tour_id` int(11) NOT NULL,
  `event_date` date NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tour_events`
--

INSERT INTO `tour_events` (`event_id`, `tour_id`, `event_date`, `sort_order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, '2026-05-10', 1, 1, '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(2, 1, '2026-06-07', 2, 1, '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(3, 1, '2026-06-28', 3, 1, '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(4, 1, '2025-10-18', 4, 1, '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(5, 1, '2025-10-13', 5, 1, '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(6, 1, '2025-09-08', 6, 1, '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(7, 1, '2027-06-20', 7, 1, '2026-11-18 11:59:06', '2026-11-18 11:59:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tour_event_translations`
--

DROP TABLE IF EXISTS `tour_event_translations`;
CREATE TABLE `tour_event_translations` (
  `event_trans_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `city_name` varchar(100) NOT NULL,
  `location_text` varchar(150) NOT NULL,
  `venue_name` varchar(150) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tour_event_translations`
--

INSERT INTO `tour_event_translations` (`event_trans_id`, `event_id`, `language_id`, `city_name`, `location_text`, `venue_name`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'CHIBA', 'Chiba, Chiba, Japan', 'Makuhari Messe', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(2, 1, 2, 'CHIBA', 'Chiba, Jepang', 'Makuhari Messe', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(3, 1, 3, '치바', '치바, 일본', '마쿠하리 멧세', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(4, 2, 1, 'INCHEON', 'Incheon, South Korea', 'KSP Dome', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(5, 2, 2, 'INCHEON', 'Incheon, Korea Selatan', 'KSP Dome', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(6, 2, 3, '인천', '인천, 대한민국', 'KSP 돔', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(7, 3, 1, 'JAKARTA', 'Jakarta, Indonesia', 'Indonesia Arena', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(8, 3, 2, 'JAKARTA', 'Jakarta, Indonesia', 'Indonesia Arena', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(9, 3, 3, '자카르타', '자카르타, 인도네시아', '인도네시아 아레나', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(10, 4, 1, 'BROOKLYN', 'Brooklyn, New York', 'Duggal Greenhouse', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(11, 4, 2, 'BROOKLYN', 'Brooklyn, New York', 'Duggal Greenhouse', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(12, 4, 3, '브루클린', '브루클린, 뉴욕', '더걸 그린하우스', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(13, 5, 1, 'BURBANK', 'Burbank, California', 'iHeartRadio Theater', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(14, 5, 2, 'BURBANK', 'Burbank, California', 'iHeartRadio Theater', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(15, 5, 3, '버뱅크', '버뱅크, 캘리포니아', '아이하트라디오 시어터', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(16, 6, 1, 'SEOUL', 'Seoul, South Korea', 'Korea University Gymnasium', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(17, 6, 2, 'SEOUL', 'Seoul, Korea Selatan', 'Korea University Gymnasium', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(18, 6, 3, '서울', '서울, 대한민국', '고려대학교 체육관', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(19, 7, 2, 'Jakarta', 'Indonesia', 'GBK', '2026-11-18 12:00:00', '2026-11-18 12:00:00'),
(20, 7, 1, 'Jakarta', 'Indonesia', 'GBK', '2026-11-18 12:05:03', '2026-11-18 12:05:03'),
(21, 7, 3, '자카르타', '인도네시아', 'GBK', '2026-11-18 12:05:36', '2026-11-18 12:05:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tour_translations`
--

DROP TABLE IF EXISTS `tour_translations`;
CREATE TABLE `tour_translations` (
  `tour_trans_id` int(11) NOT NULL,
  `tour_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `tour_name` varchar(150) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tour_translations`
--

INSERT INTO `tour_translations` (`tour_trans_id`, `tour_id`, `language_id`, `tour_name`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'DEADLINE WORLD TOUR', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(2, 1, 2, 'DUNIA BATAS AKHIR TUR', '2026-11-11 07:18:37', '2026-11-11 07:18:37'),
(3, 1, 3, '데드라인 월드 투어', '2026-11-11 07:18:37', '2026-11-11 07:18:37');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `about_content`
--
ALTER TABLE `about_content`
  ADD PRIMARY KEY (`about_id`),
  ADD KEY `fk_about_content_admin` (`updated_by`);

--
-- Indeks untuk tabel `about_content_translations`
--
ALTER TABLE `about_content_translations`
  ADD PRIMARY KEY (`about_trans_id`),
  ADD UNIQUE KEY `uq_about_lang` (`about_id`,`language_id`),
  ADD KEY `fk_about_trans_lang` (`language_id`);

--
-- Indeks untuk tabel `about_slides`
--
ALTER TABLE `about_slides`
  ADD PRIMARY KEY (`slide_id`);

--
-- Indeks untuk tabel `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `home_banner`
--
ALTER TABLE `home_banner`
  ADD PRIMARY KEY (`banner_id`),
  ADD KEY `fk_home_banner_admin` (`updated_by`);

--
-- Indeks untuk tabel `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`language_id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indeks untuk tabel `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`member_id`);

--
-- Indeks untuk tabel `navigation_menus`
--
ALTER TABLE `navigation_menus`
  ADD PRIMARY KEY (`menu_id`),
  ADD UNIQUE KEY `menu_key` (`menu_key`);

--
-- Indeks untuk tabel `navigation_menu_translations`
--
ALTER TABLE `navigation_menu_translations`
  ADD PRIMARY KEY (`menu_trans_id`),
  ADD UNIQUE KEY `uq_menu_lang` (`menu_id`,`language_id`),
  ADD KEY `fk_mt_lang` (`language_id`);

--
-- Indeks untuk tabel `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`),
  ADD UNIQUE KEY `external_id` (`external_id`),
  ADD KEY `idx_news_published` (`published_at`),
  ADD KEY `idx_news_title` (`title`);

--
-- Indeks untuk tabel `news_translations`
--
ALTER TABLE `news_translations`
  ADD PRIMARY KEY (`news_trans_id`),
  ADD UNIQUE KEY `uq_news_lang` (`news_id`,`language_id`),
  ADD KEY `fk_news_trans_lang` (`language_id`);

--
-- Indeks untuk tabel `social_links`
--
ALTER TABLE `social_links`
  ADD PRIMARY KEY (`link_id`),
  ADD UNIQUE KEY `uq_social_platform` (`platform`);

--
-- Indeks untuk tabel `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`song_id`);

--
-- Indeks untuk tabel `song_lyric_lines`
--
ALTER TABLE `song_lyric_lines`
  ADD PRIMARY KEY (`line_id`),
  ADD UNIQUE KEY `uq_song_line` (`song_id`,`line_no`);

--
-- Indeks untuk tabel `tours`
--
ALTER TABLE `tours`
  ADD PRIMARY KEY (`tour_id`);

--
-- Indeks untuk tabel `tour_events`
--
ALTER TABLE `tour_events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `fk_tour_events_tour` (`tour_id`);

--
-- Indeks untuk tabel `tour_event_translations`
--
ALTER TABLE `tour_event_translations`
  ADD PRIMARY KEY (`event_trans_id`),
  ADD UNIQUE KEY `uq_event_lang` (`event_id`,`language_id`),
  ADD KEY `fk_event_trans_lang` (`language_id`);

--
-- Indeks untuk tabel `tour_translations`
--
ALTER TABLE `tour_translations`
  ADD PRIMARY KEY (`tour_trans_id`),
  ADD UNIQUE KEY `uq_tour_lang` (`tour_id`,`language_id`),
  ADD KEY `fk_tour_trans_lang` (`language_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `about_content`
--
ALTER TABLE `about_content`
  MODIFY `about_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `about_content_translations`
--
ALTER TABLE `about_content_translations`
  MODIFY `about_trans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `about_slides`
--
ALTER TABLE `about_slides`
  MODIFY `slide_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `home_banner`
--
ALTER TABLE `home_banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `languages`
--
ALTER TABLE `languages`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `members`
--
ALTER TABLE `members`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `navigation_menus`
--
ALTER TABLE `navigation_menus`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `navigation_menu_translations`
--
ALTER TABLE `navigation_menu_translations`
  MODIFY `menu_trans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `news_translations`
--
ALTER TABLE `news_translations`
  MODIFY `news_trans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT untuk tabel `social_links`
--
ALTER TABLE `social_links`
  MODIFY `link_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `songs`
--
ALTER TABLE `songs`
  MODIFY `song_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `song_lyric_lines`
--
ALTER TABLE `song_lyric_lines`
  MODIFY `line_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=320;

--
-- AUTO_INCREMENT untuk tabel `tours`
--
ALTER TABLE `tours`
  MODIFY `tour_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tour_events`
--
ALTER TABLE `tour_events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tour_event_translations`
--
ALTER TABLE `tour_event_translations`
  MODIFY `event_trans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `tour_translations`
--
ALTER TABLE `tour_translations`
  MODIFY `tour_trans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `about_content`
--
ALTER TABLE `about_content`
  ADD CONSTRAINT `fk_about_content_admin` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`admin_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `about_content_translations`
--
ALTER TABLE `about_content_translations`
  ADD CONSTRAINT `fk_about_trans_about` FOREIGN KEY (`about_id`) REFERENCES `about_content` (`about_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_about_trans_lang` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `home_banner`
--
ALTER TABLE `home_banner`
  ADD CONSTRAINT `fk_home_banner_admin` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`admin_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `navigation_menu_translations`
--
ALTER TABLE `navigation_menu_translations`
  ADD CONSTRAINT `fk_mt_lang` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_mt_menu` FOREIGN KEY (`menu_id`) REFERENCES `navigation_menus` (`menu_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `news_translations`
--
ALTER TABLE `news_translations`
  ADD CONSTRAINT `fk_news_trans_lang` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_news_trans_news` FOREIGN KEY (`news_id`) REFERENCES `news` (`news_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `song_lyric_lines`
--
ALTER TABLE `song_lyric_lines`
  ADD CONSTRAINT `fk_lyric_song` FOREIGN KEY (`song_id`) REFERENCES `songs` (`song_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tour_events`
--
ALTER TABLE `tour_events`
  ADD CONSTRAINT `fk_tour_events_tour` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`tour_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tour_event_translations`
--
ALTER TABLE `tour_event_translations`
  ADD CONSTRAINT `fk_event_trans_event` FOREIGN KEY (`event_id`) REFERENCES `tour_events` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_event_trans_lang` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tour_translations`
--
ALTER TABLE `tour_translations`
  ADD CONSTRAINT `fk_tour_trans_lang` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tour_trans_tour` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`tour_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
