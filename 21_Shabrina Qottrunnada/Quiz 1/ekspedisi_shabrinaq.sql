-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 25, 2025 at 04:34 PM
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
-- Database: `ekspedisi_shabrinaq`
--

-- --------------------------------------------------------

--
-- Table structure for table `dimdate`
--

CREATE TABLE `dimdate` (
  `id_dimDate` int NOT NULL,
  `Date` date NOT NULL,
  `Year` int NOT NULL,
  `Month` int NOT NULL,
  `Day` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dimdate`
--

INSERT INTO `dimdate` (`id_dimDate`, `Date`, `Year`, `Month`, `Day`) VALUES
(1, '2024-01-01', 2024, 1, 1),
(2, '2024-01-02', 2024, 1, 2),
(3, '2024-01-03', 2024, 1, 3),
(4, '2024-01-04', 2024, 1, 4),
(5, '2024-01-05', 2024, 1, 5),
(6, '2024-01-06', 2024, 1, 6),
(7, '2024-01-07', 2024, 1, 7),
(8, '2024-01-08', 2024, 1, 8),
(9, '2024-01-09', 2024, 1, 9),
(10, '2024-01-10', 2024, 1, 10),
(11, '2024-01-11', 2024, 1, 11),
(12, '2024-01-12', 2024, 1, 12),
(13, '2024-01-13', 2024, 1, 13),
(14, '2024-01-14', 2024, 1, 14),
(15, '2024-01-15', 2024, 1, 15),
(16, '2024-01-16', 2024, 1, 16),
(17, '2024-01-17', 2024, 1, 17),
(18, '2024-01-18', 2024, 1, 18),
(19, '2024-01-19', 2024, 1, 19),
(20, '2024-01-20', 2024, 1, 20),
(21, '2024-01-21', 2024, 1, 21),
(22, '2024-01-22', 2024, 1, 22),
(23, '2024-01-23', 2024, 1, 23),
(24, '2024-01-24', 2024, 1, 24),
(25, '2024-01-25', 2024, 1, 25),
(26, '2024-01-26', 2024, 1, 26),
(27, '2024-01-27', 2024, 1, 27),
(28, '2024-01-28', 2024, 1, 28),
(29, '2024-01-29', 2024, 1, 29),
(30, '2024-01-30', 2024, 1, 30),
(31, '2024-01-31', 2024, 1, 31),
(32, '2024-02-01', 2024, 2, 1),
(33, '2024-02-02', 2024, 2, 2),
(34, '2024-02-03', 2024, 2, 3),
(35, '2024-02-04', 2024, 2, 4),
(36, '2024-02-05', 2024, 2, 5),
(37, '2024-02-06', 2024, 2, 6),
(38, '2024-02-07', 2024, 2, 7),
(39, '2024-02-08', 2024, 2, 8),
(40, '2024-02-09', 2024, 2, 9),
(41, '2024-02-10', 2024, 2, 10),
(42, '2024-02-11', 2024, 2, 11),
(43, '2024-02-12', 2024, 2, 12),
(44, '2024-02-13', 2024, 2, 13),
(45, '2024-02-14', 2024, 2, 14),
(46, '2024-02-15', 2024, 2, 15),
(47, '2024-02-16', 2024, 2, 16),
(48, '2024-02-17', 2024, 2, 17),
(49, '2024-02-18', 2024, 2, 18),
(50, '2024-02-19', 2024, 2, 19),
(51, '2024-02-20', 2024, 2, 20),
(52, '2024-02-21', 2024, 2, 21),
(53, '2024-02-22', 2024, 2, 22),
(54, '2024-02-23', 2024, 2, 23),
(55, '2024-02-24', 2024, 2, 24),
(56, '2024-02-25', 2024, 2, 25),
(57, '2024-02-26', 2024, 2, 26),
(58, '2024-02-27', 2024, 2, 27),
(59, '2024-02-28', 2024, 2, 28),
(60, '2024-02-29', 2024, 2, 29),
(61, '2024-03-01', 2024, 3, 1),
(62, '2024-03-02', 2024, 3, 2),
(63, '2024-03-03', 2024, 3, 3),
(64, '2024-03-04', 2024, 3, 4),
(65, '2024-03-05', 2024, 3, 5),
(66, '2024-03-06', 2024, 3, 6),
(67, '2024-03-07', 2024, 3, 7),
(68, '2024-03-08', 2024, 3, 8),
(69, '2024-03-09', 2024, 3, 9),
(70, '2024-03-10', 2024, 3, 10),
(71, '2024-03-11', 2024, 3, 11),
(72, '2024-03-12', 2024, 3, 12),
(73, '2024-03-13', 2024, 3, 13),
(74, '2024-03-14', 2024, 3, 14),
(75, '2024-03-15', 2024, 3, 15),
(76, '2024-03-16', 2024, 3, 16),
(77, '2024-03-17', 2024, 3, 17),
(78, '2024-03-18', 2024, 3, 18),
(79, '2024-03-19', 2024, 3, 19),
(80, '2024-03-20', 2024, 3, 20),
(81, '2024-03-21', 2024, 3, 21),
(82, '2024-03-22', 2024, 3, 22),
(83, '2024-03-23', 2024, 3, 23),
(84, '2024-03-24', 2024, 3, 24),
(85, '2024-03-25', 2024, 3, 25),
(86, '2024-03-26', 2024, 3, 26),
(87, '2024-03-27', 2024, 3, 27),
(88, '2024-03-28', 2024, 3, 28),
(89, '2024-03-29', 2024, 3, 29),
(90, '2024-03-30', 2024, 3, 30),
(91, '2024-03-31', 2024, 3, 31),
(92, '2024-04-01', 2024, 4, 1),
(93, '2024-04-02', 2024, 4, 2),
(94, '2024-04-03', 2024, 4, 3),
(95, '2024-04-04', 2024, 4, 4),
(96, '2024-04-05', 2024, 4, 5),
(97, '2024-04-06', 2024, 4, 6),
(98, '2024-04-07', 2024, 4, 7),
(99, '2024-04-08', 2024, 4, 8),
(100, '2024-04-09', 2024, 4, 9),
(101, '2024-04-10', 2024, 4, 10),
(102, '2024-04-11', 2024, 4, 11),
(103, '2024-04-12', 2024, 4, 12),
(104, '2024-04-13', 2024, 4, 13),
(105, '2024-04-14', 2024, 4, 14),
(106, '2024-04-15', 2024, 4, 15),
(107, '2024-04-16', 2024, 4, 16),
(108, '2024-04-17', 2024, 4, 17),
(109, '2024-04-18', 2024, 4, 18),
(110, '2024-04-19', 2024, 4, 19),
(111, '2024-04-20', 2024, 4, 20),
(112, '2024-04-21', 2024, 4, 21),
(113, '2024-04-22', 2024, 4, 22),
(114, '2024-04-23', 2024, 4, 23),
(115, '2024-04-24', 2024, 4, 24),
(116, '2024-04-25', 2024, 4, 25),
(117, '2024-04-26', 2024, 4, 26),
(118, '2024-04-27', 2024, 4, 27),
(119, '2024-04-28', 2024, 4, 28),
(120, '2024-04-29', 2024, 4, 29),
(121, '2024-04-30', 2024, 4, 30),
(122, '2024-05-01', 2024, 5, 1),
(123, '2024-05-02', 2024, 5, 2),
(124, '2024-05-03', 2024, 5, 3),
(125, '2024-05-04', 2024, 5, 4),
(126, '2024-05-05', 2024, 5, 5),
(127, '2024-05-06', 2024, 5, 6),
(128, '2024-05-07', 2024, 5, 7),
(129, '2024-05-08', 2024, 5, 8),
(130, '2024-05-09', 2024, 5, 9),
(131, '2024-05-10', 2024, 5, 10),
(132, '2024-05-11', 2024, 5, 11),
(133, '2024-05-12', 2024, 5, 12),
(134, '2024-05-13', 2024, 5, 13),
(135, '2024-05-14', 2024, 5, 14),
(136, '2024-05-15', 2024, 5, 15),
(137, '2024-05-16', 2024, 5, 16),
(138, '2024-05-17', 2024, 5, 17),
(139, '2024-05-18', 2024, 5, 18),
(140, '2024-05-19', 2024, 5, 19),
(141, '2024-05-20', 2024, 5, 20),
(142, '2024-05-21', 2024, 5, 21),
(143, '2024-05-22', 2024, 5, 22),
(144, '2024-05-23', 2024, 5, 23),
(145, '2024-05-24', 2024, 5, 24),
(146, '2024-05-25', 2024, 5, 25),
(147, '2024-05-26', 2024, 5, 26),
(148, '2024-05-27', 2024, 5, 27),
(149, '2024-05-28', 2024, 5, 28),
(150, '2024-05-29', 2024, 5, 29),
(151, '2024-05-30', 2024, 5, 30),
(152, '2024-05-31', 2024, 5, 31),
(153, '2024-06-01', 2024, 6, 1),
(154, '2024-06-02', 2024, 6, 2),
(155, '2024-06-03', 2024, 6, 3),
(156, '2024-06-04', 2024, 6, 4),
(157, '2024-06-05', 2024, 6, 5),
(158, '2024-06-06', 2024, 6, 6),
(159, '2024-06-07', 2024, 6, 7),
(160, '2024-06-08', 2024, 6, 8),
(161, '2024-06-09', 2024, 6, 9),
(162, '2024-06-10', 2024, 6, 10),
(163, '2024-06-11', 2024, 6, 11),
(164, '2024-06-12', 2024, 6, 12),
(165, '2024-06-13', 2024, 6, 13),
(166, '2024-06-14', 2024, 6, 14),
(167, '2024-06-15', 2024, 6, 15),
(168, '2024-06-16', 2024, 6, 16),
(169, '2024-06-17', 2024, 6, 17),
(170, '2024-06-18', 2024, 6, 18),
(171, '2024-06-19', 2024, 6, 19),
(172, '2024-06-20', 2024, 6, 20),
(173, '2024-06-21', 2024, 6, 21),
(174, '2024-06-22', 2024, 6, 22),
(175, '2024-06-23', 2024, 6, 23),
(176, '2024-06-24', 2024, 6, 24),
(177, '2024-06-25', 2024, 6, 25),
(178, '2024-06-26', 2024, 6, 26),
(179, '2024-06-27', 2024, 6, 27),
(180, '2024-06-28', 2024, 6, 28),
(181, '2024-06-29', 2024, 6, 29),
(182, '2024-06-30', 2024, 6, 30),
(183, '2024-07-01', 2024, 7, 1),
(184, '2024-07-02', 2024, 7, 2),
(185, '2024-07-03', 2024, 7, 3),
(186, '2024-07-04', 2024, 7, 4),
(187, '2024-07-05', 2024, 7, 5),
(188, '2024-07-06', 2024, 7, 6),
(189, '2024-07-07', 2024, 7, 7),
(190, '2024-07-08', 2024, 7, 8),
(191, '2024-07-09', 2024, 7, 9),
(192, '2024-07-10', 2024, 7, 10),
(193, '2024-07-11', 2024, 7, 11),
(194, '2024-07-12', 2024, 7, 12),
(195, '2024-07-13', 2024, 7, 13),
(196, '2024-07-14', 2024, 7, 14),
(197, '2024-07-15', 2024, 7, 15),
(198, '2024-07-16', 2024, 7, 16),
(199, '2024-07-17', 2024, 7, 17),
(200, '2024-07-18', 2024, 7, 18),
(201, '2024-07-19', 2024, 7, 19),
(202, '2024-07-20', 2024, 7, 20),
(203, '2024-07-21', 2024, 7, 21),
(204, '2024-07-22', 2024, 7, 22),
(205, '2024-07-23', 2024, 7, 23),
(206, '2024-07-24', 2024, 7, 24),
(207, '2024-07-25', 2024, 7, 25),
(208, '2024-07-26', 2024, 7, 26),
(209, '2024-07-27', 2024, 7, 27),
(210, '2024-07-28', 2024, 7, 28),
(211, '2024-07-29', 2024, 7, 29),
(212, '2024-07-30', 2024, 7, 30),
(213, '2024-07-31', 2024, 7, 31),
(214, '2024-08-01', 2024, 8, 1),
(215, '2024-08-02', 2024, 8, 2),
(216, '2024-08-03', 2024, 8, 3),
(217, '2024-08-04', 2024, 8, 4),
(218, '2024-08-05', 2024, 8, 5),
(219, '2024-08-06', 2024, 8, 6),
(220, '2024-08-07', 2024, 8, 7),
(221, '2024-08-08', 2024, 8, 8),
(222, '2024-08-09', 2024, 8, 9),
(223, '2024-08-10', 2024, 8, 10),
(224, '2024-08-11', 2024, 8, 11),
(225, '2024-08-12', 2024, 8, 12),
(226, '2024-08-13', 2024, 8, 13),
(227, '2024-08-14', 2024, 8, 14),
(228, '2024-08-15', 2024, 8, 15),
(229, '2024-08-16', 2024, 8, 16),
(230, '2024-08-17', 2024, 8, 17),
(231, '2024-08-18', 2024, 8, 18),
(232, '2024-08-19', 2024, 8, 19),
(233, '2024-08-20', 2024, 8, 20),
(234, '2024-08-21', 2024, 8, 21),
(235, '2024-08-22', 2024, 8, 22),
(236, '2024-08-23', 2024, 8, 23),
(237, '2024-08-24', 2024, 8, 24),
(238, '2024-08-25', 2024, 8, 25),
(239, '2024-08-26', 2024, 8, 26),
(240, '2024-08-27', 2024, 8, 27),
(241, '2024-08-28', 2024, 8, 28),
(242, '2024-08-29', 2024, 8, 29),
(243, '2024-08-30', 2024, 8, 30),
(244, '2024-08-31', 2024, 8, 31),
(245, '2024-09-01', 2024, 9, 1),
(246, '2024-09-02', 2024, 9, 2),
(247, '2024-09-03', 2024, 9, 3),
(248, '2024-09-04', 2024, 9, 4),
(249, '2024-09-05', 2024, 9, 5),
(250, '2024-09-06', 2024, 9, 6),
(251, '2024-09-07', 2024, 9, 7),
(252, '2024-09-08', 2024, 9, 8),
(253, '2024-09-09', 2024, 9, 9),
(254, '2024-09-10', 2024, 9, 10),
(255, '2024-09-11', 2024, 9, 11),
(256, '2024-09-12', 2024, 9, 12),
(257, '2024-09-13', 2024, 9, 13),
(258, '2024-09-14', 2024, 9, 14),
(259, '2024-09-15', 2024, 9, 15),
(260, '2024-09-16', 2024, 9, 16),
(261, '2024-09-17', 2024, 9, 17),
(262, '2024-09-18', 2024, 9, 18),
(263, '2024-09-19', 2024, 9, 19),
(264, '2024-09-20', 2024, 9, 20),
(265, '2024-09-21', 2024, 9, 21),
(266, '2024-09-22', 2024, 9, 22),
(267, '2024-09-23', 2024, 9, 23),
(268, '2024-09-24', 2024, 9, 24),
(269, '2024-09-25', 2024, 9, 25),
(270, '2024-09-26', 2024, 9, 26),
(271, '2024-09-27', 2024, 9, 27),
(272, '2024-09-28', 2024, 9, 28),
(273, '2024-09-29', 2024, 9, 29),
(274, '2024-09-30', 2024, 9, 30),
(275, '2024-10-01', 2024, 10, 1),
(276, '2024-10-02', 2024, 10, 2),
(277, '2024-10-03', 2024, 10, 3),
(278, '2024-10-04', 2024, 10, 4),
(279, '2024-10-05', 2024, 10, 5),
(280, '2024-10-06', 2024, 10, 6),
(281, '2024-10-07', 2024, 10, 7),
(282, '2024-10-08', 2024, 10, 8),
(283, '2024-10-09', 2024, 10, 9),
(284, '2024-10-10', 2024, 10, 10),
(285, '2024-10-11', 2024, 10, 11),
(286, '2024-10-12', 2024, 10, 12),
(287, '2024-10-13', 2024, 10, 13),
(288, '2024-10-14', 2024, 10, 14),
(289, '2024-10-15', 2024, 10, 15),
(290, '2024-10-16', 2024, 10, 16),
(291, '2024-10-17', 2024, 10, 17),
(292, '2024-10-18', 2024, 10, 18),
(293, '2024-10-19', 2024, 10, 19),
(294, '2024-10-20', 2024, 10, 20),
(295, '2024-10-21', 2024, 10, 21),
(296, '2024-10-22', 2024, 10, 22),
(297, '2024-10-23', 2024, 10, 23),
(298, '2024-10-24', 2024, 10, 24),
(299, '2024-10-25', 2024, 10, 25),
(300, '2024-10-26', 2024, 10, 26),
(301, '2024-10-27', 2024, 10, 27),
(302, '2024-10-28', 2024, 10, 28),
(303, '2024-10-29', 2024, 10, 29),
(304, '2024-10-30', 2024, 10, 30),
(305, '2024-10-31', 2024, 10, 31),
(306, '2024-11-01', 2024, 11, 1),
(307, '2024-11-02', 2024, 11, 2),
(308, '2024-11-03', 2024, 11, 3),
(309, '2024-11-04', 2024, 11, 4),
(310, '2024-11-05', 2024, 11, 5),
(311, '2024-11-06', 2024, 11, 6),
(312, '2024-11-07', 2024, 11, 7),
(313, '2024-11-08', 2024, 11, 8),
(314, '2024-11-09', 2024, 11, 9),
(315, '2024-11-10', 2024, 11, 10),
(316, '2024-11-11', 2024, 11, 11),
(317, '2024-11-12', 2024, 11, 12),
(318, '2024-11-13', 2024, 11, 13),
(319, '2024-11-14', 2024, 11, 14),
(320, '2024-11-15', 2024, 11, 15),
(321, '2024-11-16', 2024, 11, 16),
(322, '2024-11-17', 2024, 11, 17),
(323, '2024-11-18', 2024, 11, 18),
(324, '2024-11-19', 2024, 11, 19),
(325, '2024-11-20', 2024, 11, 20),
(326, '2024-11-21', 2024, 11, 21),
(327, '2024-11-22', 2024, 11, 22),
(328, '2024-11-23', 2024, 11, 23),
(329, '2024-11-24', 2024, 11, 24),
(330, '2024-11-25', 2024, 11, 25),
(331, '2024-11-26', 2024, 11, 26),
(332, '2024-11-27', 2024, 11, 27),
(333, '2024-11-28', 2024, 11, 28),
(334, '2024-11-29', 2024, 11, 29),
(335, '2024-11-30', 2024, 11, 30),
(336, '2024-12-01', 2024, 12, 1),
(337, '2024-12-02', 2024, 12, 2),
(338, '2024-12-03', 2024, 12, 3),
(339, '2024-12-04', 2024, 12, 4),
(340, '2024-12-05', 2024, 12, 5),
(341, '2024-12-06', 2024, 12, 6),
(342, '2024-12-07', 2024, 12, 7),
(343, '2024-12-08', 2024, 12, 8),
(344, '2024-12-09', 2024, 12, 9),
(345, '2024-12-10', 2024, 12, 10),
(346, '2024-12-11', 2024, 12, 11),
(347, '2024-12-12', 2024, 12, 12),
(348, '2024-12-13', 2024, 12, 13),
(349, '2024-12-14', 2024, 12, 14),
(350, '2024-12-15', 2024, 12, 15),
(351, '2024-12-16', 2024, 12, 16),
(352, '2024-12-17', 2024, 12, 17),
(353, '2024-12-18', 2024, 12, 18),
(354, '2024-12-19', 2024, 12, 19),
(355, '2024-12-20', 2024, 12, 20),
(356, '2024-12-21', 2024, 12, 21),
(357, '2024-12-22', 2024, 12, 22),
(358, '2024-12-23', 2024, 12, 23),
(359, '2024-12-24', 2024, 12, 24),
(360, '2024-12-25', 2024, 12, 25),
(361, '2024-12-26', 2024, 12, 26),
(362, '2024-12-27', 2024, 12, 27),
(363, '2024-12-28', 2024, 12, 28),
(364, '2024-12-29', 2024, 12, 29),
(365, '2024-12-30', 2024, 12, 30),
(366, '2024-12-31', 2024, 12, 31),
(367, '2025-01-01', 2025, 1, 1),
(368, '2025-01-02', 2025, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `dimkecamatan`
--

CREATE TABLE `dimkecamatan` (
  `ID_Kecamatan` int NOT NULL,
  `Nama_Kecamatan` varchar(100) NOT NULL,
  `Kota_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dimkecamatan`
--

INSERT INTO `dimkecamatan` (`ID_Kecamatan`, `Nama_Kecamatan`, `Kota_ID`) VALUES
(1, 'Menteng', 1),
(2, 'Cilandak', 2),
(3, 'Kebayoran Baru', 2),
(4, 'Klojen', 3),
(5, 'Lowokwaru', 3),
(6, 'Sukun', 3),
(7, 'Wonokromo', 4),
(8, 'Gubeng', 4),
(9, 'Tegalsari', 4),
(10, 'Denpasar Utara', 5),
(11, 'Denpasar Selatan', 5),
(12, 'Mataram Barat', 6),
(13, 'Ampenan', 6),
(14, 'Pontianak Kota', 7),
(15, 'Pontianak Timur', 7),
(16, 'Balikpapan Kota', 8),
(17, 'Balikpapan Selatan', 8),
(18, 'Manado Timur', 9),
(19, 'Manado Barat', 9),
(20, 'Makassar Timur', 10),
(21, 'Makassar Barat', 10);

-- --------------------------------------------------------

--
-- Table structure for table `dimkota`
--

CREATE TABLE `dimkota` (
  `ID_Kota` int NOT NULL,
  `Nama_Kota` varchar(100) NOT NULL,
  `Provinsi_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dimkota`
--

INSERT INTO `dimkota` (`ID_Kota`, `Nama_Kota`, `Provinsi_ID`) VALUES
(1, 'Banda Aceh', 1),
(2, 'Sabang', 1),
(3, 'Medan', 2),
(4, 'Binjai', 2),
(5, 'Padang', 3),
(6, 'Pekanbaru', 4),
(7, 'Jambi', 5),
(8, 'Palembang', 6),
(9, 'Bengkulu', 7),
(10, 'Bandar Lampung', 8),
(11, 'Jakarta', 9),
(12, 'Bandung', 10),
(13, 'Semarang', 11),
(14, 'Yogyakarta', 12),
(15, 'Surabaya', 13),
(16, 'Malang', 13),
(17, 'Denpasar', 14),
(18, 'Mataram', 15),
(19, 'Kupang', 16),
(20, 'Pontianak', 17),
(21, 'Palangkaraya', 18),
(22, 'Banjarmasin', 19),
(23, 'Samarinda', 20),
(24, 'Manado', 21),
(25, '	Gorontalo', 22),
(26, 'Makassar', 23),
(27, 'Kendari', 24),
(28, 'Ambon', 25),
(29, 'Jayapura', 26),
(30, 'Sorong', 27),
(31, 'Ternate', 28),
(32, 'Tarakan', 29),
(33, 'Tanjungpinang', 30),
(34, 'Pangkalpinang', 31),
(35, 'Serang', 32),
(36, 'Tasikmalaya', 10),
(37, 'Cirebon', 10),
(38, 'Banyuwangi', 13);

-- --------------------------------------------------------

--
-- Table structure for table `dimkurir`
--

CREATE TABLE `dimkurir` (
  `ID_Kurir` int NOT NULL,
  `Nama_Kurir` varchar(100) DEFAULT NULL,
  `Tipe_Kendaraan` varchar(50) DEFAULT NULL,
  `NoHP` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dimkurir`
--

INSERT INTO `dimkurir` (`ID_Kurir`, `Nama_Kurir`, `Tipe_Kendaraan`, `NoHP`) VALUES
(1, 'Andi', 'Motor', '081234567890'),
(2, 'Budi', 'Mobil', '082345678901'),
(3, 'Citra', 'Sepeda', '083456789012'),
(4, 'Dewi', 'Motor', '084567890123'),
(5, 'Eko', 'Mobil', '085678901234'),
(6, 'Fajar', 'Motor', '086789012345'),
(7, 'Gita', 'Sepeda', '087890123456'),
(8, 'Hadi', 'Mobil', '088901234567'),
(9, 'Indah', 'Motor', '089012345678'),
(10, 'Joko', 'Sepeda', '081023456789'),
(11, 'Kiki', 'Mobil', '082134567890'),
(12, 'Lina', 'Motor', '083245678901'),
(13, 'Maman', 'Sepeda', '084356789012'),
(14, 'Nina', 'Mobil', '085467890123'),
(15, 'Omar', 'Motor', '086578901234'),
(16, 'Putri', 'Sepeda', '087689012345'),
(17, 'Qori', 'Mobil', '088790123456'),
(18, 'Rian', 'Motor', '089801234567'),
(19, 'Sinta', 'Sepeda', '081912345678'),
(20, 'Toni', 'Mobil', '082023456789'),
(21, 'Umar', 'Motor', '083134567890'),
(22, 'Vina', 'Sepeda', '084245678901'),
(23, 'Wawan', 'Mobil', '085356789012'),
(24, 'Xena', 'Motor', '086467890123'),
(25, 'Yoga', 'Sepeda', '087578901234'),
(26, 'Zaki', 'Mobil', '088689012345');

-- --------------------------------------------------------

--
-- Table structure for table `dimpembayaran`
--

CREATE TABLE `dimpembayaran` (
  `ID_Pembayaran` int NOT NULL,
  `TotalPembayaran` decimal(10,2) NOT NULL,
  `StatusPembayaran_ID` int DEFAULT NULL,
  `TipePembayaran_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dimpembayaran`
--

INSERT INTO `dimpembayaran` (`ID_Pembayaran`, `TotalPembayaran`, `StatusPembayaran_ID`, `TipePembayaran_ID`) VALUES
(1, '150000.00', 1, 101),
(2, '250000.50', 3, 102),
(3, '50000.75', 4, 103),
(4, '120000.00', 1, 104),
(5, '90000.00', 2, 105),
(6, '300000.25', 1, 101),
(7, '450000.75', 4, 103),
(8, '60000.50', 3, 105),
(9, '175000.00', 1, 104),
(10, '80000.00', 2, 102),
(11, '200000.00', 3, 101),
(12, '350000.25', 4, 102),
(13, '75000.50', 1, 103),
(14, '125000.75', 2, 104),
(15, '95000.00', 3, 105),
(16, '275000.00', 1, 101),
(17, '180000.50', 4, 103),
(18, '65000.75', 2, 105),
(19, '195000.00', 1, 102),
(20, '225000.25', 3, 104),
(21, '85000.50', 4, 101),
(22, '155000.75', 2, 102),
(23, '320000.00', 1, 103),
(24, '275000.50', 3, 104),
(25, '140000.75', 4, 105),
(26, '190000.00', 1, 101),
(27, '210000.50', 2, 102),
(28, '280000.75', 3, 103),
(29, '315000.00', 4, 104),
(30, '185000.25', 1, 105),
(31, '260000.00', 3, 101),
(32, '340000.50', 2, 102),
(33, '120000.75', 1, 103),
(34, '295000.00', 4, 104),
(35, '175000.25', 3, 105),
(36, '235000.50', 1, 101),
(37, '275000.75', 2, 102),
(38, '310000.00', 3, 103),
(39, '285000.25', 4, 104),
(40, '160000.50', 1, 105),
(41, '220000.75', 3, 101),
(42, '290000.00', 2, 102),
(43, '250000.25', 1, 103),
(44, '335000.50', 4, 104),
(45, '155000.75', 3, 105),
(46, '275000.00', 1, 101),
(47, '195000.25', 2, 102),
(48, '310000.50', 3, 103),
(49, '285000.75', 4, 104),
(50, '165000.00', 1, 105),
(51, '245000.25', 3, 101);

-- --------------------------------------------------------

--
-- Table structure for table `dimprovinsi`
--

CREATE TABLE `dimprovinsi` (
  `ID_Provinsi` int NOT NULL,
  `Nama_Provinsi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dimprovinsi`
--

INSERT INTO `dimprovinsi` (`ID_Provinsi`, `Nama_Provinsi`) VALUES
(1, 'Aceh'),
(2, 'Sumatera Utara\n'),
(3, 'Sumatera Barat\n'),
(4, 'Riau\n'),
(5, 'Kepulauan Riau\n'),
(6, 'Jambi\n'),
(7, 'Sumatera Selatan\n'),
(8, 'Bangka Belitung\n'),
(9, 'Bengkulu\n'),
(10, 'Lampung\n'),
(11, 'DKI Jakarta\n'),
(12, 'Jawa Barat\n'),
(13, 'Banten\n'),
(14, 'Jawa Tengah\n'),
(15, 'DI Yogyakarta\n'),
(16, 'Jawa Timur\n'),
(17, 'Bali\n'),
(18, 'Nusa Tenggara Barat\n'),
(19, 'Nusa Tenggara Timur\n'),
(20, 'Kalimantan Barat\n'),
(21, 'Kalimantan Tengah\n'),
(22, 'Kalimantan Selatan\n'),
(23, 'Kalimantan Timur\n'),
(24, 'Kalimantan Utara\n'),
(25, 'Sulawesi Utara\n'),
(26, 'Gorontalo\n'),
(27, 'Sulawesi Tengah\n'),
(28, 'Sulawesi Selatan\n'),
(29, 'Sulawesi Tenggara\n'),
(30, 'Sulawesi Barat\n'),
(31, 'Maluku\n'),
(32, 'Maluku Utara\n'),
(33, 'Papua\n'),
(34, 'Papua Barat\n'),
(35, 'Papua Selatan\n'),
(36, 'Papua Pegunungan\n'),
(37, 'Papua Tengah\n'),
(38, 'Papua Barat Daya');

-- --------------------------------------------------------

--
-- Table structure for table `dimstatuspembayaran`
--

CREATE TABLE `dimstatuspembayaran` (
  `ID_StatusPembayaran` int NOT NULL,
  `Nama_StatusPembayaran` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dimstatuspembayaran`
--

INSERT INTO `dimstatuspembayaran` (`ID_StatusPembayaran`, `Nama_StatusPembayaran`) VALUES
(1, 'Lunas'),
(2, 'Belum Lunas'),
(3, 'Pending'),
(4, 'Dibatalkan');

-- --------------------------------------------------------

--
-- Table structure for table `dimstatuspengiriman`
--

CREATE TABLE `dimstatuspengiriman` (
  `ID_Status_Pengiriman` int NOT NULL,
  `Nama_Status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dimstatuspengiriman`
--

INSERT INTO `dimstatuspengiriman` (`ID_Status_Pengiriman`, `Nama_Status`) VALUES
(1, 'Sedang Dikirim'),
(2, 'Terkirim'),
(3, 'Gagal Terkirim');

-- --------------------------------------------------------

--
-- Table structure for table `dimtipepembayaran`
--

CREATE TABLE `dimtipepembayaran` (
  `ID_TipePembayaran` int NOT NULL,
  `Nama_TipePembayaran` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dimtipepembayaran`
--

INSERT INTO `dimtipepembayaran` (`ID_TipePembayaran`, `Nama_TipePembayaran`) VALUES
(101, 'Transfer Bank'),
(102, 'Debit'),
(103, 'E-Wallet'),
(104, 'COD'),
(105, 'Virtual Account');

-- --------------------------------------------------------

--
-- Table structure for table `faktapengiriman`
--

CREATE TABLE `faktapengiriman` (
  `ID_Pengiriman` int NOT NULL,
  `Kecamatan_Asal_ID` int DEFAULT NULL,
  `Kecamatan_Tujuan_ID` int DEFAULT NULL,
  `Berat` decimal(10,2) NOT NULL,
  `ID_DimDate_Pengiriman` int DEFAULT NULL,
  `ID_DimDate_Sampai_Perkiraan` int DEFAULT NULL,
  `ID_DimDate_Sampai_Aktual` int DEFAULT NULL,
  `Kurir_ID` int DEFAULT NULL,
  `Status_Pengiriman_ID` int DEFAULT NULL,
  `Pembayaran_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dimdate`
--
ALTER TABLE `dimdate`
  ADD PRIMARY KEY (`id_dimDate`);

--
-- Indexes for table `dimkecamatan`
--
ALTER TABLE `dimkecamatan`
  ADD PRIMARY KEY (`ID_Kecamatan`),
  ADD KEY `Kota_ID` (`Kota_ID`);

--
-- Indexes for table `dimkota`
--
ALTER TABLE `dimkota`
  ADD PRIMARY KEY (`ID_Kota`),
  ADD KEY `Provinsi_ID` (`Provinsi_ID`);

--
-- Indexes for table `dimkurir`
--
ALTER TABLE `dimkurir`
  ADD PRIMARY KEY (`ID_Kurir`);

--
-- Indexes for table `dimpembayaran`
--
ALTER TABLE `dimpembayaran`
  ADD PRIMARY KEY (`ID_Pembayaran`),
  ADD KEY `StatusPembayaran_ID` (`StatusPembayaran_ID`),
  ADD KEY `TipePembayaran_ID` (`TipePembayaran_ID`);

--
-- Indexes for table `dimprovinsi`
--
ALTER TABLE `dimprovinsi`
  ADD PRIMARY KEY (`ID_Provinsi`);

--
-- Indexes for table `dimstatuspembayaran`
--
ALTER TABLE `dimstatuspembayaran`
  ADD PRIMARY KEY (`ID_StatusPembayaran`);

--
-- Indexes for table `dimstatuspengiriman`
--
ALTER TABLE `dimstatuspengiriman`
  ADD PRIMARY KEY (`ID_Status_Pengiriman`);

--
-- Indexes for table `dimtipepembayaran`
--
ALTER TABLE `dimtipepembayaran`
  ADD PRIMARY KEY (`ID_TipePembayaran`);

--
-- Indexes for table `faktapengiriman`
--
ALTER TABLE `faktapengiriman`
  ADD PRIMARY KEY (`ID_Pengiriman`),
  ADD KEY `Kecamatan_Asal_ID` (`Kecamatan_Asal_ID`),
  ADD KEY `Kecamatan_Tujuan_ID` (`Kecamatan_Tujuan_ID`),
  ADD KEY `ID_DimDate_Pengiriman` (`ID_DimDate_Pengiriman`),
  ADD KEY `ID_DimDate_Sampai_Perkiraan` (`ID_DimDate_Sampai_Perkiraan`),
  ADD KEY `ID_DimDate_Sampai_Aktual` (`ID_DimDate_Sampai_Aktual`),
  ADD KEY `Kurir_ID` (`Kurir_ID`),
  ADD KEY `Status_Pengiriman_ID` (`Status_Pengiriman_ID`),
  ADD KEY `Pembayaran_ID` (`Pembayaran_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dimdate`
--
ALTER TABLE `dimdate`
  MODIFY `id_dimDate` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=369;

--
-- AUTO_INCREMENT for table `dimkecamatan`
--
ALTER TABLE `dimkecamatan`
  MODIFY `ID_Kecamatan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `dimkota`
--
ALTER TABLE `dimkota`
  MODIFY `ID_Kota` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `dimkurir`
--
ALTER TABLE `dimkurir`
  MODIFY `ID_Kurir` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `dimpembayaran`
--
ALTER TABLE `dimpembayaran`
  MODIFY `ID_Pembayaran` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `dimprovinsi`
--
ALTER TABLE `dimprovinsi`
  MODIFY `ID_Provinsi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `dimstatuspembayaran`
--
ALTER TABLE `dimstatuspembayaran`
  MODIFY `ID_StatusPembayaran` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dimstatuspengiriman`
--
ALTER TABLE `dimstatuspengiriman`
  MODIFY `ID_Status_Pengiriman` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dimtipepembayaran`
--
ALTER TABLE `dimtipepembayaran`
  MODIFY `ID_TipePembayaran` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `faktapengiriman`
--
ALTER TABLE `faktapengiriman`
  MODIFY `ID_Pengiriman` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dimkecamatan`
--
ALTER TABLE `dimkecamatan`
  ADD CONSTRAINT `dimkecamatan_ibfk_1` FOREIGN KEY (`Kota_ID`) REFERENCES `dimkota` (`ID_Kota`);

--
-- Constraints for table `dimkota`
--
ALTER TABLE `dimkota`
  ADD CONSTRAINT `dimkota_ibfk_1` FOREIGN KEY (`Provinsi_ID`) REFERENCES `dimprovinsi` (`ID_Provinsi`);

--
-- Constraints for table `dimpembayaran`
--
ALTER TABLE `dimpembayaran`
  ADD CONSTRAINT `dimpembayaran_ibfk_1` FOREIGN KEY (`StatusPembayaran_ID`) REFERENCES `dimstatuspembayaran` (`ID_StatusPembayaran`),
  ADD CONSTRAINT `dimpembayaran_ibfk_2` FOREIGN KEY (`TipePembayaran_ID`) REFERENCES `dimtipepembayaran` (`ID_TipePembayaran`);

--
-- Constraints for table `faktapengiriman`
--
ALTER TABLE `faktapengiriman`
  ADD CONSTRAINT `faktapengiriman_ibfk_1` FOREIGN KEY (`Kecamatan_Asal_ID`) REFERENCES `dimkecamatan` (`ID_Kecamatan`),
  ADD CONSTRAINT `faktapengiriman_ibfk_2` FOREIGN KEY (`Kecamatan_Tujuan_ID`) REFERENCES `dimkecamatan` (`ID_Kecamatan`),
  ADD CONSTRAINT `faktapengiriman_ibfk_3` FOREIGN KEY (`ID_DimDate_Pengiriman`) REFERENCES `dimdate` (`id_dimDate`),
  ADD CONSTRAINT `faktapengiriman_ibfk_4` FOREIGN KEY (`ID_DimDate_Sampai_Perkiraan`) REFERENCES `dimdate` (`id_dimDate`),
  ADD CONSTRAINT `faktapengiriman_ibfk_5` FOREIGN KEY (`ID_DimDate_Sampai_Aktual`) REFERENCES `dimdate` (`id_dimDate`),
  ADD CONSTRAINT `faktapengiriman_ibfk_6` FOREIGN KEY (`Kurir_ID`) REFERENCES `dimkurir` (`ID_Kurir`),
  ADD CONSTRAINT `faktapengiriman_ibfk_7` FOREIGN KEY (`Status_Pengiriman_ID`) REFERENCES `dimstatuspengiriman` (`ID_Status_Pengiriman`),
  ADD CONSTRAINT `faktapengiriman_ibfk_8` FOREIGN KEY (`Pembayaran_ID`) REFERENCES `dimpembayaran` (`ID_Pembayaran`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
