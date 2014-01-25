SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

ALTER TABLE `crawler_lastfm`.`lastfm_annotations` CHANGE COLUMN `user_id` `user_id` INT(10) UNSIGNED NOT NULL  , CHANGE COLUMN `tag_name` `tag_name` VARCHAR(255) NOT NULL;

ALTER TABLE `crawler_lastfm`.`lastfm_extended_user_info` CHANGE COLUMN `user_name` `user_name` VARCHAR(32) CHARACTER SET 'utf8' NOT NULL  , CHANGE COLUMN `user_id` `user_id` INT(10) UNSIGNED NOT NULL DEFAULT 0  , CHANGE COLUMN `country` `country` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL  , CHANGE COLUMN `age` `age` TINYINT(3) UNSIGNED NULL DEFAULT NULL  , CHANGE COLUMN `gender` `gender` VARCHAR(10) CHARACTER SET 'utf8' NULL DEFAULT NULL  , CHANGE COLUMN `subscriber` `subscriber` TINYINT(1) NULL DEFAULT 0  , CHANGE COLUMN `playcount` `playcount` INT(10) UNSIGNED NULL DEFAULT NULL  , CHANGE COLUMN `playlists` `playlists` INT(11) NULL DEFAULT NULL  , CHANGE COLUMN `bootstrap` `bootstrap` INT(11) NULL DEFAULT NULL  , CHANGE COLUMN `anno_count` `anno_count` INT(11) NULL DEFAULT NULL; 

ALTER TABLE `crawler_lastfm`.`lastfm_bannedtracks` CHANGE COLUMN `user_id` `user_id` INT(10) UNSIGNED NOT NULL  , 
/*CHANGE COLUMN `item_url` `item_url` VARCHAR(700) CHARACTER SET 'utf8' NOT NULL
 * , */
CHANGE COLUMN `ban_time` `ban_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE `crawler_lastfm`.`lastfm_crawlqueue` CHANGE COLUMN `user_name` `user_name` VARCHAR(32) NOT NULL;

ALTER TABLE `crawler_lastfm`.`lastfm_errorqueue` CHANGE COLUMN `user_id` `user_id` INT(10) UNSIGNED NOT NULL  , CHANGE COLUMN `error_type` `error_type` VARCHAR(11) NOT NULL  , CHANGE COLUMN `tag_name` `tag_name` VARCHAR(255) NOT NULL  , CHANGE COLUMN `retry_count` `retry_count` SMALLINT(5) UNSIGNED NOT NULL DEFAULT 0; 


ALTER TABLE `crawler_lastfm`.`lastfm_friendlist` DROP COLUMN `sanity_check_id` , CHANGE COLUMN `friend_id1` `friend_id1` INT(10) UNSIGNED NOT NULL  , CHANGE COLUMN `friend_id2` `friend_id2` INT(10) UNSIGNED NOT NULL; 

ALTER TABLE `crawler_lastfm`.`lastfm_groups` CHARACTER SET = utf8 , CHANGE COLUMN `user_id` `user_id` INT(10) UNSIGNED NOT NULL;

ALTER TABLE `crawler_lastfm`.`lastfm_lovedtracks` CHANGE COLUMN `user_id` `user_id` INT(10) UNSIGNED NOT NULL;

ALTER TABLE `crawler_lastfm`.`lastfm_scrobbles` CHANGE COLUMN `user_id` `user_id` INT(10) UNSIGNED NOT NULL;

ALTER TABLE `crawler_lastfm`.`lastfm_userlist` CHANGE COLUMN `user_id` `user_id` INT(10) UNSIGNED NOT NULL  , CHANGE COLUMN `user_name` `user_name` VARCHAR(32) NOT NULL  ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
