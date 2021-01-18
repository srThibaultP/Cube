-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 16, 2020 at 08:02 AM
-- Server version: 10.3.27-MariaDB-0+deb10u1
-- PHP Version: 7.3.19-1~deb10u1

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
  `CHEMIN` tinyint(1) NOT NULL DEFAULT 0
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
-- Table structure for table `S1`
--

CREATE TABLE `S1` (
  `ID` int(11) NOT NULL,
  `T1` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `S2`
--

CREATE TABLE `S2` (
  `ID` int(11) NOT NULL,
  `T2` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Indexes for table `S1`
--
ALTER TABLE `S1`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `S2`
--
ALTER TABLE `S2`
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
-- AUTO_INCREMENT for table `S1`
--
ALTER TABLE `S1`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `S2`
--
ALTER TABLE `S2`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
