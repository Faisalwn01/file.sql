-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jul 14, 2024 at 02:45 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `usaha`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `email`, `phone_number`) VALUES
(1, 'admin1', 'password1', 'admin1@example.com', '123-456-7890'),
(2, 'admin2', 'password2', 'admin2@example.com', '234-567-8901'),
(3, 'admin3', 'password3', 'admin3@example.com', '345-678-9012'),
(4, 'admin4', 'password4', 'admin4@example.com', '456-789-0123');

-- --------------------------------------------------------

--
-- Table structure for table `laporan_usaha`
--

CREATE TABLE `laporan_usaha` (
  `id_rangkuman` int(11) NOT NULL,
  `Pengeluaran` int(11) DEFAULT NULL,
  `Pemasukan` int(11) DEFAULT NULL,
  `total_utang` decimal(10,2) DEFAULT NULL,
  `total_piutang` decimal(10,2) DEFAULT NULL,
  `total_lunas` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laporan_usaha`
--

INSERT INTO `laporan_usaha` (`id_rangkuman`, `Pengeluaran`, `Pemasukan`, `total_utang`, `total_piutang`, `total_lunas`) VALUES
(1, 2000, 3000, 5000.00, 7000.00, 1000.00),
(2, 3000, 4000, 4000.00, 6000.00, 2000.00),
(3, 2500, 3500, 3000.00, 8000.00, 1500.00),
(4, 4500, 5000, 7000.00, 9000.00, 2500.00),
(5, 1000, 2000, 2000.00, 11000.00, 500.00),
(6, 5000, 6000, 8000.00, 12000.00, 3000.00);

-- --------------------------------------------------------

--
-- Table structure for table `piutang`
--

CREATE TABLE `piutang` (
  `id_piutang` int(11) NOT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `jumlah` decimal(10,2) DEFAULT NULL,
  `tanggal_keluar` date DEFAULT NULL,
  `jatuh_tempo` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `piutang`
--

INSERT INTO `piutang` (`id_piutang`, `id_admin`, `jumlah`, `tanggal_keluar`, `jatuh_tempo`) VALUES
(1, 1, 5000.00, '2024-01-01', '2024-06-01'),
(2, 2, 7000.00, '2024-02-01', '2024-07-01'),
(3, 3, 8000.00, '2024-03-01', '2024-08-01'),
(4, 4, 6000.00, '2024-04-01', '2024-09-01'),
(5, 1, 9000.00, '2024-05-01', '2024-10-01'),
(6, 2, 11000.00, '2024-06-01', '2024-11-01');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_utang` int(11) DEFAULT NULL,
  `id_piutang` int(11) DEFAULT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `jumlah` decimal(10,2) DEFAULT NULL,
  `id_rangkuman` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_utang`, `id_piutang`, `id_admin`, `jumlah`, `id_rangkuman`, `tanggal`, `status`) VALUES
(1, 1, 1, 1, 2000.00, 1, '2024-01-15', 'pending'),
(2, 2, 2, 2, 3000.00, 2, '2024-02-15', 'completed'),
(3, 3, 3, 3, 2500.00, 3, '2024-03-20', 'pending'),
(4, 4, 4, 4, 4000.00, 4, '2024-04-25', 'completed'),
(5, 5, 5, 1, 1500.00, 5, '2024-05-30', 'pending'),
(6, 6, 6, 2, 3500.00, 6, '2024-06-05', 'completed'),
(7, 1, 3, 1, 1000.00, 1, '2024-01-20', 'pending'),
(8, 2, 4, 2, 2000.00, 2, '2024-02-25', 'completed'),
(9, 3, 5, 3, 3000.00, 3, '2024-03-30', 'pending'),
(10, 4, 6, 4, 4000.00, 4, '2024-04-10', 'completed'),
(11, 5, 1, 1, 2500.00, 5, '2024-05-15', 'pending'),
(12, 6, 2, 2, 3500.00, 6, '2024-06-20', 'completed');

-- --------------------------------------------------------

--
-- Table structure for table `utang`
--

CREATE TABLE `utang` (
  `id_utang` int(11) NOT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `jumlah` decimal(10,2) DEFAULT NULL,
  `tanggal_keluar` date DEFAULT NULL,
  `jatuh_tempo` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `utang`
--

INSERT INTO `utang` (`id_utang`, `id_admin`, `jumlah`, `tanggal_keluar`, `jatuh_tempo`) VALUES
(1, 1, 3000.00, '2024-01-10', '2024-06-10'),
(2, 2, 4000.00, '2024-02-10', '2024-07-10'),
(3, 3, 5000.00, '2024-03-10', '2024-08-10'),
(4, 4, 6000.00, '2024-04-10', '2024-09-10'),
(5, 1, 7000.00, '2024-05-10', '2024-10-10'),
(6, 2, 8000.00, '2024-06-10', '2024-11-10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `laporan_usaha`
--
ALTER TABLE `laporan_usaha`
  ADD PRIMARY KEY (`id_rangkuman`);

--
-- Indexes for table `piutang`
--
ALTER TABLE `piutang`
  ADD PRIMARY KEY (`id_piutang`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_utang` (`id_utang`),
  ADD KEY `id_piutang` (`id_piutang`),
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `id_rangkuman` (`id_rangkuman`);

--
-- Indexes for table `utang`
--
ALTER TABLE `utang`
  ADD PRIMARY KEY (`id_utang`),
  ADD KEY `id_admin` (`id_admin`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `laporan_usaha`
--
ALTER TABLE `laporan_usaha`
  MODIFY `id_rangkuman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `piutang`
--
ALTER TABLE `piutang`
  MODIFY `id_piutang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `utang`
--
ALTER TABLE `utang`
  MODIFY `id_utang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `piutang`
--
ALTER TABLE `piutang`
  ADD CONSTRAINT `piutang_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_utang`) REFERENCES `utang` (`id_utang`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_piutang`) REFERENCES `piutang` (`id_piutang`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`),
  ADD CONSTRAINT `transaksi_ibfk_4` FOREIGN KEY (`id_rangkuman`) REFERENCES `laporan_usaha` (`id_rangkuman`);

--
-- Constraints for table `utang`
--
ALTER TABLE `utang`
  ADD CONSTRAINT `utang_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
