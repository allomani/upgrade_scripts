ALTER TABLE  `songs_custom_sets` ADD  `details` VARCHAR( 255 ) NOT NULL ,
ADD  `enable_search` INT( 1 ) NOT NULL;

ALTER TABLE  `songs_custom_sets` CHANGE  `name`  `name` VARCHAR( 100 )  NOT NULL ,
CHANGE  `type`  `type` VARCHAR( 50 )  NOT NULL ,
CHANGE  `value`  `value` VARCHAR( 255 )  NOT NULL ,
CHANGE  `style`  `style` VARCHAR( 255 )  NOT NULL;


RENAME TABLE  `songs_custom_sets` TO  `songs_songs_fields` ;

update  songs_songs_fields set enable_search=1;





ALTER TABLE  `info_best_visitors` CHANGE  `time`  `time` VARCHAR( 200 ) NOT NULL;


ALTER TABLE  `info_browser` CHANGE  `name`  `name` VARCHAR( 255 )  NOT NULL;

insert into `info_browser` (name) values ('Nokia'),('Android'),('iPhone'),('iPod'),('BlackBerry'),('Firefox'),('Chrome') ; 


ALTER TABLE  `info_hits` CHANGE  `date`  `date` VARCHAR( 12 ) NOT NULL;
ALTER TABLE  `info_hits` ADD INDEX (  `date` );

alter table info_online drop primary key;
ALTER TABLE  `info_online` ADD INDEX (  `time` );
ALTER TABLE  `info_online` ADD INDEX time_and_ip (  `time`,`ip` );



ALTER TABLE  `info_os` CHANGE  `name`  `name` VARCHAR( 255 )  NOT NULL;

INSERT INTO `info_os` (`name`) VALUES ('BlackBerry'), ('Symbian');


CREATE TABLE IF NOT EXISTS `songs_access_log` (
  `id` int(11) NOT NULL auto_increment,
  `username` text NOT NULL,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `status` text NOT NULL,
  `ip` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;



ALTER TABLE `songs_albums` CHANGE `name` `name` VARCHAR(255) NOT NULL;

ALTER TABLE  `songs_albums` ADD  `year` INT NOT NULL ,
ADD  `page_name` VARCHAR( 100 ) NOT NULL ,
ADD  `page_title` VARCHAR( 255 ) NOT NULL ,
ADD  `page_description` VARCHAR( 255 ) NOT NULL ,
ADD  `page_keywords` VARCHAR( 255 ) NOT NULL ,
ADD  `votes` INT NOT NULL ,
ADD  `votes_total` INT NOT NULL ,
ADD  `rate` FLOAT NOT NULL ,
ADD  `views` INT NOT NULL ,
ADD  `date` INT NOT NULL ;


ALTER TABLE  `songs_albums` ADD INDEX (  `name` );
ALTER TABLE  `songs_albums` ADD INDEX (  `year` );
ALTER TABLE  `songs_albums` ADD INDEX (  `rate` );


CREATE TABLE IF NOT EXISTS `songs_albums_fields` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `details` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `value` text NOT NULL,
  `style` varchar(255) NOT NULL,
  `ord` int(11) NOT NULL default '0',
  `enable_search` int(1) NOT NULL,
`active` int(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


ALTER TABLE  `songs_banners` CHANGE  `title`  `title` VARCHAR( 255 ) NOT NULL;

ALTER TABLE  `songs_banners` CHANGE  `date`  `date` TEXT NOT NULL;
update songs_banners set date=UNIX_TIMESTAMP(date);
ALTER TABLE  `songs_banners` CHANGE  `date`  `date` INT( 11 ) NOT NULL;


ALTER TABLE  `songs_banners` CHANGE  `type`  `type` VARCHAR( 20 )  NOT NULL;
ALTER TABLE  `songs_banners` CHANGE  `menu_pos`  `menu_pos` VARCHAR( 1 )  NOT NULL;
ALTER TABLE  `songs_banners` CHANGE  `pages`  `pages` VARCHAR( 255 ) NOT NULL;

ALTER TABLE  `songs_banners` CHANGE  `c_type`  `c_type` VARCHAR( 4 )  NOT NULL;
ALTER TABLE  `songs_banners` CHANGE  `active`  `active` INT( 1 ) NOT NULL DEFAULT  '0';

ALTER TABLE  `songs_banners` ADD  `start_date` INT NOT NULL , ADD  `expire_date` INT NOT NULL;

alter table songs_banners add index pos_active_start_end (`active`,`start_date`,`expire_date`,`menu_pos`);
alter table songs_banners add index (`active`);
alter table songs_banners add index (`menu_pos`);
alter table songs_banners add index (`expire_date`);


ALTER TABLE  `songs_blocks` CHANGE  `title`  `title` VARCHAR( 100 )  NOT NULL;
ALTER TABLE  `songs_blocks` CHANGE  `pos`  `pos` VARCHAR( 1 )  NOT NULL;
ALTER TABLE  `songs_blocks` CHANGE  `active`  `active` INT( 1 ) NOT NULL;
ALTER TABLE  `songs_blocks` CHANGE  `template`  `template` VARCHAR( 100 ) NOT NULL;
ALTER TABLE  `songs_blocks` CHANGE  `pages`  `pages` VARCHAR( 255 )  NOT NULL;
ALTER TABLE  `songs_blocks` ADD  `cat` INT NOT NULL , ADD  `hide_title` INT( 1 ) NOT NULL;


ALTER TABLE  `songs_cats` CHANGE  `name`  `name` VARCHAR( 100 ) NOT NULL;
ALTER TABLE  `songs_cats` CHANGE  `download_limit`  `download_for_members` INT( 1 ) NOT NULL;

ALTER TABLE  `songs_cats` ADD  `listen_for_members` INT( 1 ) NOT NULL ,
ADD  `page_name` VARCHAR( 100 ) NOT NULL ,
ADD  `page_title` VARCHAR( 255 ) NOT NULL ,
ADD  `page_description` VARCHAR( 255 ) NOT NULL ,
ADD  `page_keywords` VARCHAR( 255 ) NOT NULL;

ALTER TABLE  `songs_cats` ADD INDEX (  `active` );


RENAME TABLE  `songs_comments` TO  `songs_exts` ;
ALTER TABLE  `songs_exts` CHANGE  `name`  `name` VARCHAR( 50 ) NOT NULL;
ALTER TABLE  `songs_exts` ADD  `period_from` INT NOT NULL , ADD  `period_to` INT NOT NULL;



RENAME TABLE  `songs_favorites` TO  `songs_members_favorites` ;


ALTER TABLE  `songs_members_favorites` CHANGE  `data_id`  `fid` INT( 11 ) NOT NULL DEFAULT  '0',
CHANGE  `type`  `type` VARCHAR( 10 )  NOT NULL ,
CHANGE  `user`  `uid` INT( 11 ) NOT NULL DEFAULT  '0';

ALTER TABLE  `songs_members` CHANGE  `username`  `username` VARCHAR( 100 )  NOT NULL ,
CHANGE  `password`  `password` VARCHAR( 100 )  NOT NULL ,
CHANGE  `email`  `email` VARCHAR( 100 )  NOT NULL ,
CHANGE  `active_code`  `active_code` VARCHAR( 35 )  NOT NULL;
ALTER TABLE  `songs_members` CHANGE  `sex`  `gender` VARCHAR( 10 )  NOT NULL;


ALTER TABLE  `songs_members` CHANGE  `date`  `date` TEXT NOT NULL;
update songs_members set date=UNIX_TIMESTAMP(date);
ALTER TABLE  `songs_members` CHANGE  `date`  `date` INT( 11 ) NOT NULL;

ALTER TABLE  `songs_members` CHANGE  `last_login`  `last_login` TEXT NOT NULL;
update songs_members set last_login=UNIX_TIMESTAMP(last_login);
ALTER TABLE  `songs_members` CHANGE  `last_login`  `last_login` INT( 11 ) NOT NULL;


ALTER TABLE  `songs_members` CHANGE  `country`  `country` VARCHAR( 90 ) NOT NULL;

ALTER TABLE  `songs_members` ADD  `img` VARCHAR( 255 ) NOT NULL ,
ADD  `thumb` VARCHAR( 255 ) NOT NULL ,
ADD  `pm_email_notify` INT( 1 ) NOT NULL ,
ADD  `privacy_settings` TEXT NOT NULL;

ALTER TABLE  `songs_members` ADD INDEX (  `gender` );
ALTER TABLE  `songs_members` ADD INDEX (  `active_code` );
ALTER TABLE  `songs_members` ADD INDEX (  `username` );
ALTER TABLE  `songs_members` ADD INDEX (  `email` );
ALTER TABLE  `songs_members` ADD INDEX (  `last_login` );
ALTER TABLE  `songs_members` ADD INDEX (  `members_list` );
