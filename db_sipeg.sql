-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 03, 2024 at 06:03 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sipeg`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensis`
--

CREATE TABLE `absensis` (
  `absensi_id` int(10) UNSIGNED NOT NULL,
  `pegawai_id` int(10) UNSIGNED NOT NULL,
  `status_absensi` varchar(20) NOT NULL,
  `jam_masuk` time DEFAULT NULL,
  `jam_keluar` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `absensis`
--

INSERT INTO `absensis` (`absensi_id`, `pegawai_id`, `status_absensi`, `jam_masuk`, `jam_keluar`, `created_at`, `updated_at`) VALUES
(1, 1, 'present', '18:07:22', '20:03:21', '2024-05-07 05:06:29', '2024-05-07 05:14:21'),
(2, 1, 'present', '18:07:22', '20:03:21', '2024-06-20 21:10:54', '2024-06-20 21:10:54'),
(3, 1, 'absence', '18:07:22', '20:03:21', '2024-07-02 06:56:18', '2024-07-02 06:56:18'),
(4, 1, 'present', NULL, NULL, '2024-07-02 16:34:38', '2024-07-02 16:34:38'),
(5, 1, 'sick', NULL, NULL, '2024-07-02 16:52:18', '2024-07-02 16:52:18'),
(6, 1, 'absence', NULL, NULL, '2024-07-02 16:55:27', '2024-07-02 16:55:27'),
(7, 3, 'present', NULL, NULL, '2024-07-02 17:59:55', '2024-07-02 17:59:55'),
(8, 3, 'present', NULL, NULL, '2024-07-02 18:01:22', '2024-07-02 18:01:22'),
(9, 1, 'present', NULL, NULL, '2024-07-02 18:03:13', '2024-07-02 18:03:13'),
(10, 5, 'present', NULL, NULL, '2024-07-02 18:33:17', '2024-07-02 18:33:17'),
(11, 1, 'sick', NULL, NULL, '2024-07-02 20:18:19', '2024-07-02 20:18:19'),
(12, 6, 'present', NULL, NULL, '2024-07-02 20:53:45', '2024-07-02 20:53:45');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `text_content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `connects`
--

CREATE TABLE `connects` (
  `connect_id` int(10) UNSIGNED NOT NULL,
  `user_id1` int(10) UNSIGNED NOT NULL,
  `user_id2` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cutis`
--

CREATE TABLE `cutis` (
  `cuti_id` int(10) UNSIGNED NOT NULL,
  `pegawai_id` int(10) UNSIGNED NOT NULL,
  `detail_cuti` varchar(50) NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_selesai` date NOT NULL,
  `status_cuti` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cutis`
--

INSERT INTO `cutis` (`cuti_id`, `pegawai_id`, `detail_cuti`, `tgl_mulai`, `tgl_selesai`, `status_cuti`, `created_at`, `updated_at`) VALUES
(1, 1, 'sakit', '2024-05-01', '2024-09-11', 0, '2024-05-07 04:34:45', '2024-05-07 04:56:05'),
(3, 1, 'sakit', '2024-05-01', '2024-09-01', 0, '2024-05-07 05:13:51', '2024-07-02 09:04:41'),
(4, 4, 'ba', '2024-05-01', '2024-09-01', 1, '2024-07-02 07:00:59', '2024-07-02 07:01:12'),
(5, 1, 'ngabuburits', '2024-05-01', '2024-09-11', 1, '2024-07-02 08:41:50', '2024-07-02 08:59:39'),
(6, 1, 'ngabuburit', '2023-05-03', '2023-05-05', 0, '2024-07-02 18:36:48', '2024-07-02 20:20:52'),
(7, 5, 'salit hati', '2024-07-10', '2024-07-18', 1, '2024-07-02 18:55:11', '2024-07-02 19:11:48'),
(8, 1, '1233', '2024-07-17', '2024-07-25', 1, '2024-07-02 19:11:18', '2024-07-02 20:20:15'),
(9, 6, 'saya sakit hati', '2024-07-11', '2024-07-15', 1, '2024-07-02 19:48:31', '2024-07-02 19:49:53'),
(10, 6, 'sakit hati', '2024-07-10', '2024-07-13', 0, '2024-07-02 20:54:23', '2024-07-02 20:57:19');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gajis`
--

CREATE TABLE `gajis` (
  `gaji_id` int(10) UNSIGNED NOT NULL,
  `pegawai_id` int(10) UNSIGNED NOT NULL,
  `tunjangan` int(11) NOT NULL,
  `potongan_gaji` int(11) NOT NULL,
  `ket_potongan_gaji` varchar(50) NOT NULL,
  `total_gaji` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gajis`
--

INSERT INTO `gajis` (`gaji_id`, `pegawai_id`, `tunjangan`, `potongan_gaji`, `ket_potongan_gaji`, `total_gaji`, `created_at`, `updated_at`) VALUES
(1, 1, 3000000, 10000, 'Pinjaman Koperasi,', 52990000, '2024-06-20 21:10:00', '2024-06-20 21:10:00');

-- --------------------------------------------------------

--
-- Table structure for table `jabatans`
--

CREATE TABLE `jabatans` (
  `jabatan_id` int(10) UNSIGNED NOT NULL,
  `nama_jabatan` varchar(50) NOT NULL,
  `deskripsi` varchar(50) NOT NULL,
  `gaji_pokok` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jabatans`
--

INSERT INTO `jabatans` (`jabatan_id`, `nama_jabatan`, `deskripsi`, `gaji_pokok`, `created_at`, `updated_at`) VALUES
(1, 'CEO', 'Chief Executive Officers', 50000000, '2024-05-07 04:14:13', '2024-05-07 04:14:13'),
(2, 'Programmer', 'Programmer di IT', 10000000, '2024-05-15 18:58:56', '2024-05-15 18:58:56');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `like_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`like_id`, `post_id`, `user_id`, `created_at`, `updated_at`) VALUES
(3, 1, 3, '2024-05-07 08:28:38', '2024-05-07 08:28:38'),
(4, 1, 4, '2024-05-07 08:43:22', '2024-05-07 08:43:22'),
(5, 5, 3, '2024-05-29 19:08:09', '2024-05-29 19:08:09'),
(6, 5, 3, '2024-05-29 19:08:14', '2024-05-29 19:08:14'),
(7, 5, 3, '2024-05-29 19:08:32', '2024-05-29 19:08:32'),
(8, 5, 3, '2024-05-29 19:13:00', '2024-05-29 19:13:00'),
(9, 5, 3, '2024-05-29 19:41:33', '2024-05-29 19:41:33'),
(10, 6, 3, '2024-05-29 19:41:44', '2024-05-29 19:41:44'),
(11, 5, 3, '2024-05-30 21:26:12', '2024-05-30 21:26:12'),
(12, 1, 3, '2024-06-12 19:45:21', '2024-06-12 19:45:21');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2024_03_05_102207_create_jabatans_table', 1),
(5, '2024_03_05_102235_create_pagawais_table', 1),
(6, '2024_03_05_102300_create_users_table', 1),
(7, '2024_03_05_103202_create_gajis_table', 1),
(8, '2024_03_05_104146_create_cutis_table', 1),
(9, '2024_03_05_122941_create_absensis_table', 1),
(10, '2024_03_05_123550_create_penilaian_kerjas_table', 1),
(11, '2024_05_03_131436_create_posts_table', 1),
(12, '2024_05_03_131505_create_comments_table', 1),
(13, '2024_05_03_131512_create_likes_table', 1),
(14, '2024_05_03_131520_create_unlikes_table', 1),
(15, '2024_05_06_104358_create_connects_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pegawais`
--

CREATE TABLE `pegawais` (
  `pegawai_id` int(10) UNSIGNED NOT NULL,
  `manager_id` int(10) UNSIGNED DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `nohp` varchar(20) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `tgl_keluar` date DEFAULT NULL,
  `jabatan_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pegawais`
--

INSERT INTO `pegawais` (`pegawai_id`, `manager_id`, `nama`, `nohp`, `alamat`, `email`, `tgl_masuk`, `tgl_keluar`, `jabatan_id`, `created_at`, `updated_at`) VALUES
(1, NULL, 'ifalss', '081235257', 'padang', 'ranaufalm@gmail.com', '2024-03-03', NULL, 1, '2024-05-07 04:14:15', '2024-05-07 04:14:15'),
(2, NULL, 'admin', '1r525313', 'cupak tangah', 'admin@gmail.com', '2024-03-22', NULL, 1, NULL, NULL),
(3, NULL, 'Fauzi', '08228557523', 'Kerinci', 'fauziisyrin@gmail.com', '2024-05-16', NULL, 2, NULL, NULL),
(4, NULL, 'Yefri Afri Zandra', '014879124', 'Padang', 'yefriafri@gmail.com', '2024-05-16', NULL, 2, NULL, NULL),
(5, 1, 'Veron', '082285572233', 'cupak tangah', 'verons@gmail.com', '2024-11-12', NULL, 2, NULL, NULL),
(6, 1, 'budi', '082285574444', 'cupak tangah', 'budi@gmail.com', '2024-03-21', NULL, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `penilaian_kerjas`
--

CREATE TABLE `penilaian_kerjas` (
  `penilaiankerja_id` int(10) UNSIGNED NOT NULL,
  `penilai_id` int(10) UNSIGNED NOT NULL,
  `pegawai_id` int(10) UNSIGNED NOT NULL,
  `kehadiran` int(11) NOT NULL,
  `kinerja` int(11) NOT NULL,
  `kerjasama` int(11) NOT NULL,
  `kreatifitas` int(11) NOT NULL,
  `kepemimpinan` int(11) NOT NULL,
  `pemecahan_masalah` int(11) NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penilaian_kerjas`
--

INSERT INTO `penilaian_kerjas` (`penilaiankerja_id`, `penilai_id`, `pegawai_id`, `kehadiran`, `kinerja`, `kerjasama`, `kreatifitas`, `kepemimpinan`, `pemecahan_masalah`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 5, 6, 7, 6, 6, 7, 61.666666666667, '2024-05-07 05:24:07', '2024-05-07 05:33:19'),
(2, 1, 2, 5, 7, 6, 8, 8, 5, 65, '2024-05-07 05:27:21', '2024-05-07 05:32:49'),
(3, 1, 1, 5, 6, 3, 7, 5, 7, 55, '2024-05-07 05:29:45', '2024-05-07 05:33:17'),
(5, 1, 1, 5, 6, 3, 7, 5, 7, 6, '2024-07-02 12:30:07', '2024-07-02 12:30:07'),
(13, 2, 4, 5, 6, 3, 7, 5, 7, 6, '2024-07-02 12:40:16', '2024-07-02 12:40:16'),
(20, 1, 5, 7, 7, 7, 8, 7, 8, 73.333333333333, '2024-07-02 12:44:39', '2024-07-02 12:44:39'),
(24, 2, 4, 5, 6, 3, 7, 5, 7, 6, '2024-07-02 12:49:22', '2024-07-02 12:49:22'),
(25, 3, 4, 5, 6, 3, 7, 5, 7, 6, '2024-07-02 12:49:47', '2024-07-02 12:49:47'),
(28, 3, 5, 3, 3, 5, 10, 8, 9, 63.33333333333333, '2024-07-02 12:53:40', '2024-07-02 12:53:40'),
(29, 1, 5, 2, 1, 3, 1, 2, 2, 18.333333333333332, '2024-07-02 16:25:12', '2024-07-02 16:25:12'),
(38, 3, 5, 6, 5, 5, 5, 5, 5, 51.66666666666667, '2024-07-02 20:36:22', '2024-07-02 20:36:22'),
(39, 3, 5, 1, 1, 1, 1, 1, 1, 10, '2024-07-02 20:44:23', '2024-07-02 20:44:23'),
(40, 3, 5, 5, 8, 8, 9, 8, 7, 75, '2024-07-02 20:58:02', '2024-07-02 20:58:02');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `url_content` text DEFAULT NULL,
  `text_content` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `user_id`, `url_content`, `text_content`, `created_at`, `updated_at`) VALUES
(1, 3, 'assets/posts/1715090765_3.jpg', 'asd', '2024-05-07 07:06:05', '2024-05-07 07:06:05'),
(2, 3, 'assets/posts/1715090857_3.JPG', 'asd', '2024-05-07 07:07:37', '2024-05-07 07:07:37'),
(5, 5, 'assets/posts/1715824958_5.HEIC', 'lagi ngoding guys', '2024-05-15 19:02:38', '2024-05-15 19:02:38'),
(6, 6, 'assets/posts/1715828011_6.jpg', 'pagiii guysss, aku mau cerita nichhh.. :\"\r\nkan aqoeh dari tadi ngoding. truz tib4-tib4 codingan ku error. aku kan jadi syed111hhhh😭😭\r\n\r\nsumpahh 😭 padahal deadline tinggal 1 jam lagiii ....\r\ndoain aku dong guyss :\"\"\"\"\"', '2024-05-15 19:53:31', '2024-05-15 20:21:36'),
(7, 6, 'assets/posts/1715829776_6.HEIC', 'Ternyata ini yang nge errorin codingan ku guyss.. dia jahat bangetttt 😭😭😡', '2024-05-15 20:22:56', '2024-05-15 20:22:56');

-- --------------------------------------------------------

--
-- Table structure for table `unlikes`
--

CREATE TABLE `unlikes` (
  `unlikes_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `pegawai_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `hak_akses` int(11) NOT NULL,
  `url_profile` text DEFAULT NULL,
  `bio` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `pegawai_id`, `username`, `password`, `hak_akses`, `url_profile`, `bio`, `created_at`, `updated_at`) VALUES
(3, 1, 'ifalgaul', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 1, NULL, NULL, '2024-05-07 04:19:17', '2024-05-07 04:19:17'),
(4, 2, 'admin', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 1, NULL, NULL, '2024-05-07 05:27:03', '2024-05-07 05:27:03'),
(5, 3, 'fauziisyrin', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 2, NULL, NULL, '2024-05-15 19:00:20', '2024-05-15 19:00:20'),
(6, 4, 'Yefri', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 2, NULL, NULL, '2024-05-15 19:06:44', '2024-05-15 19:06:44'),
(7, 5, 'vron', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 3, NULL, NULL, '2024-07-02 10:11:12', '2024-07-02 10:11:12'),
(8, 6, 'budi', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 3, NULL, NULL, '2024-07-02 19:42:24', '2024-07-02 19:42:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensis`
--
ALTER TABLE `absensis`
  ADD PRIMARY KEY (`absensi_id`),
  ADD KEY `absensis_pegawai_id_foreign` (`pegawai_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `comments_post_id_foreign` (`post_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `connects`
--
ALTER TABLE `connects`
  ADD PRIMARY KEY (`connect_id`),
  ADD KEY `connects_user_id1_foreign` (`user_id1`),
  ADD KEY `connects_user_id2_foreign` (`user_id2`);

--
-- Indexes for table `cutis`
--
ALTER TABLE `cutis`
  ADD PRIMARY KEY (`cuti_id`),
  ADD KEY `cutis_pegawai_id_foreign` (`pegawai_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gajis`
--
ALTER TABLE `gajis`
  ADD PRIMARY KEY (`gaji_id`),
  ADD KEY `gajis_pegawai_id_foreign` (`pegawai_id`);

--
-- Indexes for table `jabatans`
--
ALTER TABLE `jabatans`
  ADD PRIMARY KEY (`jabatan_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`like_id`),
  ADD KEY `likes_post_id_foreign` (`post_id`),
  ADD KEY `likes_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pegawais`
--
ALTER TABLE `pegawais`
  ADD PRIMARY KEY (`pegawai_id`),
  ADD UNIQUE KEY `pegawais_email_unique` (`email`),
  ADD KEY `pegawais_manager_id_foreign` (`manager_id`),
  ADD KEY `pegawais_jabatan_id_foreign` (`jabatan_id`);

--
-- Indexes for table `penilaian_kerjas`
--
ALTER TABLE `penilaian_kerjas`
  ADD PRIMARY KEY (`penilaiankerja_id`),
  ADD KEY `penilaian_kerjas_penilai_id_foreign` (`penilai_id`),
  ADD KEY `penilaian_kerjas_pegawai_id_foreign` (`pegawai_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `unlikes`
--
ALTER TABLE `unlikes`
  ADD PRIMARY KEY (`unlikes_id`),
  ADD KEY `unlikes_post_id_foreign` (`post_id`),
  ADD KEY `unlikes_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `users_pegawai_id_unique` (`pegawai_id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensis`
--
ALTER TABLE `absensis`
  MODIFY `absensi_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `connects`
--
ALTER TABLE `connects`
  MODIFY `connect_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cutis`
--
ALTER TABLE `cutis`
  MODIFY `cuti_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gajis`
--
ALTER TABLE `gajis`
  MODIFY `gaji_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jabatans`
--
ALTER TABLE `jabatans`
  MODIFY `jabatan_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `like_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `pegawais`
--
ALTER TABLE `pegawais`
  MODIFY `pegawai_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `penilaian_kerjas`
--
ALTER TABLE `penilaian_kerjas`
  MODIFY `penilaiankerja_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `unlikes`
--
ALTER TABLE `unlikes`
  MODIFY `unlikes_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absensis`
--
ALTER TABLE `absensis`
  ADD CONSTRAINT `absensis_pegawai_id_foreign` FOREIGN KEY (`pegawai_id`) REFERENCES `pegawais` (`pegawai_id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`),
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `connects`
--
ALTER TABLE `connects`
  ADD CONSTRAINT `connects_user_id1_foreign` FOREIGN KEY (`user_id1`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `connects_user_id2_foreign` FOREIGN KEY (`user_id2`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `cutis`
--
ALTER TABLE `cutis`
  ADD CONSTRAINT `cutis_pegawai_id_foreign` FOREIGN KEY (`pegawai_id`) REFERENCES `pegawais` (`pegawai_id`);

--
-- Constraints for table `gajis`
--
ALTER TABLE `gajis`
  ADD CONSTRAINT `gajis_pegawai_id_foreign` FOREIGN KEY (`pegawai_id`) REFERENCES `pegawais` (`pegawai_id`);

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`),
  ADD CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `pegawais`
--
ALTER TABLE `pegawais`
  ADD CONSTRAINT `pegawais_jabatan_id_foreign` FOREIGN KEY (`jabatan_id`) REFERENCES `jabatans` (`jabatan_id`),
  ADD CONSTRAINT `pegawais_manager_id_foreign` FOREIGN KEY (`manager_id`) REFERENCES `pegawais` (`pegawai_id`);

--
-- Constraints for table `penilaian_kerjas`
--
ALTER TABLE `penilaian_kerjas`
  ADD CONSTRAINT `penilaian_kerjas_pegawai_id_foreign` FOREIGN KEY (`pegawai_id`) REFERENCES `pegawais` (`pegawai_id`),
  ADD CONSTRAINT `penilaian_kerjas_penilai_id_foreign` FOREIGN KEY (`penilai_id`) REFERENCES `pegawais` (`pegawai_id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `unlikes`
--
ALTER TABLE `unlikes`
  ADD CONSTRAINT `unlikes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`),
  ADD CONSTRAINT `unlikes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_pegawai_id_foreign` FOREIGN KEY (`pegawai_id`) REFERENCES `pegawais` (`pegawai_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
