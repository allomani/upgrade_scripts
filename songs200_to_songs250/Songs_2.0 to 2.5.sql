
CREATE TABLE `songs_albums` (
  `id` int(11) NOT NULL auto_increment,
  `cat` int(11) NOT NULL default '0',
  `name` text NOT NULL,
  `img` text NOT NULL,
  PRIMARY KEY  (`id`)
) TYPE=MyISAM AUTO_INCREMENT=17 ;

CREATE TABLE `songs_new_menu` (
  `id` int(11) NOT NULL auto_increment,
  `singer_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) TYPE=MyISAM AUTO_INCREMENT=15 ;


DROP TABLE IF EXISTS `songs_ramadv`;
CREATE TABLE `songs_ramadv` (
  `content` text NOT NULL,
  `height` int(11) NOT NULL default '0',
  `width` int(11) NOT NULL default '0',
  `active` int(11) NOT NULL default '0'
) TYPE=MyISAM;

INSERT INTO `songs_ramadv` VALUES ('<html dir=rtl>\r\n<center><img src=''http://allomani.com/allomani_banner.gif''>\r\n<br>\r\n<?\r\nprint $_SERVER[''SERVER_NAME'']; \r\n?>\r\n</center>\r\n</html>', 200, 600, 0);


CREATE TABLE `songs_settings` (
  `name` text NOT NULL,
  `value` text NOT NULL
) TYPE=MyISAM;


INSERT INTO `songs_settings` VALUES ('snd2friend', '1');
INSERT INTO `songs_settings` VALUES ('vote_song', '1');
INSERT INTO `songs_settings` VALUES ('sitename', 'Allomani');
INSERT INTO `songs_settings` VALUES ('section_name', 'Songs & Clips v2.5');
INSERT INTO `songs_settings` VALUES ('songs_add_fields', '5');
INSERT INTO `songs_settings` VALUES ('letters_songs', '1');
INSERT INTO `songs_settings` VALUES ('letters_singers', '1');
INSERT INTO `songs_settings` VALUES ('html_dir', 'rtl');
INSERT INTO `songs_settings` VALUES ('header_keywords', 'songs , music');
INSERT INTO `songs_settings` VALUES ('uploader', '0');
INSERT INTO `songs_settings` VALUES ('uploader_path', 'uploads');
INSERT INTO `songs_settings` VALUES ('uploader_msg', '‰√”› ·ﬂ  Õ„Ì· «·„·›«  €Ì— „›⁄·');
INSERT INTO `songs_settings` VALUES ('uploader_types', 'jpg,gif,png,rm,mp3');
INSERT INTO `songs_settings` VALUES ('songs_add_limit', '10');

ALTER TABLE `songs_songs` ADD `album_id` INT NOT NULL ,
ADD `listens` INT NOT NULL ,
ADD `votes` INT NOT NULL ,
ADD `votes_total` INT NOT NULL ;

ALTER TABLE `songs_templates` ADD `title` text NOT NULL ;

update songs_templates set title='«·ÂÌœ—' where name='header' ;
update songs_templates set title='«·›Ê —' where name='footer' ;
update songs_templates set title='«·ﬁÊ«∆„' where name='block' ;
update songs_templates set title='«·Ãœ«Ê·' where name='table' ;
update songs_templates set title='«·« ’«· »‰«' where name='contactus' ;
update songs_templates set title='—”«·… «·«—”«· ·’œÌﬁ' where name='friend_msg' ;
