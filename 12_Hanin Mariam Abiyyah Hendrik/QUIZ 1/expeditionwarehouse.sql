-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 25, 2025 at 03:14 AM
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
-- Database: `expeditionwarehouse`
--

-- --------------------------------------------------------

--
-- Table structure for table `dimkurir`
--

CREATE TABLE `dimkurir` (
  `KurirID` int NOT NULL,
  `Nama` varchar(100) DEFAULT NULL,
  `TipeKendaraan` varchar(50) DEFAULT NULL,
  `NoHP` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dimkurir`
--

INSERT INTO `dimkurir` (`KurirID`, `Nama`, `TipeKendaraan`, `NoHP`) VALUES
(201, 'Nayeon', 'Motorcycle', '81234567890'),
(202, 'Jeongyeon', 'Car', '81987654321'),
(203, 'Momo', 'Truck', '81123456789');

-- --------------------------------------------------------

--
-- Table structure for table `dimpembayaran`
--

CREATE TABLE `dimpembayaran` (
  `PembayaranID` int NOT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `StatusPembayaranID` int DEFAULT NULL,
  `TipePembayaranID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dimstatuspengiriman`
--

CREATE TABLE `dimstatuspengiriman` (
  `StatusPengirimanID` int NOT NULL,
  `Nama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `factpengiriman`
--

CREATE TABLE `factpengiriman` (
  `PengirimanID` int NOT NULL,
  `NamaPelanggan` varchar(100) NOT NULL,
  `AlamatAsal` varchar(200) DEFAULT NULL,
  `AlamatTujuan` varchar(200) DEFAULT NULL,
  `KecamatanAsalID` int DEFAULT NULL,
  `KecamatanTujuanID` int DEFAULT NULL,
  `Berat` decimal(10,2) DEFAULT NULL,
  `TanggalPengiriman` date DEFAULT NULL,
  `TanggalSampaiPerkiraan` date DEFAULT NULL,
  `TanggalSampaiAktual` date DEFAULT NULL,
  `KurirID` int DEFAULT NULL,
  `StatusPengirimanID` int DEFAULT NULL,
  `PembayaranID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kecamatan`
--

CREATE TABLE `kecamatan` (
  `ID` int NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `KotaID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kota`
--

CREATE TABLE `kota` (
  `ID` int NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `ProvinsiID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kurir`
--

CREATE TABLE `kurir` (
  `ID` int NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `TipeKendaraan` varchar(50) DEFAULT NULL,
  `NoHP` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provinsi`
--

CREATE TABLE `provinsi` (
  `ID` int NOT NULL,
  `Nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `statuspembayaran`
--

CREATE TABLE `statuspembayaran` (
  `ID` int NOT NULL,
  `Nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `statuspengiriman`
--

CREATE TABLE `statuspengiriman` (
  `ID` int NOT NULL,
  `Nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tipepembayaran`
--

CREATE TABLE `tipepembayaran` (
  `ID` int NOT NULL,
  `Nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dimkurir`
--
ALTER TABLE `dimkurir`
  ADD PRIMARY KEY (`KurirID`);

--
-- Indexes for table `dimpembayaran`
--
ALTER TABLE `dimpembayaran`
  ADD PRIMARY KEY (`PembayaranID`),
  ADD KEY `StatusPembayaranID` (`StatusPembayaranID`),
  ADD KEY `TipePembayaranID` (`TipePembayaranID`);

--
-- Indexes for table `dimstatuspengiriman`
--
ALTER TABLE `dimstatuspengiriman`
  ADD PRIMARY KEY (`StatusPengirimanID`);

--
-- Indexes for table `factpengiriman`
--
ALTER TABLE `factpengiriman`
  ADD PRIMARY KEY (`PengirimanID`),
  ADD KEY `KecamatanAsalID` (`KecamatanAsalID`),
  ADD KEY `KecamatanTujuanID` (`KecamatanTujuanID`),
  ADD KEY `KurirID` (`KurirID`),
  ADD KEY `StatusPengirimanID` (`StatusPengirimanID`),
  ADD KEY `PembayaranID` (`PembayaranID`);

--
-- Indexes for table `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `KotaID` (`KotaID`);

--
-- Indexes for table `kota`
--
ALTER TABLE `kota`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ProvinsiID` (`ProvinsiID`);

--
-- Indexes for table `kurir`
--
ALTER TABLE `kurir`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `provinsi`
--
ALTER TABLE `provinsi`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `statuspembayaran`
--
ALTER TABLE `statuspembayaran`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `statuspengiriman`
--
ALTER TABLE `statuspengiriman`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tipepembayaran`
--
ALTER TABLE `tipepembayaran`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dimkurir`
--
ALTER TABLE `dimkurir`
  MODIFY `KurirID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `dimpembayaran`
--
ALTER TABLE `dimpembayaran`
  MODIFY `PembayaranID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dimstatuspengiriman`
--
ALTER TABLE `dimstatuspengiriman`
  MODIFY `StatusPengirimanID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `factpengiriman`
--
ALTER TABLE `factpengiriman`
  MODIFY `PengirimanID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kecamatan`
--
ALTER TABLE `kecamatan`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kota`
--
ALTER TABLE `kota`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kurir`
--
ALTER TABLE `kurir`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `provinsi`
--
ALTER TABLE `provinsi`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `statuspembayaran`
--
ALTER TABLE `statuspembayaran`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `statuspengiriman`
--
ALTER TABLE `statuspengiriman`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipepembayaran`
--
ALTER TABLE `tipepembayaran`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dimpembayaran`
--
ALTER TABLE `dimpembayaran`
  ADD CONSTRAINT `dimpembayaran_ibfk_1` FOREIGN KEY (`StatusPembayaranID`) REFERENCES `statuspembayaran` (`ID`),
  ADD CONSTRAINT `dimpembayaran_ibfk_2` FOREIGN KEY (`TipePembayaranID`) REFERENCES `tipepembayaran` (`ID`);

--
-- Constraints for table `factpengiriman`
--
ALTER TABLE `factpengiriman`
  ADD CONSTRAINT `factpengiriman_ibfk_1` FOREIGN KEY (`KecamatanAsalID`) REFERENCES `kecamatan` (`ID`),
  ADD CONSTRAINT `factpengiriman_ibfk_2` FOREIGN KEY (`KecamatanTujuanID`) REFERENCES `kecamatan` (`ID`),
  ADD CONSTRAINT `factpengiriman_ibfk_3` FOREIGN KEY (`KurirID`) REFERENCES `kurir` (`ID`),
  ADD CONSTRAINT `factpengiriman_ibfk_4` FOREIGN KEY (`StatusPengirimanID`) REFERENCES `statuspengiriman` (`ID`),
  ADD CONSTRAINT `factpengiriman_ibfk_5` FOREIGN KEY (`PembayaranID`) REFERENCES `dimpembayaran` (`PembayaranID`);

--
-- Constraints for table `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD CONSTRAINT `kecamatan_ibfk_1` FOREIGN KEY (`KotaID`) REFERENCES `kota` (`ID`);

--
-- Constraints for table `kota`
--
ALTER TABLE `kota`
  ADD CONSTRAINT `kota_ibfk_1` FOREIGN KEY (`ProvinsiID`) REFERENCES `provinsi` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
