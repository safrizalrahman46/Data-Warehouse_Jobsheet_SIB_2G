-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 27, 2025 at 01:40 AM
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
-- Database: `dw_toko_barokah`
--

-- --------------------------------------------------------

--
-- Table structure for table `dim_pembeli`
--

CREATE TABLE `dim_pembeli` (
  `sk_pembeli` int DEFAULT NULL,
  `id_member` int DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dim_penjual`
--

CREATE TABLE `dim_penjual` (
  `sk_penjual` int DEFAULT NULL,
  `id_penjual` int DEFAULT NULL,
  `nama_penjual` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dim_produk`
--

CREATE TABLE `dim_produk` (
  `sk_produk` int DEFAULT NULL,
  `id_produk` int DEFAULT NULL,
  `nama_produk` varchar(50) DEFAULT NULL,
  `satuan` varchar(10) DEFAULT NULL,
  `harga` decimal(22,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dim_waktu`
--

CREATE TABLE `dim_waktu` (
  `sk_waktu` bigint DEFAULT NULL,
  `Hari` int DEFAULT NULL,
  `Kuartal` tinytext,
  `Bulan` int DEFAULT NULL,
  `Tahun` int DEFAULT NULL,
  `Tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fact_penjualan`
--

CREATE TABLE `fact_penjualan` (
  `id_transaksi` int DEFAULT NULL,
  `sk_produk` int DEFAULT NULL,
  `sk_pembeli` int DEFAULT NULL,
  `sk_penjual` int DEFAULT NULL,
  `sk_waktu` bigint DEFAULT NULL,
  `sk_penjualan` int DEFAULT NULL,
  `qty` decimal(22,0) DEFAULT NULL,
  `total_harga` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
