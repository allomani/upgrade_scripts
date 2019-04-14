ALTER TABLE `movies_data` CHANGE `date` `date2` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00';

ALTER TABLE `movies_data` ADD `date` INT NOT NULL ,
ADD `year` INT NOT NULL ,
ADD `director` VARCHAR( 50 ) NOT NULL ,
ADD `page_title` VARCHAR( 255 ) NOT NULL ,
ADD `page_description` VARCHAR( 255 ) NOT NULL ,
ADD `page_keywords` VARCHAR( 255 ) NOT NULL ;

ALTER TABLE `movies_data` CHANGE `name` `name` VARCHAR( 255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL; 

ALTER TABLE `movies_data` ADD INDEX  (`name`) ; 
ALTER TABLE `movies_data` ADD INDEX  (`cat`) ; 


update movies_data set date=UNIX_TIMESTAMP(date2);

ALTER TABLE `movies_cats` ADD `active` INT( 1 ) NOT NULL ,
ADD `ord` INT( 11 ) NOT NULL ,
ADD `path` VARCHAR( 255 ) NOT NULL ,
ADD `users` VARCHAR( 255 ) NOT NULL ,
ADD `page_title` TEXT NOT NULL ,
ADD `page_description` TEXT NOT NULL ,
ADD `page_keywords` TEXT NOT NULL ,
ADD `watch_for_members` INT( 1 ) NOT NULL ;

ALTER TABLE`movies_cats` ADD `download_for_members` INT NOT NULL ;

UPDATE `movies_cats` SET active =1;


ALTER TABLE `movies_files` CHANGE `date` `date2` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00';

ALTER TABLE `movies_files` ADD `date` INT NOT NULL ,
 ADD `url_watch` TEXT NOT NULL ,
 ADD `ord` INT NOT NULL ;

update movies_files set date=UNIX_TIMESTAMP(date2);


update movies_members set password=md5(password);

ALTER TABLE  `movies_members` CHANGE  `sex`  `gender` VARCHAR( 10 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
ALTER TABLE `movies_members` CHANGE `date` `date2` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00';

ALTER TABLE `movies_members` ADD `date` INT NOT NULL ;
update movies_members set date=UNIX_TIMESTAMP(date2);


ALTER TABLE `movies_members` CHANGE `last_login` `last_login2` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00';

ALTER TABLE `movies_members` ADD `last_login` INT NOT NULL ;
update movies_members set last_login=UNIX_TIMESTAMP(last_login2);


ALTER TABLE  `movies_members` ADD  `img` TEXT NOT NULL ,
ADD  `thumb` TEXT NOT NULL ,
ADD  `pm_email_notify` INT( 1 ) NOT NULL ,
ADD  `privacy_settings` TEXT NOT NULL;

ALTER TABLE  `movies_news` ADD  `votes` INT NOT NULL ,
ADD  `votes_total` INT NOT NULL ,
ADD  `cat` INT NOT NULL;

ALTER TABLE  `movies_news` ADD INDEX (  `cat` );


ALTER TABLE `movies_news` CHANGE `date` `date2` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00';

ALTER TABLE `movies_news` ADD `date` INT NOT NULL ;
update movies_news set date=UNIX_TIMESTAMP(date2);


ALTER TABLE  `movies_subtitles` ADD  `ord` INT NOT NULL ,
ADD  `downloads` INT NOT NULL;


ALTER TABLE `movies_subtitles` CHANGE `date` `date2` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00';

ALTER TABLE `movies_subtitles` ADD `date` INT NOT NULL ;
update movies_subtitles set date=UNIX_TIMESTAMP(date2);

ALTER TABLE  `movies_photos` ADD  `img_resized` TEXT NOT NULL;
update movies_photos set img_resized=img;

ALTER TABLE `movies_photos` CHANGE `date` `date2` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00';

ALTER TABLE `movies_photos` ADD `date` INT NOT NULL ;
update movies_photos  set date=UNIX_TIMESTAMP(date2);


ALTER TABLE  `movies_photos` ADD  `votes` INT NOT NULL ,
ADD  `votes_total` INT NOT NULL ,
ADD  `ord` INT NOT NULL ,
ADD  `views` INT NOT NULL;

ALTER TABLE  `movies_photos` ADD INDEX (  `cat` );