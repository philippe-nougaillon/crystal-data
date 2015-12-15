-- MySQL dump 10.13  Distrib 5.5.46, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: AEMMS-UK
-- ------------------------------------------------------
-- Server version	5.5.46-0ubuntu0.14.04.2

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
-- Table structure for table `chantiers`
--

DROP TABLE IF EXISTS `chantiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chantiers` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `lieu` varchar(255) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `cloture` tinyint(1) DEFAULT '0',
  `annee` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chantiers`
--

LOCK TABLES `chantiers` WRITE;
/*!40000 ALTER TABLE `chantiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `chantiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controles`
--

DROP TABLE IF EXISTS `controles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controles` (
  `id` int(11) NOT NULL,
  `localization_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `defaut` varchar(255) DEFAULT NULL,
  `czmcale010` varchar(255) DEFAULT NULL,
  `czmcale015` varchar(255) DEFAULT NULL,
  `czmcale020` varchar(255) DEFAULT NULL,
  `csrcale010` varchar(255) DEFAULT NULL,
  `csrcale015` varchar(255) DEFAULT NULL,
  `csrcale020` varchar(255) DEFAULT NULL,
  `longueur1` int(11) DEFAULT NULL,
  `tracecale050` varchar(255) DEFAULT NULL,
  `tracecale1` varchar(255) DEFAULT NULL,
  `longueur2` int(11) DEFAULT NULL,
  `etiqcharge` varchar(255) DEFAULT NULL,
  `etiqmoule` varchar(255) DEFAULT NULL,
  `obs` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `profil_e1` int(11) DEFAULT NULL,
  `profil_e2` int(11) DEFAULT NULL,
  `profil_pointu` decimal(10,0) DEFAULT NULL,
  `profil_creux` int(11) DEFAULT NULL,
  `profil_longueur_meulage` int(11) DEFAULT NULL,
  `trace_sortante` int(11) DEFAULT NULL,
  `trace_entrante` int(11) DEFAULT NULL,
  `trace_longueur_meulage` int(11) DEFAULT NULL,
  `decision` int(11) DEFAULT NULL,
  `identification_soudure` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controles`
--

LOCK TABLES `controles` WRITE;
/*!40000 ALTER TABLE `controles` DISABLE KEYS */;
/*!40000 ALTER TABLE `controles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grindings`
--

DROP TABLE IF EXISTS `grindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grindings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `metrage` varchar(255) DEFAULT NULL,
  `rail` varchar(255) DEFAULT NULL,
  `railsidewearreading` varchar(255) DEFAULT NULL,
  `RailDepth` int(11) DEFAULT NULL,
  `TrackGauge` int(11) DEFAULT NULL,
  `CrossLevel` int(11) DEFAULT NULL,
  `RailProfileGaugeNumber` int(11) DEFAULT NULL,
  `SideWearGaugeNumber` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `job_id` int(11) DEFAULT NULL,
  `elr` varchar(255) DEFAULT NULL,
  `mileagem` int(11) DEFAULT NULL,
  `mileagey` int(11) DEFAULT NULL,
  `point` varchar(255) DEFAULT NULL,
  `trackid` varchar(255) DEFAULT NULL,
  `defect` varchar(255) DEFAULT NULL,
  `conform` tinyint(1) DEFAULT NULL,
  `nonconform` varchar(255) DEFAULT NULL,
  `weldingstamp` varchar(255) DEFAULT NULL,
  `railtype` varchar(255) DEFAULT NULL,
  `raildesign` varchar(255) DEFAULT NULL,
  `decision` int(11) DEFAULT NULL,
  `client_check` int(11) DEFAULT NULL,
  `client_date_check` date DEFAULT NULL,
  `date` date DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grindings`
--

LOCK TABLES `grindings` WRITE;
/*!40000 ALTER TABLE `grindings` DISABLE KEYS */;
INSERT INTO `grindings` VALUES (1,1,1,'120','RH','23343',1,8,4,5,5,'no comment','2015-09-07 11:40:51','2015-09-14 09:28:12',3,'AZE',22,23,'1','1','bad welding',0,'B','aZAZAZ','A','STRAIGHT',3,2,'2015-09-11','2015-09-01',NULL),(11,1,24,'89','RH','8989',2,2,2,NULL,NULL,NULL,'2015-09-23 15:41:58','2015-10-16 13:16:47',77,'899',1,1,'7889','7789','',0,'','777','STRAIGHT',NULL,1,2,'2015-10-16','2015-09-23',NULL),(12,1,25,'99','RH','789',12,100,10,NULL,NULL,NULL,'2015-09-23 15:41:58','2015-09-24 09:34:50',78,'9',1,1,'898','778','PPP',1,'B','999','CURVED',NULL,4,1,'2015-09-24','2015-09-23',NULL),(13,1,26,'999','RH','7889',2,2,4,NULL,NULL,NULL,'2015-09-23 15:41:59','2015-09-23 15:41:59',79,'7979',70,70,'89','99','77897',1,'C','9999','STRAIGHT',NULL,NULL,NULL,NULL,'2015-09-23',NULL),(14,1,28,'','','',0,0,0,NULL,NULL,NULL,'2015-09-24 09:02:50','2015-09-24 09:02:50',85,'123',0,0,'123','132','',0,'','','',NULL,NULL,NULL,NULL,'2015-09-24',NULL),(15,1,30,'7788','RH','8999',4,4,3,NULL,NULL,NULL,'2015-09-24 18:36:00','2015-09-24 18:36:00',90,'889',1,2,'789','77889','malrjj',1,'B','99994','CURVED',NULL,NULL,NULL,NULL,'2015-09-24',NULL),(16,1,33,'97987','RH','arara',2,2,2,NULL,NULL,NULL,'2015-09-25 11:48:56','2015-10-16 13:59:54',95,'78787',5,2,'789','12453','mlarmj',1,'C','789','CURVED',NULL,1,2,'2015-10-16','2015-09-25',NULL),(17,1,34,'123','RH','arara',2,4,3,NULL,NULL,NULL,'2015-09-25 11:48:56','2015-09-25 11:48:56',96,'7979',2,4,'7894','45563','mqjfmjqfm',1,'A','789','CURVED',NULL,NULL,NULL,NULL,'2015-09-25',NULL),(18,1,14,'','RH','',0,0,0,NULL,NULL,NULL,'2015-09-28 07:35:16','2015-10-29 15:04:14',98,'12',0,0,'12','2','',0,'A','','CURVED',NULL,3,2,'2015-10-29','2015-09-28',NULL),(19,1,8,'','RH','',0,0,0,NULL,NULL,NULL,'2015-09-28 07:35:16','2015-10-29 15:04:14',99,'12',0,0,'12','12','',1,'','1.3','STRAIGHT',NULL,3,2,'2015-10-29','2015-09-28',NULL),(20,1,35,'999','RH','899',3,2,2,NULL,NULL,NULL,'2015-09-28 08:16:49','2015-09-28 08:16:49',100,'889',7,70,'99','999','mklsjfmlqjf',1,'','7789','CURVED',NULL,NULL,NULL,NULL,'2015-09-28',NULL),(21,1,36,'7789','RH','77889',2,4,4,NULL,NULL,NULL,'2015-09-29 12:34:52','2015-10-16 13:59:54',101,'7898',2,2,'7899','9999','RAS',1,'','8999','CURVED',NULL,1,2,'2015-10-16','2015-09-29',NULL),(22,1,37,'78979','RH','7979',3,3,3,NULL,NULL,NULL,'2015-10-13 08:20:40','2015-10-16 13:59:54',104,'789',1,1,'123','789','qùklfjmlkjqf',0,'C','7889','CURVED',NULL,1,2,'2015-10-16','2015-10-13',NULL);
/*!40000 ALTER TABLE `grindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interventions`
--

DROP TABLE IF EXISTS `interventions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interventions` (
  `id` int(11) NOT NULL,
  `chantier_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `kits` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `periode` int(11) DEFAULT NULL,
  `obs` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `semaine` int(11) DEFAULT NULL,
  `contact_nom` varchar(255) DEFAULT NULL,
  `contact_tel` varchar(255) DEFAULT NULL,
  `horaires` varchar(255) DEFAULT NULL,
  `kits_qte` int(11) DEFAULT NULL,
  `nbr_jour` int(11) DEFAULT NULL,
  `nbr_nuit` int(11) DEFAULT NULL,
  `nbr_soudure` int(11) DEFAULT NULL,
  `nbr_meulage` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interventions`
--

LOCK TABLES `interventions` WRITE;
/*!40000 ALTER TABLE `interventions` DISABLE KEYS */;
/*!40000 ALTER TABLE `interventions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `starttime` time DEFAULT NULL,
  `finishtime` time DEFAULT NULL,
  `weldingassistant` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `worksitelocation` varchar(255) DEFAULT NULL,
  `jobcost` varchar(255) DEFAULT NULL,
  `jobtype` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `kit` tinyint(1) DEFAULT '0',
  `weldings_count` int(11) DEFAULT NULL,
  `grindings_count` int(11) DEFAULT NULL,
  `operation_type` varchar(255) DEFAULT NULL,
  `operation_count` int(11) DEFAULT NULL,
  `week` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_jobs_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_df6238c8a6` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (3,'2015-06-04',1,'11:18:00','19:18:00','Fidji','2015-06-04 11:19:18','2015-09-16 09:45:51','Presle en brie','77220','Maintenance',1,'Fidji\'s father','06 04 05 05 05','she likes to play with a ball and have a walk with me',1,5,1,'',NULL,23),(4,'2015-09-02',1,'11:44:00','18:44:00','','2015-06-04 11:44:55','2015-09-16 08:21:50','Gare de Lyon','a','Renewals',2,'','','',0,1,0,'',NULL,38),(5,'2015-06-04',1,'13:58:00','13:58:00','','2015-06-04 13:58:36','2015-09-14 09:02:04','zz','a','Maintenance',1,'','','',1,3,0,'Welding',2,38),(7,'2015-06-04',1,'16:18:00','16:18:00','','2015-06-04 16:18:40','2015-06-04 16:18:40','ZEAZE','azeaze','Renewals',3,NULL,NULL,NULL,0,1,0,NULL,NULL,38),(8,'2015-06-05',1,'08:55:00','08:55:00','','2015-06-05 08:55:31','2015-06-05 08:55:31','PARIS','12345','Maintenance',1,NULL,NULL,NULL,0,1,0,NULL,NULL,38),(12,'2015-09-17',1,NULL,NULL,NULL,'2015-09-17 15:06:29','2015-09-17 15:06:29','?','?','?',4,NULL,NULL,NULL,0,1,NULL,NULL,NULL,0),(13,'2015-09-17',1,NULL,NULL,NULL,'2015-09-17 15:06:29','2015-09-17 15:06:29','?','?','?',4,NULL,NULL,NULL,0,1,NULL,NULL,NULL,0),(14,'2015-09-17',1,'13:56:00','13:56:00','','2015-09-17 15:06:29','2015-09-24 13:56:30','?','?','Maintenance',1,'','','',0,1,NULL,'Welding',2,38),(16,'2015-09-18',1,NULL,NULL,NULL,'2015-09-18 08:58:38','2015-09-18 08:58:38','?','?','?',1,NULL,NULL,NULL,0,1,NULL,NULL,NULL,38),(17,'2015-09-18',1,NULL,NULL,NULL,'2015-09-18 09:05:50','2015-09-18 09:05:50','?','?','?',1,NULL,NULL,NULL,0,1,NULL,NULL,NULL,38),(19,'2015-09-18',1,NULL,NULL,NULL,'2015-09-21 20:00:11','2015-09-21 20:00:11','?','?','?',1,NULL,NULL,NULL,0,1,NULL,NULL,NULL,38),(24,'2015-09-22',1,NULL,NULL,NULL,'2015-09-22 07:27:22','2015-09-22 07:27:22','?','?','?',1,NULL,NULL,NULL,0,1,NULL,NULL,NULL,39),(26,'2015-09-22',1,NULL,NULL,NULL,'2015-09-22 07:35:25','2015-09-22 07:35:25','?','?','?',1,NULL,NULL,NULL,0,1,NULL,NULL,NULL,39),(27,'2015-09-22',1,NULL,NULL,NULL,'2015-09-22 08:08:02','2015-09-22 08:08:02','?','?','?',4,NULL,NULL,NULL,0,1,NULL,NULL,NULL,39),(58,'2015-09-27',1,'08:07:00','08:07:00','','2015-09-22 09:23:35','2015-10-23 08:07:14','?','?','Maintenance',1,'','','',0,1,NULL,'',NULL,39),(59,'2015-09-22',1,NULL,NULL,NULL,'2015-09-22 09:23:35','2015-09-22 09:23:35','?','?','?',1,NULL,NULL,NULL,0,1,NULL,NULL,NULL,39),(67,'2015-09-22',1,NULL,NULL,NULL,'2015-09-23 09:37:11','2015-09-23 09:37:11','?','?','?',1,NULL,NULL,NULL,0,1,NULL,NULL,NULL,39),(68,'2015-09-22',1,NULL,NULL,NULL,'2015-09-23 09:37:12','2015-09-23 09:37:12','?','?','?',4,NULL,NULL,NULL,0,1,NULL,NULL,NULL,39),(69,'2015-09-22',1,NULL,NULL,NULL,'2015-09-23 09:37:12','2015-09-23 09:37:12','?','?','?',4,NULL,NULL,NULL,0,1,NULL,NULL,NULL,39),(70,'2015-09-23',1,NULL,NULL,NULL,'2015-09-23 10:11:57','2015-09-23 10:11:57','?','?','?',1,NULL,NULL,NULL,0,1,NULL,NULL,NULL,39),(71,'2015-09-23',1,NULL,NULL,NULL,'2015-09-23 10:18:19','2015-09-23 10:18:19','?','?','?',2,NULL,NULL,NULL,0,1,NULL,NULL,NULL,39),(74,'2015-09-23',1,NULL,NULL,NULL,'2015-09-23 10:22:33','2015-09-23 10:22:33','?','?','?',2,NULL,NULL,NULL,0,1,NULL,NULL,NULL,39),(75,'2015-09-23',1,NULL,NULL,NULL,'2015-09-23 15:41:57','2015-09-23 15:41:57','?','?','?',6,NULL,NULL,NULL,0,1,NULL,NULL,NULL,39),(76,'2015-09-23',1,NULL,NULL,NULL,'2015-09-23 15:41:58','2015-09-23 15:41:58','?','?','?',6,NULL,NULL,NULL,0,1,NULL,NULL,NULL,39),(77,'2015-09-23',1,NULL,NULL,NULL,'2015-09-23 15:41:58','2015-09-23 15:41:58','?','?','?',6,NULL,NULL,NULL,0,NULL,1,NULL,NULL,39),(78,'2015-09-23',1,NULL,NULL,NULL,'2015-09-23 15:41:58','2015-09-23 15:41:58','?','?','?',6,NULL,NULL,NULL,0,NULL,1,NULL,NULL,39),(79,'2015-09-23',1,NULL,NULL,NULL,'2015-09-23 15:41:59','2015-09-23 15:41:59','?','?','?',6,NULL,NULL,NULL,0,NULL,1,NULL,NULL,39),(84,'2015-09-24',1,NULL,NULL,NULL,'2015-09-24 09:02:34','2015-09-24 09:02:34','?','?','?',1,NULL,NULL,NULL,0,1,NULL,NULL,NULL,39),(85,'2015-09-24',1,NULL,NULL,NULL,'2015-09-24 09:02:50','2015-09-24 09:02:50','?','?','?',1,NULL,NULL,NULL,0,NULL,1,NULL,NULL,39),(86,'2015-09-24',1,NULL,NULL,NULL,'2015-09-24 14:30:46','2015-09-24 14:30:46','?','?','?',1,NULL,NULL,NULL,0,1,NULL,NULL,NULL,39),(87,'2015-09-24',1,NULL,NULL,NULL,'2015-09-24 14:30:57','2015-09-24 14:30:57','?','?','?',1,NULL,NULL,NULL,0,1,NULL,NULL,NULL,39),(88,'2015-09-18',1,NULL,NULL,NULL,'2015-09-24 15:46:11','2015-09-24 15:46:11','?','?','?',1,NULL,NULL,NULL,0,1,NULL,NULL,NULL,38),(89,'2015-09-24',1,NULL,NULL,NULL,'2015-09-24 18:36:00','2015-09-24 18:36:00','?','?','?',6,NULL,NULL,NULL,0,1,NULL,NULL,NULL,39),(90,'2015-09-24',1,NULL,NULL,NULL,'2015-09-24 18:36:00','2015-09-24 18:36:00','?','?','?',6,NULL,NULL,NULL,0,NULL,1,NULL,NULL,39),(91,'2015-09-24',1,NULL,NULL,NULL,'2015-09-24 18:42:18','2015-09-24 18:42:18','?','?','?',6,NULL,NULL,NULL,0,1,NULL,NULL,NULL,39),(92,'2015-09-25',1,NULL,NULL,NULL,'2015-09-25 10:23:41','2015-09-25 10:23:41','?','?','?',1,NULL,NULL,NULL,0,1,NULL,NULL,NULL,39),(93,'2015-09-25',1,NULL,NULL,NULL,'2015-09-25 10:23:41','2015-09-25 10:23:41','?','?','?',1,NULL,NULL,NULL,0,1,NULL,NULL,NULL,39),(94,'2015-09-25',1,NULL,NULL,NULL,'2015-09-25 11:48:55','2015-09-25 11:48:55','?','?','?',6,NULL,NULL,NULL,0,1,NULL,NULL,NULL,39),(95,'2015-09-25',1,NULL,NULL,NULL,'2015-09-25 11:48:56','2015-09-25 11:48:56','?','?','?',6,NULL,NULL,NULL,0,NULL,1,NULL,NULL,39),(96,'2015-09-25',1,NULL,NULL,NULL,'2015-09-25 11:48:56','2015-09-25 11:48:56','?','?','?',6,NULL,NULL,NULL,0,NULL,1,NULL,NULL,39),(97,'2015-09-29',1,'17:00:00','05:00:00','STEVE','2015-09-25 13:12:28','2015-09-25 15:29:08','LONDON 1','8999','Projects',7,'Richard','99999','kmfjqsmjf',0,NULL,NULL,'Welding',7777,40),(98,'2015-09-28',1,NULL,NULL,NULL,'2015-09-28 07:35:16','2015-09-28 07:35:16','?','?','?',7,NULL,NULL,NULL,0,NULL,1,NULL,NULL,40),(99,'2015-09-28',1,NULL,NULL,NULL,'2015-09-28 07:35:16','2015-09-28 07:35:16','?','?','?',7,NULL,NULL,NULL,0,NULL,1,NULL,NULL,40),(100,'2015-09-28',1,NULL,NULL,NULL,'2015-09-28 08:16:49','2015-09-28 08:16:49','?','?','?',6,NULL,NULL,NULL,0,NULL,1,NULL,NULL,40),(101,'2015-09-29',1,NULL,NULL,NULL,'2015-09-29 12:34:52','2015-09-29 12:34:52','?','?','?',6,NULL,NULL,NULL,0,1,1,NULL,NULL,40),(104,'2015-11-12',1,NULL,NULL,NULL,'2015-11-12 16:32:15','2015-11-12 16:32:15','?','?','?',7,NULL,NULL,NULL,0,1,NULL,NULL,NULL,46),(105,'2015-11-12',1,NULL,NULL,NULL,'2015-12-07 11:43:57','2015-12-07 11:43:57','?','?','?',8,NULL,NULL,NULL,0,1,NULL,NULL,NULL,46),(108,'2015-12-07',1,NULL,NULL,NULL,'2015-12-07 12:08:34','2015-12-07 12:08:34','?','?','?',7,NULL,NULL,NULL,0,1,NULL,NULL,NULL,50);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localizations`
--

DROP TABLE IF EXISTS `localizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pk` varchar(255) DEFAULT NULL,
  `voie` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `ligne` varchar(255) DEFAULT NULL,
  `intervention_id` int(11) DEFAULT NULL,
  `numligne` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_localizations_on_id` (`id`),
  KEY `index_localizations_on_intervention_id` (`intervention_id`),
  KEY `index_localizations_on_ligne_and_voie_and_file_and_pk` (`ligne`,`voie`,`file`,`pk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localizations`
--

LOCK TABLES `localizations` WRITE;
/*!40000 ALTER TABLE `localizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `localizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elr` varchar(255) DEFAULT NULL,
  `mileagem` int(11) DEFAULT NULL,
  `mileagey` int(11) DEFAULT NULL,
  `point` varchar(255) DEFAULT NULL,
  `trackid` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'AZE',22,23,'1','1','2015-09-07 11:39:17','2015-09-07 11:39:17'),(2,'AZ',33,23,'1233','12','2015-09-07 15:35:56','2015-09-07 15:35:56'),(3,'AZE',1,5,'A','A','2015-09-07 15:36:05','2015-09-07 15:36:05'),(4,'azaz',1,1,'azaz','2','2015-09-07 15:36:13','2015-09-07 15:36:13'),(5,'az',1,2,'W1','1','2015-09-15 10:30:06','2015-09-15 10:30:06'),(6,'789',0,0,'123','4563','2015-09-17 14:20:43','2015-09-17 14:20:43'),(7,'123',1,1,'1','1','2015-09-17 15:06:29','2015-09-17 15:06:29'),(8,'12',0,0,'12','12','2015-09-17 15:06:29','2015-09-17 15:06:29'),(9,'125',0,0,'12','12','2015-09-18 08:56:24','2015-09-18 08:56:24'),(10,'123',0,0,'123','123','2015-09-18 09:05:50','2015-09-18 09:05:50'),(11,'1',12,12,'12','12','2015-09-21 20:00:11','2015-09-21 20:00:11'),(12,'1',1,1,'1','11','2015-09-21 20:00:12','2015-09-21 20:00:12'),(13,'12',1,1,'12','12','2015-09-21 20:00:12','2015-09-21 20:00:12'),(14,'12',0,0,'12','2','2015-09-22 07:33:06','2015-09-22 07:33:06'),(15,'1212',1,1,'12','2','2015-09-22 08:08:02','2015-09-22 08:08:02'),(16,'1',1,1,'1','1','2015-09-22 08:10:24','2015-09-22 08:10:24'),(17,'12',0,0,'2','2','2015-09-22 08:25:48','2015-09-22 08:25:48'),(18,'11',0,0,'1','1','2015-09-22 08:58:35','2015-09-22 08:58:35'),(19,'12',1,4,'54','4','2015-09-22 09:16:13','2015-09-22 09:16:13'),(20,'123456',0,1,'123456','6549687','2015-09-23 07:49:03','2015-09-23 07:49:03'),(21,'125 44',0,0,'AR11','122','2015-09-23 09:35:11','2015-09-23 09:35:11'),(22,'11',0,0,'11','11','2015-09-23 10:18:19','2015-09-23 10:18:19'),(23,'1',0,0,'1','11','2015-09-23 10:19:12','2015-09-23 10:19:12'),(24,'899',1,1,'7889','7789','2015-09-23 15:41:57','2015-09-23 15:41:57'),(25,'9',1,1,'898','778','2015-09-23 15:41:58','2015-09-23 15:41:58'),(26,'7979',70,70,'89','99','2015-09-23 15:41:59','2015-09-23 15:41:59'),(27,'78',0,0,'78','78','2015-09-24 08:19:33','2015-09-24 08:19:33'),(28,'123',0,0,'123','132','2015-09-24 09:02:50','2015-09-24 09:02:50'),(29,'899',15,100,'789','77777','2015-09-24 18:36:00','2015-09-24 18:36:00'),(30,'889',1,2,'789','77889','2015-09-24 18:36:00','2015-09-24 18:36:00'),(31,'7899',1,2,'7889','77899','2015-09-24 18:42:18','2015-09-24 18:42:18'),(32,'12',12,100,'12','12','2015-09-25 10:23:41','2015-09-25 10:23:41'),(33,'78787',5,2,'789','12453','2015-09-25 11:48:55','2015-09-25 11:48:55'),(34,'7979',2,4,'7894','45563','2015-09-25 11:48:56','2015-09-25 11:48:56'),(35,'889',7,70,'99','999','2015-09-28 08:16:49','2015-09-28 08:16:49'),(36,'7898',2,2,'7899','9999','2015-09-29 12:34:52','2015-09-29 12:34:52'),(37,'date',1,1,'1212','1100 - Up Main/Fast','2015-11-12 13:49:31','2015-11-12 13:49:31'),(38,'123',-1,-1,'1212','1200 - Up Slow','2015-11-12 14:00:44','2015-11-12 14:00:44'),(39,'1',1,1,'12','1100 - Up Main/Fast','2015-11-12 16:06:05','2015-11-12 16:06:05'),(40,'123',1,1,'12','1100 - Up Main/Fast','2015-11-12 16:32:15','2015-11-12 16:32:15'),(41,'12',0,0,'123','1100 - Up Main/Fast','2015-12-07 12:08:34','2015-12-07 12:08:34'),(42,'SIGNATURE',0,0,'123','1100 - Up Main/Fast','2015-12-07 13:17:41','2015-12-07 13:17:41');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `data` text,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `data_type` varchar(255) DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (57,'alh','192.168.0.254','{\"id\":null,\"job_id\":81,\"elr\":\"78\",\"mileagem\":0,\"mileagey\":0,\"point\":\"78\",\"trackid\":\"78\",\"rail\":\"\",\"linespeed\":null,\"locationtype\":\"\",\"sleepertype\":\"\",\"consolidated\":false,\"l_manufacturer\":\"\",\"l_profile\":\"\",\"l_grade\":\"\",\"l_wear\":\"\",\"r_manufacturer\":\"\",\"r_profile\":\"\",\"r_grade\":\"\",\"r_wear\":\"\",\"cutting\":\"\",\"gap\":0,\"method\":\"\",\"temperature\":0,\"weldtype\":\"\",\"mouldtype\":\"\",\"fuelgas\":\"\",\"gaskitnumber\":\"\",\"batchnumber\":\"\",\"tappingtime\":\"\",\"tensorkitnumber\":\"\",\"pressure\":null,\"pressureafter\":null,\"conform\":false,\"stampdetails\":\"\",\"report\":false,\"clamped\":false,\"created_at\":null,\"updated_at\":null,\"comment\":\"\",\"default\":\"\",\"kit\":false,\"traveltime\":0,\"traveltime2\":0,\"starttime\":\"2000-01-01T12:00:00.000Z\",\"finishtime\":\"2000-01-01T12:00:00.000Z\",\"location_id\":27,\"user_id\":1,\"date\":\"2015-09-24\"}','ERROR','2015-09-24 08:35:29','2015-09-24 18:26:24','W',NULL,1,1),(58,'alh','192.168.0.254','{\"id\":null,\"job_id\":82,\"elr\":\"78\",\"mileagem\":0,\"mileagey\":0,\"point\":\"78\",\"trackid\":\"78\",\"rail\":\"\",\"linespeed\":null,\"locationtype\":\"\",\"sleepertype\":\"\",\"consolidated\":false,\"l_manufacturer\":\"\",\"l_profile\":\"\",\"l_grade\":\"\",\"l_wear\":\"\",\"r_manufacturer\":\"\",\"r_profile\":\"\",\"r_grade\":\"\",\"r_wear\":\"\",\"cutting\":\"\",\"gap\":0,\"method\":\"\",\"temperature\":0,\"weldtype\":\"\",\"mouldtype\":\"\",\"fuelgas\":\"\",\"gaskitnumber\":\"\",\"batchnumber\":\"\",\"tappingtime\":\"\",\"tensorkitnumber\":\"\",\"pressure\":null,\"pressureafter\":null,\"conform\":false,\"stampdetails\":\"\",\"report\":false,\"clamped\":false,\"created_at\":null,\"updated_at\":null,\"comment\":\"\",\"default\":\"\",\"kit\":false,\"traveltime\":0,\"traveltime2\":0,\"starttime\":\"2000-01-01T12:00:00.000Z\",\"finishtime\":\"2000-01-01T12:00:00.000Z\",\"location_id\":27,\"user_id\":1,\"date\":\"2015-09-24\"}','ERROR: [\"Conform can\'t be blank\"]','2015-09-24 08:53:12','2015-09-24 08:53:12','W',NULL,1,1),(59,'alh','192.168.0.254','{\"id\":null,\"job_id\":83,\"elr\":\"78\",\"mileagem\":0,\"mileagey\":0,\"point\":\"78\",\"trackid\":\"78\",\"rail\":\"\",\"linespeed\":null,\"locationtype\":\"\",\"sleepertype\":\"\",\"consolidated\":false,\"l_manufacturer\":\"\",\"l_profile\":\"\",\"l_grade\":\"\",\"l_wear\":\"\",\"r_manufacturer\":\"\",\"r_profile\":\"\",\"r_grade\":\"\",\"r_wear\":\"\",\"cutting\":\"\",\"gap\":0,\"method\":\"\",\"temperature\":0,\"weldtype\":\"\",\"mouldtype\":\"\",\"fuelgas\":\"\",\"gaskitnumber\":\"\",\"batchnumber\":\"\",\"tappingtime\":\"\",\"tensorkitnumber\":\"\",\"pressure\":null,\"pressureafter\":null,\"conform\":false,\"stampdetails\":\"\",\"report\":false,\"clamped\":false,\"created_at\":null,\"updated_at\":null,\"comment\":\"\",\"default\":\"\",\"kit\":false,\"traveltime\":0,\"traveltime2\":0,\"starttime\":\"2000-01-01T12:00:00.000Z\",\"finishtime\":\"2000-01-01T12:00:00.000Z\",\"location_id\":27,\"user_id\":1,\"date\":\"2015-09-24\"}','ERROR: [\"Conform can\'t be blank\"]','2015-09-24 08:53:22','2015-09-24 08:53:22','W',NULL,1,1),(60,'alh','192.168.0.254','{\"id\":null,\"job_id\":84,\"elr\":\"78\",\"mileagem\":0,\"mileagey\":0,\"point\":\"78\",\"trackid\":\"78\",\"rail\":\"\",\"linespeed\":null,\"locationtype\":\"\",\"sleepertype\":\"\",\"consolidated\":false,\"l_manufacturer\":\"\",\"l_profile\":\"\",\"l_grade\":\"\",\"l_wear\":\"\",\"r_manufacturer\":\"\",\"r_profile\":\"\",\"r_grade\":\"\",\"r_wear\":\"\",\"cutting\":\"\",\"gap\":0,\"method\":\"\",\"temperature\":0,\"weldtype\":\"\",\"mouldtype\":\"\",\"fuelgas\":\"\",\"gaskitnumber\":\"\",\"batchnumber\":\"\",\"tappingtime\":\"\",\"tensorkitnumber\":\"\",\"pressure\":null,\"pressureafter\":null,\"conform\":false,\"stampdetails\":\"\",\"report\":false,\"clamped\":false,\"created_at\":null,\"updated_at\":null,\"comment\":\"\",\"default\":\"\",\"kit\":false,\"traveltime\":0,\"traveltime2\":0,\"starttime\":\"2000-01-01T12:00:00.000Z\",\"finishtime\":\"2000-01-01T12:00:00.000Z\",\"location_id\":27,\"user_id\":1,\"date\":\"2015-09-24\"}','OK','2015-09-24 09:02:34','2015-09-24 09:02:34','W',32,1,1),(61,'alh','192.168.0.254','{\"id\":null,\"user_id\":1,\"location_id\":28,\"metrage\":\"\",\"rail\":\"\",\"railsidewearreading\":\"\",\"RailDepth\":0,\"TrackGauge\":0,\"CrossLevel\":0,\"RailProfileGaugeNumber\":null,\"SideWearGaugeNumber\":null,\"comment\":null,\"created_at\":null,\"updated_at\":null,\"job_id\":85,\"elr\":\"123\",\"mileagem\":0,\"mileagey\":0,\"point\":\"123\",\"trackid\":\"132\",\"defect\":\"\",\"conform\":false,\"nonconform\":\"\",\"weldingstamp\":\"\",\"railtype\":\"\",\"raildesign\":null,\"decision\":null,\"client_check\":null,\"client_date_check\":null,\"date\":\"2015-09-24\"}','OK','2015-09-24 09:02:50','2015-09-24 09:02:50','G',14,1,1),(62,'alh','192.168.0.254','{\"id\":null,\"job_id\":88,\"elr\":\"123\",\"mileagem\":0,\"mileagey\":0,\"point\":\"123\",\"trackid\":\"123\",\"rail\":\"\",\"linespeed\":null,\"locationtype\":\"\",\"sleepertype\":\"\",\"consolidated\":false,\"l_manufacturer\":\"\",\"l_profile\":\"\",\"l_grade\":\"\",\"l_wear\":\"\",\"r_manufacturer\":\"\",\"r_profile\":\"\",\"r_grade\":\"\",\"r_wear\":\"\",\"cutting\":\"\",\"gap\":0,\"method\":\"\",\"temperature\":0,\"weldtype\":\"\",\"mouldtype\":\"\",\"fuelgas\":\"\",\"gaskitnumber\":\"\",\"batchnumber\":\"\",\"tappingtime\":\"\",\"tensorkitnumber\":\"\",\"pressure\":null,\"pressureafter\":null,\"conform\":false,\"stampdetails\":\"\",\"report\":false,\"clamped\":false,\"created_at\":null,\"updated_at\":null,\"comment\":\"\",\"default\":\"\",\"kit\":false,\"traveltime\":0,\"traveltime2\":0,\"starttime\":\"2000-01-01T12:00:00.000Z\",\"finishtime\":\"2000-01-01T10:00:00.000Z\",\"location_id\":10,\"user_id\":1,\"date\":\"2015-09-18\"}','OK','2015-09-24 15:46:11','2015-09-24 15:46:11','W',36,1,1),(63,'alh','90.61.106.225','{\"id\":null,\"job_id\":89,\"elr\":\"899\",\"mileagem\":15,\"mileagey\":100,\"point\":\"789\",\"trackid\":\"77777\",\"rail\":\"999\",\"linespeed\":888,\"locationtype\":\"Tunnel\",\"sleepertype\":\"77\",\"consolidated\":false,\"l_manufacturer\":\"Railtech\",\"l_profile\":\"78\",\"l_grade\":\"78\",\"l_wear\":\"78\",\"r_manufacturer\":\"Railtech\",\"r_profile\":\"89\",\"r_grade\":\"87\",\"r_wear\":\"47\",\"cutting\":\"999\",\"gap\":3,\"method\":\"mlkjamlkjr\",\"temperature\":6,\"weldtype\":\"HG\",\"mouldtype\":\"H\",\"fuelgas\":\"Propane\",\"gaskitnumber\":\"889\",\"batchnumber\":\"8899\",\"tappingtime\":\"889\",\"tensorkitnumber\":\"8899\",\"pressure\":78899,\"pressureafter\":8999,\"conform\":true,\"stampdetails\":\"8889\",\"report\":true,\"clamped\":true,\"created_at\":null,\"updated_at\":null,\"comment\":\"RAS\",\"default\":\"Sand inclusion\",\"kit\":true,\"traveltime\":1,\"traveltime2\":1,\"starttime\":\"2000-01-01T09:30:00.000Z\",\"finishtime\":\"2000-01-01T17:30:00.000Z\",\"location_id\":29,\"user_id\":1,\"date\":\"2015-09-24\"}','OK','2015-09-24 18:36:00','2015-09-24 18:36:00','W',37,1,6),(64,'alh','90.61.106.225','{\"id\":null,\"user_id\":1,\"location_id\":30,\"metrage\":\"7788\",\"rail\":\"RH\",\"railsidewearreading\":\"8999\",\"RailDepth\":4,\"TrackGauge\":4,\"CrossLevel\":3,\"RailProfileGaugeNumber\":null,\"SideWearGaugeNumber\":null,\"comment\":null,\"created_at\":null,\"updated_at\":null,\"job_id\":90,\"elr\":\"889\",\"mileagem\":1,\"mileagey\":2,\"point\":\"789\",\"trackid\":\"77889\",\"defect\":\"malrjj\",\"conform\":true,\"nonconform\":\"B\",\"weldingstamp\":\"99994\",\"railtype\":\"CURVED\",\"raildesign\":null,\"decision\":null,\"client_check\":null,\"client_date_check\":null,\"date\":\"2015-09-24\"}','OK','2015-09-24 18:36:00','2015-09-24 18:36:00','G',15,1,6),(65,'alh','90.61.106.225','{\"id\":null,\"job_id\":91,\"elr\":\"7899\",\"mileagem\":1,\"mileagey\":2,\"point\":\"7889\",\"trackid\":\"77899\",\"rail\":\"89797\",\"linespeed\":60,\"locationtype\":\"Tunnel\",\"sleepertype\":\"78899\",\"consolidated\":false,\"l_manufacturer\":\"Railtech\",\"l_profile\":\"78\",\"l_grade\":\"97\",\"l_wear\":\"67\",\"r_manufacturer\":\"Railtech\",\"r_profile\":\"45\",\"r_grade\":\"63\",\"r_wear\":\"58\",\"cutting\":\"789\",\"gap\":3,\"method\":\"mlakjr\",\"temperature\":5,\"weldtype\":\"HG\",\"mouldtype\":\"H\",\"fuelgas\":\"Propane\",\"gaskitnumber\":\"7889\",\"batchnumber\":\"7889\",\"tappingtime\":\"789\",\"tensorkitnumber\":\"7899\",\"pressure\":799,\"pressureafter\":472,\"conform\":true,\"stampdetails\":\"777777\",\"report\":true,\"clamped\":true,\"created_at\":null,\"updated_at\":null,\"comment\":\"ramrkjamjrkmljamr\",\"default\":\"Shrinkage\",\"kit\":true,\"traveltime\":1,\"traveltime2\":1,\"starttime\":\"2000-01-01T20:39:00.000Z\",\"finishtime\":\"2000-01-01T21:30:00.000Z\",\"location_id\":31,\"user_id\":1,\"date\":\"2015-09-24\"}','OK','2015-09-24 18:42:18','2015-09-24 18:42:18','W',38,1,6),(66,'alh','192.168.0.254','{\"id\":null,\"job_id\":92,\"elr\":\"12\",\"mileagem\":0,\"mileagey\":0,\"point\":\"12\",\"trackid\":\"12\",\"rail\":\"\",\"linespeed\":null,\"locationtype\":\"\",\"sleepertype\":\"\",\"consolidated\":false,\"l_manufacturer\":\"\",\"l_profile\":\"\",\"l_grade\":\"\",\"l_wear\":\"\",\"r_manufacturer\":\"\",\"r_profile\":\"\",\"r_grade\":\"\",\"r_wear\":\"\",\"cutting\":\"\",\"gap\":0,\"method\":\"\",\"temperature\":0,\"weldtype\":\"\",\"mouldtype\":\"\",\"fuelgas\":\"\",\"gaskitnumber\":\"\",\"batchnumber\":\"\",\"tappingtime\":\"\",\"tensorkitnumber\":\"\",\"pressure\":null,\"pressureafter\":null,\"conform\":true,\"stampdetails\":\"\",\"report\":false,\"clamped\":false,\"created_at\":null,\"updated_at\":null,\"comment\":\"\",\"default\":\"\",\"kit\":false,\"traveltime\":100,\"traveltime2\":100,\"starttime\":\"2000-01-01T12:00:00.000Z\",\"finishtime\":\"2000-01-01T12:00:00.000Z\",\"location_id\":8,\"user_id\":1,\"date\":\"2015-09-25\"}','OK','2015-09-25 10:23:41','2015-09-25 10:23:41','W',39,1,1),(67,'alh','192.168.0.254','{\"id\":null,\"job_id\":93,\"elr\":\"12\",\"mileagem\":12,\"mileagey\":100,\"point\":\"12\",\"trackid\":\"12\",\"rail\":\"\",\"linespeed\":null,\"locationtype\":\"\",\"sleepertype\":\"\",\"consolidated\":false,\"l_manufacturer\":\"\",\"l_profile\":\"\",\"l_grade\":\"\",\"l_wear\":\"\",\"r_manufacturer\":\"\",\"r_profile\":\"\",\"r_grade\":\"\",\"r_wear\":\"\",\"cutting\":\"\",\"gap\":0,\"method\":\"\",\"temperature\":0,\"weldtype\":\"\",\"mouldtype\":\"\",\"fuelgas\":\"\",\"gaskitnumber\":\"\",\"batchnumber\":\"\",\"tappingtime\":\"\",\"tensorkitnumber\":\"\",\"pressure\":null,\"pressureafter\":null,\"conform\":false,\"stampdetails\":\"\",\"report\":false,\"clamped\":false,\"created_at\":null,\"updated_at\":null,\"comment\":\"\",\"default\":\"\",\"kit\":false,\"traveltime\":1,\"traveltime2\":1,\"starttime\":\"2000-01-01T12:00:00.000Z\",\"finishtime\":\"2000-01-01T16:00:00.000Z\",\"location_id\":32,\"user_id\":1,\"date\":\"2015-09-25\"}','OK','2015-09-25 10:23:41','2015-09-25 10:23:41','W',40,1,1),(68,'alh','109.234.64.22','{\"id\":null,\"job_id\":94,\"elr\":\"78787\",\"mileagem\":5,\"mileagey\":2,\"point\":\"789\",\"trackid\":\"12453\",\"rail\":\"78\",\"linespeed\":80,\"locationtype\":\"Tunnel\",\"sleepertype\":\"78787\",\"consolidated\":false,\"l_manufacturer\":\"Railtech\",\"l_profile\":\"78\",\"l_grade\":\"77\",\"l_wear\":\"45\",\"r_manufacturer\":\"Railtech\",\"r_profile\":\"99\",\"r_grade\":\"78\",\"r_wear\":\"45\",\"cutting\":\"7894\",\"gap\":2,\"method\":\"AABD\",\"temperature\":2,\"weldtype\":\"HG\",\"mouldtype\":\"H\",\"fuelgas\":\"Propane\",\"gaskitnumber\":\"889\",\"batchnumber\":\"7789\",\"tappingtime\":\"789\",\"tensorkitnumber\":\"785\",\"pressure\":789,\"pressureafter\":12453,\"conform\":true,\"stampdetails\":\"7889\",\"report\":true,\"clamped\":false,\"created_at\":null,\"updated_at\":null,\"comment\":\"marmjamrj\",\"default\":\"Paste inclusion lute\",\"kit\":true,\"traveltime\":1,\"traveltime2\":1,\"starttime\":\"2000-01-01T14:00:00.000Z\",\"finishtime\":\"2000-01-01T18:00:00.000Z\",\"location_id\":33,\"user_id\":1,\"date\":\"2015-09-25\"}','OK','2015-09-25 11:48:55','2015-09-25 11:48:55','W',41,1,6),(69,'alh','109.234.64.22','{\"id\":null,\"user_id\":1,\"location_id\":33,\"metrage\":\"97987\",\"rail\":\"RH\",\"railsidewearreading\":\"arara\",\"RailDepth\":2,\"TrackGauge\":2,\"CrossLevel\":2,\"RailProfileGaugeNumber\":null,\"SideWearGaugeNumber\":null,\"comment\":null,\"created_at\":null,\"updated_at\":null,\"job_id\":95,\"elr\":\"78787\",\"mileagem\":5,\"mileagey\":2,\"point\":\"789\",\"trackid\":\"12453\",\"defect\":\"mlarmj\",\"conform\":true,\"nonconform\":\"C\",\"weldingstamp\":\"789\",\"railtype\":\"CURVED\",\"raildesign\":null,\"decision\":null,\"client_check\":null,\"client_date_check\":null,\"date\":\"2015-09-25\"}','OK','2015-09-25 11:48:56','2015-09-25 11:48:56','G',16,1,6),(70,'alh','109.234.64.22','{\"id\":null,\"user_id\":1,\"location_id\":34,\"metrage\":\"123\",\"rail\":\"RH\",\"railsidewearreading\":\"arara\",\"RailDepth\":2,\"TrackGauge\":4,\"CrossLevel\":3,\"RailProfileGaugeNumber\":null,\"SideWearGaugeNumber\":null,\"comment\":null,\"created_at\":null,\"updated_at\":null,\"job_id\":96,\"elr\":\"7979\",\"mileagem\":2,\"mileagey\":4,\"point\":\"7894\",\"trackid\":\"45563\",\"defect\":\"mqjfmjqfm\",\"conform\":true,\"nonconform\":\"A\",\"weldingstamp\":\"789\",\"railtype\":\"CURVED\",\"raildesign\":null,\"decision\":null,\"client_check\":null,\"client_date_check\":null,\"date\":\"2015-09-25\"}','OK','2015-09-25 11:48:56','2015-09-25 11:48:56','G',17,1,6),(71,'alh','192.168.0.254','{\"id\":null,\"user_id\":1,\"location_id\":14,\"metrage\":\"\",\"rail\":\"RH\",\"railsidewearreading\":\"\",\"RailDepth\":0,\"TrackGauge\":0,\"CrossLevel\":0,\"RailProfileGaugeNumber\":null,\"SideWearGaugeNumber\":null,\"comment\":null,\"created_at\":null,\"updated_at\":null,\"job_id\":98,\"elr\":\"12\",\"mileagem\":0,\"mileagey\":0,\"point\":\"12\",\"trackid\":\"2\",\"defect\":\"\",\"conform\":false,\"nonconform\":\"A\",\"weldingstamp\":\"\",\"railtype\":\"CURVED\",\"raildesign\":null,\"decision\":null,\"client_check\":null,\"client_date_check\":null,\"date\":\"2015-09-28\"}','OK','2015-09-28 07:35:16','2015-09-28 07:35:16','G',18,1,7),(72,'alh','192.168.0.254','{\"id\":null,\"user_id\":1,\"location_id\":8,\"metrage\":\"\",\"rail\":\"RH\",\"railsidewearreading\":\"\",\"RailDepth\":0,\"TrackGauge\":0,\"CrossLevel\":0,\"RailProfileGaugeNumber\":null,\"SideWearGaugeNumber\":null,\"comment\":null,\"created_at\":null,\"updated_at\":null,\"job_id\":99,\"elr\":\"12\",\"mileagem\":0,\"mileagey\":0,\"point\":\"12\",\"trackid\":\"12\",\"defect\":\"\",\"conform\":true,\"nonconform\":\"\",\"weldingstamp\":\"1.3\",\"railtype\":\"STRAIGHT\",\"raildesign\":null,\"decision\":null,\"client_check\":null,\"client_date_check\":null,\"date\":\"2015-09-28\"}','OK','2015-09-28 07:35:16','2015-09-28 07:35:16','G',19,1,7),(73,'alh','90.61.106.225','{\"id\":null,\"user_id\":1,\"location_id\":35,\"metrage\":\"999\",\"rail\":\"RH\",\"railsidewearreading\":\"899\",\"RailDepth\":3,\"TrackGauge\":2,\"CrossLevel\":2,\"RailProfileGaugeNumber\":null,\"SideWearGaugeNumber\":null,\"comment\":null,\"created_at\":null,\"updated_at\":null,\"job_id\":100,\"elr\":\"889\",\"mileagem\":7,\"mileagey\":70,\"point\":\"99\",\"trackid\":\"999\",\"defect\":\"mklsjfmlqjf\",\"conform\":true,\"nonconform\":\"\",\"weldingstamp\":\"7789\",\"railtype\":\"CURVED\",\"raildesign\":null,\"decision\":null,\"client_check\":null,\"client_date_check\":null,\"date\":\"2015-09-28\"}','OK','2015-09-28 08:16:49','2015-09-28 08:16:49','G',20,1,6),(74,'alh','90.61.106.225','{\"id\":null,\"user_id\":1,\"location_id\":36,\"metrage\":\"7789\",\"rail\":\"RH\",\"railsidewearreading\":\"77889\",\"RailDepth\":2,\"TrackGauge\":4,\"CrossLevel\":4,\"RailProfileGaugeNumber\":null,\"SideWearGaugeNumber\":null,\"comment\":null,\"created_at\":null,\"updated_at\":null,\"job_id\":101,\"elr\":\"7898\",\"mileagem\":2,\"mileagey\":2,\"point\":\"7899\",\"trackid\":\"9999\",\"defect\":\"RAS\",\"conform\":true,\"nonconform\":\"\",\"weldingstamp\":\"8999\",\"railtype\":\"CURVED\",\"raildesign\":null,\"decision\":null,\"client_check\":null,\"client_date_check\":null,\"date\":\"2015-09-29\"}','OK','2015-09-29 12:34:52','2015-09-29 12:34:52','G',21,1,6),(75,'alh','90.61.106.225','{\"id\":null,\"job_id\":101,\"elr\":\"7898\",\"mileagem\":2,\"mileagey\":2,\"point\":\"7899\",\"trackid\":\"9999\",\"rail\":\"99\",\"linespeed\":70,\"locationtype\":\"Tunnel\",\"sleepertype\":\"7789\",\"consolidated\":false,\"l_manufacturer\":\"Railtech\",\"l_profile\":\"78\",\"l_grade\":\"98\",\"l_wear\":\"99\",\"r_manufacturer\":\"Railtech\",\"r_profile\":\"78\",\"r_grade\":\"99\",\"r_wear\":\"77\",\"cutting\":\"77889\",\"gap\":2,\"method\":\"7899\",\"temperature\":2,\"weldtype\":\"HG\",\"mouldtype\":\"G\",\"fuelgas\":\"Propane\",\"gaskitnumber\":\"789\",\"batchnumber\":\"7889\",\"tappingtime\":\"7889\",\"tensorkitnumber\":\"887\",\"pressure\":888,\"pressureafter\":777,\"conform\":true,\"stampdetails\":\"7889\",\"report\":true,\"clamped\":true,\"created_at\":null,\"updated_at\":null,\"comment\":\"kjlkfjmljakmljr\",\"default\":\"Corundum inclusion\",\"kit\":true,\"traveltime\":1,\"traveltime2\":1,\"starttime\":\"2000-01-01T09:00:00.000Z\",\"finishtime\":\"2000-01-01T17:00:00.000Z\",\"location_id\":36,\"user_id\":1,\"date\":\"2015-09-29\"}','OK','2015-09-29 12:34:53','2015-09-29 12:34:53','W',42,1,6),(76,'ALH','192.168.1.17','{\"id\":null,\"job_id\":103,\"elr\":\"1\",\"mileagem\":1,\"mileagey\":1,\"point\":\"12\",\"trackid\":\"1100 - Up Main/Fast\",\"rail\":\"Left\",\"linespeed\":\"55\",\"locationtype\":\"Open\",\"sleepertype\":\"Concrete\",\"consolidated\":false,\"l_manufacturer\":\"TATA\",\"l_profile\":\"110A\",\"l_grade\":\"220 - Normal Grade\",\"l_wear\":\"FLAM\",\"r_manufacturer\":\"TATA\",\"r_profile\":\"110A\",\"r_grade\":\"220 - Normal Grade\",\"r_wear\":\"DISC\",\"cutting\":\"12\",\"gap\":1,\"temperature\":1,\"weldtype\":\"Thermit\",\"mouldtype\":\"Railtech PLA:Type A\",\"fuelgas\":\"1\",\"gaskitnumber\":\"1\",\"batchnumber\":\"12\",\"tappingtime\":\"27\",\"tensorkitnumber\":\"1\",\"pressure\":1,\"pressureafter\":1,\"conform\":false,\"stampdetails\":\"123\",\"report\":false,\"clamped\":false,\"created_at\":null,\"updated_at\":null,\"comment\":\"132\",\"default\":\"Ref:9 | UIC Code:4707D | Weld feature:Gall | Action Code (Track 1A,1,2,3):2C | Action Code (Track 4,5,6):2C\",\"traveltime\":0,\"traveltime2\":0,\"starttime\":\"2000-01-01T12:00:00.000Z\",\"finishtime\":\"2000-01-01T12:00:00.000Z\",\"location_id\":39,\"user_id\":1,\"date\":\"2015-11-12\",\"alignment\":\"Wedgers\",\"portion_type\":\"Z80\",\"ncf\":\"123\",\"ncf_possession\":\"12\",\"ncf_time_nc_reported\":\"123456\",\"ncf_description\":\"12\",\"ncf_track_conditions\":\"12\",\"ncf_abnormalities\":\"12\",\"ncf_welder\":\"12\",\"ncf_supervisor\":\"13213213\",\"ncf_date\":\"jeudi 12 novembre 2015\",\"portion_number\":\"123456\"}','OK','2015-11-12 16:06:05','2015-11-12 16:06:05','W',45,1,14),(77,'ALH','192.168.1.17','{\"id\":null,\"job_id\":102,\"elr\":\"12\",\"mileagem\":0,\"mileagey\":0,\"point\":\"12\",\"trackid\":\"12\",\"rail\":\"\",\"linespeed\":\"125\",\"locationtype\":\"Open\",\"sleepertype\":\"Concrete\",\"consolidated\":null,\"l_manufacturer\":\"\",\"l_profile\":\"\",\"l_grade\":\"\",\"l_wear\":\"\",\"r_manufacturer\":\"\",\"r_profile\":\"\",\"r_grade\":\"\",\"r_wear\":\"\",\"cutting\":\"\",\"gap\":null,\"temperature\":0,\"weldtype\":\"\",\"mouldtype\":\"\",\"fuelgas\":\"\",\"gaskitnumber\":\"\",\"batchnumber\":\"\",\"tappingtime\":\"\",\"tensorkitnumber\":\"\",\"pressure\":null,\"pressureafter\":null,\"conform\":false,\"stampdetails\":\"\",\"report\":false,\"clamped\":false,\"created_at\":null,\"updated_at\":null,\"comment\":\"\",\"default\":\"\",\"traveltime\":0,\"traveltime2\":0,\"starttime\":\"2000-01-01T12:00:00.000Z\",\"finishtime\":\"2000-01-01T12:00:00.000Z\",\"location_id\":8,\"user_id\":1,\"date\":\"2015-11-10\",\"alignment\":\"\",\"portion_type\":\"\",\"ncf\":\"\",\"ncf_possession\":\"\",\"ncf_time_nc_reported\":\"\",\"ncf_description\":\"\",\"ncf_track_conditions\":\"\",\"ncf_abnormalities\":\"\",\"ncf_welder\":\"\",\"ncf_supervisor\":\"\",\"ncf_date\":\"\",\"portion_number\":\"\"}','OK','2015-11-12 16:06:18','2015-11-12 16:06:18','W',46,1,8),(78,'ALH','192.168.1.17','{\"id\":null,\"job_id\":104,\"elr\":\"123\",\"mileagem\":1,\"mileagey\":1,\"point\":\"12\",\"trackid\":\"1100 - Up Main/Fast\",\"rail\":\"Left\",\"linespeed\":\"95\",\"locationtype\":\"Open\",\"sleepertype\":\"Concrete\",\"consolidated\":false,\"l_manufacturer\":\"\",\"l_profile\":\"\",\"l_grade\":\"\",\"l_wear\":\"\",\"r_manufacturer\":\"\",\"r_profile\":\"\",\"r_grade\":\"\",\"r_wear\":\"\",\"cutting\":\"\",\"gap\":null,\"temperature\":0,\"weldtype\":\"\",\"mouldtype\":\"\",\"fuelgas\":\"\",\"gaskitnumber\":\"\",\"batchnumber\":\"\",\"tappingtime\":\"\",\"tensorkitnumber\":\"\",\"pressure\":null,\"pressureafter\":null,\"conform\":null,\"stampdetails\":\"\",\"report\":null,\"clamped\":null,\"created_at\":null,\"updated_at\":null,\"comment\":\"\",\"default\":\"\",\"traveltime\":0,\"traveltime2\":0,\"starttime\":\"2000-01-01T12:00:00.000Z\",\"finishtime\":\"2000-01-01T18:00:00.000Z\",\"location_id\":40,\"user_id\":1,\"date\":\"2015-11-12\",\"alignment\":\"\",\"portion_type\":\"\",\"ncf\":\"\",\"ncf_possession\":\"\",\"ncf_time_nc_reported\":\"\",\"ncf_description\":\"\",\"ncf_track_conditions\":\"\",\"ncf_abnormalities\":\"\",\"ncf_welder\":\"\",\"ncf_supervisor\":\"\",\"ncf_date\":\"\",\"portion_number\":\"\"}','OK','2015-11-12 16:32:15','2015-11-12 16:32:15','W',45,1,7),(79,'ALH','192.168.0.254','{\"id\":null,\"job_id\":105,\"elr\":\"123\",\"mileagem\":1,\"mileagey\":1,\"point\":\"12\",\"trackid\":\"1100 - Up Main/Fast\",\"rail\":\"Left\",\"linespeed\":\"95\",\"locationtype\":\"Open\",\"sleepertype\":\"Concrete\",\"consolidated\":false,\"l_manufacturer\":\"\",\"l_profile\":\"\",\"l_grade\":\"\",\"l_wear\":\"\",\"r_manufacturer\":\"\",\"r_profile\":\"\",\"r_grade\":\"\",\"r_wear\":\"\",\"cutting\":\"\",\"gap\":null,\"temperature\":0,\"weldtype\":\"\",\"mouldtype\":\"\",\"fuelgas\":\"\",\"gaskitnumber\":\"\",\"batchnumber\":\"\",\"tappingtime\":\"\",\"tensorkitnumber\":\"\",\"pressure\":null,\"pressureafter\":null,\"conform\":null,\"stampdetails\":\"\",\"report\":null,\"clamped\":null,\"created_at\":null,\"updated_at\":null,\"comment\":\"NO comment\",\"default\":\"\",\"traveltime\":0,\"traveltime2\":0,\"starttime\":\"2000-01-01T12:00:00.000Z\",\"finishtime\":null,\"location_id\":40,\"user_id\":1,\"date\":\"2015-11-12\",\"alignment\":\"\",\"portion_type\":\"\",\"ncf\":\"\",\"ncf_possession\":\"\",\"ncf_time_nc_reported\":\"\",\"ncf_description\":\"\",\"ncf_track_conditions\":\"\",\"ncf_abnormalities\":\"\",\"ncf_welder\":\"\",\"ncf_supervisor\":\"\",\"ncf_date\":\"\",\"portion_number\":\"\"}','OK','2015-12-07 11:43:57','2015-12-07 11:43:57','W',48,1,8),(80,'ALH','192.168.0.254','{\"id\":null,\"job_id\":106,\"elr\":\"123456\",\"mileagem\":0,\"mileagey\":0,\"point\":\"123\",\"trackid\":\"\",\"rail\":\"\",\"linespeed\":\"75\",\"locationtype\":\"Open\",\"sleepertype\":\"Concrete\",\"consolidated\":null,\"l_manufacturer\":\"\",\"l_profile\":\"\",\"l_grade\":\"\",\"l_wear\":\"\",\"r_manufacturer\":\"\",\"r_profile\":\"\",\"r_grade\":\"\",\"r_wear\":\"\",\"cutting\":\"\",\"gap\":null,\"temperature\":0,\"weldtype\":\"\",\"mouldtype\":\"\",\"fuelgas\":\"\",\"gaskitnumber\":\"\",\"batchnumber\":\"\",\"tappingtime\":\"\",\"tensorkitnumber\":\"\",\"pressure\":null,\"pressureafter\":null,\"conform\":null,\"stampdetails\":\"\",\"report\":null,\"clamped\":null,\"created_at\":null,\"updated_at\":null,\"comment\":\"\",\"default\":\"\",\"traveltime\":0,\"traveltime2\":0,\"starttime\":\"2000-01-01T12:00:00.000Z\",\"finishtime\":\"2000-01-01T16:00:00.000Z\",\"location_id\":null,\"user_id\":1,\"date\":\"2015-12-07\",\"alignment\":\"\",\"portion_type\":\"\",\"ncf\":\"\",\"ncf_possession\":\"\",\"ncf_time_nc_reported\":\"\",\"ncf_description\":\"\",\"ncf_track_conditions\":\"\",\"ncf_abnormalities\":\"\",\"ncf_welder\":\"\",\"ncf_supervisor\":\"\",\"ncf_date\":\"\",\"portion_number\":\"\",\"signature\":\"5643dae6-f7cc-4952-8431-c63180c9df03.bmp\"}','ERROR: [\"Trackid can\'t be blank\"]','2015-12-07 12:01:04','2015-12-07 12:01:04','W',NULL,1,1),(81,'ALH','192.168.0.254','{\"id\":null,\"job_id\":107,\"elr\":\"12\",\"mileagem\":0,\"mileagey\":0,\"point\":\"123\",\"trackid\":\"\",\"rail\":\"Left\",\"linespeed\":\"80\",\"locationtype\":\"Open\",\"sleepertype\":\"Concrete\",\"consolidated\":null,\"l_manufacturer\":\"\",\"l_profile\":\"\",\"l_grade\":\"\",\"l_wear\":\"\",\"r_manufacturer\":\"\",\"r_profile\":\"\",\"r_grade\":\"\",\"r_wear\":\"\",\"cutting\":\"\",\"gap\":null,\"temperature\":0,\"weldtype\":\"\",\"mouldtype\":\"\",\"fuelgas\":\"\",\"gaskitnumber\":\"\",\"batchnumber\":\"\",\"tappingtime\":\"\",\"tensorkitnumber\":\"\",\"pressure\":null,\"pressureafter\":null,\"conform\":null,\"stampdetails\":\"\",\"report\":null,\"clamped\":null,\"created_at\":null,\"updated_at\":null,\"comment\":\"\",\"default\":\"\",\"traveltime\":0,\"traveltime2\":0,\"starttime\":\"2000-01-01T01:00:00.000Z\",\"finishtime\":\"2000-01-01T01:00:00.000Z\",\"location_id\":null,\"user_id\":1,\"date\":\"2015-12-07\",\"alignment\":\"\",\"portion_type\":\"\",\"ncf\":\"\",\"ncf_possession\":\"\",\"ncf_time_nc_reported\":\"\",\"ncf_description\":\"\",\"ncf_track_conditions\":\"\",\"ncf_abnormalities\":\"\",\"ncf_welder\":\"\",\"ncf_supervisor\":\"\",\"ncf_date\":\"\",\"portion_number\":\"\",\"signature\":\"5636577b-ae01-4759-b9f7-b63a1f7cee78.bmp\"}','ERROR: [\"Trackid can\'t be blank\"]','2015-12-07 12:04:45','2015-12-07 12:04:45','W',NULL,1,7),(82,'ALH','192.168.0.254','{\"id\":null,\"job_id\":108,\"elr\":\"12\",\"mileagem\":0,\"mileagey\":0,\"point\":\"123\",\"trackid\":\"1100 - Up Main/Fast\",\"rail\":\"Left\",\"linespeed\":\"80\",\"locationtype\":\"Open\",\"sleepertype\":\"Concrete\",\"consolidated\":null,\"l_manufacturer\":\"\",\"l_profile\":\"\",\"l_grade\":\"\",\"l_wear\":\"\",\"r_manufacturer\":\"\",\"r_profile\":\"\",\"r_grade\":\"\",\"r_wear\":\"\",\"cutting\":\"\",\"gap\":null,\"temperature\":0,\"weldtype\":\"\",\"mouldtype\":\"\",\"fuelgas\":\"\",\"gaskitnumber\":\"\",\"batchnumber\":\"\",\"tappingtime\":\"\",\"tensorkitnumber\":\"\",\"pressure\":null,\"pressureafter\":null,\"conform\":null,\"stampdetails\":\"\",\"report\":null,\"clamped\":null,\"created_at\":null,\"updated_at\":null,\"comment\":\"\",\"default\":\"\",\"traveltime\":0,\"traveltime2\":0,\"starttime\":\"2000-01-01T01:00:00.000Z\",\"finishtime\":\"2000-01-01T01:00:00.000Z\",\"location_id\":41,\"user_id\":1,\"date\":\"2015-12-07\",\"alignment\":\"\",\"portion_type\":\"\",\"ncf\":\"\",\"ncf_possession\":\"\",\"ncf_time_nc_reported\":\"\",\"ncf_description\":\"\",\"ncf_track_conditions\":\"\",\"ncf_abnormalities\":\"\",\"ncf_welder\":\"\",\"ncf_supervisor\":\"\",\"ncf_date\":\"\",\"portion_number\":\"\",\"signature\":\"5636577b-ae01-4759-b9f7-b63a1f7cee78.bmp\"}','OK','2015-12-07 12:08:34','2015-12-07 12:08:34','W',49,1,7);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meulages`
--

DROP TABLE IF EXISTS `meulages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meulages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `localization_id` int(11) DEFAULT NULL,
  `identification_soudure` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `obs` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `profil_e1` int(11) DEFAULT NULL,
  `profil_e2` int(11) DEFAULT NULL,
  `profil_pointu` decimal(10,0) DEFAULT NULL,
  `profil_creux` int(11) DEFAULT NULL,
  `profil_longueur_meulage` int(11) DEFAULT NULL,
  `trace_sortante` int(11) DEFAULT NULL,
  `trace_entrante` int(11) DEFAULT NULL,
  `trace_longueur_meulage` int(11) DEFAULT NULL,
  `geometrie` int(11) DEFAULT NULL,
  `decision_etf` int(11) DEFAULT NULL,
  `date_decision_etf` date DEFAULT NULL,
  `decision_client` int(11) DEFAULT NULL,
  `date_decision_client` date DEFAULT NULL,
  `defaut` varchar(255) DEFAULT NULL,
  `masquee` tinyint(1) DEFAULT NULL,
  `journuit` int(11) DEFAULT NULL,
  `horaire_debut` varchar(255) DEFAULT NULL,
  `horaire_fin` varchar(255) DEFAULT NULL,
  `heurepriseposte` varchar(255) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_meulages_on_id` (`id`),
  KEY `index_meulages_on_localization_id` (`localization_id`),
  KEY `index_meulages_on_identification_soudure` (`identification_soudure`),
  KEY `index_meulages_on_date` (`date`),
  KEY `index_meulages_on_decision_etf` (`decision_etf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meulages`
--

LOCK TABLES `meulages` WRITE;
/*!40000 ALTER TABLE `meulages` DISABLE KEYS */;
/*!40000 ALTER TABLE `meulages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mus`
--

DROP TABLE IF EXISTS `mus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `mu` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mus`
--

LOCK TABLES `mus` WRITE;
/*!40000 ALTER TABLE `mus` DISABLE KEYS */;
/*!40000 ALTER TABLE `mus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receptions`
--

DROP TABLE IF EXISTS `receptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `localization_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `decision` int(11) DEFAULT NULL,
  `cause` varchar(255) DEFAULT NULL,
  `pv` tinyint(1) DEFAULT NULL,
  `obs` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `identification_soudure` varchar(255) DEFAULT NULL,
  `soudure_refaite_par` int(11) DEFAULT NULL,
  `penalites` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receptions`
--

LOCK TABLES `receptions` WRITE;
/*!40000 ALTER TABLE `receptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `receptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20130403190726'),('20130403190941'),('20130403191048'),('20130403191348'),('20130403194252'),('20130403194503'),('20130404080307'),('20130423093704'),('20130423093951'),('20130508114306'),('20130508140902'),('20130513091033'),('20130513143957'),('20130513144909'),('20130516154357'),('20130516154919'),('20130519200040'),('20130520114053'),('20130520120153'),('20130520121821'),('20130520131110'),('20130520140936'),('20130521073607'),('20130521082701'),('20130521105144'),('20130521112343'),('20130524070202'),('20130528080630'),('20130528082424'),('20130604041311'),('20130604071617'),('20130604075446'),('20130604115200'),('20130605081651'),('20130605083651'),('20130605085710'),('20130605111602'),('20130606113605'),('20130606114356'),('20130606114853'),('20130607075728'),('20130607082647'),('20130610130110'),('20130612130620'),('20130617125625'),('20130617132834'),('20130628101257'),('20130628120139'),('20130710094605'),('20131112114105'),('20131112124855'),('20131114111651'),('20131114112613'),('20131120114123'),('20131206085049'),('20140310160812'),('20140312104208'),('20140312112130'),('20140514135322'),('20141114115930'),('20141117124923'),('20150518122921'),('20150604082802'),('20150604083448'),('20150604085251'),('20150604085811'),('20150604090941'),('20150604102719'),('20150604105318'),('20150604110628'),('20150604111109'),('20150608072610'),('20150619085333'),('20150619090903'),('20150619092432'),('20150619094621'),('20150619101915'),('20150619102239'),('20150619102954'),('20150619133818'),('20150707120428'),('20150707121211'),('20150707141511'),('20150707142021'),('20150709084903'),('20150709091947'),('20150709111631'),('20150907120431'),('20150910115401'),('20150914082441'),('20150914083635'),('20150914085525'),('20150914091502'),('20150915140030'),('20150916081540'),('20150918090158'),('20150922071700'),('20150922072921'),('20150922073355'),('20150922090624'),('20150922092023'),('20150924142609'),('20150929173058'),('20151112104156'),('20151112131407'),('20151112134143'),('20151112145648'),('20151207091136'),('20151207115959');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inno` varchar(255) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `jobtype` varchar(255) DEFAULT NULL,
  `worksitelocation` varchar(255) DEFAULT NULL,
  `jobcost` varchar(255) DEFAULT NULL,
  `archive` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `installation_date` date DEFAULT NULL,
  `site_number` varchar(255) DEFAULT NULL,
  `client_site_number` varchar(255) DEFAULT NULL,
  `jobs_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,'162-5','COLAS','TON BRIDGE',NULL,NULL,NULL,0,'2015-06-04 10:31:37','2015-06-19 09:53:10','2015-05-03','12A','99999',20),(2,'999-1','COLAS','PARIS',NULL,NULL,NULL,0,'2015-06-04 11:42:39','2015-09-11 12:17:26',NULL,'34','',3),(3,'1234','ETF','PARIS',NULL,NULL,NULL,1,'2015-06-04 13:50:40','2015-06-05 11:21:29',NULL,NULL,NULL,1),(4,'89992-12','SNCF','PARIS ST LAZARE',NULL,NULL,NULL,0,'2015-06-05 13:33:36','2015-06-05 13:33:36',NULL,NULL,NULL,5),(5,'12344','DB','Strasbourg',NULL,NULL,NULL,0,'2015-06-08 07:33:06','2015-06-08 07:33:06','2014-11-16',NULL,NULL,0),(6,NULL,'SNCF','Paris',NULL,NULL,NULL,0,'2015-09-23 15:28:13','2015-09-23 15:28:13','2015-09-23','99999','8888',13),(7,NULL,'GPX','LONDON',NULL,NULL,NULL,0,'2015-09-25 13:07:57','2015-09-25 13:07:57','2015-09-27','99999','77777',5);
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soudures`
--

DROP TABLE IF EXISTS `soudures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soudures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `localization_id` int(11) DEFAULT NULL,
  `identification_soudure` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `lacune` int(11) DEFAULT NULL,
  `profil` varchar(255) DEFAULT NULL,
  `nuance` int(11) DEFAULT NULL,
  `procede` varchar(255) DEFAULT NULL,
  `obs` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `charge` varchar(255) DEFAULT NULL,
  `moule` varchar(255) DEFAULT NULL,
  `verin` tinyint(1) DEFAULT NULL,
  `aspect` int(11) DEFAULT NULL,
  `type_soudure` varchar(255) DEFAULT NULL,
  `type_autre` varchar(255) DEFAULT NULL,
  `meteo_soleil` tinyint(1) DEFAULT NULL,
  `meteo_nuages` tinyint(1) DEFAULT NULL,
  `meteo_pluie` tinyint(1) DEFAULT NULL,
  `meteo_neige` tinyint(1) DEFAULT NULL,
  `meteo_gel` tinyint(1) DEFAULT NULL,
  `temperature` int(11) DEFAULT NULL,
  `temperature_rail` int(11) DEFAULT NULL,
  `decision_etf` int(11) DEFAULT NULL,
  `date_decision_etf` date DEFAULT NULL,
  `decision_client` int(11) DEFAULT NULL,
  `date_decision_client` date DEFAULT NULL,
  `defaut` varchar(255) DEFAULT NULL,
  `journuit` int(11) DEFAULT NULL,
  `horaire_debut` varchar(255) DEFAULT NULL,
  `horaire_fin` varchar(255) DEFAULT NULL,
  `heurepriseposte` varchar(255) DEFAULT NULL,
  `masquee` tinyint(1) DEFAULT NULL,
  `usure` int(11) DEFAULT NULL,
  `usure_delta1` bigint(20) DEFAULT NULL,
  `usure_delta2` bigint(20) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_soudures_on_id` (`id`),
  KEY `index_soudures_on_localization_id` (`localization_id`),
  KEY `index_soudures_on_identification_soudure` (`identification_soudure`),
  KEY `index_soudures_on_date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soudures`
--

LOCK TABLES `soudures` WRITE;
/*!40000 ALTER TABLE `soudures` DISABLE KEYS */;
/*!40000 ALTER TABLE `soudures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password_digest` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `poincon` varchar(255) DEFAULT NULL,
  `validitee_debut` date DEFAULT NULL,
  `validitee_fin` date DEFAULT NULL,
  `secteur` varchar(255) DEFAULT NULL,
  `card_file_name` varchar(255) DEFAULT NULL,
  `card_content_type` varchar(255) DEFAULT NULL,
  `card_file_size` int(11) DEFAULT NULL,
  `card_updated_at` datetime DEFAULT NULL,
  `picture_file_name` varchar(255) DEFAULT NULL,
  `picture_content_type` varchar(255) DEFAULT NULL,
  `picture_file_size` int(11) DEFAULT NULL,
  `picture_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_users_on_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ALH','$2a$10$xiyj/W.EzdfLUBL4HAXNK.d7nUcOSIo8/iq9AJYlg4szrJiACH0La',3,'2015-06-04 09:29:55','2015-09-29 18:12:07','ALH','alh','','','999',NULL,NULL,NULL,'article-0-05F6EF1F000005DC-567_468x286.jpg','image/jpeg',63614,'2015-09-29 18:12:07','patrick-stewart1.jpg','image/jpeg',249246,'2015-09-29 18:10:04'),(2,'Richard','$2a$10$NFVK7Gmq7PMqpzy7uWRO4.8TTaAjFdCfYuDnY/LVvgDALPuC8z0JS',1,'2015-09-13 12:07:42','2015-09-29 18:49:20','V','Richard','88','88','8889','2015-09-13','2015-09-30',NULL,'article-0-05F6EF1F000005DC-567_468x286.jpg','image/jpeg',63614,'2015-09-29 18:49:19','patrick-stewart1.jpg','image/jpeg',249246,'2015-09-29 18:49:19'),(3,'TVonkat','$2a$10$hqyqaai1xQ10gw8Yg8l3nOORISxoTEdGKbppHPO2hIHVxzt98IAne',2,'2015-09-29 13:09:40','2015-09-29 18:51:12','VONKAT','Tam','','','77777','2015-09-01','2015-09-30',NULL,'article-0-05F6EF1F000005DC-567_468x286.jpg','image/jpeg',63614,'2015-09-29 18:51:12',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weldings`
--

DROP TABLE IF EXISTS `weldings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weldings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `elr` varchar(255) DEFAULT NULL,
  `mileagem` int(11) DEFAULT NULL,
  `mileagey` int(11) DEFAULT NULL,
  `point` varchar(255) DEFAULT NULL,
  `trackid` varchar(255) DEFAULT NULL,
  `rail` varchar(255) DEFAULT NULL,
  `linespeed` varchar(255) DEFAULT NULL,
  `locationtype` varchar(255) DEFAULT NULL,
  `sleepertype` varchar(255) DEFAULT NULL,
  `consolidated` tinyint(1) DEFAULT NULL,
  `l_manufacturer` varchar(255) DEFAULT NULL,
  `l_profile` varchar(255) DEFAULT NULL,
  `l_grade` varchar(255) DEFAULT NULL,
  `l_wear` varchar(255) DEFAULT NULL,
  `r_manufacturer` varchar(255) DEFAULT NULL,
  `r_profile` varchar(255) DEFAULT NULL,
  `r_grade` varchar(255) DEFAULT NULL,
  `r_wear` varchar(255) DEFAULT NULL,
  `cutting` varchar(255) DEFAULT NULL,
  `gap` int(11) DEFAULT NULL,
  `temperature` int(11) DEFAULT NULL,
  `weldtype` varchar(255) DEFAULT NULL,
  `mouldtype` varchar(255) DEFAULT NULL,
  `fuelgas` varchar(255) DEFAULT NULL,
  `gaskitnumber` varchar(255) DEFAULT NULL,
  `batchnumber` varchar(255) DEFAULT NULL,
  `tappingtime` varchar(255) DEFAULT NULL,
  `tensorkitnumber` varchar(255) DEFAULT NULL,
  `pressure` int(11) DEFAULT NULL,
  `pressureafter` int(11) DEFAULT NULL,
  `conform` tinyint(1) DEFAULT NULL,
  `stampdetails` varchar(255) DEFAULT NULL,
  `report` tinyint(1) DEFAULT NULL,
  `clamped` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `default` varchar(255) DEFAULT NULL,
  `traveltime` int(11) DEFAULT NULL,
  `traveltime2` int(11) DEFAULT NULL,
  `starttime` time DEFAULT NULL,
  `finishtime` time DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `alignment` varchar(255) DEFAULT NULL,
  `portion_type` varchar(255) DEFAULT NULL,
  `ncf` varchar(255) DEFAULT NULL,
  `ncf_possession` varchar(255) DEFAULT NULL,
  `ncf_time_nc_reported` varchar(255) DEFAULT NULL,
  `ncf_description` varchar(255) DEFAULT NULL,
  `ncf_track_conditions` varchar(255) DEFAULT NULL,
  `ncf_abnormalities` varchar(255) DEFAULT NULL,
  `ncf_welder` varchar(255) DEFAULT NULL,
  `ncf_supervisor` varchar(255) DEFAULT NULL,
  `ncf_date` varchar(255) DEFAULT NULL,
  `portion_number` varchar(255) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_weldings_on_job_id` (`job_id`),
  CONSTRAINT `fk_rails_3bc2e38f54` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weldings`
--

LOCK TABLES `weldings` WRITE;
/*!40000 ALTER TABLE `weldings` DISABLE KEYS */;
INSERT INTO `weldings` VALUES (1,4,'az',1,2,'W1','1','','100','','',0,'','','','','','','','','',1,NULL,'','','','','','','',NULL,NULL,1,'123456',1,1,'2015-06-04 11:51:32','2015-09-15 10:32:31','azaa az','Blowholes',1,1,'10:29:00','10:29:00',5,1,'2015-09-15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,3,'azaz',1,1,'azaz','2','',NULL,'Open','',0,'','','','','','','','','',NULL,NULL,'','','','','','','',NULL,NULL,1,'',1,1,'2015-06-04 12:07:52','2015-09-07 15:36:13','zaazeaze','',NULL,NULL,'15:36:00','15:36:00',4,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,8,'AZE',1,5,'A','A','',NULL,'','',0,'','','','','','','','','',NULL,NULL,'','','','','','','',NULL,NULL,0,'',0,0,'2015-06-05 08:55:59','2015-09-07 15:36:05','','',NULL,NULL,'15:36:00','15:36:00',3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,3,'AZ',33,23,'1233','12','RH','50','Tunnel','',0,'','','','','','','','','',NULL,NULL,'','','','','','','',NULL,NULL,1,'',0,0,'2015-06-05 10:19:14','2015-09-14 10:02:57','','',NULL,NULL,'15:35:00','15:35:00',2,2,'2015-09-14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,3,'AZE',22,23,'1','1','',NULL,'','',0,'','','','','','','','','',NULL,NULL,'','','','','','','',NULL,NULL,1,'',1,1,'2015-06-05 10:20:03','2015-09-14 09:32:11','','',NULL,NULL,'15:58:00','15:58:00',1,1,'2015-09-02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,7,'AZAZA',120,12,'1','11','',NULL,'','',0,'','','','','','','','','',NULL,NULL,'','','','','','','',NULL,NULL,1,'',0,0,'2015-06-05 10:50:34','2015-06-05 10:51:40','',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,5,'789',0,0,'123','4563',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-09-17 14:20:43','2015-09-17 14:20:43',NULL,NULL,NULL,NULL,NULL,NULL,6,1,'2015-09-17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,5,'789',0,0,'123','4563','','60','Open',NULL,0,'','','','','','','','','',0,0,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,'2015-09-17 14:40:49','2015-09-17 14:40:49','',NULL,0,0,NULL,NULL,6,1,'2015-09-17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,5,'789',0,0,'123','4563','','60','Open',NULL,0,'','','','','','','','','',0,0,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,'2015-09-17 15:06:29','2015-09-17 15:06:29','',NULL,0,0,NULL,NULL,6,1,'2015-09-17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,12,'123',1,1,'1','1','','130','Open',NULL,0,'','','','','','','','','',0,0,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,'2015-09-17 15:06:29','2015-09-17 15:06:29','',NULL,0,0,NULL,NULL,7,1,'2015-09-17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,13,'123',1,1,'1','1','','130','Tunnel',NULL,0,'','','','','','','','','',1,0,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,'2015-09-17 15:06:29','2015-09-17 15:06:29','',NULL,1,2,NULL,NULL,7,1,'2015-09-17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,14,'12',0,0,'12','12','',NULL,'',NULL,0,'','','','','','','','','',0,0,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,'2015-09-17 15:06:29','2015-09-17 15:06:29','',NULL,0,0,NULL,'10:25:00',8,1,'2015-09-17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,16,'125',0,0,'12','12','','50','Open',NULL,0,'','','','','','','','','',0,0,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,'2015-09-18 08:58:38','2015-09-18 08:58:38','',NULL,1,1,'12:00:00','18:00:00',9,1,'2015-09-18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,17,'123',0,0,'123','123','',NULL,'',NULL,0,'','','','','','','','','',0,0,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,'2015-09-18 09:05:50','2015-09-18 09:05:50','',NULL,0,0,'12:00:00','10:00:00',10,1,'2015-09-18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,19,'123',0,0,'123','123','',NULL,'',NULL,0,'','','','','','','','','',0,0,'','','','','','','',NULL,NULL,1,'1231',0,1,'2015-09-21 20:00:11','2015-09-21 20:00:11','12312','Blowholes',0,0,'12:00:00','12:00:00',10,1,'2015-09-18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,24,'12',1,1,'12','12','',NULL,'',NULL,0,'','','','','','','','','',0,0,'','','','','','','',NULL,NULL,0,'',0,0,'2015-09-22 07:27:22','2015-09-22 07:27:22','','',0,0,'12:00:00','16:00:00',13,1,'2015-09-22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,26,'12',0,0,'12','2','',NULL,'',NULL,0,'','','','','','','','','',0,0,'','','','','','','',NULL,NULL,0,'',0,0,'2015-09-22 07:35:25','2015-09-22 07:35:25','','',0,0,NULL,NULL,14,1,'2015-09-22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,27,'1212',1,1,'12','2','',NULL,'',NULL,0,'','','','','','','','','',0,0,'','','','','','','',NULL,NULL,0,'',0,0,'2015-09-22 08:08:02','2015-09-22 08:08:02','','',0,0,'12:00:00','12:00:00',15,1,'2015-09-22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,58,'1',1,1,'1','1','',NULL,'','',0,'','','','','','','','','',0,0,'','','','','','','',NULL,NULL,0,'',0,0,'2015-09-22 09:23:35','2015-09-22 09:23:35','','',0,0,'01:00:00','01:00:00',16,1,'2015-09-27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,59,'12',0,0,'2','2','',NULL,'','',0,'','','','','','','','','',0,0,'','','','','','','',NULL,NULL,0,'',0,0,'2015-09-22 09:23:35','2015-09-22 09:23:35','','',0,0,'12:00:00','12:00:00',17,1,'2015-09-22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,67,'12',0,0,'12','12','',NULL,'','',0,'','','','','','','','','',0,0,'','','','','','','',NULL,NULL,0,'',0,0,'2015-09-23 09:37:11','2015-09-23 09:37:11','','',0,0,'12:00:00','16:00:00',8,1,'2015-09-22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,68,'123456',0,1,'123456','6549687','',NULL,'','',0,'','','','','','','','','',0,0,'','','','','','','',NULL,NULL,0,'',0,0,'2015-09-23 09:37:12','2015-09-23 09:37:12','','',0,0,'18:00:00','06:00:00',20,1,'2015-09-22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,69,'123456',0,1,'123456','6549687','',NULL,'','',0,'','','','','','','','','',0,0,'','','','','','','',NULL,NULL,0,'',0,0,'2015-09-23 09:37:12','2015-09-23 09:37:12','','',0,0,'18:00:00','06:00:00',20,1,'2015-09-22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,70,'12',0,0,'12','12','',NULL,'','',0,'','','','','','','','','',0,0,'','','','','','','',NULL,NULL,0,'',0,0,'2015-09-23 10:11:57','2015-09-23 10:11:57','','',0,0,'12:00:00','18:00:00',8,1,'2015-09-23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,71,'11',0,0,'11','11','',NULL,'','',0,'','','','','','','','','',0,0,'','','','','','','',NULL,NULL,0,'',0,0,'2015-09-23 10:18:19','2015-09-23 10:18:19','','',0,0,'11:00:00','11:00:00',22,1,'2015-09-23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,74,'1',0,0,'1','11','',NULL,'','',0,'','','','','','','','','',0,0,'','','','','','','',NULL,NULL,0,'',0,0,'2015-09-23 10:22:33','2015-09-23 10:22:33','','',0,0,'01:00:00','01:00:00',23,1,'2015-09-23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,75,'899',1,1,'7889','7789','787','7878','8787','787',0,'railtech','78','78','78','railtech','89','89','89','77',2,0,'','','','','','','',NULL,NULL,0,'',0,0,'2015-09-23 15:41:57','2015-09-23 15:41:57','','',1,1,'09:00:00','17:00:00',24,1,'2015-09-23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,76,'9',1,1,'898','778','889','88','88','88',0,'railtech','78','79','79','Railtech','99','99','99','99',2,15,'PLA','H','Propane','899','888','999','99',77,77,1,'889',1,1,'2015-09-23 15:41:58','2015-09-23 15:41:58','RAS','Sand inclusion',1,1,'05:00:00','16:00:00',25,1,'2015-09-23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,84,'78',0,0,'78','78','',NULL,'','',0,'','','','','','','','','',0,0,'','','','','','','',NULL,NULL,0,'',0,0,'2015-09-24 09:02:34','2015-09-24 09:02:34','','',0,0,'12:00:00','12:00:00',27,1,'2015-09-24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,86,'78',0,0,'78','78','',NULL,'','',0,'','','','','','','','','',0,0,'','','','','','','',NULL,NULL,0,'',0,0,'2015-09-24 14:30:46','2015-09-24 14:30:46','','',0,0,'12:00:00','12:00:00',27,1,'2015-09-24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,87,'78',0,0,'78','78','',NULL,'','',0,'','','','','','','','','',0,0,'','','','','','','',NULL,NULL,0,'',0,0,'2015-09-24 14:30:57','2015-09-24 14:30:57','','',0,0,'12:00:00','12:00:00',27,1,'2015-09-24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,88,'123',0,0,'123','123','',NULL,'','',0,'','','','','','','','','',0,0,'','','','','','','',NULL,NULL,0,'',0,0,'2015-09-24 15:46:11','2015-09-24 15:46:11','','',0,0,'12:00:00','10:00:00',10,1,'2015-09-18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,89,'899',15,100,'789','77777','999','888','Tunnel','77',0,'Railtech','78','78','78','Railtech','89','87','47','999',3,6,'HG','H','Propane','889','8899','889','8899',78899,8999,1,'8889',1,1,'2015-09-24 18:36:00','2015-09-24 18:36:00','RAS','Sand inclusion',1,1,'09:30:00','17:30:00',29,1,'2015-09-24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,91,'7899',1,2,'7889','77899','89797','60','Tunnel','78899',0,'Railtech','78','97','67','Railtech','45','63','58','789',3,5,'HG','H','Propane','7889','7889','789','7899',799,472,1,'777777',1,1,'2015-09-24 18:42:18','2015-09-24 18:42:18','ramrkjamjrkmljamr','Shrinkage',1,1,'20:39:00','21:30:00',31,1,'2015-09-24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,92,'12',0,0,'12','12','',NULL,'','',0,'','','','','','','','','',0,0,'','','','','','','',NULL,NULL,1,'',0,0,'2015-09-25 10:23:41','2015-09-25 10:23:41','','',100,100,'12:00:00','12:00:00',8,1,'2015-09-25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,93,'12',12,100,'12','12','',NULL,'','',0,'','','','','','','','','',0,0,'','','','','','','',NULL,NULL,0,'',0,0,'2015-09-25 10:23:41','2015-09-25 10:23:41','','',1,1,'12:00:00','16:00:00',32,1,'2015-09-25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,94,'78787',5,2,'789','12453','78','80','Tunnel','78787',0,'Railtech','78','77','45','Railtech','99','78','45','7894',2,2,'HG','H','Propane','889','7789','789','785',789,12453,1,'7889',1,0,'2015-09-25 11:48:55','2015-09-25 11:48:55','marmjamrj','Paste inclusion lute',1,1,'14:00:00','18:00:00',33,1,'2015-09-25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,101,'7898',2,2,'7899','9999','99','70','Tunnel','7789',0,'Railtech','78','98','99','Railtech','78','99','77','77889',2,2,'HG','G','Propane','789','7889','7889','887',888,777,1,'7889',1,1,'2015-09-29 12:34:53','2015-09-29 12:34:53','kjlkfjmljakmljr','Corundum inclusion',1,1,'09:00:00','17:00:00',36,1,'2015-09-29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,3,'date',1,1,'1212','1100 - Up Main/Fast','','','','',NULL,'TATA','113A','260 - Grade A','DISC','','','','','',NULL,NULL,'','','','','','','',NULL,NULL,NULL,'',NULL,NULL,'2015-11-12 13:49:31','2015-11-12 14:10:14','','',NULL,NULL,'12:42:00','12:42:00',37,NULL,'2015-11-11','','','','sdq','qsd','qsd','qsd','qsd','qsd','qsd','2015-11-01',NULL,NULL),(44,3,'123',-1,-1,'1212','1200 - Up Slow','','','','',NULL,'TATA','113A','260 - Grade A','DISC','','','','','1',2,2,'Railtech','AZ','Propane','2','AZ','17','2',2,2,1,'qsdsqd',NULL,NULL,'2015-11-12 14:00:44','2015-11-12 14:12:31','qsdqsd','qsdqsd',NULL,NULL,'12:42:00','12:42:00',38,1,'2015-11-11','Wedgers','AZ','sdqsd','sqdqsdqsd','qsdqsd','qsdqsdqsd','qsdqsdqsd','qsdqsdqsd','sdqsdqsd','qsdqsdqsd','2015-11-03',NULL,NULL),(47,104,'123',1,1,'12','1100 - Up Main/Fast','Left','95','Open','Concrete',0,'','','','','','','','','',NULL,0,'','','','','','','',NULL,NULL,NULL,'',NULL,NULL,'2015-11-12 16:32:15','2015-11-12 16:32:15','','',0,0,'12:00:00','18:00:00',40,1,'2015-11-12','','','','','','','','','','','','',NULL),(48,105,'123',1,1,'12','1100 - Up Main/Fast','Left','95','Open','Concrete',0,'','','','','','','','','',NULL,0,'','','','','','','',NULL,NULL,NULL,'',NULL,NULL,'2015-12-07 11:43:57','2015-12-07 11:43:57','NO comment','',0,0,'12:00:00',NULL,40,1,'2015-11-12','','','','','','','','','','','','',NULL),(49,108,'SIGNATURE',0,0,'123','1100 - Up Main/Fast','Left','80','Open','Concrete',NULL,'','','','','','','','','',NULL,0,'','','','','','','',NULL,NULL,NULL,'',NULL,NULL,'2015-12-07 12:08:34','2015-12-07 13:36:34','','',0,0,'01:00:00','01:00:00',42,1,'2015-12-07','','','','','','','','','','','','','e7ab44d6-3a68-4563-8413-2e32efe3431f.png');
/*!40000 ALTER TABLE `weldings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-11 15:58:18
