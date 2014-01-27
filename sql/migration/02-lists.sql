SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

USE crawler_lastfm;

-- BANNEDTRACKS
DELETE `lastfm_bannedtracks`
FROM `lastfm_bannedtracks`
  LEFT OUTER JOIN `lastfm_extended_user_info`
  ON `lastfm_extended_user_info`.`user_id` = 
     `lastfm_bannedtracks`.`user_id`
  WHERE `lastfm_extended_user_info`.`user_id` is NULL;

ALTER TABLE `crawler_lastfm`.`lastfm_bannedtracks`
  ADD CONSTRAINT `fk_lastfm_bannedtracks_lastfm_extended_user_info1`
  FOREIGN KEY (`user_id` )
  REFERENCES `crawler_lastfm`.`lastfm_extended_user_info` (`user_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD PRIMARY KEY (`user_id`, `item_url`) ;

-- FRIENDLIST
DELETE `lastfm_friendlist`
FROM `lastfm_friendlist`
  LEFT OUTER JOIN `lastfm_extended_user_info`
  ON `lastfm_extended_user_info`.`user_id` = 
     `lastfm_friendlist`.`friend_id1`
  WHERE `lastfm_extended_user_info`.`user_id` is NULL;

DELETE `lastfm_friendlist`
FROM `lastfm_friendlist`
  LEFT OUTER JOIN `lastfm_extended_user_info`
  ON `lastfm_extended_user_info`.`user_id` = 
     `lastfm_friendlist`.`friend_id2`
  WHERE `lastfm_extended_user_info`.`user_id` is NULL;

ALTER TABLE `crawler_lastfm`.`lastfm_friendlist`
  ADD CONSTRAINT `fk_lastfm_friendlist_lastfm_extended_user_info1`
  FOREIGN KEY (`friend_id1` )
  REFERENCES `crawler_lastfm`.`lastfm_extended_user_info` (`user_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION, 
  ADD CONSTRAINT `fk_lastfm_friendlist_lastfm_extended_user_info2`
  FOREIGN KEY (`friend_id2` )
  REFERENCES `crawler_lastfm`.`lastfm_extended_user_info` (`user_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD PRIMARY KEY (`friend_id2`, `friend_id1`) ;

-- GROUPS
DELETE `lastfm_groups`
FROM `lastfm_groups`
  LEFT OUTER JOIN `lastfm_extended_user_info`
  ON `lastfm_extended_user_info`.`user_id` = 
     `lastfm_groups`.`user_id`
  WHERE `lastfm_extended_user_info`.`user_id` is NULL;
ALTER TABLE `crawler_lastfm`.`lastfm_groups`
  ADD CONSTRAINT `fk_lastfm_groups_lastfm_extended_user_info1`
  FOREIGN KEY (`user_id` )
  REFERENCES `crawler_lastfm`.`lastfm_extended_user_info` (`user_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

-- LOVEDTRACKS
DELETE `lastfm_lovedtracks`
FROM `lastfm_lovedtracks`
  LEFT OUTER JOIN `lastfm_extended_user_info`
  ON `lastfm_extended_user_info`.`user_id` = 
     `lastfm_lovedtracks`.`user_id`
  WHERE `lastfm_extended_user_info`.`user_id` is NULL;
ALTER TABLE `crawler_lastfm`.`lastfm_lovedtracks`
  ADD CONSTRAINT `fk_lastfm_lovedtracks_lastfm_extended_user_info1`
  FOREIGN KEY (`user_id` )
  REFERENCES `crawler_lastfm`.`lastfm_extended_user_info` (`user_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD PRIMARY KEY (`user_id`, `item_url`) ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

