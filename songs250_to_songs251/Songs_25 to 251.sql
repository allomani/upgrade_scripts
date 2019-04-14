INSERT INTO `songs_settings` (`name`, `value`) VALUES ('songs_perpage', '30');
INSERT INTO `songs_settings` (`name`, `value`) VALUES ('singers_groups', '0');
INSERT INTO `songs_settings` (`name`, `value`) VALUES ('songs_cells', '4');
INSERT INTO `songs_settings` (`name`, `value`) VALUES ('vote_clip', '1');
INSERT INTO `songs_settings` (`name`, `value`) VALUES ('snd2friend_clip', '1');

ALTER TABLE `songs_videos_data` ADD `date` DATETIME NOT NULL ;
ALTER TABLE `songs_videos_data` ADD `votes` INT NOT NULL , ADD `votes_total` INT NOT NULL ;

ALTER TABLE `songs_templates` ADD `protected` INT NOT NULL ;

update songs_templates set protected=1 ;

INSERT INTO `songs_templates` ( `id` , `title` , `name` , `content` , `protected` ) 
VALUES (NULL, '&#1585;&#1587;&#1575;&#1604;&#1577; &#1575;&#1604;&#1575;&#1585;&#1587;&#1575;&#1604; &#1604;&#1589;&#1583;&#1610;&#1602; - &#1603;&#1604;&#1610;&#1576;&#1575;&#1578;', 'friend_msg_clip', '<html dir="rtl">\r\n\r\n<head>\r\n<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">\r\n<meta http-equiv="Content-Language" content="ar-sa">\r\n</head>\r\n\r\n<p>��� �����  {name_from} ������ ��� ������� ��</p>\r\n\r\n��� ������� : {title} <br><br>\r\n\r\n�������� : <br> {url_listen}\r\n<br><br>\r\n�������  : <br> {url_save}\r\n\r\n\r\n\r\n</html>\r\n\r\n        \r\n        \r\n        ', 1),
(NULL, '&#1583;&#1608;&#1575;&#1604; &#1575;&#1604;&#1580;&#1575;&#1601;&#1575; &#1587;&#1603;&#1585;&#1610;&#1576;&#1578; &#1575;&#1604;&#1582;&#1575;&#1589;&#1577; &#1576;&#1575;&#1604;&#1606;&#1608;&#1575;&#1601;&#1584;', 'js_functions', '<script>\r\nfunction snd(id)\r\n{\r\n\r\nmsgwindow=window.open("send2friend.php?id="+id,"displaywindow","toolbar=no,scrollbars=no,width=350,height=270,top=200,left=200")\r\n}\r\n\r\nfunction snd_vid(id)\r\n{\r\n\r\nmsgwindow=window.open("send2friend.php?op=video&id="+id,"displaywindow","toolbar=no,scrollbars=no,width=350,height=270,top=200,left=200")\r\n}\r\n\r\nfunction vote_song(id,action)\r\n{\r\n\r\nmsgwindow=window.open("vote_song.php?id="+id+"&action="+action,"displaywindow","toolbar=no,scrollbars=no,width=350,height=250,top=200,left=200")\r\n}\r\n\r\n </script>\r\n        \r\n        ', 1),
(NULL, '���� ������ ��������', 'letters_singers', '<p align="center" class="title">\r\n<a class="big" href="index.php?action=browse&op=letter&letter=%C7">&#1575;</a>\r\n<a class="big" href="index.php?action=browse&op=letter&letter=%C8">&#1576;</a>\r\n<a class="big" href="index.php?action=browse&op=letter&letter=%CA">&#1578;</a>\r\n<a class="big" href="index.php?action=browse&op=letter&letter=%CB">&#1579;</a>\r\n<a class="big" href="index.php?action=browse&op=letter&letter=%CC">&#1580;</a>\r\n<a class="big" href="index.php?action=browse&op=letter&letter=%CD">&#1581;</a>\r\n<a class="big" href="index.php?action=browse&op=letter&letter=%CE">&#1582;</a>\r\n<a class="big" href="index.php?action=browse&op=letter&letter=%CF">&#1583;</a>\r\n<a class="big" href="index.php?action=browse&op=letter&letter=%D0">&#1584;</a>\r\n<a class="big" href="index.php?action=browse&op=letter&letter=%D1">&#1585;</a>\r\n<a class="big" href="index.php?action=browse&op=letter&letter=%D2">&#1586;</a>\r\n<a class="big" href="index.php?action=browse&op=letter&letter=%D3">&#1587;</a>\r\n<a class="big" href="index.php?action=browse&op=letter&letter=%D4">&#1588;</a>\r\n<a class="big" href="index.php?action=browse&op=letter&letter=%D5">&#1589;</a>\r\n<a class="big" href="index.php?action=browse&op=letter&letter=%D6">&#1590;</a>\r\n<a class="big" href="index.php?action=browse&op=letter&letter=%D8">&#1591;</a>\r\n<a class="big" href="index.php?action=browse&op=letter&letter=%D9">&#1592;</a>\r\n<a class="big" href="index.php?action=browse&op=letter&letter=%DA">&#1593;</a>\r\n<a class="big" href="index.php?action=browse&op=letter&letter=%DB">&#1594;</a>\r\n<a class="big" href="index.php?action=browse&op=letter&letter=%DD">&#1601;</a>\r\n<a class="big" href="index.php?action=browse&op=letter&letter=%DE">&#1602;</a>\r\n<a class="big" href="index.php?action=browse&op=letter&letter=%DF">&#1603;</a>\r\n<a class="big" href="index.php?action=browse&op=letter&letter=%E1">&#1604;</a>\r\n<a class="big" href="index.php?action=browse&op=letter&letter=%E3">&#1605;</a>\r\n<a class="big" href="index.php?action=browse&op=letter&letter=%E4">&#1606;</a>\r\n<a class="big" href="index.php?action=browse&op=letter&letter=%E5">&#1607;&#1600;</a>\r\n<a class="big" href="index.php?action=browse&op=letter&letter=%E6">&#1608;</a>\r\n<a class="big" href="index.php?action=browse&op=letter&letter=%ED">&#1609;</a></p>', 1),
(NULL, '���� ������ �������', 'letters_songs', '<p align="center" class="title">\r\n<a class="big" href="index.php?action=songs&op=letter&letter=%C7">&#1575;</a>\r\n<a class="big" href="index.php?action=songs&op=letter&letter=%C8">&#1576;</a>\r\n<a class="big" href="index.php?action=songs&op=letter&letter=%CA">&#1578;</a>\r\n<a class="big" href="index.php?action=songs&op=letter&letter=%CB">&#1579;</a>\r\n<a class="big" href="index.php?action=songs&op=letter&letter=%CC">&#1580;</a>\r\n<a class="big" href="index.php?action=songs&op=letter&letter=%CD">&#1581;</a>\r\n<a class="big" href="index.php?action=songs&op=letter&letter=%CE">&#1582;</a>\r\n<a class="big" href="index.php?action=songs&op=letter&letter=%CF">&#1583;</a>\r\n<a class="big" href="index.php?action=songs&op=letter&letter=%D0">&#1584;</a>\r\n<a class="big" href="index.php?action=songs&op=letter&letter=%D1">&#1585;</a>\r\n<a class="big" href="index.php?action=songs&op=letter&letter=%D2">&#1586;</a>\r\n<a class="big" href="index.php?action=songs&op=letter&letter=%D3">&#1587;</a>\r\n<a class="big" href="index.php?action=songs&op=letter&letter=%D4">&#1588;</a>\r\n<a class="big" href="index.php?action=songs&op=letter&letter=%D5">&#1589;</a>\r\n<a class="big" href="index.php?action=songs&op=letter&letter=%D6">&#1590;</a>\r\n<a class="big" href="index.php?action=songs&op=letter&letter=%D8">&#1591;</a>\r\n<a class="big" href="index.php?action=songs&op=letter&letter=%D9">&#1592;</a>\r\n<a class="big" href="index.php?action=songs&op=letter&letter=%DA">&#1593;</a>\r\n<a class="big" href="index.php?action=songs&op=letter&letter=%DB">&#1594;</a>\r\n<a class="big" href="index.php?action=songs&op=letter&letter=%DD">&#1601;</a>\r\n<a class="big" href="index.php?action=songs&op=letter&letter=%DE">&#1602;</a>\r\n<a class="big" href="index.php?action=songs&op=letter&letter=%DF">&#1603;</a>\r\n<a class="big" href="index.php?action=songs&op=letter&letter=%E1">&#1604;</a>\r\n<a class="big" href="index.php?action=songs&op=letter&letter=%E3">&#1605;</a>\r\n<a class="big" href="index.php?action=songs&op=letter&letter=%E4">&#1606;</a>\r\n<a class="big" href="index.php?action=songs&op=letter&letter=%E5">&#1607;&#1600;</a>\r\n<a class="big" href="index.php?action=songs&op=letter&letter=%E6">&#1608;</a>\r\n<a class="big" href="index.php?action=songs&op=letter&letter=%ED">&#1609;</a></p>', 1);



ALTER TABLE `songs_blocks` ADD `template` INT NOT NULL ;


CREATE TABLE `songs_phrases` (
`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`name` TEXT NOT NULL ,
`value` TEXT NOT NULL 
) TYPE = MYISAM ;

INSERT INTO `songs_phrases` (`id`, `name`, `value`) VALUES 
(1, 'the_songs', '�������'),
(2, 'the_singers', '��������'),
(3, 'the_songs_count', '��� �������'),
(4, 'the_albums_count', '��� ���������'),
(5, 'last_update', '��� �����'),
(6, 'contact_us', '������� ���'),
(7, 'no_results', '�� ���� �����'),
(8, 'search_results', '����� �����'),
(9, 'download', '�����'),
(10, 'listen', '������'),
(11, 'vote_song', '����� �������'),
(12, 'send2friend', '����� �����'),
(13, 'lyrics', '����� �������'),
(14, 'watch', '������'),
(15, 'vote_video', '����� �������'),
(16, 'err_no_page', '���� , ��� ������ ��� ������'),
(17, 'type_search_keyword', '�� ������ ��� ����� ���'),
(18, 'the_name', '�����'),
(19, 'add_date', '����� �������'),
(20, 'err_no_videos', '�� ���� ������ ��� ��� �����'),
(21, 'err_wrong_url', '���� �����'),
(22, 'err_no_cats', '���� , �� ���� ����� ���'),
(23, 'another_songs', '����� ����'),
(24, 'pages', '�������'),
(25, 'err_no_songs', '�� ���� �����'),
(26, 'the_writer', '������'),
(27, 'the_news_archive', '����� �������'),
(28, 'vote_song_thnx_msg', '���� �� .. ��� �� ����� �������'),
(29, 'vote_video_thnx_msg', '���� �� .. ��� �� ����� ������'),
(30, 'vote_select', '�������'),
(31, 'vote_do', '�����'),
(32, 'send2friend_subject', '���� �� ����� '),
(33, 'send2friend_done', '��� �� ����� ������  ������ '),
(34, 'your_name', '����'),
(35, 'your_email', '����� ����������'),
(36, 'your_friend_email', '���� �����'),
(37, 'send', '�����');

