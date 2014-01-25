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
-- Table structure for table `lastfm_extended_user_info`
--

DROP TABLE IF EXISTS `lastfm_extended_user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lastfm_extended_user_info` (
  `user_name` varchar(767) CHARACTER SET utf8 DEFAULT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `country` varchar(767) CHARACTER SET utf8 DEFAULT NULL,
  `age` int(20) DEFAULT NULL,
  `gender` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `subscriber` tinyint(1) DEFAULT NULL,
  `playcount` bigint(20) DEFAULT NULL,
  `playlists` bigint(20) DEFAULT NULL,
  `bootstrap` bigint(20) DEFAULT NULL,
  `registered` datetime DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `anno_count` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_name` (`user_name`(255))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-11-06 23:55:08
