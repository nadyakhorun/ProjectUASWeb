-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2023 at 04:07 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 5.6.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kas_rt`
--

-- --------------------------------------------------------

--
-- Table structure for table `bulan_pembayaran`
--

CREATE TABLE `bulan_pembayaran` (
  `id_bulan_pembayaran` int(11) NOT NULL,
  `nama_bulan` enum('januari','februari','maret','april','mei','juni','juli','agustus','september','oktober','november','desember') NOT NULL,
  `tahun` int(4) NOT NULL,
  `pembayaran_perminggu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bulan_pembayaran`
--

INSERT INTO `bulan_pembayaran` (`id_bulan_pembayaran`, `nama_bulan`, `tahun`, `pembayaran_perminggu`) VALUES
(1, 'januari', 2021, 5000),
(2, 'februari', 2021, 4000),
(3, 'juli', 2020, 5000),
(4, 'desember', 2020, 15000),
(5, 'desember', 2023, 50000);

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `id_jabatan` int(11) NOT NULL,
  `nama_jabatan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id_jabatan`, `nama_jabatan`) VALUES
(1, 'administrator'),
(2, 'users');

-- --------------------------------------------------------

--
-- Table structure for table `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `id_pengeluaran` int(11) NOT NULL,
  `jumlah_pengeluaran` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `tanggal_pengeluaran` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengeluaran`
--

INSERT INTO `pengeluaran` (`id_pengeluaran`, `jumlah_pengeluaran`, `keterangan`, `tanggal_pengeluaran`, `id_user`) VALUES
(3, 12000, 'pengharum ruangan 1 Pcs', 1593626363, 1),
(4, 14000, 'Sapu 2 Pcs', 1593626300, 1),
(7, 9000, 'kain pel 1 pcs', 1593625725, 1),
(8, 12000, 'Penghapus papan tulis 1Pcs', 1593626393, 1),
(10, 50000, 'bayar sampah', 1703498815, 1);

-- --------------------------------------------------------

--
-- Table structure for table `riwayat`
--

CREATE TABLE `riwayat` (
  `id_riwayat` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_uang_kas` int(11) NOT NULL,
  `aksi` text NOT NULL,
  `tanggal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `riwayat`
--

INSERT INTO `riwayat` (`id_riwayat`, `id_user`, `id_uang_kas`, `aksi`, `tanggal`) VALUES
(1, 1, 2, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 2,000', 1590247875),
(2, 1, 1, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 3,000', 1590247882),
(3, 1, 3, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 5,000', 1590247886),
(4, 1, 4, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 1,000', 1590247894),
(5, 1, 5, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 4,000', 1590248804),
(6, 1, 5, 'telah mengubah pembayaran minggu ke-2 dari Rp. 0 menjadi Rp. 4,000', 1590248809),
(7, 1, 6, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 3,000', 1590248815),
(8, 1, 7, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 3,000', 1590248824),
(9, 1, 8, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 1,000', 1590248827),
(10, 2, 1, 'telah mengubah pembayaran minggu ke-1 dari Rp. 3,000 menjadi Rp. 5,000', 1590248990),
(11, 1, 1, 'telah mengubah pembayaran minggu ke-2 dari Rp. 0 menjadi Rp. 5,000', 1590332508),
(12, 1, 1, 'telah mengubah pembayaran minggu ke-3 dari Rp. 0 menjadi Rp. 2,000', 1591296094),
(13, 1, 1, 'telah mengubah pembayaran minggu ke-3 dari Rp. 2,000 menjadi Rp. 5,000', 1591296102),
(14, 1, 1, 'telah mengubah pembayaran minggu ke-4 dari Rp. 0 menjadi Rp. 5,000', 1591296107),
(15, 1, 13, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 5,000', 1591296909),
(16, 1, 9, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 3,000', 1591296918),
(17, 1, 13, 'telah mengubah pembayaran minggu ke-2 dari Rp. 0 menjadi Rp. 3,000', 1591296924),
(18, 1, 13, 'telah mengubah pembayaran minggu ke-2 dari Rp. 3,000 menjadi Rp. 0', 1591296938),
(19, 1, 13, 'telah mengubah pembayaran minggu ke-1 dari Rp. 5,000 menjadi Rp. 4,000', 1591296943),
(20, 1, 9, 'telah mengubah pembayaran minggu ke-1 dari Rp. 3,000 menjadi Rp. 5,000', 1593623076),
(21, 1, 9, 'telah mengubah pembayaran minggu ke-2 dari Rp. 0 menjadi Rp. 5,000', 1593623099),
(22, 2, 9, 'telah mengubah pembayaran minggu ke-2 dari Rp. 5,000 menjadi Rp. 0', 1593623193),
(23, 1, 14, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 5,000', 1607139543),
(24, 1, 10, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 5,000', 1703471544),
(25, 1, 21, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 25,000', 1703472721),
(26, 1, 11, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 500', 1703476960),
(27, 1, 26, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 50,000', 1703496157),
(28, 1, 26, 'telah mengubah pembayaran minggu ke-2 dari Rp. 0 menjadi Rp. 50,000', 1703496173),
(29, 1, 26, 'telah mengubah pembayaran minggu ke-3 dari Rp. 0 menjadi Rp. 50,000', 1703496187),
(30, 1, 26, 'telah mengubah pembayaran minggu ke-4 dari Rp. 0 menjadi Rp. 50,000', 1703496196),
(31, 1, 26, 'telah mengubah pembayaran minggu ke-4 dari Rp. 50,000 menjadi Rp. 0', 1703496298),
(32, 1, 21, 'telah mengubah pembayaran minggu ke-1 dari Rp. 25,000 menjadi Rp. 50,000', 1703496308),
(33, 1, 21, 'telah mengubah pembayaran minggu ke-2 dari Rp. 0 menjadi Rp. 50,000', 1703496669),
(34, 1, 21, 'telah mengubah pembayaran minggu ke-2 dari Rp. 50,000 menjadi Rp. 0', 1703496677),
(35, 1, 26, 'telah mengubah pembayaran minggu ke-3 dari Rp. 50,000 menjadi Rp. 0', 1703496685),
(36, 1, 26, 'telah mengubah pembayaran minggu ke-2 dari Rp. 50,000 menjadi Rp. 0', 1703496690),
(37, 1, 26, 'telah mengubah pembayaran minggu ke-1 dari Rp. 50,000 menjadi Rp. 0', 1703496695),
(38, 1, 21, 'telah mengubah pembayaran minggu ke-1 dari Rp. 50,000 menjadi Rp. 0', 1703496702),
(39, 1, 21, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 50,000', 1703496715),
(40, 1, 21, 'telah mengubah pembayaran minggu ke-2 dari Rp. 0 menjadi Rp. 0', 1703496747),
(41, 1, 21, 'telah mengubah pembayaran minggu ke-1 dari Rp. 50,000 menjadi Rp. 50,000', 1703496754),
(42, 1, 21, 'telah mengubah pembayaran minggu ke-1 dari Rp. 50,000 menjadi Rp. 0', 1703496762),
(43, 1, 20, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 50,000', 1703496773),
(44, 1, 20, 'telah mengubah pembayaran minggu ke-2 dari Rp. 0 menjadi Rp. 50,000', 1703497413),
(45, 1, 20, 'telah mengubah pembayaran minggu ke-3 dari Rp. 0 menjadi Rp. 15,000', 1703497426),
(46, 1, 20, 'telah mengubah pembayaran minggu ke-3 dari Rp. 15,000 menjadi Rp. 50,000', 1703500212),
(47, 1, 20, 'telah mengubah pembayaran minggu ke-4 dari Rp. 0 menjadi Rp. 50,000', 1703500219),
(48, 1, 26, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 50,000', 1703500333),
(49, 1, 21, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 50,000', 1703500944),
(50, 1, 21, 'telah mengubah pembayaran minggu ke-2 dari Rp. 0 menjadi Rp. 50,000', 1703500952),
(51, 1, 20, 'telah mengubah pembayaran minggu ke-4 dari Rp. 50,000 menjadi Rp. 0', 1703504799);

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_pengeluaran`
--

CREATE TABLE `riwayat_pengeluaran` (
  `id_riwayat_pengeluaran` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `aksi` text NOT NULL,
  `tanggal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `riwayat_pengeluaran`
--

INSERT INTO `riwayat_pengeluaran` (`id_riwayat_pengeluaran`, `id_user`, `aksi`, `tanggal`) VALUES
(1, 1, 'telah mengubah pengeluaran pengharum ruangan 1 Pcs dari biaya Rp. 10,000 menjadi Rp. 12,000', 1593626363),
(2, 1, 'telah menambahkan pengeluaran Penghapus papan tulis 1Pcs dengan biaya Rp. 12,000', 1593626393),
(3, 1, 'telah menambahkan pengeluaran Meser Cilok dengan biaya Rp. 20,000', 1607139619),
(4, 1, 'telah menambahkan pengeluaran bayar sampah dengan biaya Rp. 50,000', 1703498815);

-- --------------------------------------------------------

--
-- Table structure for table `uang_kas`
--

CREATE TABLE `uang_kas` (
  `id_uang_kas` int(11) NOT NULL,
  `id_warga` int(11) NOT NULL,
  `id_bulan_pembayaran` int(11) NOT NULL,
  `jenis_iuran` enum('kas','sampah','sumbangan','keamanan') NOT NULL,
  `minggu_ke_1` int(11) DEFAULT NULL,
  `minggu_ke_2` int(11) DEFAULT NULL,
  `minggu_ke_3` int(11) DEFAULT NULL,
  `minggu_ke_4` int(11) DEFAULT NULL,
  `keterangan` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `uang_kas`
--

INSERT INTO `uang_kas` (`id_uang_kas`, `id_warga`, `id_bulan_pembayaran`, `jenis_iuran`, `minggu_ke_1`, `minggu_ke_2`, `minggu_ke_3`, `minggu_ke_4`, `keterangan`) VALUES
(1, 1, 1, '', 5000, 5000, 5000, 5000, ''),
(2, 2, 1, '', 2000, 0, 0, 0, ''),
(3, 3, 1, '', 5000, 0, 0, 0, ''),
(4, 4, 1, '', 1000, 0, 0, 0, ''),
(5, 1, 2, '', 4000, 4000, 0, 0, ''),
(6, 2, 2, '', 3000, 0, 0, 0, ''),
(7, 3, 2, '', 3000, 0, 0, 0, ''),
(8, 4, 2, '', 1000, 0, 0, 0, ''),
(9, 1, 3, '', 5000, 0, 0, 0, ''),
(10, 2, 3, '', 5000, 0, 0, 0, ''),
(11, 3, 3, '', 500, 0, 0, 0, ''),
(12, 4, 3, '', 0, 0, 0, 0, ''),
(13, 6, 3, '', 4000, 0, 0, 0, ''),
(14, 5, 3, '', 5000, 0, 0, 0, ''),
(15, 1, 4, '', 0, 0, 0, 0, ''),
(16, 2, 4, '', 0, 0, 0, 0, ''),
(17, 3, 4, '', 0, 0, 0, 0, ''),
(18, 4, 4, '', 0, 0, 0, 0, ''),
(19, 5, 4, '', 0, 0, 0, 0, ''),
(20, 1, 5, 'kas', 50000, 50000, 50000, 0, ''),
(21, 2, 5, 'kas', 50000, 50000, 0, 0, ''),
(22, 3, 5, 'kas', 0, 0, 0, 0, ''),
(23, 4, 5, 'kas', 0, 0, 0, 0, ''),
(24, 5, 5, 'kas', 0, 0, 0, 0, ''),
(25, 12, 5, 'kas', 0, 0, 0, 0, ''),
(26, 13, 5, 'kas', 50000, 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_jabatan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_lengkap`, `username`, `password`, `id_jabatan`) VALUES
(1, 'Amanda Puspa Negara', 'amandapn', '$2y$10$ORy5D/FjQucHQTbTpcqSNOrMEzT8VDUtjn0bsyHYUa/o8jrVEgG7q', 1),
(2, 'Dhea Dwi Adelia', 'dhea', '$2y$10$mlpX9.PuD9MvgeSlFFjmwul29ZPWDp83y8lf1cKD3lp4uZO.37iWK', 2);

-- --------------------------------------------------------

--
-- Table structure for table `warga`
--

CREATE TABLE `warga` (
  `id_warga` int(11) NOT NULL,
  `nik` int(100) NOT NULL,
  `nama_warga` varchar(100) NOT NULL,
  `jenis_kelamin` enum('pria','wanita') NOT NULL,
  `no_telepon` varchar(25) NOT NULL,
  `email` varchar(255) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `warga`
--

INSERT INTO `warga` (`id_warga`, `nik`, `nama_warga`, `jenis_kelamin`, `no_telepon`, `email`, `alamat`, `status`) VALUES
(1, 0, 'Andri Firman Saputra', 'pria', '087808675313', 'andri.firman.saputra.56@gmail.com', '', ''),
(2, 0, 'Abdul Jabbar', 'pria', '085753152511', 'abdjbbr2@gmail.com', '', ''),
(3, 0, 'Annisa Azzahra', 'wanita', '089612351520', 'annisazahra12@gmail.com', '', ''),
(4, 0, 'Dewa Guska', 'pria', '085712526395', 'dewaweb12@gmail.com', '', ''),
(5, 0, 'Sandi Priyadi', 'pria', '083815432987', 'sandipriyadi107@gmail.com', '', ''),
(12, 312210126, 'Dhea Dwi Adelia', 'wanita', '08254325689', 'geano2399@gmail.com', 'Karawang', 'aktif'),
(13, 312210129, 'Amanda Puspa Negara', 'wanita', '085773335691', 'am.puspa17@gmail.com', 'Cikarang', 'aktif');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bulan_pembayaran`
--
ALTER TABLE `bulan_pembayaran`
  ADD PRIMARY KEY (`id_bulan_pembayaran`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indexes for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD PRIMARY KEY (`id_pengeluaran`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `riwayat`
--
ALTER TABLE `riwayat`
  ADD PRIMARY KEY (`id_riwayat`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_uang_kas` (`id_uang_kas`);

--
-- Indexes for table `riwayat_pengeluaran`
--
ALTER TABLE `riwayat_pengeluaran`
  ADD PRIMARY KEY (`id_riwayat_pengeluaran`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `uang_kas`
--
ALTER TABLE `uang_kas`
  ADD PRIMARY KEY (`id_uang_kas`),
  ADD KEY `id_siswa` (`id_warga`),
  ADD KEY `id_bulan_pembayaran` (`id_bulan_pembayaran`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_jabatan` (`id_jabatan`);

--
-- Indexes for table `warga`
--
ALTER TABLE `warga`
  ADD PRIMARY KEY (`id_warga`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bulan_pembayaran`
--
ALTER TABLE `bulan_pembayaran`
  MODIFY `id_bulan_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id_jabatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  MODIFY `id_pengeluaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `riwayat`
--
ALTER TABLE `riwayat`
  MODIFY `id_riwayat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `riwayat_pengeluaran`
--
ALTER TABLE `riwayat_pengeluaran`
  MODIFY `id_riwayat_pengeluaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `uang_kas`
--
ALTER TABLE `uang_kas`
  MODIFY `id_uang_kas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `warga`
--
ALTER TABLE `warga`
  MODIFY `id_warga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
