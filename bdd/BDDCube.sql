-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 10, 2021 at 05:30 PM
-- Server version: 10.3.27-MariaDB-0+deb10u1-log
-- PHP Version: 7.3.27-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `BDDCube`
--

-- --------------------------------------------------------

--
-- Table structure for table `AGENDA`
--

CREATE TABLE `AGENDA` (
  `ID` int(11) NOT NULL,
  `DEBUT` date NOT NULL,
  `FIN` date NOT NULL,
  `DATEAJOUT` date NOT NULL,
  `NOM` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `AGENDA`
--

INSERT INTO `AGENDA` (`ID`, `DEBUT`, `FIN`, `DATEAJOUT`, `NOM`) VALUES
(8, '2021-06-22', '2021-06-26', '2021-06-10', 'Vacances'),
(9, '2021-06-10', '2021-06-18', '2021-06-10', 'Vacances');

-- --------------------------------------------------------

--
-- Table structure for table `CIRCUL`
--

CREATE TABLE `CIRCUL` (
  `ID` int(11) NOT NULL,
  `R` int(11) NOT NULL,
  `CHEMIN` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `HeureOccupation`
--

CREATE TABLE `HeureOccupation` (
  `ID` int(11) NOT NULL,
  `HeureDebut` time NOT NULL,
  `HeureFin` time NOT NULL,
  `commentaire` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `HeureOccupation`
--

INSERT INTO `HeureOccupation` (`ID`, `HeureDebut`, `HeureFin`, `commentaire`) VALUES
(10, '08:28:00', '19:56:00', 'boulot'),
(11, '09:34:00', '10:34:00', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `METEO`
--

CREATE TABLE `METEO` (
  `ID` int(11) NOT NULL,
  `DATE` timestamp NOT NULL DEFAULT current_timestamp(),
  `VILLE` varchar(50) NOT NULL,
  `TEMP` int(11) NOT NULL,
  `UVI` double NOT NULL,
  `DescCu` varchar(50) NOT NULL,
  `DescJ1` varchar(50) NOT NULL,
  `DescJ2` varchar(50) NOT NULL,
  `DescJ3` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `METEO`
--

INSERT INTO `METEO` (`ID`, `DATE`, `VILLE`, `TEMP`, `UVI`, `DescCu`, `DescJ1`, `DescJ2`, `DescJ3`) VALUES
(36, '2021-06-03 14:32:04', 'La Roche sur Yon', 19, 2.22, 'moderate rain', 'overcast clouds', 'clear sky', 'overcast clouds'),
(37, '2021-06-04 10:26:38', 'La Roche sur Yon', 13, 2.44, 'light rain', 'clear sky', 'scattered clouds', 'scattered clouds'),
(38, '2021-06-04 10:53:41', 'La Roche sur Yon', 13, 2.97, 'light rain', 'clear sky', 'scattered clouds', 'scattered clouds'),
(39, '2021-06-04 10:57:10', 'La Roche sur Yon', 13, 2.97, 'light rain', 'clear sky', 'scattered clouds', 'scattered clouds'),
(40, '2021-06-04 10:59:03', 'La Roche-Sur-Yon', 13, 2.97, 'light rain', 'clear sky', 'scattered clouds', 'scattered clouds'),
(41, '2021-06-04 11:14:22', 'La Roche-Sur-Yon', 13, 2.97, 'light rain', 'clear sky', 'scattered clouds', 'scattered clouds'),
(42, '2021-06-04 11:19:59', 'La Roche-Sur-Yon', 12, 2.97, 'light rain', 'clear sky', 'scattered clouds', 'scattered clouds'),
(43, '2021-06-04 13:06:38', 'La Roche-Sur-Yon', 15, 4.1, 'light rain', 'clear sky', 'few clouds', 'scattered clouds'),
(44, '2021-06-04 17:00:14', 'La Roche-Sur-Yon', 18, 1.04, 'light rain', 'clear sky', 'few clouds', 'scattered clouds'),
(45, '2021-06-06 15:40:30', 'La Roche-Sur-Yon', 23, 1.53, 'few clouds', 'scattered clouds', 'scattered clouds', 'overcast clouds'),
(46, '2021-06-07 13:28:13', 'La Roche-Sur-Yon', 25, 2.9, 'clear sky', 'scattered clouds', 'clear sky', 'broken clouds'),
(47, '2021-06-08 06:50:19', 'La Roche-Sur-Yon', 19, 1.32, 'scattered clouds', 'few clouds', 'overcast clouds', 'light rain'),
(48, '2021-06-08 06:55:39', 'La Roche-Sur-Yon', 19, 1.32, 'scattered clouds', 'few clouds', 'overcast clouds', 'light rain'),
(49, '2021-06-08 07:10:05', 'La Roche-Sur-Yon', 19, 1.32, 'scattered clouds', 'scattered clouds', 'broken clouds', 'broken clouds'),
(50, '2021-06-08 07:10:50', 'La Roche-Sur-Yon', 19, 1.32, 'scattered clouds', 'few clouds', 'overcast clouds', 'light rain'),
(51, '2021-06-08 07:11:03', 'La Roche-Sur-Yon', 19, 1.32, 'scattered clouds', 'few clouds', 'overcast clouds', 'light rain'),
(52, '2021-06-08 07:12:02', 'La Roche-Sur-Yon', 19, 1.32, 'scattered clouds', 'few clouds', 'overcast clouds', 'light rain'),
(53, '2021-06-08 07:13:02', 'La Roche-Sur-Yon', 19, 1.32, 'scattered clouds', 'few clouds', 'overcast clouds', 'light rain'),
(54, '2021-06-08 07:14:02', 'La Roche-Sur-Yon', 19, 1.32, 'scattered clouds', 'few clouds', 'overcast clouds', 'light rain'),
(55, '2021-06-08 07:15:03', 'La Roche-Sur-Yon', 19, 1.32, 'scattered clouds', 'few clouds', 'overcast clouds', 'light rain'),
(56, '2021-06-09 04:00:03', 'La Roche-Sur-Yon', 13, 0, 'scattered clouds', 'broken clouds', 'light rain', 'clear sky'),
(57, '2021-06-10 04:00:06', 'La Roche-Sur-Yon', 13, 0, 'broken clouds', 'clear sky', 'clear sky', 'clear sky'),
(58, '2021-06-10 09:42:43', 'La Roche-Sur-Yon', 22, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(59, '2021-06-10 09:46:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(60, '2021-06-10 09:47:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(61, '2021-06-10 09:48:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(62, '2021-06-10 09:49:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(63, '2021-06-10 09:50:05', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(64, '2021-06-10 09:51:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(65, '2021-06-10 09:52:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(66, '2021-06-10 09:53:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(67, '2021-06-10 09:54:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(68, '2021-06-10 09:55:03', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(69, '2021-06-10 09:56:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(70, '2021-06-10 09:57:03', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(71, '2021-06-10 09:58:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(72, '2021-06-10 09:59:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(73, '2021-06-10 10:00:06', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(74, '2021-06-10 10:01:06', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(75, '2021-06-10 10:02:03', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(76, '2021-06-10 10:03:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(77, '2021-06-10 10:04:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(78, '2021-06-10 10:05:03', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(79, '2021-06-10 10:06:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(80, '2021-06-10 10:07:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(81, '2021-06-10 10:08:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(82, '2021-06-10 10:09:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(83, '2021-06-10 10:10:06', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(84, '2021-06-10 10:11:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(85, '2021-06-10 10:12:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(86, '2021-06-10 10:13:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(87, '2021-06-10 10:14:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(88, '2021-06-10 10:15:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(89, '2021-06-10 10:16:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(90, '2021-06-10 10:17:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(91, '2021-06-10 10:18:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(92, '2021-06-10 10:19:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(93, '2021-06-10 10:20:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(94, '2021-06-10 10:21:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(95, '2021-06-10 10:22:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(96, '2021-06-10 10:23:03', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(97, '2021-06-10 10:24:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(98, '2021-06-10 10:25:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(99, '2021-06-10 10:26:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(100, '2021-06-10 10:27:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(101, '2021-06-10 10:28:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(102, '2021-06-10 10:29:02', 'La Roche-Sur-Yon', 23, 6.17, 'scattered clouds', 'light rain', 'clear sky', 'clear sky'),
(103, '2021-06-10 10:30:03', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(104, '2021-06-10 10:31:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(105, '2021-06-10 10:32:03', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(106, '2021-06-10 10:33:04', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(107, '2021-06-10 10:34:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(108, '2021-06-10 10:35:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(109, '2021-06-10 10:36:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(110, '2021-06-10 10:37:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(111, '2021-06-10 10:38:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(112, '2021-06-10 10:39:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(113, '2021-06-10 10:40:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(114, '2021-06-10 10:41:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(115, '2021-06-10 10:42:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(116, '2021-06-10 10:43:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(117, '2021-06-10 10:44:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(118, '2021-06-10 10:45:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(119, '2021-06-10 10:46:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(120, '2021-06-10 10:47:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(121, '2021-06-10 10:48:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(122, '2021-06-10 10:49:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(123, '2021-06-10 10:50:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(124, '2021-06-10 10:51:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(125, '2021-06-10 10:52:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(126, '2021-06-10 10:53:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(127, '2021-06-10 10:54:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(128, '2021-06-10 10:55:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(129, '2021-06-10 10:56:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(130, '2021-06-10 10:57:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(131, '2021-06-10 10:58:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(132, '2021-06-10 10:59:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(133, '2021-06-10 11:00:04', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(134, '2021-06-10 11:01:03', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(135, '2021-06-10 11:02:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(136, '2021-06-10 11:03:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(137, '2021-06-10 11:04:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(138, '2021-06-10 11:05:04', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(139, '2021-06-10 11:06:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(140, '2021-06-10 11:07:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(141, '2021-06-10 11:08:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(142, '2021-06-10 11:09:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(143, '2021-06-10 11:10:03', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(144, '2021-06-10 11:11:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(145, '2021-06-10 11:12:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(146, '2021-06-10 11:13:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(147, '2021-06-10 11:14:02', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(148, '2021-06-10 11:15:03', 'La Roche-Sur-Yon', 23, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(149, '2021-06-10 11:16:02', 'La Roche-Sur-Yon', 24, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(150, '2021-06-10 11:17:02', 'La Roche-Sur-Yon', 24, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(151, '2021-06-10 11:18:02', 'La Roche-Sur-Yon', 24, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(152, '2021-06-10 11:19:02', 'La Roche-Sur-Yon', 24, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(153, '2021-06-10 11:20:04', 'La Roche-Sur-Yon', 24, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(154, '2021-06-10 11:21:02', 'La Roche-Sur-Yon', 24, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(155, '2021-06-10 11:22:02', 'La Roche-Sur-Yon', 24, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(156, '2021-06-10 11:23:02', 'La Roche-Sur-Yon', 24, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(157, '2021-06-10 11:24:02', 'La Roche-Sur-Yon', 24, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(158, '2021-06-10 11:25:04', 'La Roche-Sur-Yon', 24, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(159, '2021-06-10 11:26:02', 'La Roche-Sur-Yon', 24, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(160, '2021-06-10 11:27:02', 'La Roche-Sur-Yon', 24, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(161, '2021-06-10 11:28:02', 'La Roche-Sur-Yon', 24, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(162, '2021-06-10 11:29:02', 'La Roche-Sur-Yon', 24, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(163, '2021-06-10 11:30:15', 'La Roche-Sur-Yon', 24, 8.07, 'clear sky', 'light rain', 'clear sky', 'clear sky'),
(164, '2021-06-10 11:31:02', 'La Roche-Sur-Yon', 24, 8.07, 'clear sky', 'light rain', 'clear sky', 'clear sky'),
(165, '2021-06-10 11:32:03', 'La Roche-Sur-Yon', 24, 8.07, 'clear sky', 'light rain', 'clear sky', 'clear sky'),
(166, '2021-06-10 11:33:02', 'La Roche-Sur-Yon', 24, 8.07, 'clear sky', 'light rain', 'clear sky', 'clear sky'),
(167, '2021-06-10 11:34:02', 'La Roche-Sur-Yon', 24, 8.07, 'clear sky', 'light rain', 'clear sky', 'clear sky'),
(168, '2021-06-10 11:35:02', 'La Roche-Sur-Yon', 24, 8.07, 'clear sky', 'light rain', 'clear sky', 'clear sky'),
(169, '2021-06-10 11:36:02', 'La Roche-Sur-Yon', 24, 8.07, 'clear sky', 'light rain', 'clear sky', 'clear sky'),
(170, '2021-06-10 11:37:02', 'La Roche-Sur-Yon', 24, 8.07, 'clear sky', 'light rain', 'clear sky', 'clear sky'),
(171, '2021-06-10 11:38:02', 'La Roche-Sur-Yon', 24, 8.07, 'clear sky', 'light rain', 'clear sky', 'clear sky'),
(172, '2021-06-10 11:39:02', 'La Roche-Sur-Yon', 24, 8.07, 'clear sky', 'light rain', 'clear sky', 'clear sky'),
(173, '2021-06-10 11:40:02', 'La Roche-Sur-Yon', 24, 8.07, 'clear sky', 'light rain', 'clear sky', 'clear sky'),
(174, '2021-06-10 11:41:02', 'La Roche-Sur-Yon', 24, 8.07, 'clear sky', 'light rain', 'clear sky', 'clear sky'),
(175, '2021-06-10 11:42:02', 'La Roche-Sur-Yon', 24, 8.07, 'clear sky', 'light rain', 'clear sky', 'clear sky'),
(176, '2021-06-10 12:33:02', 'La Roche-Sur-Yon', 24, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(177, '2021-06-10 12:34:02', 'La Roche-Sur-Yon', 24, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(178, '2021-06-10 12:35:02', 'La Roche-Sur-Yon', 24, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(179, '2021-06-10 12:36:02', 'La Roche-Sur-Yon', 24, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(180, '2021-06-10 12:37:03', 'La Roche-Sur-Yon', 24, 7.5, 'few clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(181, '2021-06-10 12:38:02', 'La Roche-Sur-Yon', 24, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(182, '2021-06-10 12:39:03', 'La Roche-Sur-Yon', 24, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(183, '2021-06-10 12:40:05', 'La Roche-Sur-Yon', 24, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(184, '2021-06-10 12:41:02', 'La Roche-Sur-Yon', 24, 7.5, 'few clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(185, '2021-06-10 12:42:02', 'La Roche-Sur-Yon', 24, 7.5, 'few clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(186, '2021-06-10 12:43:02', 'La Roche-Sur-Yon', 24, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(187, '2021-06-10 12:44:02', 'La Roche-Sur-Yon', 25, 7.5, 'few clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(188, '2021-06-10 12:45:03', 'La Roche-Sur-Yon', 25, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(189, '2021-06-10 12:46:02', 'La Roche-Sur-Yon', 25, 7.5, 'few clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(190, '2021-06-10 12:47:02', 'La Roche-Sur-Yon', 25, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(191, '2021-06-10 12:48:02', 'La Roche-Sur-Yon', 25, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(192, '2021-06-10 12:49:02', 'La Roche-Sur-Yon', 25, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(193, '2021-06-10 12:50:04', 'La Roche-Sur-Yon', 25, 7.5, 'few clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(194, '2021-06-10 12:51:02', 'La Roche-Sur-Yon', 25, 7.5, 'few clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(195, '2021-06-10 12:52:02', 'La Roche-Sur-Yon', 25, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(196, '2021-06-10 12:53:02', 'La Roche-Sur-Yon', 25, 7.5, 'few clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(197, '2021-06-10 12:54:02', 'La Roche-Sur-Yon', 25, 7.5, 'few clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(198, '2021-06-10 12:55:05', 'La Roche-Sur-Yon', 25, 7.5, 'few clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(199, '2021-06-10 12:56:02', 'La Roche-Sur-Yon', 25, 7.5, 'few clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(200, '2021-06-10 12:57:02', 'La Roche-Sur-Yon', 25, 7.5, 'few clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(201, '2021-06-10 12:58:03', 'La Roche-Sur-Yon', 25, 7.5, 'few clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(202, '2021-06-10 12:59:02', 'La Roche-Sur-Yon', 25, 7.5, 'few clouds', 'light rain', 'clear sky', 'clear sky'),
(203, '2021-06-10 13:00:55', 'La Roche-Sur-Yon', 25, 7.5, 'few clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(204, '2021-06-10 13:01:03', 'La Roche-Sur-Yon', 25, 7.5, 'few clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(205, '2021-06-10 13:02:02', 'La Roche-Sur-Yon', 25, 7.5, 'few clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(206, '2021-06-10 13:03:02', 'La Roche-Sur-Yon', 25, 7.5, 'few clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(207, '2021-06-10 13:04:02', 'La Roche-Sur-Yon', 25, 7.5, 'few clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(208, '2021-06-10 13:05:02', 'La Roche-Sur-Yon', 25, 7.5, 'few clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(209, '2021-06-10 13:06:02', 'La Roche-Sur-Yon', 25, 7.5, 'few clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(210, '2021-06-10 13:07:02', 'La Roche-Sur-Yon', 25, 7.5, 'few clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(211, '2021-06-10 13:08:03', 'La Roche-Sur-Yon', 25, 7.5, 'few clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(212, '2021-06-10 13:09:02', 'La Roche-Sur-Yon', 25, 7.5, 'few clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(213, '2021-06-10 13:10:02', 'La Roche-Sur-Yon', 25, 7.5, 'few clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(214, '2021-06-10 13:11:02', 'La Roche-Sur-Yon', 25, 7.5, 'few clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(215, '2021-06-10 13:12:03', 'La Roche-Sur-Yon', 25, 7.5, 'few clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(216, '2021-06-10 13:13:02', 'La Roche-Sur-Yon', 25, 7.5, 'few clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(217, '2021-06-10 13:14:02', 'La Roche-Sur-Yon', 25, 7.5, 'few clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(218, '2021-06-10 13:15:02', 'La Roche-Sur-Yon', 25, 7.5, 'few clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(219, '2021-06-10 13:16:03', 'La Roche-Sur-Yon', 26, 7.5, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(220, '2021-06-10 13:17:02', 'La Roche-Sur-Yon', 26, 7.5, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(221, '2021-06-10 13:18:02', 'La Roche-Sur-Yon', 26, 7.5, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(222, '2021-06-10 13:19:02', 'La Roche-Sur-Yon', 26, 7.5, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(223, '2021-06-10 13:20:03', 'La Roche-Sur-Yon', 26, 7.5, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(224, '2021-06-10 13:21:02', 'La Roche-Sur-Yon', 26, 7.5, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(225, '2021-06-10 13:22:02', 'La Roche-Sur-Yon', 26, 7.5, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(226, '2021-06-10 13:23:03', 'La Roche-Sur-Yon', 26, 7.5, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(227, '2021-06-10 13:24:02', 'La Roche-Sur-Yon', 26, 7.5, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(228, '2021-06-10 13:25:03', 'La Roche-Sur-Yon', 26, 7.5, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(229, '2021-06-10 13:26:02', 'La Roche-Sur-Yon', 26, 7.5, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(230, '2021-06-10 13:27:02', 'La Roche-Sur-Yon', 26, 7.5, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(231, '2021-06-10 13:28:02', 'La Roche-Sur-Yon', 26, 7.5, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(232, '2021-06-10 13:29:02', 'La Roche-Sur-Yon', 26, 7.5, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(233, '2021-06-10 13:30:12', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(234, '2021-06-10 13:31:02', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(235, '2021-06-10 13:32:02', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(236, '2021-06-10 13:33:02', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(237, '2021-06-10 13:34:02', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(238, '2021-06-10 13:35:03', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(239, '2021-06-10 13:36:02', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(240, '2021-06-10 13:37:02', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(241, '2021-06-10 13:38:02', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(242, '2021-06-10 13:39:03', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(243, '2021-06-10 13:40:05', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(244, '2021-06-10 13:41:03', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(245, '2021-06-10 13:42:02', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(246, '2021-06-10 13:43:02', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(247, '2021-06-10 13:44:02', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(248, '2021-06-10 13:45:07', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(249, '2021-06-10 13:46:02', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(250, '2021-06-10 13:47:02', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(251, '2021-06-10 13:48:02', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(252, '2021-06-10 13:49:02', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(253, '2021-06-10 13:50:18', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(254, '2021-06-10 13:51:02', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(255, '2021-06-10 13:52:02', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(256, '2021-06-10 13:53:02', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(257, '2021-06-10 13:54:02', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(258, '2021-06-10 13:55:03', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(259, '2021-06-10 13:56:02', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(260, '2021-06-10 13:57:03', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(261, '2021-06-10 13:58:02', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(262, '2021-06-10 13:59:02', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(263, '2021-06-10 14:00:03', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(264, '2021-06-10 14:01:04', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(265, '2021-06-10 14:02:02', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(266, '2021-06-10 14:03:02', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(267, '2021-06-10 14:04:02', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(268, '2021-06-10 14:05:04', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(269, '2021-06-10 14:06:02', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(270, '2021-06-10 14:07:02', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(271, '2021-06-10 14:08:02', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(272, '2021-06-10 14:09:02', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(273, '2021-06-10 14:10:05', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(274, '2021-06-10 14:11:02', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(275, '2021-06-10 14:12:02', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(276, '2021-06-10 14:13:02', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(277, '2021-06-10 14:14:02', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(278, '2021-06-10 14:15:03', 'La Roche-Sur-Yon', 26, 6.31, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(279, '2021-06-10 14:16:03', 'La Roche-Sur-Yon', 27, 6.31, 'scattered clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(280, '2021-06-10 14:17:02', 'La Roche-Sur-Yon', 27, 6.31, 'scattered clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(281, '2021-06-10 14:18:02', 'La Roche-Sur-Yon', 27, 6.31, 'scattered clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(282, '2021-06-10 14:19:02', 'La Roche-Sur-Yon', 27, 6.31, 'scattered clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(283, '2021-06-10 14:20:09', 'La Roche-Sur-Yon', 27, 6.31, 'scattered clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(284, '2021-06-10 14:21:02', 'La Roche-Sur-Yon', 27, 6.31, 'scattered clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(285, '2021-06-10 14:22:02', 'La Roche-Sur-Yon', 27, 6.31, 'scattered clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(286, '2021-06-10 14:23:02', 'La Roche-Sur-Yon', 27, 6.31, 'scattered clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(287, '2021-06-10 14:24:03', 'La Roche-Sur-Yon', 27, 6.31, 'scattered clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(288, '2021-06-10 14:25:02', 'La Roche-Sur-Yon', 27, 6.31, 'scattered clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(289, '2021-06-10 14:26:02', 'La Roche-Sur-Yon', 27, 6.31, 'scattered clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(290, '2021-06-10 14:27:02', 'La Roche-Sur-Yon', 27, 6.31, 'scattered clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(291, '2021-06-10 14:28:02', 'La Roche-Sur-Yon', 27, 6.31, 'scattered clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(292, '2021-06-10 14:29:02', 'La Roche-Sur-Yon', 27, 6.31, 'scattered clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(293, '2021-06-10 14:30:09', 'La Roche-Sur-Yon', 27, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(294, '2021-06-10 14:31:03', 'La Roche-Sur-Yon', 27, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(295, '2021-06-10 14:32:02', 'La Roche-Sur-Yon', 27, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(296, '2021-06-10 14:33:03', 'La Roche-Sur-Yon', 27, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(297, '2021-06-10 14:34:02', 'La Roche-Sur-Yon', 27, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(298, '2021-06-10 14:35:03', 'La Roche-Sur-Yon', 27, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(299, '2021-06-10 14:36:02', 'La Roche-Sur-Yon', 27, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(300, '2021-06-10 14:37:02', 'La Roche-Sur-Yon', 27, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(301, '2021-06-10 14:38:03', 'La Roche-Sur-Yon', 27, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(302, '2021-06-10 14:39:02', 'La Roche-Sur-Yon', 27, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(303, '2021-06-10 14:40:03', 'La Roche-Sur-Yon', 27, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(304, '2021-06-10 14:41:02', 'La Roche-Sur-Yon', 27, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(305, '2021-06-10 14:42:02', 'La Roche-Sur-Yon', 27, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(306, '2021-06-10 14:43:02', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(307, '2021-06-10 14:44:02', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(308, '2021-06-10 14:45:02', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(309, '2021-06-10 14:46:03', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(310, '2021-06-10 14:47:02', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(311, '2021-06-10 14:48:02', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(312, '2021-06-10 14:49:02', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(313, '2021-06-10 14:50:04', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(314, '2021-06-10 14:51:03', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(315, '2021-06-10 14:52:02', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(316, '2021-06-10 14:53:02', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(317, '2021-06-10 14:54:02', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(318, '2021-06-10 14:55:03', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(319, '2021-06-10 14:56:02', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(320, '2021-06-10 14:57:02', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(321, '2021-06-10 14:58:02', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(322, '2021-06-10 14:59:02', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(323, '2021-06-10 15:00:04', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(324, '2021-06-10 15:01:02', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(325, '2021-06-10 15:02:03', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(326, '2021-06-10 15:03:02', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(327, '2021-06-10 15:04:02', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(328, '2021-06-10 15:05:02', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(329, '2021-06-10 15:06:04', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(330, '2021-06-10 15:07:02', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(331, '2021-06-10 15:08:03', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(332, '2021-06-10 15:09:02', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(333, '2021-06-10 15:10:03', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(334, '2021-06-10 15:11:02', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(335, '2021-06-10 15:12:02', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(336, '2021-06-10 15:13:02', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(337, '2021-06-10 15:14:02', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(338, '2021-06-10 15:15:03', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(339, '2021-06-10 15:16:03', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(340, '2021-06-10 15:17:02', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(341, '2021-06-10 15:18:07', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(342, '2021-06-10 15:19:02', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(343, '2021-06-10 15:20:02', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(344, '2021-06-10 15:21:02', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(345, '2021-06-10 15:22:03', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(346, '2021-06-10 15:23:02', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(347, '2021-06-10 15:24:03', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(348, '2021-06-10 15:25:01', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(349, '2021-06-10 15:26:02', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(350, '2021-06-10 15:27:02', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(351, '2021-06-10 15:28:02', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky'),
(352, '2021-06-10 15:29:02', 'La Roche-Sur-Yon', 26, 4.65, 'broken clouds', 'clear sky', 'scattered clouds', 'clear sky');

-- --------------------------------------------------------

--
-- Table structure for table `PARAMETRE`
--

CREATE TABLE `PARAMETRE` (
  `ID` int(11) NOT NULL,
  `R` smallint(6) NOT NULL,
  `Rmax` smallint(6) NOT NULL,
  `Dt` smallint(6) NOT NULL,
  `ETAT` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `PARAMETRE`
--

INSERT INTO `PARAMETRE` (`ID`, `R`, `Rmax`, `Dt`, `ETAT`) VALUES
(1, 10, 55, 16, 2);

-- --------------------------------------------------------

--
-- Table structure for table `REGULATION`
--

CREATE TABLE `REGULATION` (
  `ID` int(11) NOT NULL,
  `Dton` smallint(6) NOT NULL,
  `Dtoff` smallint(6) NOT NULL,
  `Rmin` smallint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `REGULATION`
--

INSERT INTO `REGULATION` (`ID`, `Dton`, `Dtoff`, `Rmin`) VALUES
(1, 91, 69, 78);

-- --------------------------------------------------------

--
-- Table structure for table `S`
--

CREATE TABLE `S` (
  `ID` int(11) NOT NULL,
  `DATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `T1` smallint(6) DEFAULT NULL,
  `T2` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `S`
--

INSERT INTO `S` (`ID`, `DATE`, `T1`, `T2`) VALUES
(1296, '2021-05-31 08:26:50', 22, 25),
(1297, '2021-05-31 08:26:54', 22, 25),
(1298, '2021-06-01 12:05:53', 22, 25),
(1299, '2021-06-01 12:06:49', 26, 27),
(1300, '2021-06-01 12:06:53', 26, 27),
(1301, '2021-06-01 12:09:03', 34, 38),
(1302, '2021-06-01 12:09:07', 34, 38),
(1303, '2021-06-08 07:09:27', 45, 25),
(1304, '2021-06-08 07:18:57', 22, 23),
(1305, '2021-06-08 07:19:01', 22, 23),
(1306, '2021-06-08 07:19:06', 22, 23),
(1307, '2021-06-08 07:19:10', 22, 23),
(1308, '2021-06-08 07:19:13', 22, 23),
(1309, '2021-06-08 07:19:18', 22, 23),
(1310, '2021-06-08 07:19:22', 22, 23),
(1311, '2021-06-08 07:19:26', 22, 23),
(1312, '2021-06-08 07:19:36', 22, 23),
(1313, '2021-06-09 20:03:27', 47, 25),
(1314, '2021-06-10 07:44:56', 23, 43),
(1315, '2021-06-10 08:48:47', 52, 36);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AGENDA`
--
ALTER TABLE `AGENDA`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `CIRCUL`
--
ALTER TABLE `CIRCUL`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `HeureOccupation`
--
ALTER TABLE `HeureOccupation`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `METEO`
--
ALTER TABLE `METEO`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `PARAMETRE`
--
ALTER TABLE `PARAMETRE`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `REGULATION`
--
ALTER TABLE `REGULATION`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `S`
--
ALTER TABLE `S`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `AGENDA`
--
ALTER TABLE `AGENDA`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `CIRCUL`
--
ALTER TABLE `CIRCUL`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `HeureOccupation`
--
ALTER TABLE `HeureOccupation`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `METEO`
--
ALTER TABLE `METEO`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=353;
--
-- AUTO_INCREMENT for table `PARAMETRE`
--
ALTER TABLE `PARAMETRE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `REGULATION`
--
ALTER TABLE `REGULATION`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `S`
--
ALTER TABLE `S`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1316;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
