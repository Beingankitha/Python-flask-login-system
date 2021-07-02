-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: CO3102_CW2_2020
-- ------------------------------------------------------
-- Server version	5.7.15

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
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Admin` (
  `Username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `PasswordHash` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
INSERT INTO `Admin` VALUES ('admin','5994471ABB01112AFCC18159F6CC74B4F511B99806DA59B3CAF5A9C173CACFC5'),('tester','36BBE50ED96841D10443BCB670D6554F0A34B761BE67EC9C4A8AD2C0C44CA42C');
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HomeTestKit`
--

DROP TABLE IF EXISTS `HomeTestKit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HomeTestKit` (
  `TNN_Code` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `used` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`TNN_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HomeTestKit`
--

LOCK TABLES `HomeTestKit` WRITE;
/*!40000 ALTER TABLE `HomeTestKit` DISABLE KEYS */;
INSERT INTO `HomeTestKit` VALUES ('34GC829B','1'),('4F7YKH9G','0'),('57UBS5J6','0'),('8RL4ENTK','0'),('CB8FBCCM','0'),('CCZTQ8KW','0'),('FEQQ6UUG','0'),('MM2874Z6','0'),('R9KZ2NXL','0'),('YBQUVXHL','0');
/*!40000 ALTER TABLE `HomeTestKit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TestResult`
--

DROP TABLE IF EXISTS `TestResult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TestResult` (
  `Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Fullname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Gender` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Address` longtext COLLATE utf8_unicode_ci,
  `Postcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TTN` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TestResult` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TestResult`
--

LOCK TABLES `TestResult` WRITE;
/*!40000 ALTER TABLE `TestResult` DISABLE KEYS */;
INSERT INTO `TestResult` VALUES ('abc@le.ac.uk','John Smith',30,'M','University Road, Leicester','LE1 7RH',NULL,'Negative');
/*!40000 ALTER TABLE `TestResult` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-04  2:55:47
