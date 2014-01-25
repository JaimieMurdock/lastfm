
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
-- Table structure for table `lastfm_annotations`
--

USE `crawler_lastfm`;

DROP TABLE IF EXISTS `lastfm_annotations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lastfm_annotations` (
  `user_id` bigint(20) NOT NULL,
  `item_url` varchar(767) NOT NULL,
  `tag_name` varchar(2000) NOT NULL,
  `tag_date` date NOT NULL,
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `lastfm_bannedtracks`
--

DROP TABLE IF EXISTS `lastfm_bannedtracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lastfm_bannedtracks` (
  `user_id` int(10) DEFAULT NULL,
  `item_url` varchar(767) COLLATE latin1_general_ci DEFAULT NULL,
  `ban_time` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `user_id_item_url` (`user_id`,`item_url`),
  KEY `user_id` (`user_id`),
  KEY `item_url` (`item_url`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

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

--
-- Table structure for table `lastfm_errorqueue`
--

DROP TABLE IF EXISTS `lastfm_errorqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lastfm_errorqueue` (
  `user_id` bigint(20) DEFAULT NULL,
  `error_type` varchar(11) DEFAULT NULL,
  `tag_name` varchar(2000) DEFAULT NULL,
  `retry_count` int(11) DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `user_id` (`user_id`),
  KEY `error_type` (`error_type`),
  KEY `retry_count` (`retry_count`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

--
-- Table structure for table `lastfm_friendlist`
--

DROP TABLE IF EXISTS `lastfm_friendlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lastfm_friendlist` (
  `friend_id1` bigint(20) NOT NULL,
  `friend_id2` bigint(20) NOT NULL,
  `sanity_check_id` varchar(767) NOT NULL,
  PRIMARY KEY (`sanity_check_id`),
  KEY `friend_id1` (`friend_id1`),
  KEY `friend_id2` (`friend_id2`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `lastfm_groups`
--

DROP TABLE IF EXISTS `lastfm_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lastfm_groups` (
  `user_id` int(10) NOT NULL DEFAULT '0',
  `group_name` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`,`group_name`),
  KEY `group` (`group_name`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `lastfm_lovedtracks`
--

DROP TABLE IF EXISTS `lastfm_lovedtracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lastfm_lovedtracks` (
  `user_id` bigint(20) NOT NULL,
  `item_url` varchar(767) NOT NULL,
  `love_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `user_id_item_url` (`user_id`,`item_url`),
  KEY `item_url` (`item_url`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `lastfm_scrobbles`
--

DROP TABLE IF EXISTS `lastfm_scrobbles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lastfm_scrobbles` (
  `user_id` bigint(20) NOT NULL,
  `item_url` varchar(767) NOT NULL,
  `scrobble_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `user_id_item_url_scrobble_time` (`user_id`,`item_url`,`scrobble_time`),
  KEY `user_id` (`user_id`),
  KEY `item_url` (`item_url`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `lastfm_userlist`
--

DROP TABLE IF EXISTS `lastfm_userlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lastfm_userlist` (
  `user_id` bigint(20) NOT NULL,
  `user_name` varchar(767) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-11-06 23:36:05
