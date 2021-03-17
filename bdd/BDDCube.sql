-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 15, 2021 at 11:32 AM
-- Server version: 10.3.27-MariaDB-0+deb10u1
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
  `COND` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `CIRCUL`
--

CREATE TABLE `CIRCUL` (
  `ID` int(11) NOT NULL,
  `R` float DEFAULT NULL,
  `CHEMIN` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `METEO`
--

CREATE TABLE `METEO` (
  `ID` int(11) NOT NULL,
  `COND` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `PARAMETRE`
--

CREATE TABLE `PARAMETRE` (
  `ID` int(11) NOT NULL,
  `R` int(11) DEFAULT NULL,
  `Rmax` int(11) DEFAULT NULL,
  `Rmin` int(11) DEFAULT NULL,
  `Dt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `REGULATION`
--

CREATE TABLE `REGULATION` (
  `ID` int(11) NOT NULL,
  `Dton` int(11) DEFAULT NULL,
  `Dtoff` int(11) DEFAULT NULL,
  `Rmin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `S`
--

CREATE TABLE `S` (
  `ID` int(11) NOT NULL,
  `T1` smallint(6) DEFAULT NULL,
  `T2` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `S`
--

INSERT INTO `S` (`ID`, `T1`, `T2`) VALUES
(1, 25, 21),
(2, 25, 21),
(3, 25, 21),
(4, 22, 21),
(5, 22, 21),
(6, 22, 21),
(7, 22, 21),
(8, 22, 21),
(9, 22, 21),
(10, 22, 21),
(11, 22, 21),
(12, 22, 21),
(13, 22, 21),
(14, 22, 21),
(15, 22, 21),
(16, 22, 21),
(17, 22, 21),
(18, 22, 21),
(19, 22, 21),
(20, 22, 21),
(21, 22, 21),
(22, 22, 21),
(23, 22, 21),
(24, 22, 21),
(25, 22, 21),
(26, 22, 21),
(27, 22, 21),
(28, 22, 21),
(29, 22, 21),
(30, 22, 21),
(31, 21, 21),
(32, 21, 21),
(33, 21, 21),
(34, 21, 21),
(35, 21, 21),
(36, 21, 21),
(37, 21, 21),
(38, 21, 21),
(39, 21, 21),
(40, 21, 21),
(41, 21, 21),
(42, 21, 21);

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `CIRCUL`
--
ALTER TABLE `CIRCUL`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `METEO`
--
ALTER TABLE `METEO`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `PARAMETRE`
--
ALTER TABLE `PARAMETRE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `REGULATION`
--
ALTER TABLE `REGULATION`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `S`
--
ALTER TABLE `S`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
