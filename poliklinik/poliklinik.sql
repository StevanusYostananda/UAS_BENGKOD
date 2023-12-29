-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2023 at 04:41 PM
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
-- Database: `poliklinik`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_periksa`
--

CREATE TABLE `detail_periksa` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_periksa` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_hp` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id`, `nama`, `alamat`, `no_hp`) VALUES
(2, 'ahnaf', 'depok', '0987654321'),
(3, 'gilang', 'ambarawa', '081234575');

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama_obat` varbinary(50) NOT NULL,
  `kemasan` varchar(35) NOT NULL,
  `harga` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id`, `nama_obat`, `kemasan`, `harga`) VALUES
(2, 0x41435420284172746573756e617465207461626c6574203530206d67202b20416d6f6469617175696e6520616e6879647269, '2 blister @ 12 tablet / kotak', 44000),
(3, 0x41435420284172746573756e617465207461626c6574203530206d67202b20416d6f6469617175696e6520616e6879647269, '3 blister @ 8 tablet / kotak', 44000),
(4, 0x416c62656e6461736f6c2073757370656e736920323030206d672f35206d6c, 'Ktk 10 btl @ 10 ml', 6000),
(5, 0x416c62656e64617a6f6c207461626c65742f207461626c6574206b756e79616820343030206d67, 'ktk 5 x 6 tablet', 16000),
(6, 0x416c6f707572696e6f6c207461626c657420313030206d67, 'ktk 10 x 10 tablet', 16000),
(7, 0x416c6f707572696e6f6c207461626c657420333030206d67, 'ktk 10 x 10 tablet', 33000),
(8, 0x416c7072617a6f6c616d207461626c657420302c3235206d67, 'ktk 10 x 10 tablet', 64000),
(9, 0x416c7072617a6f6c616d207461626c657420302c35206d67, 'ktk 10 x 10 tablet', 77000),
(10, 0x416c7072617a6f6c616d207461626c65742031206d67, 'ktk 10 x 10 tablet', 118000),
(11, 0x416d62726f786f6c207369727570203135206d672f6d6c, 'btl 60 ml', 5000),
(12, 0x416d62726f786f6c207369727570203330206d67, 'ktk 10 x 10 tablet', 21000),
(13, 0x416d696c6f72696461207461626c65742035206d67, 'ktk 10 x 10 tablet', 12000),
(14, 0x416d696e6f66696c696e20696e6a656b7369203234206d672f6d6c, 'ktk 30 ampul @ 10 ml', 118000),
(15, 0x416d696e6f66696c696e207461626c657420313530, 'botol 1000 tablet', 57000),
(16, 0x416d696e6f66696c696e207461626c657420323030, 'botol 100 tablet', 15000),
(17, 0x416d697472697074696c696e207461626c65742073616c7574203235206d67202848434929, 'ktk 10 x 10 tablet salut', 16000),
(18, 0x416d6c6f646970696e207461626c65742035206d67, 'ktk 3 x 10 tablet', 9000),
(19, 0x416d6c6f646970696e207461626c65742035206d67, 'ktk 5 x 10 tablet', 63000),
(20, 0x416d6c6f646970696e207461626c6574203130206d67, 'ktk 3 x 10 tablet', 8750),
(21, 0x416d6c6f646970696e207461626c6574203130206d67, 'ktk 5 x 10 tablet', 111000),
(22, 0x416d6f6b736973696c696e202b41732e4b6c6176756c616e617420363235206d67207461626c6574, 'ktk 5 x 6 tablet', 209000),
(23, 0x416d6f6b736973696c696e206b617073756c20323530206d67, 'ktk 10 x 10 kapsul', 38000),
(24, 0x416d6f6b736973696c696e206b617073756c20323530206d67, 'ktk 12 x 10 kapsul', 52000),
(25, 0x416d6f6b736973696c696e204b61706c657420353030206d67, 'ktk 10 x 10 kapsul', 45000),
(26, 0x416d6f6b736973696c696e2073657262756b20696e6a656b73692031303030206d67, 'ktk 10 vial', 99000),
(27, 0x416d6f6b736973696c696e207369727570206b6572696e6720313235206d672f2035206d6c, 'btl 60 ml', 5000),
(28, 0x416d706973696c696e206b61706c657420323530206d67, 'ktk 10 x 10 kaplet', 36000),
(29, 0x416d706973696c696e206b61706c657420353030206d67, 'ktk 10 x 10 kaplet', 62400),
(30, 0x416d706973696c696e2073657262756b20696e6a656b736920692e6d2f6c2e762031303030206d672f7669616c, 'ktk 10 vial', 105600),
(31, 0x416d706973696c696e2073657262756b20696e6a656b736920692e6d2f6c2e7620353030206d672f7669616c, 'ktk 10 vial', 40000);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_hp` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id`, `nama`, `alamat`, `no_hp`) VALUES
(3, 'sindu', 'semarang', '08356392874'),
(5, 'david', 'blora', '03938466474');

-- --------------------------------------------------------

--
-- Table structure for table `periksa`
--

CREATE TABLE `periksa` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_pasien` int(11) UNSIGNED NOT NULL,
  `id_dokter` int(11) UNSIGNED NOT NULL,
  `tgl_periksa` datetime NOT NULL,
  `catatan` text NOT NULL,
  `biaya_periksa` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `periksa`
--

INSERT INTO `periksa` (`id`, `id_pasien`, `id_dokter`, `tgl_periksa`, `catatan`, `biaya_periksa`) VALUES
(6, 5, 2, '2023-12-28 01:00:00', 'kurus', 150000),
(7, 3, 2, '2023-12-28 01:17:00', 'kurus', 150000),
(8, 3, 2, '2023-12-29 22:31:00', 'pusing', 150000);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(5, 'david', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
(6, 'udin', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
(7, 'gilang', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
(8, 'stevanus', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
(9, 'tika', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `periksa`
--
ALTER TABLE `periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_dokter` (`id_dokter`),
  ADD KEY `id_pasien` (`id_pasien`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `periksa`
--
ALTER TABLE `periksa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `periksa`
--
ALTER TABLE `periksa`
  ADD CONSTRAINT `periksa_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id`),
  ADD CONSTRAINT `periksa_ibfk_2` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
