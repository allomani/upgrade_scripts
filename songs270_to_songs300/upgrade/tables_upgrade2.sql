CREATE TABLE IF NOT EXISTS `songs_members_black` (
  `id` int(11) NOT NULL auto_increment,
  `uid1` int(11) NOT NULL,
  `uid2` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `songs_members_friends` (
  `id` int(11) NOT NULL auto_increment,
  `uid1` int(11) NOT NULL,
  `uid2` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


RENAME TABLE  `songs_msgs` TO  `songs_members_msgs` ;


ALTER TABLE  `songs_members_msgs` CHANGE  `title`  `title` VARCHAR( 255 ) NOT NULL ,
CHANGE  `user`  `owner` INT( 11 ) NOT NULL DEFAULT  '0',
CHANGE  `sender`  `username` VARCHAR( 255 )  NOT NULL ,
CHANGE  `opened`  `opened` INT( 1 ) NOT NULL DEFAULT  '0';

ALTER TABLE  `songs_members_msgs` CHANGE  `date`  `date` TEXT NOT NULL;
update songs_members_msgs set date=UNIX_TIMESTAMP(date);
ALTER TABLE  `songs_members_msgs` CHANGE  `date`  `date` INT( 11 ) NOT NULL;

ALTER TABLE  `songs_members_msgs` ADD  `uid` INT NOT NULL ,
ADD  `sent` INT( 1 ) NOT NULL;

ALTER TABLE  `songs_members_msgs` ADD INDEX (  `owner` );
ALTER TABLE  `songs_members_msgs` ADD INDEX (  `sent` );

ALTER TABLE  `songs_news` CHANGE  `writer`  `writer` VARCHAR( 100 )  NOT NULL ,
CHANGE  `title`  `title` VARCHAR( 255 )  NOT NULL;

ALTER TABLE  `songs_news` CHANGE  `date`  `date` TEXT NOT NULL;
update songs_news set date=UNIX_TIMESTAMP(date);
ALTER TABLE  `songs_news` CHANGE  `date`  `date` INT( 11 ) NOT NULL;


ALTER TABLE  `songs_news` ADD  `votes` INT NOT NULL ,
ADD  `votes_total` INT NOT NULL ,
ADD  `rate` FLOAT NOT NULL ,
ADD  `cat` INT NOT NULL;

ALTER TABLE  `songs_news` ADD INDEX (  `cat` );
ALTER TABLE  `songs_news` ADD INDEX (  `rate` );

update songs_news  set rate = votes/votes_total;


CREATE TABLE IF NOT EXISTS `songs_news_cats` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `ord` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

ALTER TABLE  `songs_new_menu` CHANGE  `type`  `type` VARCHAR( 10 )  NOT NULL;
ALTER TABLE  `songs_new_menu` ADD INDEX (  `type` );
ALTER TABLE  `songs_new_songs_menu` ADD INDEX (  `song_id` );

ALTER TABLE  `songs_pages` CHANGE  `title`  `title` VARCHAR( 255 )  NOT NULL;
ALTER TABLE  `songs_pages` ADD INDEX (  `active` );


ALTER TABLE  `songs_playlists` CHANGE  `name`  `name` VARCHAR( 100 )  NOT NULL;
ALTER TABLE  `songs_playlists` ADD INDEX (  `member_id` );


alter table  songs_playlists_data add index member_order_cat (cat,member_id,ord);
alter table  songs_playlists_data add index member_id (member_id,ord);


CREATE TABLE IF NOT EXISTS `songs_reports` (
  `id` int(11) NOT NULL auto_increment,
  `uid` int(11) NOT NULL,
  `fid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `report_type` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `date` int(11) NOT NULL,
  `opened` int(1) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `report_type` (`report_type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

ALTER TABLE  `songs_singers` CHANGE  `active`  `active` INT( 1 ) NOT NULL DEFAULT  '0';
ALTER TABLE  `songs_singers` CHANGE  `name`  `name` VARCHAR( 255 ) NOT NULL;


ALTER TABLE  `songs_singers` CHANGE  `last_update`  `last_update` TEXT NOT NULL;
update songs_singers set last_update=UNIX_TIMESTAMP(last_update);
ALTER TABLE  `songs_singers` CHANGE  `last_update`  `last_update` INT( 11 ) NOT NULL;


ALTER TABLE `songs_singers`  ADD `content` VARCHAR(255) NOT NULL,  ADD `details` TEXT NOT NULL,  ADD `page_name` VARCHAR(100) NOT NULL,  ADD `page_title` VARCHAR(255) NOT NULL,  ADD `page_description` VARCHAR(255) NOT NULL,  ADD `page_keywords` VARCHAR(255) NOT NULL,  ADD `votes` INT NOT NULL,  ADD `votes_total` INT NOT NULL,  ADD `rate` FLOAT NOT NULL,  ADD `views` INT NOT NULL,  ADD `date` INT NOT NULL,  ADD `songs_count` INT NOT NULL,  ADD `albums_count` INT NOT NULL,  ADD `photos_count` INT NOT NULL,  ADD `videos_count` INT NOT NULL;


ALTER TABLE  `songs_singers` ADD INDEX (  `name` );
ALTER TABLE  `songs_singers` ADD INDEX cat_active (  `cat`,`active` );
ALTER TABLE  `songs_singers` ADD INDEX (  `cat` );
ALTER TABLE  `songs_singers` ADD INDEX (  `active` );
ALTER TABLE  `songs_singers` ADD INDEX (  `rate` );
ALTER TABLE  `songs_singers` ADD INDEX (  `last_update` );


CREATE TABLE IF NOT EXISTS `songs_singers_fields` (
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


CREATE TABLE IF NOT EXISTS `songs_singers_photos` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `cat` int(11) NOT NULL default '0',
  `img` text NOT NULL,
  `img_resized` text NOT NULL,
  `thumb` text NOT NULL,
  `date` int(10) NOT NULL default '0',
  `ord` int(11) NOT NULL default '0',
  `views` int(11) NOT NULL default '0',
  `votes` int(11) NOT NULL default '0',
  `votes_total` int(11) NOT NULL default '0',
  `rate` float NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `cat` (`cat`),
  KEY `ord` (`ord`),
  KEY `rate` (`rate`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `songs_singers_photos_tags` (
  `id` int(11) NOT NULL auto_increment,
  `photo_id` int(11) NOT NULL default '0',
  `name` varchar(100) NOT NULL default '',
  `singer_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `singer_id` (`singer_id`),
  KEY `photo_id` (`photo_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


ALTER TABLE  `songs_songs` CHANGE  `name`  `name` VARCHAR( 255 )  NOT NULL;


ALTER TABLE  `songs_songs` CHANGE  `date`  `date` TEXT NOT NULL;
update songs_songs set date=UNIX_TIMESTAMP(date);
ALTER TABLE  `songs_songs` CHANGE  `date`  `date` INT( 11 ) NOT NULL;

ALTER TABLE  `songs_songs` CHANGE  `comment`  `ext` INT( 11 ) NOT NULL DEFAULT  '0';

ALTER TABLE  `songs_songs` ADD  `c_ext` VARCHAR( 50 ) NOT NULL ,
ADD  `rate` FLOAT NOT NULL ,
ADD  `video_id` INT NOT NULL;

update songs_songs set rate = votes/votes_total;


ALTER TABLE  `songs_songs` ADD INDEX (  `name` );

ALTER TABLE  `songs_songs` ADD INDEX (  `album` );
ALTER TABLE  `songs_songs` ADD INDEX singer_and_album (  `album`,`album_id` );
ALTER TABLE  `songs_songs` ADD INDEX (  `video_id` );
ALTER TABLE  `songs_songs` ADD INDEX (  `rate` );
ALTER TABLE  `songs_songs` ADD INDEX ext_and_date (  `ext`,`date` );
ALTER TABLE  `songs_songs` ADD INDEX (  `c_ext` );
ALTER TABLE  `songs_songs` ADD INDEX (  `date` );
ALTER TABLE  `songs_songs` ADD INDEX (  `ext` );


ALTER TABLE  `songs_templates` CHANGE  `name`  `name` VARCHAR( 255 ) NOT NULL;
ALTER TABLE  `songs_templates` ADD INDEX (  `name` );
ALTER TABLE  `songs_templates` ADD  `views` INT NOT NULL;

ALTER TABLE  `songs_templates_cats` ADD  `images` VARCHAR( 255 ) NOT NULL;

ALTER TABLE  `songs_urls_fields` ADD  `download_for_members` INT( 1 ) NOT NULL ,
ADD  `listen_for_members` INT( 1 ) NOT NULL ,
ADD  `listen_type` INT( 1 ) NOT NULL ,
ADD  `show_ext_listen` INT( 1 ) NOT NULL ,
ADD  `ext_listen_icon` VARCHAR( 100 ) NOT NULL ,
ADD  `ext_listen_alt` VARCHAR( 100 ) NOT NULL;

ALTER TABLE  `songs_videos_cats` CHANGE  `name`  `name` VARCHAR( 255 )  NOT NULL;

ALTER TABLE  `songs_videos_cats` ADD  `path` VARCHAR( 255 ) NOT NULL ,
ADD  `page_title` VARCHAR( 255 ) NOT NULL ,
ADD  `page_description` VARCHAR( 255 ) NOT NULL ,
ADD  `page_keywords` VARCHAR( 255 ) NOT NULL ,
ADD  `users` VARCHAR( 255 ) NOT NULL;

ALTER TABLE  `songs_videos_data` CHANGE  `name`  `name` VARCHAR( 255 ) NOT NULL;

ALTER TABLE  `songs_videos_data` CHANGE  `date`  `date` TEXT NOT NULL;
update songs_videos_data set date=UNIX_TIMESTAMP(date);
ALTER TABLE  `songs_videos_data` CHANGE  `date`  `date` INT( 11 ) NOT NULL;

ALTER TABLE  `songs_videos_data` ADD  `rate` FLOAT NOT NULL;

update songs_videos_data set rate = votes/votes_total;

ALTER TABLE  `songs_videos_data` CHANGE  `views`  `views` INT( 11 ) NOT NULL;


ALTER TABLE  `songs_videos_data` ADD INDEX (  `cat` );
ALTER TABLE  `songs_videos_data` ADD INDEX (  `name` );
ALTER TABLE  `songs_videos_data` ADD INDEX (  `rate` );
ALTER TABLE  `songs_videos_data` ADD INDEX (  `downloads` );
ALTER TABLE  `songs_videos_data` ADD INDEX (  `views` );

ALTER TABLE  `songs_votes` ADD INDEX (  `cat` );

CREATE TABLE IF NOT EXISTS `songs_comments` (
  `id` int(11) NOT NULL auto_increment,
  `uid` int(11) NOT NULL default '0',
  `fid` int(11) NOT NULL default '0',
  `comment_type` varchar(100) NOT NULL default '',
  `content` text NOT NULL,
  `time` int(14) NOT NULL default '0',
  `active` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `fid` (`fid`,`comment_type`,`active`),
  KEY `active` (`active`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;



update `songs_blocks`  set pages='main,browse.php,singer_overview.php,singer_bio.php,singer_photos.php,singer_videos.php,songs.php,listen.php,lyrics.php,albums.php,videos.php,video_watch.php,news.php,pages,search.php,votes.php,statics,register.php,profile.php,contactus.php,' where pos IN ('l','r');