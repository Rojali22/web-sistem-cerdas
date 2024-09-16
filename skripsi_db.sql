-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2024 at 01:57 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skripsi_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `nama`, `description`) VALUES
(1, 'Gedung A', 'Area utama ruang staff dan dosen,  termasuk toilet, wastafel, dan cermin.'),
(2, 'Gedung B', 'Area untuk kelas mahasiswa,  termasuk toilet, wastafel, dan cermin.'),
(3, 'Gedung Pucc', 'Fasilitas umum untuk acara besar, termasuk toilet, wastafel, dan cermin.'),
(4, 'Kantin', 'Area jualan makanan, termasuk toilet, wastafel, dan cermin.'),
(5, 'Halaman', 'Area halaman all area kampus, termasuk ruang klinik, dan ruang ATM.'),
(6, 'Medical', 'Area kelas untuk fakulktas teknik, termasuk toilet, wastafel, dan cermin.');

-- --------------------------------------------------------

--
-- Table structure for table `cleaning_services`
--

CREATE TABLE `cleaning_services` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `assigned_area` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cleaning_services`
--

INSERT INTO `cleaning_services` (`id`, `nama`, `assigned_area`, `id_user`, `status`) VALUES
(1, 'Adi Gunawan', 1, 6, 'inactive'),
(2, 'Asep Mulyana', 2, NULL, 'active'),
(3, 'Asep Supriatna', 3, 8, 'inactive'),
(4, 'Fahrurozi', 4, NULL, 'active'),
(5, 'Ardiansyah', 1, NULL, 'active'),
(6, 'Robiman', 1, NULL, 'active'),
(7, 'Imam Tantowi', 1, 6, 'active'),
(8, 'Endah Hidayat', 1, 6, 'active'),
(9, 'Dodo Wijaya', 1, 6, 'active'),
(10, 'Wahyu Firmansyah', 5, 8, 'active'),
(11, 'Agung Yusuf', 2, 6, 'active'),
(12, 'Heru Sunendar', 2, 6, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `jobdesk`
--

CREATE TABLE `jobdesk` (
  `id` int(11) NOT NULL,
  `hari` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `area_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobdesk`
--

INSERT INTO `jobdesk` (`id`, `hari`, `description`, `area_id`) VALUES
(1, 'Senin', 'Membersihkan ruangan utama', 1),
(2, 'Selasa', 'Membersihkan kantor pusat', 2),
(3, 'Rabu', 'Memperbaiki peralatan kantor', 3),
(4, 'Kamis', 'Merawat taman di sekitar kantor', 4),
(5, 'Jumat', 'Menjaga keamanan di area parkir', 5);

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `no_telp` varchar(15) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `tgl_bergabung` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id`, `nama`, `jabatan`, `email`, `no_telp`, `alamat`, `tgl_lahir`, `tgl_bergabung`) VALUES
(9, 'Ujang Nr', 'IT', 'hrd@gmail.com', '0000', 'blok 1', '2024-06-08', '2024-06-08'),
(11, 'Rojali', 'admin', 'kk@gmail.com', '214412344532', 'blok 1', '2024-06-08', '2024-06-08');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(255) NOT NULL,
  `menu_url` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`menu_id`, `menu_name`, `menu_url`, `user_type`) VALUES
(1, 'Data Karyawan', 'karyawan', 'leader'),
(2, 'Data Area', 'areas', 'leader,user,manager'),
(3, 'Data Jobdesk', 'jobdesk', 'leader,user,manager'),
(4, 'Data Cleaning Services', 'cleaning_services', 'leader'),
(5, 'Data Penilaian', 'penilaian', 'leader,user,manager'),
(7, 'Profil Saya', 'profile', '');

-- --------------------------------------------------------

--
-- Table structure for table `penilaian`
--

CREATE TABLE `penilaian` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `kebersihan` decimal(5,2) DEFAULT NULL,
  `kerapihan` decimal(5,2) DEFAULT NULL,
  `ketepatan_waktu` decimal(5,2) DEFAULT NULL,
  `nilai_fuzzy` decimal(5,2) DEFAULT NULL,
  `deskripsi` varchar(50) DEFAULT NULL,
  `cleaning_services_id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `waktu` time DEFAULT NULL,
  `foto_sebelum` varchar(255) DEFAULT NULL,
  `foto_sesudah` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penilaian`
--

INSERT INTO `penilaian` (`id`, `nama`, `kebersihan`, `kerapihan`, `ketepatan_waktu`, `nilai_fuzzy`, `deskripsi`, `cleaning_services_id`, `tanggal`, `waktu`, `foto_sebelum`, `foto_sesudah`) VALUES
(1, 'Robiman', 8.00, 7.00, 7.00, 5.00, 'Cukup Baik', 0, '2024-08-14', '01:53:15', 'WhatsApp_Image_2024-07-20_at_19_45_16_(1)_-_Copy.jpeg', 'WhatsApp_Image_2024-07-20_at_19_45_17.jpeg'),
(2, 'Ardiansyah', 7.00, 7.00, 7.00, 5.00, 'Cukup Baik', 0, '2024-08-13', '21:00:03', 'WhatsApp_Image_2024-07-20_at_18_57_13_-_Copy.jpeg', 'WhatsApp_Image_2024-07-20_at_18_57_13_(1)_-_Copy.jpeg'),
(3, 'Asep mulyana', 8.00, 8.00, 8.00, 8.00, 'Baik', 0, '2024-08-14', '01:52:18', 'JOb_motong.jpg', 'motong.jpg'),
(4, 'Ardiansyah', 7.00, 7.00, 7.00, 5.00, 'Cukup Baik', 0, '2024-08-13', '21:03:13', 'WhatsApp_Image_2024-07-20_at_11_16_25.jpeg', '8b800b1dc27ee1c0d19f9a8e416bd73c.jpg'),
(5, 'Fahrurozi', 8.00, 9.00, 9.00, 8.00, 'Baik', 0, '2024-08-14', '01:54:22', 'be54698f7c6a968e0edf45e9a3875b7b.jpeg', '9892283d88dbae9e74da709b2b7dadf8.jpeg'),
(6, 'Asep Supriatna', 7.00, 7.00, 7.00, 5.00, 'Cukup Baik', 0, '2024-08-13', '21:07:58', 'IMG-20230811-WA0064.jpg', 'IMG-20230811-WA0065.jpg'),
(7, 'Endah Hidayat', 7.00, 8.00, 5.00, 5.00, 'Cukup Baik', 0, '2024-08-14', '01:54:46', '5d3186ec98e9291efed1a07e99381ff6.jpg', 'df399083b0f3a91ddc906072fea29008.jpg'),
(8, 'Heru Sunendar', 7.00, 6.00, 5.00, 5.00, 'Cukup Baik', 0, '2024-08-13', '21:28:08', '509b2b31b391e770b2f883d35d0ab368.jpeg', 'ad7d16740a00039ffd905fc977450b06.jpeg'),
(9, 'Agung Yusuf', 7.00, 8.00, 8.00, 5.00, 'Cukup Baik', 0, '2024-08-14', '01:55:15', '28fc1a830ffe418c28eb3e53b9e2b2ce.jpeg', 'd994a9ebe520d8f07877f0cb94c38863.jpeg'),
(10, 'Dodo Wijaya', 5.20, 4.60, 8.00, 5.00, 'Cukup Baik', 0, '2024-08-13', '21:29:49', '22ff4beba9b451894f27a5a1920073a9.jpeg', '640d189b265a0d43d2f1b67a3bba2186.jpeg'),
(11, 'Imam Tantowi', 8.00, 9.00, 4.20, 5.00, 'Cukup Baik', 0, '2024-08-14', '01:55:52', 'e43dbce0bd1187d50128cfd5922710a2.jpeg', '114c4a8784e0f48463eb93d8d5cdb2a8.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `user_type` enum('leader','user','manager','') NOT NULL,
  `create_ad` datetime NOT NULL,
  `foto` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username`, `email`, `password`, `user_type`, `create_ad`, `foto`, `icon`) VALUES
(1, 'Rojali', 'kakaroy@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'leader', '2024-06-01 00:01:48', 'jali.jpg', 'jali.png'),
(6, 'Adi Gunawan', 'adigun14@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'user', '2024-06-20 23:58:30', 'ariel.jpg', 'jali.png'),
(8, 'Asep Supriatna', 'asepspr@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'user', '2024-06-28 12:54:59', '', 'jali.png'),
(10, 'Robiman', 'robiman23@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'manager', '2024-07-03 01:18:36', 'andika.jpg', 'jali.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cleaning_services`
--
ALTER TABLE `cleaning_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assigned_area` (`assigned_area`),
  ADD KEY `fk_cleaning_services_users` (`id_user`);

--
-- Indexes for table `jobdesk`
--
ALTER TABLE `jobdesk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `area_id` (`area_id`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `penilaian`
--
ALTER TABLE `penilaian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cleaning_services`
--
ALTER TABLE `cleaning_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `jobdesk`
--
ALTER TABLE `jobdesk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `penilaian`
--
ALTER TABLE `penilaian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cleaning_services`
--
ALTER TABLE `cleaning_services`
  ADD CONSTRAINT `cleaning_services_ibfk_1` FOREIGN KEY (`assigned_area`) REFERENCES `areas` (`id`),
  ADD CONSTRAINT `fk_cleaning_services_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Constraints for table `jobdesk`
--
ALTER TABLE `jobdesk`
  ADD CONSTRAINT `fk_jobdesk_area` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
