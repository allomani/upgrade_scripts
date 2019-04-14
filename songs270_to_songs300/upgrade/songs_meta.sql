CREATE TABLE IF NOT EXISTS `songs_meta` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `title` text NOT NULL,
  `description` text NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `songs_meta`
--

INSERT INTO `songs_meta` (`id`, `name`, `title`, `description`, `keywords`) VALUES
(1, 'cats', '{name}', '{name} , {name} mp3 , {name} ����� , {name} �����', '{name} , {name} mp3 , {name} ����� , {name} �����'),
(2, 'member_profile', '{name} - ����� ������', '����� ������ {name} , {name} profile , ����� {name} , ������� ������� {name} , ������ {name}', '����� ������ {name} , {name} profile , ����� {name} , ������� ������� {name} , ������ {name}'),
(3, 'news', '{name}', '{name} , ���� {name} , ��� {name} , ������ {name}', '{name} , ���� {name} , ��� {name} , ������ {name}'),
(4, 'pages', '{name}', '���� {name} , ������ {name}', '���� {name} , ������ {name}'),
(5, 'search', '����� �� {name}{sp}{page}', '����� �� {name} {page}', '����� �� {name} {page}'),
(6, 'singer', '{name} - {cat_name}{sp}{page}', '������� �� {name} , ����� {name} , ������� {name} ,{cat_name}, {page}  ', '������� �� {name} , ����� {name} , ������� {name} ,{cat_name}, {page}  '),
(7, 'videos_cat', '{name}{sp}{page}', '{name} , {name} �������� , ������ {name} ,{name} ����� , {name} ����� {page}', '{name} , {name} �������� , ������ {name} ,{name} ����� , {name} ����� {page}'),
(8, 'news_cats', '{name}{sp}{page}', '{name} , ����� {name} , ���� {name} , {name} news , {name} ����', '{name} , ����� {name} , ���� {name} , {name} news , {name} ����'),
(9, 'letters_songs', '����� ��� {letter}{sp}{page}', '����� ��� {letter}{sp}{page}', '����� ��� {letter}{sp}{page}'),
(10, 'letters_singers', '������ ��� {letter}', '������ ��� {letter}', '������ ��� {letter}'),
(11, 'song_listen', '{name} - {singer_name} - {cat_name}', '{name},{singer_name} {album_name},{cat_name}', '{name},{singer_name} {album_name},{cat_name}'),
(12, 'album', '����� {album} {album_year} - {name} - {cat_name}{sp}{page}', '����� {album} {album_year} , ����� {name} , ������� {name} ,{cat_name}, {page}  ', '����� {album} {album_year} , ����� {name} , ������� {name} ,{cat_name}, {page}  '),
(13, 'singer_songs', '����� {name} - {cat_name}{sp}{page}', '����� {name} , ������� {name} ,{cat_name}, {page}  ', '����� {name} , ������� {name} ,{cat_name}, {page}  '),
(14, 'singer_albums', '������� {name} - {cat_name}', '���� ������� {name} , ����� {name} , ������� {name} ,{cat_name}', '���� ������� {name} , ����� {name} , ������� {name} ,{cat_name}'),
(15, 'singer_videos', '������ {name} - {cat_name}{sp}{page}', '������ {name} , ����� {name} , ������� {name} ,{cat_name}, {page}  ', '������ {name} , ����� {name} , ������� {name} ,{cat_name}, {page}  '),
(16, 'videos', '��������', '������ , �������� , ����� , �����', '������ , �������� , ����� , �����'),
(17, 'singer_photos', '��� {name} - {cat_name}{sp}{page}', '��� {name} , ����� {name} , ������� {name} ,{cat_name}, {page}  ', '��� {name} , ����� {name} , ������� {name} ,{cat_name}, {page}  '),
(18, 'singer_photo', '���� {id} - {name} - {cat_name}', '���� {id} , {name} , {cat_name}', '���� {id} , {name} , {cat_name}'),
(19, 'video_watch', '{name} - {cat_name}', '���� {name} , ����� {name} , ���� {name}, ���� {name}, {cat_name}', '���� {name} , ����� {name} , ���� {name}, ���� {name}, {cat_name}'),
(20, 'song_lyrics', '����� {name} - {singer_name} - {cat_name}', '�����  {name},{singer_name} {album_name},{cat_name}', '�����  {name},{singer_name} {album_name},{cat_name}'),
(21, 'albums_page_w_year', '������� {year}{sp}{page}', '������� {year}{sp}{page}', '������� {year}{sp}{page}'),
(22, 'albums_page', '���������{sp}{page}', '���� ��������� {page}', '���� ��������� {page}'),
(23, 'contactus', '������� ���', '������� ���', '������� ���'),
(24, 'votes', '�����������', '�����������', '�����������');


INSERT INTO  `songs_meta` (
`id` ,
`name` ,
`title` ,
`description` ,
`keywords`
)
VALUES (
NULL ,  'members_page',  '������� {sp}{page}',  '������� {sp}{page}',  '������� {sp}{page}'
);

INSERT INTO `songs_meta` (`id`, `name`, `title`, `description`, `keywords`) VALUES (NULL, 'singer_bio', '������ ������� {name} - {cat_name}', '������ ������� {name} , ����� {name} , ������� {name} ,{cat_name}  ', '������ ������� {name} , ����� {name} , ������� {name} ,{cat_name}  ');