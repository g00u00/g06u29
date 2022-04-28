-- MySQL dump 10.13  Distrib 5.5.53, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: g06u29
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
-- Table structure for table `06u29_staff`
--

DROP TABLE IF EXISTS `06u29_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `06u29_staff` (
  `id_staff` int(11) NOT NULL AUTO_INCREMENT,
  `g06u29_fk_main` int(11) DEFAULT NULL,
  `second_name` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_staff`),
  KEY `g06u29_fk_main` (`g06u29_fk_main`),
  CONSTRAINT `g06u29_fk_main` FOREIGN KEY (`g06u29_fk_main`) REFERENCES `g06u29_main` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `06u29_staff`
--

LOCK TABLES `06u29_staff` WRITE;
/*!40000 ALTER TABLE `06u29_staff` DISABLE KEYS */;
INSERT INTO `06u29_staff` VALUES (1,1,'Иванов','Иван'),(2,1,'Петров','Петр'),(3,2,'Сидоров','Николай');
/*!40000 ALTER TABLE `06u29_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_list`
--

DROP TABLE IF EXISTS `db_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `db_variable_1` varchar(255) NOT NULL,
  `db_variable_2` decimal(10,0) NOT NULL,
  `db_variable_3` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_list`
--

LOCK TABLES `db_list` WRITE;
/*!40000 ALTER TABLE `db_list` DISABLE KEYS */;
INSERT INTO `db_list` VALUES (1,'1',2,3),(2,'10',20,35),(3,'1',2,3),(4,'1',2,3),(5,'1',2,3),(6,'1',2,3),(7,'1',2,3),(8,'1',2,3),(9,'1',2,3),(10,'1',2,3);
/*!40000 ALTER TABLE `db_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_report`
--

DROP TABLE IF EXISTS `db_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_report` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `var_1` int(10) NOT NULL DEFAULT '0',
  `var_2` int(10) NOT NULL DEFAULT '0',
  `var_3` int(10) NOT NULL DEFAULT '0',
  `var_4` int(10) NOT NULL DEFAULT '0',
  `var_5` int(10) NOT NULL DEFAULT '0',
  `var_6` int(10) NOT NULL DEFAULT '0',
  `var_7` int(10) NOT NULL DEFAULT '0',
  `var_8` int(10) NOT NULL DEFAULT '0',
  `var_9` int(10) NOT NULL DEFAULT '0',
  `var_10` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_report`
--

LOCK TABLES `db_report` WRITE;
/*!40000 ALTER TABLE `db_report` DISABLE KEYS */;
INSERT INTO `db_report` VALUES (1,1,1,1,1,1,1,1,1,1,1),(2,0,0,0,0,0,0,0,0,0,0),(3,1,3,3,3,3,3,3,3,3,0),(4,1,3,0,0,0,0,0,0,0,0),(5,1,3,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `db_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g00u18_oboi`
--

DROP TABLE IF EXISTS `g00u18_oboi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g00u18_oboi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `g00u18_task` varchar(512) DEFAULT '',
  `g00u18_length_of_wall` float DEFAULT '0' COMMENT 'Длина стены комнаты',
  `g00u18_height_of_wall` float DEFAULT '0' COMMENT 'Высота стены комнаты',
  `g00u18_width_of_wall` float DEFAULT '0' COMMENT 'Ширина стены комнаты',
  `g00u18_height_of_window` float DEFAULT '0' COMMENT 'Высота окна',
  `g00u18_width_of_window` float DEFAULT '0' COMMENT 'Ширина окна',
  `g00u18_height_of_door` float DEFAULT '0' COMMENT 'Высота двери',
  `g00u18_width_of_door` float DEFAULT '0' COMMENT 'Ширина двери',
  `g00u18_length_of_wallpaper` float DEFAULT '0' COMMENT 'Длина рулона обоев',
  `g00u18_width_of_wallpaper` float DEFAULT '0' COMMENT 'Ширина рулона обоев',
  `g00u18_result` int(11) DEFAULT NULL,
  `page_ip` varchar(255) NOT NULL,
  `page_date` date NOT NULL,
  `page_time` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g00u18_oboi`
--

LOCK TABLES `g00u18_oboi` WRITE;
/*!40000 ALTER TABLE `g00u18_oboi` DISABLE KEYS */;
INSERT INTO `g00u18_oboi` VALUES (1,'Зная длину',3,2,2,1,1,2,1,1,1,3,'','2020-11-26','10:49:00'),(2,'Зная длину',3,2,2,1,1,2,1,1,1,3,'','2020-11-26','10:50:35'),(3,'Зная длину',3,2,2,1,1,2,1,1,1,3,'','2020-11-26','10:50:40'),(4,'Зная длину, ширину и высоту комнаты, ширину и высоту оконного проёма, ширину и высоту дверного проёма, длину и ширину рулонов обоев, определить количество необходимых рулонов для оклеивания стен',3,2,2,1,1,2,1,1,1,3,'','2020-11-26','10:53:41'),(5,'Зная длину, ширину и высоту комнаты, ширину и высоту оконного проёма, ширину и высоту дверного проёма, длину и ширину рулонов обоев, определить количество необходимых рулонов для оклеивания стен',3,2,2,1,1,2,1,1,1,3,'','2020-11-26','10:53:49'),(6,'Зная длину, ширину и высоту комнаты, ширину и высоту оконного проёма, ширину и высоту дверного проёма, длину и ширину рулонов обоев, определить количество необходимых рулонов для оклеивания стен',3,2,2,1,1,2,1,1,1,3,'','2020-11-26','10:53:56'),(7,'Зная длину, ширину и высоту комнаты, ширину и высоту оконного проёма, ширину и высоту дверного проёма, длину и ширину рулонов обоев, определить количество необходимых рулонов для оклеивания стен',3,2,2,1,1,2,1,1,1,3,'','2020-11-26','10:54:49'),(8,'Зная длину, ширину и высоту комнаты, ширину и высоту оконного проёма, ширину и высоту дверного проёма, длину и ширину рулонов обоев, определить количество необходимых рулонов для оклеивания стен',3,2,2,1,1,2,1,1,1,3,'','2020-11-26','10:54:54'),(9,'Зная длину, ширину и высоту комнаты, ширину и высоту оконного проёма, ширину и высоту дверного проёма, длину и ширину рулонов обоев, определить количество необходимых рулонов для оклеивания стен',3,2,2,1,1,2,1,1,1,3,'','2020-11-26','10:55:21'),(10,'Зная длину, ширину и высоту комнаты, ширину и высоту оконного проёма, ширину и высоту дверного проёма, длину и ширину рулонов обоев, определить количество необходимых рулонов для оклеивания стен',3,2,2,1,1,2,1,1,1,3,'','2020-11-26','10:58:01'),(11,'Зная длину, ширину и высоту комнаты, ширину и высоту оконного проёма, ширину и высоту дверного проёма, длину и ширину рулонов обоев, определить количество необходимых рулонов для оклеивания стен',3,2,2,1,1,2,1,1,1,3,'','2020-11-26','11:05:11'),(12,'Зная длину, ширину и высоту комнаты, ширину и высоту оконного проёма, ширину и высоту дверного проёма, длину и ширину рулонов обоев, определить количество необходимых рулонов для оклеивания стен',3,2,2,1,1,2,1,1,1,3,'','2020-11-26','11:05:23'),(13,'Зная длину, ширину и высоту комнаты, ширину и высоту оконного проёма, ширину и высоту дверного проёма, длину и ширину рулонов обоев, определить количество необходимых рулонов для оклеивания стен',3,2,2,1,1,2,1,1,1,3,'','2020-11-26','11:05:34');
/*!40000 ALTER TABLE `g00u18_oboi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g00u76_base`
--

DROP TABLE IF EXISTS `g00u76_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g00u76_base` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `g00u76_task` varchar(512) NOT NULL DEFAULT 'Для указанного места в плацкартном вагоне поезда \n    (54 спальных места) определить: купе или боковое, верхне или нижнее.',
  `g00u76_number` int(11) DEFAULT '0' COMMENT 'Число, введённое пользователем',
  `g00u76_answer1` double DEFAULT '0',
  `g00u76_answer2` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g00u76_base`
--

LOCK TABLES `g00u76_base` WRITE;
/*!40000 ALTER TABLE `g00u76_base` DISABLE KEYS */;
INSERT INTO `g00u76_base` VALUES (1,'задание',1234,1,2);
/*!40000 ALTER TABLE `g00u76_base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g06u29_main`
--

DROP TABLE IF EXISTS `g06u29_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g06u29_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `species_manager` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g06u29_main`
--

LOCK TABLES `g06u29_main` WRITE;
/*!40000 ALTER TABLE `g06u29_main` DISABLE KEYS */;
INSERT INTO `g06u29_main` VALUES (1,'cat_manager'),(2,'dog_manager'),(3,'all_manager');
/*!40000 ALTER TABLE `g06u29_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g06u29_pet`
--

DROP TABLE IF EXISTS `g06u29_pet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g06u29_pet` (
  `g06u29_name` varchar(20) NOT NULL DEFAULT '',
  `g06u29_owner` enum('Harold','Gwen','Benny','Diane') DEFAULT NULL,
  `g06u29_species` varchar(20) DEFAULT NULL,
  `g06u29_sex` char(1) DEFAULT NULL,
  `g06u29_birth` date DEFAULT NULL,
  `g06u29_death` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g06u29_pet`
--

LOCK TABLES `g06u29_pet` WRITE;
/*!40000 ALTER TABLE `g06u29_pet` DISABLE KEYS */;
/*!40000 ALTER TABLE `g06u29_pet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_date_time`
--

DROP TABLE IF EXISTS `ip_date_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_date_time` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_ip` varchar(255) NOT NULL,
  `page_date` date NOT NULL,
  `page_time` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_date_time`
--

LOCK TABLES `ip_date_time` WRITE;
/*!40000 ALTER TABLE `ip_date_time` DISABLE KEYS */;
INSERT INTO `ip_date_time` VALUES (1,'176.213.4.73','2020-11-03','19:28:02'),(2,'176.213.4.73','2020-11-03','19:28:23'),(3,'176.213.4.73','2020-11-03','19:28:25'),(4,'176.213.4.73','2020-11-03','19:30:53'),(5,'176.213.4.73','2020-11-03','19:34:21'),(6,'176.213.4.73','2020-11-03','19:34:25'),(7,'176.213.4.73','2020-11-03','19:41:59'),(8,'176.213.4.73','2020-11-03','19:44:03'),(9,'77.111.247.223','2020-11-03','19:45:01'),(10,'77.111.247.223','2020-11-03','19:45:24'),(11,'77.111.247.223','2020-11-03','19:45:26'),(12,'176.213.4.73','2020-11-12','10:26:44'),(13,'176.213.4.73','2020-11-12','10:27:27'),(14,'176.213.4.73','2020-11-12','10:27:27'),(15,'176.213.4.73','2020-11-12','10:27:29'),(16,'176.213.4.73','2020-11-12','10:27:30'),(17,'176.213.4.73','2020-11-12','10:27:44'),(18,'176.213.4.73','2020-11-12','10:27:46'),(19,'176.213.4.73','2020-11-12','10:27:48'),(20,'176.213.4.73','2020-11-12','10:30:48'),(21,'176.213.4.73','2020-11-12','10:30:51'),(22,'176.213.4.73','2020-11-12','10:30:52'),(23,'176.213.4.73','2020-11-12','10:30:56'),(24,'176.213.4.73','2020-11-12','10:31:06'),(25,'176.213.4.73','2020-11-12','10:31:07'),(26,'89.109.30.75','2020-12-09','11:30:32'),(27,'82.208.114.250','2020-12-18','14:54:09');
/*!40000 ALTER TABLE `ip_date_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pymysql_test`
--

DROP TABLE IF EXISTS `pymysql_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pymysql_test` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `varchar_1` varchar(250) NOT NULL DEFAULT '',
  `bigint_1` bigint(20) NOT NULL DEFAULT '0',
  `double_1` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pymysql_test`
--

LOCK TABLES `pymysql_test` WRITE;
/*!40000 ALTER TABLE `pymysql_test` DISABLE KEYS */;
INSERT INTO `pymysql_test` VALUES (1,'Формулировка',12345,67890);
/*!40000 ALTER TABLE `pymysql_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_name_owner`
--

DROP TABLE IF EXISTS `view_name_owner`;
/*!50001 DROP VIEW IF EXISTS `view_name_owner`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_name_owner` (
  `g06u29_name` tinyint NOT NULL,
  `g06u29_owner` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_name_owner`
--

/*!50001 DROP TABLE IF EXISTS `view_name_owner`*/;
/*!50001 DROP VIEW IF EXISTS `view_name_owner`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`g06u29`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_name_owner` AS select `g06u29_pet`.`g06u29_name` AS `g06u29_name`,`g06u29_pet`.`g06u29_owner` AS `g06u29_owner` from `g06u29_pet` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-30 15:26:34
