-- MySQL dump 10.13  Distrib 5.5.53, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: 
-- ------------------------------------------------------
-- Server version	5.5.53-0ubuntu0.14.04.1

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
-- Current Database: `g06u29`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `g06u29` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `g06u29`;

--
-- Table structure for table `g00u00_pet`
--

DROP TABLE IF EXISTS `g00u00_pet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g00u00_pet` (
  `g00u00_name` varchar(20) DEFAULT NULL,
  `g00u00_owner` varchar(20) DEFAULT NULL,
  `g00u00_species` varchar(20) DEFAULT NULL,
  `g00u00_sex` char(1) DEFAULT NULL,
  `g00u00_birth` date DEFAULT NULL,
  `g00u00_death` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g00u00_pet`
--

LOCK TABLES `g00u00_pet` WRITE;
/*!40000 ALTER TABLE `g00u00_pet` DISABLE KEYS */;
/*!40000 ALTER TABLE `g00u00_pet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_table`
--

DROP TABLE IF EXISTS `new_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `new_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name1` varchar(45) DEFAULT NULL COMMENT 'p',
  `price` decimal(10,2) NOT NULL COMMENT 'цена',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Комментарии';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_table`
--

LOCK TABLES `new_table` WRITE;
/*!40000 ALTER TABLE `new_table` DISABLE KEYS */;
INSERT INTO `new_table` VALUES (1,'1',2.00),(2,'3',4.00),(3,'44',44.00),(4,'3',4.00),(5,'3',4.00),(6,'3',4.00),(7,'3',4.00),(8,'3',4.00),(9,'3',4.00);
/*!40000 ALTER TABLE `new_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet`
--

DROP TABLE IF EXISTS `pet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `owner` varchar(20) DEFAULT NULL,
  `species` varchar(20) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `death` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet`
--

LOCK TABLES `pet` WRITE;
/*!40000 ALTER TABLE `pet` DISABLE KEYS */;
INSERT INTO `pet` VALUES (1,'Fluffy','Harold','cat','f','1993-02-04',NULL),(2,'Claws','Gwen','cat','m','1994-03-17',NULL),(3,'Buffy','Harold','dog','f','1989-05-13',NULL),(4,'Fang','Benny','dog','m','1990-08-27',NULL),(5,'Bowser','Diane','dog','m','1979-08-31','1995-07-29'),(6,'Chirpy','Gwen','bird','f','1998-09-11',NULL),(7,'Whistler','Gwen','bird',NULL,'1997-12-09',NULL),(8,'Slim','Benny','snake','m','1996-04-29',NULL),(9,'Chirpy','Gwen','bird','f','1998-09-11',NULL),(10,'Whistler','Gwen','bird',NULL,'1997-12-09',NULL),(11,'Slim','Benny','snake','m','1996-04-29',NULL);
/*!40000 ALTER TABLE `pet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet2`
--

DROP TABLE IF EXISTS `pet2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pet2` (
  `name` varchar(20) DEFAULT NULL,
  `owner` varchar(20) DEFAULT NULL,
  `species` varchar(20) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `death` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet2`
--

LOCK TABLES `pet2` WRITE;
/*!40000 ALTER TABLE `pet2` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet3`
--

DROP TABLE IF EXISTS `pet3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pet3` (
  `name` varchar(20) DEFAULT NULL,
  `owner` varchar(20) DEFAULT NULL,
  `species` varchar(20) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `death` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet3`
--

LOCK TABLES `pet3` WRITE;
/*!40000 ALTER TABLE `pet3` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_new`
--

DROP TABLE IF EXISTS `pet_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pet_new` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `owner` varchar(20) DEFAULT NULL,
  `species` varchar(20) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `death` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_new`
--

LOCK TABLES `pet_new` WRITE;
/*!40000 ALTER TABLE `pet_new` DISABLE KEYS */;
INSERT INTO `pet_new` VALUES (1,'Fluffy','Harold','cat','f','1993-02-04',NULL),(2,'Claws','Gwen','cat','m','1994-03-17',NULL),(3,'Buffy','Harold','dog','f','1989-05-13',NULL),(4,'Fang','Benny','dog','m','1990-08-27',NULL),(5,'Bowser','Diane','dog','m','1979-08-31','1995-07-29'),(6,'Chirpy','Gwen','bird','f','1998-09-11',NULL),(7,'Whistler','Gwen','bird',NULL,'1997-12-09',NULL),(8,'Slim','Benny','snake','m','1996-04-29',NULL),(9,'Chirpy','Gwen','bird','f','1998-09-11',NULL),(10,'Whistler','Gwen','bird',NULL,'1997-12-09',NULL),(11,'Slim','Benny','snake','m','1996-04-29',NULL);
/*!40000 ALTER TABLE `pet_new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_pet`
--

DROP TABLE IF EXISTS `wb_pet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_pet` (
  `g01u00_name` varchar(20) DEFAULT NULL,
  `g01u00_owner` varchar(20) DEFAULT NULL,
  `g01u00_species` varchar(20) DEFAULT NULL,
  `g01u00_sex` set('m','f') DEFAULT NULL,
  `g01u00_birth` date DEFAULT NULL,
  `g01u00_death` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_pet`
--

LOCK TABLES `wb_pet` WRITE;
/*!40000 ALTER TABLE `wb_pet` DISABLE KEYS */;
/*!40000 ALTER TABLE `wb_pet` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-24 16:23:36
