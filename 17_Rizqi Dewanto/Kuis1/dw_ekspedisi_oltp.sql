-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 21, 2025 at 12:44 AM
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
-- Database: `dw_ekspedisi_oltp`
--

-- --------------------------------------------------------

--
-- Table structure for table `kecamatan`
--

CREATE TABLE `kecamatan` (
  `ID` int NOT NULL,
  `Nama` varchar(100) DEFAULT NULL,
  `KotaID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kecamatan`
--

INSERT INTO `kecamatan` (`ID`, `Nama`, `KotaID`) VALUES
(1, 'Cicendo', 11),
(2, 'Tembalang', 12),
(3, 'Gubeng', 13);

-- --------------------------------------------------------

--
-- Table structure for table `kota`
--

CREATE TABLE `kota` (
  `ID` int NOT NULL,
  `Nama` varchar(100) DEFAULT NULL,
  `ProvinsiID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kota`
--

INSERT INTO `kota` (`ID`, `Nama`, `ProvinsiID`) VALUES
(11, 'Bandung', 1),
(12, 'Semarang', 2),
(13, 'Surabaya', 3);

-- --------------------------------------------------------

--
-- Table structure for table `kurir`
--

CREATE TABLE `kurir` (
  `ID` int NOT NULL,
  `Nama` varchar(255) DEFAULT NULL,
  `TipeKendaraan` varchar(100) DEFAULT NULL,
  `NoHP` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kurir`
--

INSERT INTO `kurir` (`ID`, `Nama`, `TipeKendaraan`, `NoHP`) VALUES
(11, 'Rudi Santoso', 'Motor', '081234567890'),
(12, 'Budi Hartono', 'Mobil', '082345678901'),
(13, 'Siti Aisyah', 'Motor', '083456789012');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `ID` int NOT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `StatusPembayaranID` int DEFAULT NULL,
  `TipePembayaranID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`ID`, `Total`, `StatusPembayaranID`, `TipePembayaranID`) VALUES
(1, '50000.00', 1, 1),
(2, '75000.00', 2, 2),
(3, '100000.00', 1, 3),
(4, '60000.00', 1, 2),
(5, '85000.00', 3, 1),
(6, '90000.00', 1, 3),
(7, '120000.00', 2, 1),
(8, '50000.00', 1, 1),
(9, '75000.00', 2, 2),
(10, '100000.00', 1, 3),
(11, '60000.00', 1, 2),
(12, '85000.00', 3, 1),
(13, '90000.00', 1, 3),
(14, '120000.00', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pengiriman`
--

CREATE TABLE `pengiriman` (
  `ID` int NOT NULL,
  `NamaPelanggan` varchar(255) DEFAULT NULL,
  `AlamatAsal` text,
  `AlamatTujuan` text,
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
-- Dumping data for table `pengiriman`
--

INSERT INTO `pengiriman` (`ID`, `NamaPelanggan`, `AlamatAsal`, `AlamatTujuan`, `KecamatanAsalID`, `KecamatanTujuanID`, `Berat`, `TanggalPengiriman`, `TanggalSampaiPerkiraan`, `TanggalSampaiAktual`, `KurirID`, `StatusPengirimanID`, `PembayaranID`) VALUES
(1, 'Andi Wijaya', 'Jl. Sukajadi No.12', 'Jl. Dr. Cipto No.5', 1, 2, '3.50', '2023-09-15', '2023-09-17', '2023-09-17', 11, 2, 1),
(2, 'Dewi Lestari', 'Jl. Sukun Raya No.8', 'Jl. Sumatra No.20', 2, 3, '5.00', '2023-10-01', '2023-10-04', '2023-10-05', 12, 2, 2),
(3, 'Bambang Hermawan', 'Jl. Gading Serpong No.4', 'Jl. Gubeng Kertajaya No.99', 3, 1, '1.20', '2023-11-12', '2023-11-14', '2023-11-14', 13, 2, 3),
(4, 'Fitri Aulia', 'Jl. Asia Afrika No.55', 'Jl. Kaligawe No.32', 1, 2, '2.80', '2024-01-20', '2024-01-23', '2024-01-24', 11, 1, 4),
(5, 'Rudi Hartanto', 'Jl. Pemuda No.89', 'Jl. Arjuna No.13', 2, 3, '4.30', '2024-02-05', '2024-02-07', '2024-02-09', 12, 2, 5),
(6, 'Sari Melati', 'Jl. Pasteur No.3', 'Jl. Darmo No.7', 1, 3, '0.90', '2024-03-15', '2024-03-16', '2024-03-16', 13, 2, 6),
(7, 'Agus Setiawan', 'Jl. Dago No.1', 'Jl. Pandanaran No.10', 1, 2, '6.00', '2024-04-01', '2024-04-04', NULL, 11, 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `provinsi`
--

CREATE TABLE `provinsi` (
  `ID` int NOT NULL,
  `Nama` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `provinsi`
--

INSERT INTO `provinsi` (`ID`, `Nama`) VALUES
(1, 'Jawa Barat'),
(2, 'Jawa Tengah'),
(3, 'Jawa Timur');

-- --------------------------------------------------------

--
-- Table structure for table `statuspembayaran`
--

CREATE TABLE `statuspembayaran` (
  `ID` int NOT NULL,
  `Nama` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `statuspembayaran`
--

INSERT INTO `statuspembayaran` (`ID`, `Nama`) VALUES
(1, 'Lunas'),
(2, 'Pending'),
(3, 'Gagal');

-- --------------------------------------------------------

--
-- Table structure for table `statuspengiriman`
--

CREATE TABLE `statuspengiriman` (
  `ID` int NOT NULL,
  `Nama` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `statuspengiriman`
--

INSERT INTO `statuspengiriman` (`ID`, `Nama`) VALUES
(1, 'Sedang Dikirim'),
(2, 'Sampai'),
(3, 'Tertunda');

-- --------------------------------------------------------

--
-- Table structure for table `tipepembayaran`
--

CREATE TABLE `tipepembayaran` (
  `ID` int NOT NULL,
  `Nama` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tipepembayaran`
--

INSERT INTO `tipepembayaran` (`ID`, `Nama`) VALUES
(1, 'Transfer Bank'),
(2, 'COD'),
(3, 'E-Wallet');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `StatusPembayaranID` (`StatusPembayaranID`),
  ADD KEY `TipePembayaranID` (`TipePembayaranID`);

--
-- Indexes for table `pengiriman`
--
ALTER TABLE `pengiriman`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `KecamatanAsalID` (`KecamatanAsalID`),
  ADD KEY `KecamatanTujuanID` (`KecamatanTujuanID`),
  ADD KEY `KurirID` (`KurirID`),
  ADD KEY `StatusPengirimanID` (`StatusPengirimanID`),
  ADD KEY `PembayaranID` (`PembayaranID`);

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
-- AUTO_INCREMENT for table `kecamatan`
--
ALTER TABLE `kecamatan`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `kota`
--
ALTER TABLE `kota`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `kurir`
--
ALTER TABLE `kurir`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pengiriman`
--
ALTER TABLE `pengiriman`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `provinsi`
--
ALTER TABLE `provinsi`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `statuspembayaran`
--
ALTER TABLE `statuspembayaran`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `statuspengiriman`
--
ALTER TABLE `statuspengiriman`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tipepembayaran`
--
ALTER TABLE `tipepembayaran`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

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

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`StatusPembayaranID`) REFERENCES `statuspembayaran` (`ID`),
  ADD CONSTRAINT `pembayaran_ibfk_2` FOREIGN KEY (`TipePembayaranID`) REFERENCES `tipepembayaran` (`ID`);

--
-- Constraints for table `pengiriman`
--
ALTER TABLE `pengiriman`
  ADD CONSTRAINT `pengiriman_ibfk_1` FOREIGN KEY (`KecamatanAsalID`) REFERENCES `kecamatan` (`ID`),
  ADD CONSTRAINT `pengiriman_ibfk_2` FOREIGN KEY (`KecamatanTujuanID`) REFERENCES `kecamatan` (`ID`),
  ADD CONSTRAINT `pengiriman_ibfk_3` FOREIGN KEY (`KurirID`) REFERENCES `kurir` (`ID`),
  ADD CONSTRAINT `pengiriman_ibfk_4` FOREIGN KEY (`StatusPengirimanID`) REFERENCES `statuspengiriman` (`ID`),
  ADD CONSTRAINT `pengiriman_ibfk_5` FOREIGN KEY (`PembayaranID`) REFERENCES `pembayaran` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
