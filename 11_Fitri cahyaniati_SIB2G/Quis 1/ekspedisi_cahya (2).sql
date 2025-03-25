-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 24, 2025 at 02:00 PM
-- Server version: 8.0.30
-- PHP Version: 8.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ekspedisi_cahya`
--

-- --------------------------------------------------------

--
-- Table structure for table `dim_kurir`
--

CREATE TABLE `dim_kurir` (
  `ID_Kurir` int NOT NULL,
  `Nama` varchar(255) DEFAULT NULL,
  `NoHP` varchar(20) DEFAULT NULL,
  `TipeKendaraan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dim_kurir`
--

INSERT INTO `dim_kurir` (`ID_Kurir`, `Nama`, `NoHP`, `TipeKendaraan`) VALUES
(1, 'Kurir A', '081234567890', 'Motor'),
(2, 'Kurir B', '082345678901', 'Mobil'),
(3, 'Kurir C', '083456789012', 'Sepeda'),
(4, 'Kurir D', '084567890123', 'Motor'),
(5, 'Kurir E', '085678901234', 'Mobil');

-- --------------------------------------------------------

--
-- Table structure for table `dim_lokasi`
--

CREATE TABLE `dim_lokasi` (
  `ID_Lokasi` int NOT NULL,
  `Provinsi` varchar(255) DEFAULT NULL,
  `Kota` varchar(255) DEFAULT NULL,
  `Kecamatan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dim_lokasi`
--

INSERT INTO `dim_lokasi` (`ID_Lokasi`, `Provinsi`, `Kota`, `Kecamatan`) VALUES
(1, 'Jawa Barat', 'Bandung', 'Cicendo'),
(2, 'Jawa Barat', 'Bekasi', 'Pondok Gede'),
(3, 'DKI Jakarta', 'Jakarta Timur', 'Cakung'),
(4, 'Jawa Tengah', 'Semarang', 'Candisari'),
(5, 'Jawa Timur', 'Surabaya', 'Tegalsari');

-- --------------------------------------------------------

--
-- Table structure for table `dim_pembayaran`
--

CREATE TABLE `dim_pembayaran` (
  `ID_Pembayaran` int NOT NULL,
  `StatusPembayaran` varchar(50) DEFAULT NULL,
  `TipePembayaran` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dim_pembayaran`
--

INSERT INTO `dim_pembayaran` (`ID_Pembayaran`, `StatusPembayaran`, `TipePembayaran`) VALUES
(1, 'Lunas', 'Transfer Bank'),
(2, 'Belum Lunas', 'COD'),
(3, 'Lunas', 'Kartu Kredit'),
(4, 'Lunas', 'Dompet Digital'),
(5, 'Belum Lunas', 'Tunai');

-- --------------------------------------------------------

--
-- Table structure for table `dim_statuspengiriman`
--

CREATE TABLE `dim_statuspengiriman` (
  `ID_StatusPengiriman` int NOT NULL,
  `StatusPengiriman` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dim_statuspengiriman`
--

INSERT INTO `dim_statuspengiriman` (`ID_StatusPengiriman`, `StatusPengiriman`) VALUES
(1, 'Dalam Proses'),
(2, 'Terkirim'),
(3, 'Gagal Kirim'),
(4, 'Dikembalikan'),
(5, 'Dibatalkan');

-- --------------------------------------------------------

--
-- Table structure for table `dim_waktu`
--

CREATE TABLE `dim_waktu` (
  `ID_Waktu` int NOT NULL,
  `Tanggal` date DEFAULT NULL,
  `Tahun` int DEFAULT NULL,
  `Bulan` int DEFAULT NULL,
  `Hari` int DEFAULT NULL,
  `lookup_ID_Waktu` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dim_waktu`
--

INSERT INTO `dim_waktu` (`ID_Waktu`, `Tanggal`, `Tahun`, `Bulan`, `Hari`, `lookup_ID_Waktu`) VALUES
(1, '2023-01-01', 2023, 1, 1, NULL),
(2, '2023-02-15', 2023, 2, 15, NULL),
(3, '2023-03-20', 2023, 3, 20, NULL),
(4, '2023-04-10', 2023, 4, 10, NULL),
(5, '2023-05-05', 2023, 5, 5, NULL),
(6, '2023-01-01', 2023, 1, 1, 1),
(7, '2023-02-15', 2023, 2, 15, 2),
(8, '2023-03-20', 2023, 3, 20, 3),
(9, '2023-04-10', 2023, 4, 10, 4),
(10, '2023-05-05', 2023, 5, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `fact_pengiriman`
--

CREATE TABLE `fact_pengiriman` (
  `ID_Pengiriman` int NOT NULL,
  `ID_WaktuPengiriman` int DEFAULT NULL,
  `ID_WaktuEstimasi` int DEFAULT NULL,
  `ID_WaktuAktual` int DEFAULT NULL,
  `ID_LokasiAsal` int DEFAULT NULL,
  `ID_LokasiTujuan` int DEFAULT NULL,
  `ID_Kurir` int DEFAULT NULL,
  `ID_Pembayaran` int DEFAULT NULL,
  `ID_StatusPengiriman` int DEFAULT NULL,
  `Berat` decimal(10,2) DEFAULT NULL,
  `Biaya` decimal(15,2) DEFAULT NULL,
  `WaktuKeterlambatan` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `fact_pengiriman`
--

INSERT INTO `fact_pengiriman` (`ID_Pengiriman`, `ID_WaktuPengiriman`, `ID_WaktuEstimasi`, `ID_WaktuAktual`, `ID_LokasiAsal`, `ID_LokasiTujuan`, `ID_Kurir`, `ID_Pembayaran`, `ID_StatusPengiriman`, `Berat`, `Biaya`, `WaktuKeterlambatan`) VALUES
(1, 1, 2, 3, 1, 2, 1, 1, 2, '2.50', '50000.00', 0),
(2, 2, 3, 4, 2, 3, 2, 2, 1, '3.00', '75000.00', 1),
(3, 3, 4, 5, 3, 4, 3, 3, 4, '1.50', '30000.00', 0),
(4, 4, 5, 1, 4, 5, 4, 4, 3, '4.00', '100000.00', 2),
(5, 5, 1, 2, 5, 1, 5, 5, 5, '5.00', '150000.00', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dim_kurir`
--
ALTER TABLE `dim_kurir`
  ADD PRIMARY KEY (`ID_Kurir`);

--
-- Indexes for table `dim_lokasi`
--
ALTER TABLE `dim_lokasi`
  ADD PRIMARY KEY (`ID_Lokasi`);

--
-- Indexes for table `dim_pembayaran`
--
ALTER TABLE `dim_pembayaran`
  ADD PRIMARY KEY (`ID_Pembayaran`);

--
-- Indexes for table `dim_statuspengiriman`
--
ALTER TABLE `dim_statuspengiriman`
  ADD PRIMARY KEY (`ID_StatusPengiriman`);

--
-- Indexes for table `dim_waktu`
--
ALTER TABLE `dim_waktu`
  ADD PRIMARY KEY (`ID_Waktu`);

--
-- Indexes for table `fact_pengiriman`
--
ALTER TABLE `fact_pengiriman`
  ADD PRIMARY KEY (`ID_Pengiriman`),
  ADD KEY `ID_WaktuPengiriman` (`ID_WaktuPengiriman`),
  ADD KEY `ID_WaktuEstimasi` (`ID_WaktuEstimasi`),
  ADD KEY `ID_WaktuAktual` (`ID_WaktuAktual`),
  ADD KEY `ID_LokasiAsal` (`ID_LokasiAsal`),
  ADD KEY `ID_LokasiTujuan` (`ID_LokasiTujuan`),
  ADD KEY `ID_Kurir` (`ID_Kurir`),
  ADD KEY `ID_Pembayaran` (`ID_Pembayaran`),
  ADD KEY `ID_StatusPengiriman` (`ID_StatusPengiriman`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dim_kurir`
--
ALTER TABLE `dim_kurir`
  MODIFY `ID_Kurir` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dim_lokasi`
--
ALTER TABLE `dim_lokasi`
  MODIFY `ID_Lokasi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dim_pembayaran`
--
ALTER TABLE `dim_pembayaran`
  MODIFY `ID_Pembayaran` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dim_statuspengiriman`
--
ALTER TABLE `dim_statuspengiriman`
  MODIFY `ID_StatusPengiriman` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dim_waktu`
--
ALTER TABLE `dim_waktu`
  MODIFY `ID_Waktu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `fact_pengiriman`
--
ALTER TABLE `fact_pengiriman`
  MODIFY `ID_Pengiriman` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fact_pengiriman`
--
ALTER TABLE `fact_pengiriman`
  ADD CONSTRAINT `fact_pengiriman_ibfk_1` FOREIGN KEY (`ID_WaktuPengiriman`) REFERENCES `dim_waktu` (`ID_Waktu`),
  ADD CONSTRAINT `fact_pengiriman_ibfk_2` FOREIGN KEY (`ID_WaktuEstimasi`) REFERENCES `dim_waktu` (`ID_Waktu`),
  ADD CONSTRAINT `fact_pengiriman_ibfk_3` FOREIGN KEY (`ID_WaktuAktual`) REFERENCES `dim_waktu` (`ID_Waktu`),
  ADD CONSTRAINT `fact_pengiriman_ibfk_4` FOREIGN KEY (`ID_LokasiAsal`) REFERENCES `dim_lokasi` (`ID_Lokasi`),
  ADD CONSTRAINT `fact_pengiriman_ibfk_5` FOREIGN KEY (`ID_LokasiTujuan`) REFERENCES `dim_lokasi` (`ID_Lokasi`),
  ADD CONSTRAINT `fact_pengiriman_ibfk_6` FOREIGN KEY (`ID_Kurir`) REFERENCES `dim_kurir` (`ID_Kurir`),
  ADD CONSTRAINT `fact_pengiriman_ibfk_7` FOREIGN KEY (`ID_Pembayaran`) REFERENCES `dim_pembayaran` (`ID_Pembayaran`),
  ADD CONSTRAINT `fact_pengiriman_ibfk_8` FOREIGN KEY (`ID_StatusPengiriman`) REFERENCES `dim_statuspengiriman` (`ID_StatusPengiriman`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
