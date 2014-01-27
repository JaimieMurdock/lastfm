SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

ALTER TABLE `crawler_lastfm`.`lastfm_extended_user_info`
  ADD CONSTRAINT `fk_lastfm_extended_user_info_lastfm_userlist1`
  FOREIGN KEY (`user_id` )
  REFERENCES `crawler_lastfm`.`lastfm_userlist` (`user_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

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

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
