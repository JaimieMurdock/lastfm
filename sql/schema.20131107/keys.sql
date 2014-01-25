SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

ALTER TABLE `crawler_lastfm`.`lastfm_extended_user_info`
  ADD CONSTRAINT `fk_lastfm_extended_user_info_lastfm_userlist1`
  FOREIGN KEY (`user_id` )
  REFERENCES `crawler_lastfm`.`lastfm_userlist` (`user_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `crawler_lastfm`.`lastfm_annotations`
  ADD CONSTRAINT `fk_lastfm_annotations_lastfm_extended_user_info1`
  FOREIGN KEY (`user_id` )
  REFERENCES `crawler_lastfm`.`lastfm_extended_user_info` (`user_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD PRIMARY KEY (`user_id`, `item_url`, `tag_name`) ;

ALTER TABLE `crawler_lastfm`.`lastfm_bannedtracks`
  ADD CONSTRAINT `fk_lastfm_bannedtracks_lastfm_extended_user_info1`
  FOREIGN KEY (`user_id` )
  REFERENCES `crawler_lastfm`.`lastfm_extended_user_info` (`user_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD PRIMARY KEY (`user_id`, `item_url`) ;

ALTER TABLE `crawler_lastfm`.`lastfm_crawlqueue`
  ADD CONSTRAINT `fk_lastfm_crawlqueue_lastfm_userlist1`
  FOREIGN KEY (`user_name` )
  REFERENCES `crawler_lastfm`.`lastfm_userlist` (`user_name` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `crawler_lastfm`.`lastfm_errorqueue`
  ADD CONSTRAINT `fk_lastfm_errorqueue_lastfm_extended_user_info1`
  FOREIGN KEY (`user_id` )
  REFERENCES `crawler_lastfm`.`lastfm_extended_user_info` (`user_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

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
, DROP PRIMARY KEY 
, ADD PRIMARY KEY (`friend_id2`, `friend_id1`) ;

ALTER TABLE `crawler_lastfm`.`lastfm_groups`
  ADD CONSTRAINT `fk_lastfm_groups_lastfm_extended_user_info1`
  FOREIGN KEY (`user_id` )
  REFERENCES `crawler_lastfm`.`lastfm_extended_user_info` (`user_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `crawler_lastfm`.`lastfm_lovedtracks`
  ADD CONSTRAINT `fk_lastfm_lovedtracks_lastfm_extended_user_info1`
  FOREIGN KEY (`user_id` )
  REFERENCES `crawler_lastfm`.`lastfm_extended_user_info` (`user_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD PRIMARY KEY (`user_id`, `item_url`) ;

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

