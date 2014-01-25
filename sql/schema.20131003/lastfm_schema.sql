-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.11 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for crawler_lastfm
CREATE DATABASE IF NOT EXISTS `crawler_lastfm` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `crawler_lastfm`;


-- Dumping structure for table crawler_lastfm.lastfm_annotations
CREATE TABLE IF NOT EXISTS `lastfm_annotations` (
  `user_id` bigint(20) NOT NULL,
  `item_url` varchar(767) NOT NULL,
  `tag_name` varchar(2000) NOT NULL,
  `tag_date` date NOT NULL,
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table crawler_lastfm.lastfm_bannedtracks
CREATE TABLE IF NOT EXISTS `lastfm_bannedtracks` (
  `user_id` int(10) DEFAULT NULL,
  `item_url` varchar(767) COLLATE latin1_general_ci DEFAULT NULL,
  `ban_time` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `user_id_item_url` (`user_id`,`item_url`),
  KEY `user_id` (`user_id`),
  KEY `item_url` (`item_url`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Data exporting was unselected.


-- Dumping structure for table crawler_lastfm.lastfm_crawlqueue
CREATE TABLE IF NOT EXISTS `lastfm_crawlqueue` (
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

-- Data exporting was unselected.


-- Dumping structure for table crawler_lastfm.lastfm_errorqueue
CREATE TABLE IF NOT EXISTS `lastfm_errorqueue` (
  `user_id` bigint(20) DEFAULT NULL,
  `error_type` varchar(11) DEFAULT NULL,
  `tag_name` varchar(2000) DEFAULT NULL,
  `retry_count` int(11) DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `user_id` (`user_id`),
  KEY `error_type` (`error_type`),
  KEY `retry_count` (`retry_count`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table crawler_lastfm.lastfm_extended_user_info
CREATE TABLE IF NOT EXISTS `lastfm_extended_user_info` (
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

-- Data exporting was unselected.


-- Dumping structure for table crawler_lastfm.lastfm_friendlist
CREATE TABLE IF NOT EXISTS `lastfm_friendlist` (
  `friend_id1` bigint(20) NOT NULL,
  `friend_id2` bigint(20) NOT NULL,
  `sanity_check_id` varchar(767) NOT NULL,
  PRIMARY KEY (`sanity_check_id`),
  KEY `friend_id1` (`friend_id1`),
  KEY `friend_id2` (`friend_id2`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table crawler_lastfm.lastfm_groups
CREATE TABLE IF NOT EXISTS `lastfm_groups` (
  `user_id` int(10) NOT NULL DEFAULT '0',
  `group_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`,`group_name`),
  KEY `group` (`group_name`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table crawler_lastfm.lastfm_lovedtracks
CREATE TABLE IF NOT EXISTS `lastfm_lovedtracks` (
  `user_id` bigint(20) NOT NULL,
  `item_url` varchar(767) NOT NULL,
  `love_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `user_id_item_url` (`user_id`,`item_url`),
  KEY `item_url` (`item_url`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table crawler_lastfm.lastfm_scrobbles
CREATE TABLE IF NOT EXISTS `lastfm_scrobbles` (
  `user_id` bigint(20) NOT NULL,
  `item_url` varchar(767) NOT NULL,
  `scrobble_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `user_id_item_url_scrobble_time` (`user_id`,`item_url`,`scrobble_time`),
  KEY `user_id` (`user_id`),
  KEY `item_url` (`item_url`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table crawler_lastfm.lastfm_userlist
CREATE TABLE IF NOT EXISTS `lastfm_userlist` (
  `user_id` bigint(20) NOT NULL,
  `user_name` varchar(767) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for procedure crawler_lastfm.updatecrawlerqueue
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatecrawlerqueue`(OUT `userName` VARCHAR(1000))
BEGIN
	SELECT user_name from lastfm_crawlqueue where crawl_flag = 0 LIMIT 1 INTO userName;
	UPDATE lastfm_crawlqueue SET crawl_flag = 1, time_stamp= current_timestamp where user_name = userName;
    END//
DELIMITER ;


-- Dumping structure for procedure crawler_lastfm.updateerrorqueue
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateerrorqueue`(IN `userId` BIGINT, IN `errorType` VARCHAR(25), IN `tagName` VARCHAR(2000), OUT `retryCount` INT)
BEGIN
	SELECT retry_count FROM lastfm_errorqueue WHERE user_id=userId AND error_type=errorType AND tag_name=tagName INTO retryCount;
	IF retryCount IS NULL THEN
		INSERT INTO lastfm_errorqueue (user_id, error_type, tag_name, retry_count) VALUES (userId, errorType, tagName, 0);
		IF errorType='annotations' THEN
			DELETE FROM lastfm_annotations WHERE user_id=userId AND tag_name=tagname;
		END IF; 
	#ELSE update lastfm_errorqueue set retry_count=retryCount+1 where user_id=userID and error_type=errorType;
	END IF; 
    END//
DELIMITER ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
