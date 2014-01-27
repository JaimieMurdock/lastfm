SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DELETE `lastfm_scrobbles`
FROM `lastfm_scrobbles`
  LEFT OUTER JOIN `lastfm_extended_user_info`
  ON `lastfm_extended_user_info`.`user_id` = 
     `lastfm_scrobbles`.`user_id`
  WHERE `lastfm_extended_user_info`.`user_id` is NULL;
ALTER TABLE `crawler_lastfm`.`lastfm_scrobbles`
  ADD CONSTRAINT `fk_lastfm_scrobbles_lastfm_extended_user_info1`
  FOREIGN KEY (`user_id` )
  REFERENCES `crawler_lastfm`.`lastfm_extended_user_info` (`user_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD PRIMARY KEY (`user_id`, `item_url`, `scrobble_time`) ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

