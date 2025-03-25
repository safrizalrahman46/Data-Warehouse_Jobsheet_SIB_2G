-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 24, 2025 at 11:29 PM
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
-- Database: `ekspedisi_dw`
--

-- --------------------------------------------------------

--
-- Table structure for table `dimkurir`
--

CREATE TABLE `dimkurir` (
  `ID_Kurir` int NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `TipeKendaraan` varchar(50) NOT NULL,
  `NoHP` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dimlokasi`
--

CREATE TABLE `dimlokasi` (
  `ID_Lokasi` int NOT NULL,
  `NamaKecamatan` varchar(100) NOT NULL,
  `NamaKota` varchar(100) NOT NULL,
  `NamaProvinsi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dimpembayaran`
--

CREATE TABLE `dimpembayaran` (
  `ID_Pembayaran` int NOT NULL,
  `Total` decimal(10,2) NOT NULL,
  `JenisPembayaran` varchar(100) NOT NULL,
  `StatusPembayaran` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dimstatuspengiriman`
--

CREATE TABLE `dimstatuspengiriman` (
  `ID_StatusPengiriman` int NOT NULL,
  `Nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dimwaktu`
--

CREATE TABLE `dimwaktu` (
  `ID_Waktu` int NOT NULL,
  `Tanggal` date NOT NULL,
  `Bulan` int NOT NULL,
  `Tahun` int NOT NULL,
  `HariDalamMinggu` varchar(10) NOT NULL,
  `Kuartal` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `factpengiriman`
--

CREATE TABLE `factpengiriman` (
  `ID_Pengiriman` int NOT NULL,
  `ID_WaktuPengiriman` int NOT NULL,
  `ID_WaktuSampaiAktual` int NOT NULL,
  `ID_Kurir` int NOT NULL,
  `ID_StatusPengiriman` int NOT NULL,
  `ID_LokasiAsal` int NOT NULL,
  `ID_LokasiTujuan` int NOT NULL,
  `Berat` decimal(10,2) NOT NULL,
  `ID_Pembayaran` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dimkurir`
--
ALTER TABLE `dimkurir`
  ADD PRIMARY KEY (`ID_Kurir`);

--
-- Indexes for table `dimlokasi`
--
ALTER TABLE `dimlokasi`
  ADD PRIMARY KEY (`ID_Lokasi`);

--
-- Indexes for table `dimpembayaran`
--
ALTER TABLE `dimpembayaran`
  ADD PRIMARY KEY (`ID_Pembayaran`);

--
-- Indexes for table `dimstatuspengiriman`
--
ALTER TABLE `dimstatuspengiriman`
  ADD PRIMARY KEY (`ID_StatusPengiriman`);

--
-- Indexes for table `dimwaktu`
--
ALTER TABLE `dimwaktu`
  ADD PRIMARY KEY (`ID_Waktu`);

--
-- Indexes for table `factpengiriman`
--
ALTER TABLE `factpengiriman`
  ADD PRIMARY KEY (`ID_Pengiriman`),
  ADD KEY `ID_WaktuPengiriman` (`ID_WaktuPengiriman`),
  ADD KEY `ID_WaktuSampaiAktual` (`ID_WaktuSampaiAktual`),
  ADD KEY `ID_Kurir` (`ID_Kurir`),
  ADD KEY `ID_StatusPengiriman` (`ID_StatusPengiriman`),
  ADD KEY `ID_LokasiAsal` (`ID_LokasiAsal`),
  ADD KEY `ID_LokasiTujuan` (`ID_LokasiTujuan`),
  ADD KEY `ID_Pembayaran` (`ID_Pembayaran`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dimkurir`
--
ALTER TABLE `dimkurir`
  MODIFY `ID_Kurir` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dimlokasi`
--
ALTER TABLE `dimlokasi`
  MODIFY `ID_Lokasi` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dimpembayaran`
--
ALTER TABLE `dimpembayaran`
  MODIFY `ID_Pembayaran` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dimstatuspengiriman`
--
ALTER TABLE `dimstatuspengiriman`
  MODIFY `ID_StatusPengiriman` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dimwaktu`
--
ALTER TABLE `dimwaktu`
  MODIFY `ID_Waktu` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `factpengiriman`
--
ALTER TABLE `factpengiriman`
  MODIFY `ID_Pengiriman` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `factpengiriman`
--
ALTER TABLE `factpengiriman`
  ADD CONSTRAINT `factpengiriman_ibfk_1` FOREIGN KEY (`ID_WaktuPengiriman`) REFERENCES `dimwaktu` (`ID_Waktu`),
  ADD CONSTRAINT `factpengiriman_ibfk_2` FOREIGN KEY (`ID_WaktuSampaiAktual`) REFERENCES `dimwaktu` (`ID_Waktu`),
  ADD CONSTRAINT `factpengiriman_ibfk_3` FOREIGN KEY (`ID_Kurir`) REFERENCES `dimkurir` (`ID_Kurir`),
  ADD CONSTRAINT `factpengiriman_ibfk_4` FOREIGN KEY (`ID_StatusPengiriman`) REFERENCES `dimstatuspengiriman` (`ID_StatusPengiriman`),
  ADD CONSTRAINT `factpengiriman_ibfk_5` FOREIGN KEY (`ID_LokasiAsal`) REFERENCES `dimlokasi` (`ID_Lokasi`),
  ADD CONSTRAINT `factpengiriman_ibfk_6` FOREIGN KEY (`ID_LokasiTujuan`) REFERENCES `dimlokasi` (`ID_Lokasi`),
  ADD CONSTRAINT `factpengiriman_ibfk_7` FOREIGN KEY (`ID_Pembayaran`) REFERENCES `dimpembayaran` (`ID_Pembayaran`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
