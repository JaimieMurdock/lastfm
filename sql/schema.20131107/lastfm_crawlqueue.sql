-- MySQL dump 10.13  Distrib 5.6.11, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: crawler_lastfm
-- ------------------------------------------------------
-- Server version	5.6.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `lastfm_crawlqueue`
--

DROP TABLE IF EXISTS `lastfm_crawlqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lastfm_crawlqueue` (
  `user_name` varchar(767) NOT NULL,
  `crawl_flag` int(1) DEFAULT '0',
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `friends_fixed` int(1) NOT NULL DEFAULT '1',
  `loved_tracks` int(1) DEFAULT '0',
  `banned_tracks` int(1) DEFAULT '0',
  `groups` int(1) DEFAULT '0',
  PRIMARY KEY (`user_name`),
  KEY `crawl_flag` (`crawl_flag`),
  KEY `friends_fixed` (`friends_fixed`),
  KEY `loved_tracks` (`loved_tracks`),
  KEY `banned_tracks` (`banned_tracks`),
  KEY `groups` (`groups`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-11-06 23:54:18
