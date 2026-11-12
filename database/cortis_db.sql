-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Nov 2026 pada 07.59
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

-- Tugas#3 Implementasi Basis Data - Praktikum Pemrograman Web - Kelompok 6
-- Website CORTIS (18 tabel, MySQL/MariaDB)

CREATE DATABASE IF NOT EXISTS `cortis_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `cortis_db`;

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

-- --------------------------------------------------------

--
-- Struktur dari tabel `about_content`
--

CREATE TABLE `about_content` (
  `about_id` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `about_content_translations`
--

CREATE TABLE `about_content_translations` (
  `about_trans_id` int(11) NOT NULL,
  `about_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `about_slides`
--

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
(1, 'images/download-5-0e3d68.jpg', 1, 1, '2026-11-05 14:04:17', '2026-11-05 14:04:17'),
(2, 'images/download-3-869599.jpg', 1, 1, '2026-11-05 14:41:12', '2026-11-05 14:41:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `admins`
--

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
(1, 'admin', 'admin@cortis.local', '$2y$10$bmK2PaM96EZfl5KU/EWPoes3Luafpy1c69sRDW3a2Qs0KVTDQ2yki', 'superadmin', 1, NULL, '2026-11-05 13:13:31', '2026-11-05 13:13:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `home_banner`
--

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

-- --------------------------------------------------------

--
-- Struktur dari tabel `languages`
--

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

-- --------------------------------------------------------

--
-- Struktur dari tabel `navigation_menus`
--

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

-- --------------------------------------------------------

--
-- Struktur dari tabel `news_translations`
--

CREATE TABLE `news_translations` (
  `news_trans_id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `translated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `social_links`
--

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
(1, 'youtube', 'https://youtube.com/@cortis_bighit?si=2WTCTQN6FWWpvtYV', 1, 1, '2026-11-05 13:57:57', '2026-11-05 13:57:57'),
(2, 'x', 'https://x.com/cortis_bighit', 2, 1, '2026-11-05 13:57:57', '2026-11-05 13:57:57'),
(3, 'instagram', 'https://www.instagram.com/cortis?igsh=bWhrc2l4enk5YTFw', 3, 1, '2026-11-05 13:57:57', '2026-11-05 13:57:57'),
(4, 'tiktok', 'https://www.tiktok.com/@cortis_bighit?is_from_webapp=1&sender_device=pc', 4, 1, '2026-11-05 13:57:57', '2026-11-05 13:57:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `songs`
--

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

-- --------------------------------------------------------

--
-- Struktur dari tabel `song_lyric_lines`
--

CREATE TABLE `song_lyric_lines` (
  `line_id` int(11) NOT NULL,
  `song_id` int(11) NOT NULL,
  `line_no` int(11) NOT NULL,
  `start_time_ms` int(11) NOT NULL,
  `lyric_text` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tours`
--

CREATE TABLE `tours` (
  `tour_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tour_events`
--

CREATE TABLE `tour_events` (
  `event_id` int(11) NOT NULL,
  `tour_id` int(11) NOT NULL,
  `event_date` date NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tour_event_translations`
--

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

-- --------------------------------------------------------

--
-- Struktur dari tabel `tour_translations`
--

CREATE TABLE `tour_translations` (
  `tour_trans_id` int(11) NOT NULL,
  `tour_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `tour_name` varchar(150) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  MODIFY `about_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `about_content_translations`
--
ALTER TABLE `about_content_translations`
  MODIFY `about_trans_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `about_slides`
--
ALTER TABLE `about_slides`
  MODIFY `slide_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `home_banner`
--
ALTER TABLE `home_banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `languages`
--
ALTER TABLE `languages`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `members`
--
ALTER TABLE `members`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `news_translations`
--
ALTER TABLE `news_translations`
  MODIFY `news_trans_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `social_links`
--
ALTER TABLE `social_links`
  MODIFY `link_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `songs`
--
ALTER TABLE `songs`
  MODIFY `song_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `song_lyric_lines`
--
ALTER TABLE `song_lyric_lines`
  MODIFY `line_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tours`
--
ALTER TABLE `tours`
  MODIFY `tour_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tour_events`
--
ALTER TABLE `tour_events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tour_event_translations`
--
ALTER TABLE `tour_event_translations`
  MODIFY `event_trans_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tour_translations`
--
ALTER TABLE `tour_translations`
  MODIFY `tour_trans_id` int(11) NOT NULL AUTO_INCREMENT;

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
-- --------------------------------------------------------
--
-- DATA AWAL (diambil dari isi website CORTIS)
-- Urutan: tabel induk dulu, baru tabel anak (aman untuk foreign key)
--

-- HOME
INSERT INTO `home_banner` (`banner_id`, `video_url`, `fallback_image_url`, `debut_date`, `is_active`, `updated_by`) VALUES
(1, 'media/video.mp4', NULL, '2025-08-18', 1, 1);

-- ABOUT: deskripsi grup (3 bahasa)
INSERT INTO `about_content` (`about_id`, `updated_by`) VALUES (1, 1);
INSERT INTO `about_content_translations` (`about_trans_id`, `about_id`, `language_id`, `description`) VALUES
(1, 1, 1, 'CORTIS (MARTIN, JAMES, JUHOON, SEONGHYEON, and KEONHO) is the first boy band in 6 years to debut under BIGHIT MUSIC, the powerhouse label behind iconic global groups like BTS and TOMORROW X TOGETHER. The name CORTIS is an unconventional mix of six letters drawn from the phrase "COLOR OUTSIDE THE LINES," reflecting their determination to think beyond the boundaries defined by the world. True to their name, CORTIS is a crew of self-driven creatives who bring raw authenticity to everything they create, from music and choreography to video content. All five members draw from personal stories to showcase their inimitable creativity across songwriting, composition, performance, and videography. What sets them apart is their collaborative approach: rather than adhering to fixed roles, they work together as co-creators to bring their collective vision to life.'),
(2, 1, 2, 'CORTIS (MARTIN, JAMES, JUHOON, SEONGHYEON, dan KEONHO) adalah boy band pertama dalam 6 tahun yang debut di bawah BIGHIT MUSIC, label besar di balik grup global terkenal seperti BTS dan TOMORROW X TOGETHER. Nama CORTIS merupakan perpaduan unik dari enam huruf yang diambil dari kalimat "COLOR OUTSIDE THE LINES," yang mencerminkan tekad mereka untuk berpikir melampaui batas yang ditentukan oleh dunia. Sesuai dengan namanya, CORTIS adalah kumpulan kreator mandiri yang menghadirkan keaslian dalam setiap karya yang mereka buat, mulai dari musik, koreografi, hingga konten video. Kelima member mengambil cerita pribadi mereka untuk menunjukkan kreativitas unik dalam penulisan lagu, komposisi, penampilan, dan videografi. Hal yang membedakan mereka adalah pendekatan kolaboratif mereka: daripada mengikuti peran tetap, mereka bekerja bersama sebagai co-creator untuk mewujudkan visi kolektif mereka.'),
(3, 1, 3, 'CORTIS(MARTIN, JAMES, JUHOON, SEONGHYEON, KEONHO)는 BTS와 TOMORROW X TOGETHER 같은 세계적인 그룹을 배출한 BIGHIT MUSIC에서 6년 만에 데뷔하는 첫 번째 보이 그룹입니다. CORTIS라는 이름은 "COLOR OUTSIDE THE LINES"라는 문구에서 가져온 여섯 글자의 독창적인 조합으로, 세상이 정해놓은 경계를 넘어 생각하려는 그들의 의지를 담고 있습니다. 이름처럼 CORTIS는 음악, 안무, 영상 콘텐츠 등 모든 창작물에 진정성을 담아내는 자기 주도적인 크리에이터 그룹입니다. 다섯 멤버는 개인적인 이야기를 바탕으로 작사, 작곡, 퍼포먼스, 영상 제작 등 다양한 분야에서 자신만의 창의성을 보여줍니다. 그들을 특별하게 만드는 것은 협업 방식이며, 정해진 역할에 얽매이지 않고 공동 창작자로서 함께 하나의 비전을 만들어갑니다.');

-- ABOUT: kartu member
INSERT INTO `members` (`member_id`, `stage_name`, `birth_date`, `photo_url`, `sort_order`, `is_active`) VALUES
(1, 'KEONHO', '2009-02-14', 'images/member1.jpg', 1, 1),
(2, 'MARTIN', '2008-03-20', 'images/member2.jpg', 2, 1),
(3, 'JAMES', '2005-10-14', 'images/member3.jpg', 3, 1),
(4, 'SEONGHYEON', '2009-01-13', 'images/member4.jpg', 4, 1),
(5, 'JUHOON', '2008-01-03', 'images/member5.jpg', 5, 1);

-- MUSIC: lagu (durasi = perkiraan dari timestamp lirik terakhir + 6 detik; sesuaikan dengan file audio)
INSERT INTO `songs` (`song_id`, `title`, `artist_name`, `release_date`, `stream_count`, `cover_url`, `audio_url`, `mv_url`, `hover_background_url`, `duration_seconds`, `is_active`) VALUES
(1, 'REDRED', 'CORTIS', '2026-04-20', 85210000, 'media/redred.jpg', 'media/redred.mp3', 'media/redred.mp4', NULL, 150, 1),
(2, 'GO!', 'CORTIS', '2026-04-20', 98450000, 'media/go.jpg', 'media/go.mp3', 'media/go.mp4', NULL, 164, 1),
(3, 'FaShioN', 'CORTIS', '2025-08-18', 64890000, 'media/fashion.jpg', 'media/fashion.mp3', 'media/fashion.mp4', NULL, 97, 1),
(4, 'JoyRide', 'CORTIS', '2026-04-20', 39780000, 'media/joyride.jpg', 'media/joyride.mp3', 'media/joyride.mp4', NULL, 87, 1),
(5, 'What You Want', 'CORTIS', '2025-08-18', 52140000, 'media/whatyouwant.jpg', 'media/whatyouwant.mp3', 'media/whatyouwant.mp4', NULL, 104, 1);

-- MUSIC: baris lirik (contoh 3 baris/lagu; teks diganti dengan lirik dari website)
INSERT INTO `song_lyric_lines` (`line_id`, `song_id`, `line_no`, `start_time_ms`, `lyric_text`) VALUES
(1, 1, 1, 800, '(contoh: isi lirik baris 1 dari website)'),
(2, 1, 2, 2400, '(contoh: isi lirik baris 2 dari website)'),
(3, 1, 3, 4100, '(contoh: isi lirik baris 3 dari website)'),
(4, 2, 1, 1000, '(contoh: isi lirik baris 1 dari website)'),
(5, 2, 2, 3250, '(contoh: isi lirik baris 2 dari website)'),
(6, 2, 3, 3950, '(contoh: isi lirik baris 3 dari website)'),
(7, 3, 1, 350, '(contoh: isi lirik baris 1 dari website)'),
(8, 3, 2, 2200, '(contoh: isi lirik baris 2 dari website)'),
(9, 3, 3, 4050, '(contoh: isi lirik baris 3 dari website)'),
(10, 4, 1, 400, '(contoh: isi lirik baris 1 dari website)'),
(11, 4, 2, 3800, '(contoh: isi lirik baris 2 dari website)'),
(12, 4, 3, 5950, '(contoh: isi lirik baris 3 dari website)'),
(13, 5, 1, 100, '(contoh: isi lirik baris 1 dari website)'),
(14, 5, 2, 1750, '(contoh: isi lirik baris 2 dari website)'),
(15, 5, 3, 3550, '(contoh: isi lirik baris 3 dari website)');

-- TOUR
INSERT INTO `tours` (`tour_id`, `is_active`) VALUES (1, 1);
INSERT INTO `tour_translations` (`tour_trans_id`, `tour_id`, `language_id`, `tour_name`) VALUES
(1, 1, 1, 'DEADLINE WORLD TOUR'),
(2, 1, 2, 'DUNIA BATAS AKHIR TUR'),
(3, 1, 3, '데드라인 월드 투어');
INSERT INTO `tour_events` (`event_id`, `tour_id`, `event_date`, `sort_order`, `is_active`) VALUES
(1, 1, '2026-05-10', 1, 1),
(2, 1, '2026-06-07', 2, 1),
(3, 1, '2026-06-28', 3, 1),
(4, 1, '2025-10-18', 4, 1),
(5, 1, '2025-10-13', 5, 1),
(6, 1, '2025-09-08', 6, 1);
INSERT INTO `tour_event_translations` (`event_trans_id`, `event_id`, `language_id`, `city_name`, `location_text`, `venue_name`) VALUES
(1, 1, 1, 'CHIBA', 'Chiba, Chiba, Japan', 'Makuhari Messe'),
(2, 1, 2, 'CHIBA', 'Chiba, Jepang', 'Makuhari Messe'),
(3, 1, 3, '치바', '치바, 일본', '마쿠하리 멧세'),
(4, 2, 1, 'INCHEON', 'Incheon, South Korea', 'KSP Dome'),
(5, 2, 2, 'INCHEON', 'Incheon, Korea Selatan', 'KSP Dome'),
(6, 2, 3, '인천', '인천, 대한민국', 'KSP 돔'),
(7, 3, 1, 'JAKARTA', 'Jakarta, Indonesia', 'Indonesia Arena'),
(8, 3, 2, 'JAKARTA', 'Jakarta, Indonesia', 'Indonesia Arena'),
(9, 3, 3, '자카르타', '자카르타, 인도네시아', '인도네시아 아레나'),
(10, 4, 1, 'BROOKLYN', 'Brooklyn, New York', 'Duggal Greenhouse'),
(11, 4, 2, 'BROOKLYN', 'Brooklyn, New York', 'Duggal Greenhouse'),
(12, 4, 3, '브루클린', '브루클린, 뉴욕', '더걸 그린하우스'),
(13, 5, 1, 'BURBANK', 'Burbank, California', 'iHeartRadio Theater'),
(14, 5, 2, 'BURBANK', 'Burbank, California', 'iHeartRadio Theater'),
(15, 5, 3, '버뱅크', '버뱅크, 캘리포니아', '아이하트라디오 시어터'),
(16, 6, 1, 'SEOUL', 'Seoul, South Korea', 'Korea University Gymnasium'),
(17, 6, 2, 'SEOUL', 'Seoul, Korea Selatan', 'Korea University Gymnasium'),
(18, 6, 3, '서울', '서울, 대한민국', '고려대학교 체육관');

-- NEWS (dari api/news_cache.json, sumber IDN Times)
INSERT INTO `news` (`news_id`, `external_id`, `source_name`, `title`, `thumbnail_url`, `article_url`, `published_at`, `fetched_at`, `is_active`) VALUES
(1, '8cd0c763e8638c6f133809f8e562c6e4ce5fc6fa', 'IDN Times', '[QUIZ] Kalau Kamu Masuk Tim Paskib Sekolah, Siapa Member CORTIS yang Jadi Dantonnya?', 'https://image.idntimes.com/post/20261102/1_f7a75b82-06b2-4c81-9aa2-5e79640d02a4.jpg', 'https://www.idntimes.com/korea/kpop/quiz-kalau-kamu-masuk-tim-paskib-sekolah-siapa-member-cortis-yang-jadi-dantonnya-quiz-00-6x7yf-db87fp', '2026-11-03 00:00:00', '2026-11-05 08:41:24', 1),
(2, '705ee2f9c53f17b24012f13aa1bf11035fafc21a', 'IDN Times', '[QUIZ] Siapa Member CORTIS yang Ajak Kamu Berburu Trick or Treat di Halloween Tahun Ini?', 'https://image.idntimes.com/post/20260824/img_8787_b858c5a0-28b5-4493-a1fa-7d1d8ff22ad6.png', 'https://www.idntimes.com/korea/kpop/quiz-siapa-member-cortis-yang-ajak-kamu-berburu-trick-or-treat-di-halloween-tahun-ini-quiz-00-hwff8-6g6qrp', '2026-10-27 00:00:00', '2026-11-05 08:41:24', 1),
(3, '9220ee60c7859265ea0beb3cb863938a583d77a8', 'IDN Times', '[QUIZ] Member CORTIS yang Cocok Jadi Partner Traveling Akhir Tahun 2026?', 'https://image.idntimes.com/post/20260902/whatsapp-image-2026-09-02-at-19_ecb78e27-fbd5-47ef-b092-5adeda43e417.jpeg', 'https://www.idntimes.com/travel/destination/quiz-siapa-member-cortis-yang-cocok-jadi-partner-traveling-akhir-tahun-2026-quiz-00-z5hk4-68mj7h', '2026-10-27 00:00:00', '2026-11-05 08:41:24', 1),
(4, 'b11d8c1e5d20133a5c9af4029672299a4c9cc14d', 'IDN Times', '[QUIZ] Siapakah Night Ride Date-mu Diantara ke-5 Member CORTIS?', 'https://image.idntimes.com/post/20260916/img_0149_76134283-81e7-4c97-bb85-78f0eaa568af.png', 'https://www.idntimes.com/korea/kpop/quiz-siapakah-night-ride-date-mu-diantara-ke-5-member-cortis-quiz-00-syg99-vnqsn0', '2026-10-05 00:00:00', '2026-11-05 08:41:24', 1),
(5, 'd36940d1a6b6266790ca818c57a5f67c5b8c1970', 'IDN Times', '[QUIZ] Siapa Grup Gen 5 yang Cocok Jadi Teman Mabar Mobile Legends-mu?', 'https://image.idntimes.com/post/20261012/4_78cabc2d-8737-4bb3-9625-09f2277d68d3.jpg', 'https://www.idntimes.com/korea/kpop/quiz-siapa-grup-gen-5-yang-cocok-jadi-teman-mabar-mobile-legends-mu-quiz-00-6x7yf-t2j429', '2026-10-13 00:00:00', '2026-11-05 08:41:24', 1),
(6, '57e284332ca4df36ba97e41618397ec13e929197', 'IDN Times', '[QUIZ] Kalau Jadi Ketua Ekskul Musik, Siapa Member CORTIS yang Kamu Ajak Join Band Sekolah?', 'https://image.idntimes.com/post/20260928/1_07d90efa-4c22-4cfc-808d-9e7f35388b9e.jpg', 'https://www.idntimes.com/korea/kpop/quiz-kalau-jadi-ketua-ekskul-musik-siapa-member-cortis-yang-kamu-ajak-join-band-sekolah-quiz-00-6x7yf-kbw0y9', '2026-10-05 00:00:00', '2026-11-05 08:41:24', 1),
(7, '274d8ec2aaa6cb1892338e4b5e0a19473b15f3ac', 'IDN Times', '[QUIZ] Siapa Member CORTIS yang Ajak Kamu Nonton Synchronize Festival 2026?', 'https://image.idntimes.com/post/20260819/img_8406_7e638e0d-a878-44e9-9bab-9ab9d4d9c3e0.png', 'https://www.idntimes.com/korea/kpop/quiz-siapa-member-cortis-yang-ajak-kamu-nonton-synchronize-festival-2026-quiz-00-syg99-87br42', '2026-10-04 00:00:00', '2026-11-05 08:41:24', 1),
(8, 'bb25cb56859fa1f4b972ccdaeb5f5406702b5d9d', 'IDN Times', '[QUIZ] Kalau Kamu Pesan Ojol, Member CORTIS Mana yang Jadi Abang Sopirnya?', 'https://image.idntimes.com/post/20261001/chatgpt-image-oct-1-2026-03_58_52-pm_0f160372-2953-4b8a-a483-b72ecd7ed885.png', 'https://www.idntimes.com/korea/kpop/quiz-kalau-kamu-pesan-ojol-member-cortis-mana-yang-jadi-abang-sopirnya-quiz-00-hwff8-yd0hqd', '2026-10-01 00:00:00', '2026-11-05 08:41:24', 1),
(9, '33277468804f41cb8ac3872bd7dad03025535c54', 'IDN Times', '[QUIZ] Kalau Kamu Pingsan Pas Upacara Senin, Siapa Member CORTIS yang Bawa Kamu ke UKS?', 'https://image.idntimes.com/post/20260911/1_57455905-038b-48f8-838a-1c8b29164c44.jpg', 'https://www.idntimes.com/korea/kpop/quiz-kalau-kamu-pingsan-pas-upacara-hari-senin-siapa-member-cortis-yang-bawa-kamu-ke-uks-quiz-00-hwff8-k0r345', '2026-09-27 00:00:00', '2026-11-05 08:41:24', 1),
(10, '6b7e145d698992b1f52440cb28f841aa96cc8596', 'IDN Times', 'MC dan Lineup Music Bank Global Festival in Japan 2026, aespa hingga IVE', 'https://image.idntimes.com/post/20260927/1_87d18fc8-6cb1-45cd-bea3-006bc584225e.jpg', 'https://www.idntimes.com/korea/kpop/mc-dan-line-up-music-bank-global-festival-in-japan-2026-00-6x7yf-hywdyw', '2026-09-27 00:00:00', '2026-11-05 08:41:24', 1),
(11, '43c2f4b9fc1ad1c4a2312a91b656cc487711cd15', 'IDN Times', '[QUIZ] Nonton Pestapora 2026 Sendirian? Ini Boygrup Gen 5 yang Siap Nemenin!', 'https://image.idntimes.com/post/20260820/1_cdc669e5-ca8f-43cf-8344-2d1b8e90d784.jpg', 'https://www.idntimes.com/korea/kpop/quiz-nonton-pestapora-2026-sendirian-ini-boygrup-gen-5-yang-siap-nemenin-quiz-00-6x7yf-ldxcm0', '2026-09-24 00:00:00', '2026-11-05 08:41:24', 1),
(12, 'ce91d8f8d3f9c8758d45f083759f5411a0e1edcf', 'IDN Times', '9 Lagu Boy Group Sukses Charting Tinggi di Korea, Ada ''REDRED'' CORTIS!', 'https://image.idntimes.com/post/20260918/1000020505_26cc44ae-e9cf-4cea-bfc9-2c2d446c3d81.jpg', 'https://www.idntimes.com/korea/kpop/lagu-boy-group-sukses-di-chart-di-korea-c1c2-01-2kxv1-9h8hdk', '2026-09-22 00:00:00', '2026-11-05 08:41:24', 1),
(13, 'ebe30e8b0684ce2f6468821295d05eabc13382ea', 'IDN Times', 'Daftar Penghargaan CORTIS usai Setahun Debut, Sudah Dapat 2 Daesang', 'https://image.idntimes.com/post/20260920/hsnxs6mbqaahfzm_5e793764-cad3-4181-8c1d-fcc2d51bb5a9.jpg', 'https://www.idntimes.com/korea/kpop/daftar-penghargaan-cortis-usai-setahun-debut-sudah-dapat-2-daesang-c1c2-01-cccnm-rwl7bb', '2026-09-20 00:00:00', '2026-11-05 08:41:24', 1),
(14, 'f2152ddc4702a76920e93d822a97b142742460bd', 'IDN Times', 'Daftar Pemenang The Fact Music Awards (TMA) 2026, CORTIS-ATEEZ Daesang', 'https://image.idntimes.com/post/20260919/atez_3c953216-5a72-49ec-9621-e3e289f42faa.png', 'https://www.idntimes.com/korea/kpop/daftar-pemenang-the-fact-music-awards-tma-2026-00-dt824-zw0spt', '2026-09-19 00:00:00', '2026-11-05 08:41:24', 1),
(15, '47ae4391f7448ae496abfae0f3af66d73d6c4253', 'IDN Times', '[QUIZ] Seberapa Jeli Matamu Menebak Member CORTIS? Buktikan Kamu Beneran COER', 'https://image.idntimes.com/post/20251123/upload_27d11e2f751d08633257c940ffd5cde2_6133c36a-0f18-4ef1-8810-c3e0342263d6.jpeg', 'https://www.idntimes.com/korea/kpop/quiz-seberapa-jeli-matamu-menebak-member-cortis-buktikan-kamu-beneran-coer-q9t01-quiz-00-9n2b6-vpn63l', '2026-09-19 00:00:00', '2026-11-05 08:41:24', 1);
INSERT INTO `news_translations` (`news_trans_id`, `news_id`, `language_id`, `title`, `translated_at`) VALUES
(1, 1, 1, '[QUIZ] If You Join the School Flag-Raising Squad, Which CORTIS Member Is Your Commander?', '2026-11-05 08:41:24'),
(2, 1, 2, '[QUIZ] Kalau Kamu Masuk Tim Paskib Sekolah, Siapa Member CORTIS yang Jadi Dantonnya?', '2026-11-05 08:41:24'),
(3, 1, 3, '[퀴즈] 학교 국기게양 팀에 들어간다면, 대장은 어떤 CORTIS 멤버일까?', '2026-11-05 08:41:24'),
(4, 2, 1, '[QUIZ] Which CORTIS Member Takes You Trick-or-Treating This Halloween?', '2026-11-05 08:41:24'),
(5, 2, 2, '[QUIZ] Siapa Member CORTIS yang Ajak Kamu Berburu Trick or Treat di Halloween Tahun Ini?', '2026-11-05 08:41:24'),
(6, 2, 3, '[퀴즈] 올해 할로윈에 함께 트릭 오어 트릿을 할 CORTIS 멤버는?', '2026-11-05 08:41:24'),
(7, 3, 1, '[QUIZ] Which CORTIS Member Is the Best Travel Partner for Year-End 2026?', '2026-11-05 08:41:24'),
(8, 3, 2, '[QUIZ] Member CORTIS yang Cocok Jadi Partner Traveling Akhir Tahun 2026?', '2026-11-05 08:41:24'),
(9, 3, 3, '[퀴즈] 2026년 연말 여행 파트너로 어울리는 CORTIS 멤버는?', '2026-11-05 08:41:24'),
(10, 4, 1, '[QUIZ] Who Among the 5 CORTIS Members Is Your Night Ride Date?', '2026-11-05 08:41:24'),
(11, 4, 2, '[QUIZ] Siapakah Night Ride Date-mu Diantara ke-5 Member CORTIS?', '2026-11-05 08:41:24'),
(12, 4, 3, '[퀴즈] CORTIS 멤버 5명 중 나의 나이트 라이드 데이트 상대는?', '2026-11-05 08:41:24'),
(13, 5, 1, '[QUIZ] Which Gen 5 Group Is Your Best Mobile Legends Squad Mate?', '2026-11-05 08:41:24'),
(14, 5, 2, '[QUIZ] Siapa Grup Gen 5 yang Cocok Jadi Teman Mabar Mobile Legends-mu?', '2026-11-05 08:41:24'),
(15, 5, 3, '[퀴즈] 모바일 레전드를 함께할 5세대 그룹은 누구?', '2026-11-05 08:41:24'),
(16, 6, 1, '[QUIZ] As Music Club Leader, Which CORTIS Member Would You Invite to the School Band?', '2026-11-05 08:41:24'),
(17, 6, 2, '[QUIZ] Kalau Jadi Ketua Ekskul Musik, Siapa Member CORTIS yang Kamu Ajak Join Band Sekolah?', '2026-11-05 08:41:24'),
(18, 6, 3, '[퀴즈] 음악 동아리 회장이라면 학교 밴드에 어떤 CORTIS 멤버를 영입할까?', '2026-11-05 08:41:24'),
(19, 7, 1, '[QUIZ] Which CORTIS Member Invites You to Synchronize Festival 2026?', '2026-11-05 08:41:24'),
(20, 7, 2, '[QUIZ] Siapa Member CORTIS yang Ajak Kamu Nonton Synchronize Festival 2026?', '2026-11-05 08:41:24'),
(21, 7, 3, '[퀴즈] Synchronize Festival 2026에 함께 갈 CORTIS 멤버는?', '2026-11-05 08:41:24'),
(22, 8, 1, '[QUIZ] If You Book a Motorcycle Taxi, Which CORTIS Member Is Your Driver?', '2026-11-05 08:41:24'),
(23, 8, 2, '[QUIZ] Kalau Kamu Pesan Ojol, Member CORTIS Mana yang Jadi Abang Sopirnya?', '2026-11-05 08:41:24'),
(24, 8, 3, '[퀴즈] 오토바이 택시를 부르면 어떤 CORTIS 멤버가 기사님일까?', '2026-11-05 08:41:24'),
(25, 9, 1, '[QUIZ] Kalau Kamu Pingsan Pas Upacara Senin, Siapa Member CORTIS yang Bawa Kamu ke UKS?', '2026-11-05 08:41:24'),
(26, 9, 2, '[QUIZ] Kalau Kamu Pingsan Pas Upacara Senin, Siapa Member CORTIS yang Bawa Kamu ke UKS?', '2026-11-05 08:41:24'),
(27, 9, 3, '[QUIZ] Kalau Kamu Pingsan Pas Upacara Senin, Siapa Member CORTIS yang Bawa Kamu ke UKS?', '2026-11-05 08:41:24'),
(28, 10, 1, 'MC dan Lineup Music Bank Global Festival in Japan 2026, aespa hingga IVE', '2026-11-05 08:41:24'),
(29, 10, 2, 'MC dan Lineup Music Bank Global Festival in Japan 2026, aespa hingga IVE', '2026-11-05 08:41:24'),
(30, 10, 3, 'MC dan Lineup Music Bank Global Festival in Japan 2026, aespa hingga IVE', '2026-11-05 08:41:24'),
(31, 11, 1, '[QUIZ] Nonton Pestapora 2026 Sendirian? Ini Boygrup Gen 5 yang Siap Nemenin!', '2026-11-05 08:41:24'),
(32, 11, 2, '[QUIZ] Nonton Pestapora 2026 Sendirian? Ini Boygrup Gen 5 yang Siap Nemenin!', '2026-11-05 08:41:24'),
(33, 11, 3, '[QUIZ] Nonton Pestapora 2026 Sendirian? Ini Boygrup Gen 5 yang Siap Nemenin!', '2026-11-05 08:41:24'),
(34, 12, 1, '9 Boy Group Songs That Charted High in Korea, Including CORTIS''s ''REDRED''!', '2026-11-05 08:41:24'),
(35, 12, 2, '9 Lagu Boy Group Sukses Charting Tinggi di Korea, Ada ''REDRED'' CORTIS!', '2026-11-05 08:41:24'),
(36, 12, 3, '한국 차트 상위권에 오른 보이그룹 노래 9곡, CORTIS의 ''REDRED'' 포함!', '2026-11-05 08:41:24'),
(37, 13, 1, 'CORTIS''s Awards After One Year Since Debut, Already Won 2 Daesang', '2026-11-05 08:41:24'),
(38, 13, 2, 'Daftar Penghargaan CORTIS usai Setahun Debut, Sudah Dapat 2 Daesang', '2026-11-05 08:41:24'),
(39, 13, 3, '데뷔 1주년 CORTIS 수상 내역, 이미 대상 2회 수상', '2026-11-05 08:41:24'),
(40, 14, 1, 'The Fact Music Awards (TMA) 2026 Winners: CORTIS and ATEEZ Take Daesang', '2026-11-05 08:41:24'),
(41, 14, 2, 'Daftar Pemenang The Fact Music Awards (TMA) 2026, CORTIS-ATEEZ Daesang', '2026-11-05 08:41:24'),
(42, 14, 3, '2026 더 팩트 뮤직 어워즈(TMA) 수상자, CORTIS·ATEEZ 대상', '2026-11-05 08:41:24'),
(43, 15, 1, '[QUIZ] Seberapa Jeli Matamu Menebak Member CORTIS? Buktikan Kamu Beneran COER', '2026-11-05 08:41:24'),
(44, 15, 2, '[QUIZ] Seberapa Jeli Matamu Menebak Member CORTIS? Buktikan Kamu Beneran COER', '2026-11-05 08:41:24'),
(45, 15, 3, '[QUIZ] Seberapa Jeli Matamu Menebak Member CORTIS? Buktikan Kamu Beneran COER', '2026-11-05 08:41:24');

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
