-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: BDDCube
-- ------------------------------------------------------
-- Server version	5.5.5-10.3.25-MariaDB-0ubuntu0.20.04.1-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CIRCUL`
--

DROP TABLE IF EXISTS `CIRCUL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CIRCUL` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VILLE` varchar(50) DEFAULT NULL,
  `TEMP` smallint(6) DEFAULT NULL,
  `HUMIDITY` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CIRCUL`
--

LOCK TABLES `CIRCUL` WRITE;
/*!40000 ALTER TABLE `CIRCUL` DISABLE KEYS */;
/*!40000 ALTER TABLE `CIRCUL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `METEO`
--

DROP TABLE IF EXISTS `METEO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `METEO` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE` datetime NOT NULL DEFAULT current_timestamp(),
  `VILLE` text NOT NULL,
  `TEMP` smallint(6) NOT NULL,
  `HUMIDITY` smallint(6) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `METEO`
--

LOCK TABLES `METEO` WRITE;
/*!40000 ALTER TABLE `METEO` DISABLE KEYS */;
/*!40000 ALTER TABLE `METEO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARAMETRE`
--

DROP TABLE IF EXISTS `PARAMETRE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PARAMETRE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `R` smallint(6) NOT NULL,
  `Rmax` smallint(6) NOT NULL,
  `Dt` smallint(6) NOT NULL,
  `ETAT` smallint(6) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARAMETRE`
--

LOCK TABLES `PARAMETRE` WRITE;
/*!40000 ALTER TABLE `PARAMETRE` DISABLE KEYS */;
INSERT INTO `PARAMETRE` VALUES (1,10,29,77,2);
/*!40000 ALTER TABLE `PARAMETRE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REGULATION`
--

DROP TABLE IF EXISTS `REGULATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REGULATION` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Dton` smallint(6) NOT NULL,
  `Dtoff` smallint(6) NOT NULL,
  `Rmin` smallint(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REGULATION`
--

LOCK TABLES `REGULATION` WRITE;
/*!40000 ALTER TABLE `REGULATION` DISABLE KEYS */;
INSERT INTO `REGULATION` VALUES (1,68,73,41);
/*!40000 ALTER TABLE `REGULATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `S`
--

DROP TABLE IF EXISTS `S`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `S` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `T1` smallint(6) DEFAULT NULL,
  `T2` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `S`
--

LOCK TABLES `S` WRITE;
/*!40000 ALTER TABLE `S` DISABLE KEYS */;
INSERT INTO `S` VALUES (1,23,3),(2,23,3),(3,23,3),(4,23,3),(5,23,3),(6,23,3),(7,23,3),(8,23,3),(9,23,3),(10,23,3),(11,23,23),(12,23,23),(13,23,23),(14,23,23),(15,23,23),(16,23,23),(17,23,23),(18,23,19),(19,29,5),(20,100,23);
/*!40000 ALTER TABLE `S` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'BDDCube'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-30 17:44:36
