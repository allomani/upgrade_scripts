ALTER TABLE `songs_phrases` ADD `cat` TEXT NOT NULL ;

CREATE TABLE `songs_phrases_cats` (
  `id` text NOT NULL,
  `name` text NOT NULL,
  PRIMARY KEY  (`id`(20))
) ;


INSERT INTO `songs_phrases_cats` (`id`, `name`) VALUES 
('main', '&#1575;&#1604;&#1593;&#1576;&#1575;&#1585;&#1575;&#1578; &#1575;&#1604;&#1593;&#1575;&#1605;&#1577;'),
('cp', '&#1604;&#1608;&#1581;&#1577; &#1575;&#1604;&#1578;&#1581;&#1603;&#1605; / &#1575;&#1604;&#1606;&#1592;&#1575;&#1605;');


update songs_phrases set cat='main' where cat='' ;


CREATE TABLE `songs_urls_data` (
  `id` int(11) NOT NULL auto_increment,
  `url` text NOT NULL,
  `downloads` int(11) NOT NULL default '0',
  `listens` int(11) NOT NULL default '0',
  `cat` int(11) NOT NULL default '0',
  `song_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ;


CREATE TABLE `songs_urls_fields` (
  `id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `download_icon` text NOT NULL,
  `listen_icon` text NOT NULL,
  `show_listen` int(11) NOT NULL default '0',
  `show_download` int(11) NOT NULL default '0',
  `ord` int(11) NOT NULL default '0',
  `listen_mime` text NOT NULL,
  `listen_name` text NOT NULL,
  `listen_content` text NOT NULL,
  `download_alt` text NOT NULL,
  `listen_alt` text NOT NULL,
  PRIMARY KEY  (`id`)
) ;

-- 
-- Dumping data for table `songs_urls_fields`
-- 

INSERT INTO `songs_urls_fields` (`id`, `name`, `download_icon`, `listen_icon`, `show_listen`, `show_download`, `ord`, `listen_mime`, `listen_name`, `listen_content`, `download_alt`, `listen_alt`) VALUES 
(1, '—«»ÿ «· Õ„Ì·', 'images/save.gif', 'images/listen.gif', 1, 1, 1, 'audio/x-pn-realaudio', 'listen.ram', '<?\r\nglobal $data,$num_ramadv,$scripturl;\r\nif($num_ramadv){\r\n\r\n$adv_ram_link = "?rpcontexturl=".$scripturl."/ram_banners.php&rpcontextwidth=$settings[ramadv_width]&rpcontextheight=$settings[ramadv_height]";\r\n\r\n}else{\r\n$adv_ram_link = "";\r\n}\r\n\r\nif (strchr($data[''url''],"http://")) {\r\n print "$data[url]".$adv_ram_link;\r\n           }else{\r\n print $scripturl."/".$data[''url''].$adv_ram_link;\r\n        }\r\n?>', ' Õ„Ì· ({downloads}  Õ„Ì·)', '«” „«⁄ ({listens} «” „«⁄)');



ALTER TABLE `songs_banners` ADD `content` TEXT NOT NULL ,
ADD `c_type` TEXT NOT NULL ;


insert into songs_settings (name,value) values('site_pages_lang','ar-sa');
insert into songs_settings (name,value) values('site_pages_encoding','windows-1256');
insert into songs_settings (name,value) values('enable_browsing','1');
insert into songs_settings (name,value) values('disable_browsing_msg','<center> ⁄›Ê« , «·„Êﬁ⁄ „€·ﬁ Õ«·Ì«</center>');


CREATE TABLE `songs_templates_cats` (
  `id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `selectable` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
)  AUTO_INCREMENT=2 ;



INSERT INTO `songs_templates_cats` (`id`, `name`, `selectable`) VALUES 
(1, '«·” «Ì· «·«› —«÷Ì', 1);

INSERT INTO `songs_templates_cats` (`id`, `name`, `selectable`) VALUES 
(2, 'Old Style', 0);


ALTER TABLE `songs_templates` ADD `cat` INT NOT NULL ;


update songs_templates set cat=2;



CREATE TABLE IF NOT EXISTS  `songs_new_songs_menu` (
  `id` int(11) NOT NULL auto_increment,
  `song_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
)  AUTO_INCREMENT=1 ;



-- 
-- Table structure for table `songs_confirmations`
-- 

CREATE TABLE `songs_confirmations` (
  `id` int(11) NOT NULL auto_increment,
  `type` text NOT NULL,
  `old_value` text NOT NULL,
  `new_value` text NOT NULL,
  `cat` int(11) NOT NULL default '0',
  `code` text NOT NULL,
  PRIMARY KEY  (`id`)
)  AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `songs_confirmations`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `songs_members_fields`
-- 

CREATE TABLE `songs_members_fields` (
  `id` int(11) NOT NULL auto_increment,
  `cat` int(11) NOT NULL default '0',
  `member` int(11) NOT NULL default '0',
  `value` text NOT NULL,
  PRIMARY KEY  (`id`)
)  AUTO_INCREMENT=1 ;


CREATE TABLE `songs_members_sets` (
  `id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `details` text NOT NULL,
  `type` text NOT NULL,
  `value` text NOT NULL,
  `style` text NOT NULL,
  `required` int(11) NOT NULL default '0',
  `ord` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
)  AUTO_INCREMENT=1 ;


insert into songs_settings (name,value) values('register_sec_code','1');
insert into songs_settings (name,value) values('auto_email_activate','0');
insert into songs_settings (name,value) values('register_username_min_letters','4');
insert into songs_settings (name,value) values('register_username_exclude_list','admin,mod,webmaster');
insert into songs_settings (name,value) values('mailing_default_use_html','1');
insert into songs_settings (name,value) values('mailing_default_encoding','');


CREATE TABLE `songs_hooks` (
  `id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `hookid` text NOT NULL,
  `code` text NOT NULL,
  `ord` int(11) NOT NULL default '0',
  `active` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
)  AUTO_INCREMENT=1 ;


insert into songs_settings (name,value) values('count_visitors_info','1');
insert into songs_settings (name,value) values('count_visitors_hits','1');
insert into songs_settings (name,value) values('count_online_visitors','1');


insert into songs_settings (name,value) values('enable_search','1');

insert into songs_settings (name,value) values('default_styleid','1');

insert into songs_settings (name,value) values('uploader_thumb_width','100');
insert into songs_settings (name,value) values('uploader_thumb_hieght','100');

INSERT INTO `songs_settings` (
`name` ,
`value` 
)
VALUES (
'ramadv_width', '600'
), (
'ramadv_height', '200'
);


ALTER TABLE `songs_new_menu` CHANGE `singer_id` `cat` INT( 11 ) NOT NULL DEFAULT '0' ;
ALTER TABLE `songs_new_menu` ADD `type` TEXT NOT NULL ;

update songs_new_menu set `type`='singer';


INSERT INTO `songs_settings` (
`name` ,
`value` 
)
VALUES (
'sitename_in_subpages', '1'
);

INSERT INTO `songs_settings` (
`name` ,
`value` 
)
VALUES (
'section_name_in_subpages', '1'
);


ALTER TABLE `songs_banners` ADD `active` INT NOT NULL ;

update songs_banners set active=1;

ALTER TABLE `songs_cats` ADD `ord` INT NOT NULL ;

ALTER TABLE `songs_new_menu` ADD `ord` INT NOT NULL ;

ALTER TABLE `songs_new_songs_menu` ADD `ord` INT NOT NULL ;


INSERT INTO `songs_settings` (
`name` ,
`value` 
)
VALUES (
'videos_perpage', '20'
);

ALTER TABLE `songs_user` ADD `cp_permisions` TEXT NOT NULL ;
ALTER TABLE `songs_videos_cats` ADD `ord` INT NOT NULL ;


ALTER TABLE `songs_singers` ADD `active` INT NOT NULL ;

update songs_singers set active=1;


ALTER TABLE `songs_cats` ADD `active` INT NOT NULL ;

update songs_cats set active=1;


ALTER TABLE `songs_videos_cats` ADD `active` INT NOT NULL ;

update songs_videos_cats set active=1;


ALTER TABLE `songs_urls_fields` ADD `active` INT NOT NULL ;
update songs_urls_fields set active=1;


CREATE TABLE `songs_custom_fields` (
  `id` int(11) NOT NULL auto_increment,
  `cat` int(11) NOT NULL default '0',
  `song_id` int(11) NOT NULL default '0',
  `value` text NOT NULL,
  PRIMARY KEY  (`id`)
)  AUTO_INCREMENT=1 ;


CREATE TABLE `songs_custom_sets` (
  `id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `type` text NOT NULL,
  `value` text NOT NULL,
  `style` text NOT NULL,
  `ord` int(11) NOT NULL default '0',
  `active` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
)  AUTO_INCREMENT=1 ;


INSERT INTO `songs_settings` (
`name` ,
`value` 
)
VALUES (
'visitors_can_sort_songs', '1'
);


INSERT INTO `songs_settings` (
`name` ,
`value` 
)
VALUES (
'songs_default_orderby', 'binary name'
), (
'songs_default_sort', 'asc'
);


ALTER TABLE `songs_cats` ADD `download_limit` INT NOT NULL ;
ALTER TABLE `songs_videos_cats` ADD `download_limit` INT NOT NULL ;


INSERT INTO `songs_settings` (
`name` ,
`value` 
)
VALUES (
'videos_member_download_only', '2'
);


INSERT INTO `songs_settings` (
`name` ,
`value` 
)
VALUES (
'songs_multi_select', '1'
);


CREATE TABLE `songs_playlists` (
  `id` int(11) NOT NULL auto_increment,
  `member_id` int(11) NOT NULL default '0',
  `name` text NOT NULL,
  PRIMARY KEY  (`id`)
)  ;



CREATE TABLE `songs_playlists_data` (
  `id` int(11) NOT NULL auto_increment,
  `cat` int(11) NOT NULL default '0',
  `song_id` int(11) NOT NULL default '0',
  `ord` int(11) NOT NULL default '0',
  `member_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
)  ;
