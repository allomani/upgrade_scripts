INSERT INTO `songs_settings` ( `name` , `value` ) 
VALUES (
'votes_expire_hours', '24'
);

INSERT INTO `songs_settings` ( `name` , `value` ) 
VALUES (
'copyrights_sitename', '«··Ê„«‰Ì'
);

INSERT INTO `songs_settings` ( `name` , `value` ) 
VALUES (
'search_min_letters', '3'
);


ALTER TABLE `songs_blocks` ADD `pages` TEXT NOT NULL ;

update songs_blocks set pages='main,browse,songs,browse_videos,news,pages,search,votes,statics,' where pos='r' or pos='l' ;
update songs_blocks set pages='main,' where pos='c' ;


ALTER TABLE `songs_banners` ADD `pages` TEXT NOT NULL ;
update songs_banners set pages='main,browse,songs,browse_videos,news,pages,search,votes,statics,';

ALTER TABLE `songs_videos_data` ADD `views` TEXT NOT NULL AFTER `downloads` ;


INSERT INTO `songs_templates` ( `id` , `title` , `name` , `content` , `protected` ) 
VALUES (
NULL , '⁄—÷ «·„€‰ÌÌ‰', 'browse_singers', '<center><a href=''index.php?action=songs&id={id}''><img border=0 src=''{img}''><br>{name}</a></center>', '1'
);

INSERT INTO `songs_templates` ( `id` , `title` , `name` , `content` , `protected` ) 
VALUES (
NULL , '⁄—÷ «·√·»Ê„« ', 'browse_albums', '<center><a href=''index.php?action=songs&id={singer_id}&album_id={album_id}''><img border=0 src=''{img}'' alt="⁄œœ «·√€«‰Ì : {songs_count}"><br>{name}</a></center>', '1'
);

INSERT INTO `songs_phrases` (`id`, `name`, `value`) VALUES (NULL, 'err_vote_expire_hours', '⁄›Ê« , Ì„ﬂ‰ﬂ «· ’ÊÌ  ﬂ· {vote_expire_hours} ”«⁄…');



CREATE TABLE `songs_favorites` (
  `id` int(11) NOT NULL auto_increment,
  `data_id` int(11) NOT NULL default '0',
  `type` text NOT NULL,
  `user` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) TYPE=MyISAM AUTO_INCREMENT=18 ;


CREATE TABLE `songs_members` (
  `id` int(11) NOT NULL auto_increment,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `email` text NOT NULL,
  `active_code` text NOT NULL,
  `sex` text NOT NULL,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_login` datetime NOT NULL default '0000-00-00 00:00:00',
  `usr_group` int(11) NOT NULL default '0',
  `birth` date NOT NULL default '0000-00-00',
  `country` text NOT NULL,
  `mobile` text NOT NULL,
  `members_list` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) TYPE=MyISAM AUTO_INCREMENT=4 ;


CREATE TABLE `songs_msgs` (
  `id` int(11) NOT NULL auto_increment,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `user` int(11) NOT NULL default '0',
  `sender` int(11) NOT NULL default '0',
  `opened` int(11) NOT NULL default '0',
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) TYPE=MyISAM AUTO_INCREMENT=8 ;


ALTER TABLE `songs_msgs` CHANGE `sender` `sender` TEXT NOT NULL ;

CREATE TABLE `songs_countries` (
  `name` varchar(80) NOT NULL 
) TYPE=MyISAM;

INSERT INTO `songs_countries` VALUES ('Afghanistan');
INSERT INTO `songs_countries` VALUES ('Albania');
INSERT INTO `songs_countries` VALUES ('Algeria');
INSERT INTO `songs_countries` VALUES ('American Samoa');
INSERT INTO `songs_countries` VALUES ('Andorra');
INSERT INTO `songs_countries` VALUES ('Angola');
INSERT INTO `songs_countries` VALUES ('Anguilla');
INSERT INTO `songs_countries` VALUES ('Antarctica');
INSERT INTO `songs_countries` VALUES ('Antigua and Barbuda');
INSERT INTO `songs_countries` VALUES ('Argentina');
INSERT INTO `songs_countries` VALUES ('Armenia');
INSERT INTO `songs_countries` VALUES ('Aruba');
INSERT INTO `songs_countries` VALUES ('Australia');
INSERT INTO `songs_countries` VALUES ('Austria');
INSERT INTO `songs_countries` VALUES ('Azerbaijan');
INSERT INTO `songs_countries` VALUES ('Bahamas');
INSERT INTO `songs_countries` VALUES ('Bahrain');
INSERT INTO `songs_countries` VALUES ('Bangladesh');
INSERT INTO `songs_countries` VALUES ('Barbados');
INSERT INTO `songs_countries` VALUES ('Belarus');
INSERT INTO `songs_countries` VALUES ('Belgium');
INSERT INTO `songs_countries` VALUES ('Belize');
INSERT INTO `songs_countries` VALUES ('Benin');
INSERT INTO `songs_countries` VALUES ('Bermuda');
INSERT INTO `songs_countries` VALUES ('Bhutan');
INSERT INTO `songs_countries` VALUES ('Bolivia');
INSERT INTO `songs_countries` VALUES ('Bosnia and Herzegovina');
INSERT INTO `songs_countries` VALUES ('Botswana');
INSERT INTO `songs_countries` VALUES ('Bouvet Island');
INSERT INTO `songs_countries` VALUES ('Brazil');
INSERT INTO `songs_countries` VALUES ('British Indian Ocean Territory');
INSERT INTO `songs_countries` VALUES ('Brunei Darussalam');
INSERT INTO `songs_countries` VALUES ('Bulgaria');
INSERT INTO `songs_countries` VALUES ('Burkina Faso');
INSERT INTO `songs_countries` VALUES ('Burundi');
INSERT INTO `songs_countries` VALUES ('Cambodia');
INSERT INTO `songs_countries` VALUES ('Cameroon');
INSERT INTO `songs_countries` VALUES ('Canada');
INSERT INTO `songs_countries` VALUES ('Cape Verde');
INSERT INTO `songs_countries` VALUES ('Cayman Islands');
INSERT INTO `songs_countries` VALUES ('Central African Republic');
INSERT INTO `songs_countries` VALUES ('Chad');
INSERT INTO `songs_countries` VALUES ('Chile');
INSERT INTO `songs_countries` VALUES ('China');
INSERT INTO `songs_countries` VALUES ('Christmas Island');
INSERT INTO `songs_countries` VALUES ('Cocos (Keeling) Islands');
INSERT INTO `songs_countries` VALUES ('Colombia');
INSERT INTO `songs_countries` VALUES ('Comoros');
INSERT INTO `songs_countries` VALUES ('Congo');
INSERT INTO `songs_countries` VALUES ('Cook Islands');
INSERT INTO `songs_countries` VALUES ('Costa Rica');
INSERT INTO `songs_countries` VALUES ('Cote D''Ivoire');
INSERT INTO `songs_countries` VALUES ('Croatia');
INSERT INTO `songs_countries` VALUES ('Cuba');
INSERT INTO `songs_countries` VALUES ('Cyprus');
INSERT INTO `songs_countries` VALUES ('Czech Republic');
INSERT INTO `songs_countries` VALUES ('Denmark');
INSERT INTO `songs_countries` VALUES ('Djibouti');
INSERT INTO `songs_countries` VALUES ('Dominica');
INSERT INTO `songs_countries` VALUES ('Dominican Republic');
INSERT INTO `songs_countries` VALUES ('Ecuador');
INSERT INTO `songs_countries` VALUES ('Egypt');
INSERT INTO `songs_countries` VALUES ('El Salvador');
INSERT INTO `songs_countries` VALUES ('Equatorial Guinea');
INSERT INTO `songs_countries` VALUES ('Eritrea');
INSERT INTO `songs_countries` VALUES ('Estonia');
INSERT INTO `songs_countries` VALUES ('Ethiopia');
INSERT INTO `songs_countries` VALUES ('Faroe Islands');
INSERT INTO `songs_countries` VALUES ('Fiji');
INSERT INTO `songs_countries` VALUES ('Finland');
INSERT INTO `songs_countries` VALUES ('France');
INSERT INTO `songs_countries` VALUES ('Gabon');
INSERT INTO `songs_countries` VALUES ('Gambia');
INSERT INTO `songs_countries` VALUES ('Georgia');
INSERT INTO `songs_countries` VALUES ('Germany');
INSERT INTO `songs_countries` VALUES ('Ghana');
INSERT INTO `songs_countries` VALUES ('Gibraltar');
INSERT INTO `songs_countries` VALUES ('Greece');
INSERT INTO `songs_countries` VALUES ('Greenland');
INSERT INTO `songs_countries` VALUES ('Grenada');
INSERT INTO `songs_countries` VALUES ('Guadeloupe');
INSERT INTO `songs_countries` VALUES ('Guam');
INSERT INTO `songs_countries` VALUES ('Guatemala');
INSERT INTO `songs_countries` VALUES ('Guinea');
INSERT INTO `songs_countries` VALUES ('Guinea-Bissau');
INSERT INTO `songs_countries` VALUES ('Guyana');
INSERT INTO `songs_countries` VALUES ('Haiti');
INSERT INTO `songs_countries` VALUES ('Honduras');
INSERT INTO `songs_countries` VALUES ('Hong Kong');
INSERT INTO `songs_countries` VALUES ('Hungary');
INSERT INTO `songs_countries` VALUES ('Iceland');
INSERT INTO `songs_countries` VALUES ('India');
INSERT INTO `songs_countries` VALUES ('Indonesia');
INSERT INTO `songs_countries` VALUES ('Iraq');
INSERT INTO `songs_countries` VALUES ('Ireland');
INSERT INTO `songs_countries` VALUES ('Israel');
INSERT INTO `songs_countries` VALUES ('Italy');
INSERT INTO `songs_countries` VALUES ('Jamaica');
INSERT INTO `songs_countries` VALUES ('Japan');
INSERT INTO `songs_countries` VALUES ('Jordan');
INSERT INTO `songs_countries` VALUES ('Kazakhstan');
INSERT INTO `songs_countries` VALUES ('Kenya');
INSERT INTO `songs_countries` VALUES ('Kiribati');
INSERT INTO `songs_countries` VALUES ('Korea, Republic of');
INSERT INTO `songs_countries` VALUES ('Kuwait');
INSERT INTO `songs_countries` VALUES ('Kyrgyzstan');
INSERT INTO `songs_countries` VALUES ('Latvia');
INSERT INTO `songs_countries` VALUES ('Lebanon');
INSERT INTO `songs_countries` VALUES ('Lesotho');
INSERT INTO `songs_countries` VALUES ('Liberia');
INSERT INTO `songs_countries` VALUES ('Libyan Arab Jamahiriya');
INSERT INTO `songs_countries` VALUES ('Liechtenstein');
INSERT INTO `songs_countries` VALUES ('Lithuania');
INSERT INTO `songs_countries` VALUES ('Luxembourg');
INSERT INTO `songs_countries` VALUES ('Macao');
INSERT INTO `songs_countries` VALUES ('Madagascar');
INSERT INTO `songs_countries` VALUES ('Malawi');
INSERT INTO `songs_countries` VALUES ('Malaysia');
INSERT INTO `songs_countries` VALUES ('Maldives');
INSERT INTO `songs_countries` VALUES ('Mali');
INSERT INTO `songs_countries` VALUES ('Malta');
INSERT INTO `songs_countries` VALUES ('Marshall Islands');
INSERT INTO `songs_countries` VALUES ('Martinique');
INSERT INTO `songs_countries` VALUES ('Mauritania');
INSERT INTO `songs_countries` VALUES ('Mauritius');
INSERT INTO `songs_countries` VALUES ('Mayotte');
INSERT INTO `songs_countries` VALUES ('Mexico');
INSERT INTO `songs_countries` VALUES ('Monaco');
INSERT INTO `songs_countries` VALUES ('Mongolia');
INSERT INTO `songs_countries` VALUES ('Montserrat');
INSERT INTO `songs_countries` VALUES ('Morocco');
INSERT INTO `songs_countries` VALUES ('Mozambique');
INSERT INTO `songs_countries` VALUES ('Myanmar');
INSERT INTO `songs_countries` VALUES ('Namibia');
INSERT INTO `songs_countries` VALUES ('Nauru');
INSERT INTO `songs_countries` VALUES ('Nepal');
INSERT INTO `songs_countries` VALUES ('Netherlands');
INSERT INTO `songs_countries` VALUES ('Netherlands Antilles');
INSERT INTO `songs_countries` VALUES ('New Caledonia');
INSERT INTO `songs_countries` VALUES ('New Zealand');
INSERT INTO `songs_countries` VALUES ('Nicaragua');
INSERT INTO `songs_countries` VALUES ('Niger');
INSERT INTO `songs_countries` VALUES ('Nigeria');
INSERT INTO `songs_countries` VALUES ('Niue');
INSERT INTO `songs_countries` VALUES ('Norfolk Island');
INSERT INTO `songs_countries` VALUES ('Norway');
INSERT INTO `songs_countries` VALUES ('Oman');
INSERT INTO `songs_countries` VALUES ('Pakistan');
INSERT INTO `songs_countries` VALUES ('Palestine');
INSERT INTO `songs_countries` VALUES ('Panama');
INSERT INTO `songs_countries` VALUES ('Papua New Guinea');
INSERT INTO `songs_countries` VALUES ('Paraguay');
INSERT INTO `songs_countries` VALUES ('Peru');
INSERT INTO `songs_countries` VALUES ('Philippines');
INSERT INTO `songs_countries` VALUES ('Pitcairn');
INSERT INTO `songs_countries` VALUES ('Poland');
INSERT INTO `songs_countries` VALUES ('Portugal');
INSERT INTO `songs_countries` VALUES ('Puerto Rico');
INSERT INTO `songs_countries` VALUES ('Qatar');
INSERT INTO `songs_countries` VALUES ('Reunion');
INSERT INTO `songs_countries` VALUES ('Romania');
INSERT INTO `songs_countries` VALUES ('Russian Federation');
INSERT INTO `songs_countries` VALUES ('Rwanda');
INSERT INTO `songs_countries` VALUES ('Saint Helena');
INSERT INTO `songs_countries` VALUES ('Saint Kitts and Nevis');
INSERT INTO `songs_countries` VALUES ('Saint Lucia');
INSERT INTO `songs_countries` VALUES ('Saint Pierre and Miquelon');
INSERT INTO `songs_countries` VALUES ('Samoa');
INSERT INTO `songs_countries` VALUES ('San Marino');
INSERT INTO `songs_countries` VALUES ('Sao Tome and Principe');
INSERT INTO `songs_countries` VALUES ('Saudi Arabia');
INSERT INTO `songs_countries` VALUES ('Senegal');
INSERT INTO `songs_countries` VALUES ('Serbia and Montenegro');
INSERT INTO `songs_countries` VALUES ('Seychelles');
INSERT INTO `songs_countries` VALUES ('Sierra Leone');
INSERT INTO `songs_countries` VALUES ('Singapore');
INSERT INTO `songs_countries` VALUES ('Slovakia');
INSERT INTO `songs_countries` VALUES ('Slovenia');
INSERT INTO `songs_countries` VALUES ('Solomon Islands');
INSERT INTO `songs_countries` VALUES ('Somalia');
INSERT INTO `songs_countries` VALUES ('South Africa');
INSERT INTO `songs_countries` VALUES ('Spain');
INSERT INTO `songs_countries` VALUES ('Sri Lanka');
INSERT INTO `songs_countries` VALUES ('Sudan');
INSERT INTO `songs_countries` VALUES ('Suriname');
INSERT INTO `songs_countries` VALUES ('Svalbard and Jan Mayen');
INSERT INTO `songs_countries` VALUES ('Swaziland');
INSERT INTO `songs_countries` VALUES ('Sweden');
INSERT INTO `songs_countries` VALUES ('Switzerland');
INSERT INTO `songs_countries` VALUES ('Syrian Arab Republic');
INSERT INTO `songs_countries` VALUES ('Taiwan, Province of China');
INSERT INTO `songs_countries` VALUES ('Tajikistan');
INSERT INTO `songs_countries` VALUES ('Thailand');
INSERT INTO `songs_countries` VALUES ('Timor-Leste');
INSERT INTO `songs_countries` VALUES ('Togo');
INSERT INTO `songs_countries` VALUES ('Tokelau');
INSERT INTO `songs_countries` VALUES ('Tonga');
INSERT INTO `songs_countries` VALUES ('Trinidad and Tobago');
INSERT INTO `songs_countries` VALUES ('Tunisia');
INSERT INTO `songs_countries` VALUES ('Turkey');
INSERT INTO `songs_countries` VALUES ('Turkmenistan');
INSERT INTO `songs_countries` VALUES ('Turks and Caicos Islands');
INSERT INTO `songs_countries` VALUES ('Tuvalu');
INSERT INTO `songs_countries` VALUES ('Uganda');
INSERT INTO `songs_countries` VALUES ('Ukraine');
INSERT INTO `songs_countries` VALUES ('United Arab Emirates');
INSERT INTO `songs_countries` VALUES ('United Kingdom');
INSERT INTO `songs_countries` VALUES ('United States');
INSERT INTO `songs_countries` VALUES ('Uruguay');
INSERT INTO `songs_countries` VALUES ('Uzbekistan');
INSERT INTO `songs_countries` VALUES ('Vanuatu');
INSERT INTO `songs_countries` VALUES ('Venezuela');
INSERT INTO `songs_countries` VALUES ('Viet Nam');
INSERT INTO `songs_countries` VALUES ('Virgin Islands, British');
INSERT INTO `songs_countries` VALUES ('Virgin Islands, U.s.');
INSERT INTO `songs_countries` VALUES ('Wallis and Futuna');
INSERT INTO `songs_countries` VALUES ('Western Sahara');
INSERT INTO `songs_countries` VALUES ('Yemen');
INSERT INTO `songs_countries` VALUES ('Zambia');
INSERT INTO `songs_countries` VALUES ('Zimbabwe');


ALTER TABLE `songs_singers` ADD `last_update` DATETIME NOT NULL ;

INSERT INTO `songs_settings` ( `name` , `value` ) 
VALUES (
'msgs_count_limit', '30'
), (
'mailing_email', 'mailing@allomani.biz'
);

INSERT INTO `songs_phrases` ( `id` , `name` , `value` ) 
VALUES (
NULL , 'add2favorite', '«÷«›… «·Ï «·„›÷·…'
);

INSERT INTO `songs_phrases` ( `id` , `name` , `value` ) 
VALUES (
NULL , 'add2fav_success', ' „  «·«÷«›… «·Ï «·„›÷·…'
);

UPDATE `songs_templates` SET `content` = '<script>
function snd(id)
{
msgwindow=window.open("send2friend.php?id="+id,"displaywindow","toolbar=no,scrollbars=no,width=350,height=270,top=200,left=200")
}

function snd_vid(id)
{

msgwindow=window.open("send2friend.php?op=video&id="+id,"displaywindow","toolbar=no,scrollbars=no,width=350,height=270,top=200,left=200")
}

function vote_song(id,action)
{

msgwindow=window.open("vote_song.php?id="+id+"&action="+action,"displaywindow","toolbar=no,scrollbars=no,width=350,height=250,top=200,left=200")
}

function add2fav(id,type)
{
msgwindow=window.open("add2fav.php?id="+id+"&type="+type,"displaywindow","toolbar=no,scrollbars=no,width=350,height=150,top=200,left=200")
}


</script>' WHERE  name ='js_functions';

INSERT INTO `songs_settings` ( `name` , `value` ) 
VALUES (
'member_download_only', '0'
);

INSERT INTO `songs_templates` ( `id` , `title` , `name` , `content` , `protected` ) 
VALUES (
NULL , '—”«·…  ›⁄Ì· «·Õ”«»', 'register_complete', '„—Õ»« {username} 

‘ﬂ—« · ”ÃÌ·ﬂ „⁄‰«

Ì ÊÃ» «·«‰ ⁄·Ìﬂ  ›⁄Ì· «‘ —«ﬂﬂ ·ﬂÌ  ” ÿÌ⁄ «· Õ„Ì· , Ì—ÃÏ « »«⁄ «·—«»ÿ «· «·Ì ·· ›⁄Ì· :

{active_link} 
        
', '1'
);

INSERT INTO `songs_templates` ( `id` , `title` , `name` , `content` , `protected` ) 
VALUES (
NULL , '—”«·… „⁄·Ê„«  «·œŒÊ·', 'email_login_info', '»‰«¡ ⁄·Ï ÿ·»ﬂ ﬁ„‰« »«—”«· „⁄·Ê„«  «·œŒÊ· ·ﬂ : 

«”„ «·„” Œœ„ : {username}
ﬂ·„… «·„—Ê— : {password} 
«Œ— œŒÊ· ﬂ«‰ ›Ì : {last_login}', '1'
);

INSERT INTO `songs_settings` ( `name` , `value` ) 
VALUES (
'members_register', '0'
);

INSERT INTO `songs_phrases` ( `id` , `name` , `value` ) 
VALUES (
NULL , 'register_closed', '⁄›Ê« , «· ”ÃÌ· „€·ﬁ'
);

INSERT INTO `songs_templates` (`id`, `title`, `name`, `content`, `protected`) VALUES (NULL, ' ’›Õ «·√€«‰Ì', 'browse_songs', '<?
global $data,$data_comment,$data_singer,$op,$settings,$phrases,$lyrics_count,$action,$is_user_cp;

print "
<td width=50%><img src=''images/song.gif'' border=0> &nbsp; $data[name]";

if($op==''letter'' || $action==''search'' || $is_user_cp){
print "- <a href=''index.php?action=songs&id=$data_singer[id]''>$data_singer[name]</a>";
}

print "&nbsp;&nbsp;  <i><font color=#D20000>$data_comment[name]</font></i></td>";

print "<td align=center width=5%><a href=''download.php?action=lsn&id=$data[id]''><img src=''images/listen.gif'' alt=''$phrases[listen] ($data[listens] $phrases[listen])'' border=0></a></td>
          <td align=center width=5%><a href=''download.php?id=$data[id]''><img src=''images/save.gif'' alt=''$phrases[download] ($data[downloads] $phrases[download])'' border=0></a></td>";

if($settings[''vote_song'']){
 print "<td align=center width=5%><a href=\\"javascript:vote_song(''$data[id]'',''song'')\\"><img src=''images/vote_song.gif'' alt=''$phrases[vote_song]'' border=0></a></td>    ";
         
}

if($settings[''snd2friend'']){
          print "<td align=center width=5%><a href=\\"javascript:snd($data[id])\\"><img src=''images/snd.gif'' alt=''$phrases[send2friend]'' border=0></a></td>    ";
         }

          if(check_member_login() && !$is_user_cp){
          print "<td align=center width=5%><a href=\\"javascript:add2fav($data[id],''song'');\\"><img src=''images/favorite.gif'' alt=''$phrases[add2favorite]'' border=0></a></td>";
          }

          if($data[''lyrics'']){
                    print" <td align=center width=5%><a href=''index.php?action=lyrics&id=$data[id]''><img src=''images/lyric.gif'' alt=''$phrases[lyrics]'' border=0></a></td>";
                     }else{

                     if($lyrics_count > 0){
                             print "<td width=5%></td>";
                            }
                             }

?>
', '1');

INSERT INTO `songs_templates` (`id`, `title`, `name`, `content`, `protected`) VALUES (NULL, '⁄—÷ «·ﬂ·Ì»« ', 'browse_videos', '<?
global $data,$data_cat,$settings,$phrases,$action,$is_user_cp;

print " <td><center><a href=''download.php?action=video&id=$data[id]''>
            <img border=0 alt=''$phrases[the_name] : $data[name] \\n$phrases[add_date] : ".substr($data[''date''],0,10)."''
            src=''".get_image($data[''img''])."''>
            <br>$data[name] </a><br>

<a href=''download.php?action=video&id=$data[id]''><img src=''images/download.gif'' border=0 alt=''$phrases[download]''></a>
<a href=''download.php?action=video&typ=lsn&id=$data[id]''><img src=''images/watch.gif'' border=0 alt=''$phrases[watch]''></a>";

if($settings[''snd2friend_clip'']){
print "<a href=''javascript:snd_vid($data[id])''><img src=''images/send.gif'' border=0 alt=''$phrases[send2friend]''></a>";
}

if($settings[''vote_clip'']){
print "<a href=\\"javascript:vote_song(''$data[id]'',''video'')\\"><img src=''images/vote_video.gif'' alt=''$phrases[vote_video]'' border=0></a>";
}

 if(check_member_login() && !$is_user_cp){
          print "<a href=\\"javascript:add2fav($data[id],''video'');\\"><img src=''images/favorite_small.gif'' alt=''$phrases[add2favorite]'' border=0></a>";
          }

if($action==''search''){
print "<br><a href=''index.php?action=browse_videos&cat=$data_cat[id]''>$data_cat[name]</a>";
}

 print "</center>    </td>";
        ?>', '1');

INSERT INTO `songs_settings` ( `name` , `value` ) 
VALUES (
'news_perpage', '10'
);

INSERT INTO `songs_phrases` ( `id` , `name` , `value` ) 
VALUES (
NULL , 'no_news', '·«  ÊÃœ √Œ»«—'
);

INSERT INTO `songs_templates` ( `id` , `title` , `name` , `content` , `protected` ) 
VALUES (
NULL , '⁄—÷ «·√Œ»«—', 'browse_news', '<table width=100%><tr><td width=20%><img src=''{img}''></td>
<td><center><font color=''#808080'' class=''title''>{title}</font></center><br>
<font color=''#808080''>{date} : </font> {content} ... <a href=''index.php?action=news&id={id}''>«ﬁ—√ «·„“Ìœ </a>
<br><br> «·ﬂ« » : <font color=''#808080''>{writer}</font></td></tr></table>', '1'
);

INSERT INTO `songs_phrases` ( `id` , `name` , `value` ) 
VALUES (
NULL , 'err_vote_file_expire_hours', '⁄›Ê« , Ì„ﬂ‰ﬂ  ﬁÌÌ„ «·„·› ﬂ· {vote_expire_hours} ”«⁄… '
);

INSERT INTO `songs_settings` ( `name` , `value` ) 
VALUES (
'vote_file_expire_hours', '24'
);