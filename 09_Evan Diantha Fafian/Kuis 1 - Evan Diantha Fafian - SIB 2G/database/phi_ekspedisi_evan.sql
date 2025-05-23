-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 23, 2025 at 02:05 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phi_ekspedisi_evan`
--

-- --------------------------------------------------------

--
-- Table structure for table `ms_kecamatan`
--

CREATE TABLE `ms_kecamatan` (
  `ID` int NOT NULL,
  `Nama` varchar(255) DEFAULT NULL,
  `KotaID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ms_kecamatan`
--

INSERT INTO `ms_kecamatan` (`ID`, `Nama`, `KotaID`) VALUES
(1, 'Coblong', 1),
(2, 'Sukajadi', 1),
(3, 'Harjamukti', 2),
(4, 'Kejaksan', 2),
(5, 'Semarang Tengah', 3),
(6, 'Banjarsari', 4),
(7, 'Jebres', 4),
(8, 'Gubeng', 5),
(9, 'Klojen', 6);

-- --------------------------------------------------------

--
-- Table structure for table `ms_kota`
--

CREATE TABLE `ms_kota` (
  `ID` int NOT NULL,
  `Nama` varchar(255) DEFAULT NULL,
  `ProvinsiID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ms_kota`
--

INSERT INTO `ms_kota` (`ID`, `Nama`, `ProvinsiID`) VALUES
(1, 'Bandung', 1),
(2, 'Cirebon', 1),
(3, 'Semarang', 2),
(4, 'Surakarta', 2),
(5, 'Surabaya', 3),
(6, 'Malang', 3);

-- --------------------------------------------------------

--
-- Table structure for table `ms_kurir`
--

CREATE TABLE `ms_kurir` (
  `ID` int NOT NULL,
  `Nama` varchar(255) DEFAULT NULL,
  `TipeKendaraan` varchar(255) DEFAULT NULL,
  `NoHP` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ms_kurir`
--

INSERT INTO `ms_kurir` (`ID`, `Nama`, `TipeKendaraan`, `NoHP`) VALUES
(1, 'Andi', 'Motor', '081234567890'),
(2, 'Budi', 'Mobil', '081234567891'),
(3, 'Cici', 'Motor', '081234567892'),
(4, 'Dedi', 'Mobil', '081234567893'),
(5, 'Eka', 'Motor', '081234567894'),
(6, 'Fani', 'Mobil', '081234567895'),
(7, 'Gani', 'Motor', '081234567896'),
(8, 'Hani', 'Mobil', '081234567897'),
(9, 'Ika', 'Motor', '081234567898'),
(10, 'Joni', 'Mobil', '081234567899');

-- --------------------------------------------------------

--
-- Table structure for table `ms_pembayaran`
--

CREATE TABLE `ms_pembayaran` (
  `ID` int NOT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `StatusPembayaranID` int DEFAULT NULL,
  `TipePembayaranID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ms_pembayaran`
--

INSERT INTO `ms_pembayaran` (`ID`, `Total`, `StatusPembayaranID`, `TipePembayaranID`) VALUES
(1, '150000.00', 1, 1),
(2, '200000.00', 1, 2),
(3, '250000.00', 2, 3),
(4, '300000.00', 1, 1),
(5, '350000.00', 1, 2),
(6, '400000.00', 2, 3),
(7, '450000.00', 1, 1),
(8, '500000.00', 1, 2),
(9, '550000.00', 2, 3),
(10, '600000.00', 1, 1),
(11, '650000.00', 1, 2),
(12, '700000.00', 2, 3),
(13, '750000.00', 1, 1),
(14, '800000.00', 1, 2),
(15, '850000.00', 2, 3),
(16, '900000.00', 1, 1),
(17, '950000.00', 1, 2),
(18, '1000000.00', 2, 3),
(19, '1050000.00', 1, 1),
(20, '1100000.00', 1, 2),
(21, '1150000.00', 2, 3),
(22, '1200000.00', 1, 1),
(23, '1250000.00', 1, 2),
(24, '1300000.00', 2, 3),
(25, '1350000.00', 1, 1),
(26, '1400000.00', 1, 2),
(27, '1450000.00', 2, 3),
(28, '1500000.00', 1, 1),
(29, '1550000.00', 1, 2),
(30, '1600000.00', 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `ms_provinsi`
--

CREATE TABLE `ms_provinsi` (
  `ID` int NOT NULL,
  `Nama` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ms_provinsi`
--

INSERT INTO `ms_provinsi` (`ID`, `Nama`) VALUES
(1, 'Jawa Barat'),
(2, 'Jawa Tengah'),
(3, 'Jawa Timur');

-- --------------------------------------------------------

--
-- Table structure for table `ms_statuspembayaran`
--

CREATE TABLE `ms_statuspembayaran` (
  `ID` int NOT NULL,
  `Nama` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ms_statuspembayaran`
--

INSERT INTO `ms_statuspembayaran` (`ID`, `Nama`) VALUES
(1, 'Lunas'),
(2, 'Belum Lunas');

-- --------------------------------------------------------

--
-- Table structure for table `ms_statuspengiriman`
--

CREATE TABLE `ms_statuspengiriman` (
  `ID` int NOT NULL,
  `Nama` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ms_statuspengiriman`
--

INSERT INTO `ms_statuspengiriman` (`ID`, `Nama`) VALUES
(1, 'Dalam Proses'),
(2, 'Dalam Pengiriman'),
(3, 'Terkirim');

-- --------------------------------------------------------

--
-- Table structure for table `ms_tipepembayaran`
--

CREATE TABLE `ms_tipepembayaran` (
  `ID` int NOT NULL,
  `Nama` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ms_tipepembayaran`
--

INSERT INTO `ms_tipepembayaran` (`ID`, `Nama`) VALUES
(1, 'Transfer Bank'),
(2, 'Kartu Kredit'),
(3, 'Tunai');

-- --------------------------------------------------------

--
-- Table structure for table `tr_pengiriman`
--

CREATE TABLE `tr_pengiriman` (
  `ID` int NOT NULL,
  `NamaPelanggan` varchar(255) DEFAULT NULL,
  `AlamatAsal` varchar(255) DEFAULT NULL,
  `AlamatTujuan` varchar(255) DEFAULT NULL,
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

--
-- Dumping data for table `tr_pengiriman`
--

INSERT INTO `tr_pengiriman` (`ID`, `NamaPelanggan`, `AlamatAsal`, `AlamatTujuan`, `KecamatanAsalID`, `KecamatanTujuanID`, `Berat`, `TanggalPengiriman`, `TanggalSampaiPerkiraan`, `TanggalSampaiAktual`, `KurirID`, `StatusPengirimanID`, `PembayaranID`) VALUES
(1, 'Pelanggan 1', 'Jl. Merdeka No. 1', 'Jl. Sudirman No. 2', 1, 2, '5.00', '2023-10-01', '2023-10-03', '2023-10-03', 1, 1, 1),
(2, 'Pelanggan 2', 'Jl. Pahlawan No. 3', 'Jl. Gatot Subroto No. 4', 3, 4, '3.50', '2023-10-02', '2023-10-04', '2023-10-04', 2, 3, 2),
(3, 'Pelanggan 3', 'Jl. Diponegoro No. 5', 'Jl. Ahmad Yani No. 6', 5, 6, '4.00', '2023-10-03', '2023-10-05', '2023-10-05', 3, 2, 3),
(4, 'Pelanggan 4', 'Jl. Gajah Mada No. 7', 'Jl. Hayam Wuruk No. 8', 7, 8, '2.00', '2023-10-04', '2023-10-06', '2023-10-06', 4, 1, 4),
(5, 'Pelanggan 5', 'Jl. Thamrin No. 9', 'Jl. Kebon Sirih No. 10', 9, 1, '6.00', '2023-10-05', '2023-10-07', '2023-10-07', 5, 3, 5),
(6, 'Pelanggan 6', 'Jl. Sudirman No. 11', 'Jl. MH Thamrin No. 12', 2, 3, '3.00', '2023-10-06', '2023-10-08', '2023-10-08', 6, 2, 6),
(7, 'Pelanggan 7', 'Jl. Gatot Subroto No. 13', 'Jl. Pahlawan No. 14', 4, 5, '4.50', '2023-10-07', '2023-10-09', '2023-10-09', 7, 1, 7),
(8, 'Pelanggan 8', 'Jl. Ahmad Yani No. 15', 'Jl. Diponegoro No. 16', 6, 7, '5.50', '2023-10-08', '2023-10-10', '2023-10-10', 8, 3, 8),
(9, 'Pelanggan 9', 'Jl. Hayam Wuruk No. 17', 'Jl. Gajah Mada No. 18', 8, 9, '2.50', '2023-10-09', '2023-10-11', '2023-10-11', 9, 2, 9),
(10, 'Pelanggan 10', 'Jl. Kebon Sirih No. 19', 'Jl. Thamrin No. 20', 1, 2, '3.00', '2023-10-10', '2023-10-12', '2023-10-12', 10, 1, 10),
(11, 'Pelanggan 11', 'Jl. Merdeka No. 21', 'Jl. Sudirman No. 22', 2, 3, '4.00', '2023-10-11', '2023-10-13', '2023-10-13', 1, 3, 11),
(12, 'Pelanggan 12', 'Jl. Pahlawan No. 23', 'Jl. Gatot Subroto No. 24', 3, 4, '5.00', '2023-10-12', '2023-10-14', '2023-10-14', 2, 2, 12),
(13, 'Pelanggan 13', 'Jl. Diponegoro No. 25', 'Jl. Ahmad Yani No. 26', 4, 5, '6.00', '2023-10-13', '2023-10-15', '2023-10-15', 3, 1, 13),
(14, 'Pelanggan 14', 'Jl. Gajah Mada No. 27', 'Jl. Hayam Wuruk No. 28', 5, 6, '3.50', '2023-10-14', '2023-10-16', '2023-10-16', 4, 3, 14),
(15, 'Pelanggan 15', 'Jl. Thamrin No. 29', 'Jl. Kebon Sirih No. 30', 6, 7, '4.50', '2023-10-15', '2023-10-17', '2023-10-17', 5, 2, 15),
(16, 'Pelanggan 16', 'Jl. Sudirman No. 31', 'Jl. MH Thamrin No. 32', 7, 8, '2.00', '2023-10-16', '2023-10-18', '2023-10-18', 6, 1, 16),
(17, 'Pelanggan 17', 'Jl. Gatot Subroto No. 33', 'Jl. Pahlawan No. 34', 8, 9, '3.00', '2023-10-17', '2023-10-19', '2023-10-19', 7, 3, 17),
(18, 'Pelanggan 18', 'Jl. Ahmad Yani No. 35', 'Jl. Diponegoro No. 36', 9, 1, '4.00', '2023-10-18', '2023-10-20', '2023-10-20', 8, 2, 18),
(19, 'Pelanggan 19', 'Jl. Hayam Wuruk No. 37', 'Jl. Gajah Mada No. 38', 1, 2, '5.00', '2023-10-19', '2023-10-21', '2023-10-21', 9, 1, 19),
(20, 'Pelanggan 20', 'Jl. Kebon Sirih No. 39', 'Jl. Thamrin No. 40', 2, 3, '6.00', '2023-10-20', '2023-10-22', '2023-10-22', 10, 3, 20),
(21, 'Pelanggan 21', 'Jl. Merdeka No. 41', 'Jl. Sudirman No. 42', 3, 4, '3.50', '2023-10-21', '2023-10-23', '2023-10-23', 1, 2, 21),
(22, 'Pelanggan 22', 'Jl. Pahlawan No. 43', 'Jl. Gatot Subroto No. 44', 4, 5, '4.00', '2023-10-22', '2023-10-24', '2023-10-24', 2, 1, 22),
(23, 'Pelanggan 23', 'Jl. Diponegoro No. 45', 'Jl. Ahmad Yani No. 46', 5, 6, '5.00', '2023-10-23', '2023-10-25', '2023-10-25', 3, 3, 23),
(24, 'Pelanggan 24', 'Jl. Gajah Mada No. 47', 'Jl. Hayam Wuruk No. 48', 6, 7, '6.00', '2023-10-24', '2023-10-26', '2023-10-26', 4, 2, 24),
(25, 'Pelanggan 25', 'Jl. Thamrin No. 49', 'Jl. Kebon Sirih No. 50', 7, 8, '2.50', '2023-10-25', '2023-10-27', '2023-10-27', 5, 1, 25),
(26, 'Pelanggan 26', 'Jl. Sudirman No. 51', 'Jl. MH Thamrin No. 52', 8, 9, '3.50', '2023-10-26', '2023-10-28', '2023-10-28', 6, 3, 26),
(27, 'Pelanggan 27', 'Jl. Gatot Subroto No. 53', 'Jl. Pahlawan No. 54', 9, 1, '4.50', '2023-10-27', '2023-10-29', '2023-10-29', 2, 3, 27),
(28, 'Pelanggan 28', 'Jl. Ahmad Yani No. 55', 'Jl. Diponegoro No. 56', 1, 2, '5.50', '2023-10-28', '2023-10-30', '2023-10-30', 8, 1, 28),
(29, 'Pelanggan 29', 'Jl. Hayam Wuruk No. 57', 'Jl. Gajah Mada No. 58', 2, 3, '6.50', '2023-10-29', '2023-10-31', '2023-10-31', 9, 3, 29),
(30, 'Pelanggan 30', 'Jl. Kebon Sirih No. 59', 'Jl. Thamrin No. 60', 3, 4, '3.00', '2023-10-30', '2023-11-01', '2023-11-01', 10, 2, 30);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ms_kecamatan`
--
ALTER TABLE `ms_kecamatan`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `KotaID` (`KotaID`);

--
-- Indexes for table `ms_kota`
--
ALTER TABLE `ms_kota`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ProvinsiID` (`ProvinsiID`);

--
-- Indexes for table `ms_kurir`
--
ALTER TABLE `ms_kurir`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ms_pembayaran`
--
ALTER TABLE `ms_pembayaran`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `StatusPembayaranID` (`StatusPembayaranID`),
  ADD KEY `TipePembayaranID` (`TipePembayaranID`);

--
-- Indexes for table `ms_provinsi`
--
ALTER TABLE `ms_provinsi`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ms_statuspembayaran`
--
ALTER TABLE `ms_statuspembayaran`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ms_statuspengiriman`
--
ALTER TABLE `ms_statuspengiriman`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ms_tipepembayaran`
--
ALTER TABLE `ms_tipepembayaran`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tr_pengiriman`
--
ALTER TABLE `tr_pengiriman`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `KecamatanAsalID` (`KecamatanAsalID`),
  ADD KEY `KecamatanTujuanID` (`KecamatanTujuanID`),
  ADD KEY `KurirID` (`KurirID`),
  ADD KEY `StatusPengirimanID` (`StatusPengirimanID`),
  ADD KEY `PembayaranID` (`PembayaranID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ms_kecamatan`
--
ALTER TABLE `ms_kecamatan`
  ADD CONSTRAINT `ms_kecamatan_ibfk_1` FOREIGN KEY (`KotaID`) REFERENCES `ms_kota` (`ID`);

--
-- Constraints for table `ms_kota`
--
ALTER TABLE `ms_kota`
  ADD CONSTRAINT `ms_kota_ibfk_1` FOREIGN KEY (`ProvinsiID`) REFERENCES `ms_provinsi` (`ID`);

--
-- Constraints for table `ms_pembayaran`
--
ALTER TABLE `ms_pembayaran`
  ADD CONSTRAINT `ms_pembayaran_ibfk_1` FOREIGN KEY (`StatusPembayaranID`) REFERENCES `ms_statuspembayaran` (`ID`),
  ADD CONSTRAINT `ms_pembayaran_ibfk_2` FOREIGN KEY (`TipePembayaranID`) REFERENCES `ms_tipepembayaran` (`ID`);

--
-- Constraints for table `tr_pengiriman`
--
ALTER TABLE `tr_pengiriman`
  ADD CONSTRAINT `tr_pengiriman_ibfk_1` FOREIGN KEY (`KecamatanAsalID`) REFERENCES `ms_kecamatan` (`ID`),
  ADD CONSTRAINT `tr_pengiriman_ibfk_2` FOREIGN KEY (`KecamatanTujuanID`) REFERENCES `ms_kecamatan` (`ID`),
  ADD CONSTRAINT `tr_pengiriman_ibfk_3` FOREIGN KEY (`KurirID`) REFERENCES `ms_kurir` (`ID`),
  ADD CONSTRAINT `tr_pengiriman_ibfk_4` FOREIGN KEY (`StatusPengirimanID`) REFERENCES `ms_statuspengiriman` (`ID`),
  ADD CONSTRAINT `tr_pengiriman_ibfk_5` FOREIGN KEY (`PembayaranID`) REFERENCES `ms_pembayaran` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
