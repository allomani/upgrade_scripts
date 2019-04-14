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
(1, 'cats', '{name}', '{name} , {name} mp3 , {name} ÃœÌœ… , {name} Õ’—Ì…', '{name} , {name} mp3 , {name} ÃœÌœ… , {name} Õ’—Ì…'),
(2, 'member_profile', '{name} - «·„·› «·‘Œ’Ì', '«·„·› «·‘Œ’Ì {name} , {name} profile , «·⁄÷Ê {name} , «·«›·«„ «·„›’·… {name} , „—«”·… {name}', '«·„·› «·‘Œ’Ì {name} , {name} profile , «·⁄÷Ê {name} , «·«›·«„ «·„›’·… {name} , „—«”·… {name}'),
(3, 'news', '{name}', '{name} , «ﬁ—√ {name} , Œ»— {name} ,  ›«’Ì· {name}', '{name} , «ﬁ—√ {name} , Œ»— {name} ,  ›«’Ì· {name}'),
(4, 'pages', '{name}', '’›Õ… {name} ,  ›«’Ì· {name}', '’›Õ… {name} ,  ›«’Ì· {name}'),
(5, 'search', '«·»ÕÀ ⁄‰ {name}{sp}{page}', '«·»ÕÀ ⁄‰ {name} {page}', '«·»ÕÀ ⁄‰ {name} {page}'),
(6, 'singer', '{name} - {cat_name}{sp}{page}', '„⁄·Ê„«  ⁄‰ {name} , «€«‰Ì {name} , «·»Ê„«  {name} ,{cat_name}, {page}  ', '„⁄·Ê„«  ⁄‰ {name} , «€«‰Ì {name} , «·»Ê„«  {name} ,{cat_name}, {page}  '),
(7, 'videos_cat', '{name}{sp}{page}', '{name} , {name} ›ÌœÌÊÂ«  , ﬂ·Ì»«  {name} ,{name} ÃœÌœ… , {name} Õ’—Ì… {page}', '{name} , {name} ›ÌœÌÊÂ«  , ﬂ·Ì»«  {name} ,{name} ÃœÌœ… , {name} Õ’—Ì… {page}'),
(8, 'news_cats', '{name}{sp}{page}', '{name} , «Œ»«— {name} , ÃœÌœ {name} , {name} news , {name} Õ’—Ì', '{name} , «Œ»«— {name} , ÃœÌœ {name} , {name} news , {name} Õ’—Ì'),
(9, 'letters_songs', '√€«‰Ì Õ—› {letter}{sp}{page}', '√€«‰Ì Õ—› {letter}{sp}{page}', '√€«‰Ì Õ—› {letter}{sp}{page}'),
(10, 'letters_singers', '„€‰ÌÌ‰ Õ—› {letter}', '„€‰ÌÌ‰ Õ—› {letter}', '„€‰ÌÌ‰ Õ—› {letter}'),
(11, 'song_listen', '{name} - {singer_name} - {cat_name}', '{name},{singer_name} {album_name},{cat_name}', '{name},{singer_name} {album_name},{cat_name}'),
(12, 'album', '√·»Ê„ {album} {album_year} - {name} - {cat_name}{sp}{page}', '√·»Ê„ {album} {album_year} , «€«‰Ì {name} , «·»Ê„«  {name} ,{cat_name}, {page}  ', '√·»Ê„ {album} {album_year} , «€«‰Ì {name} , «·»Ê„«  {name} ,{cat_name}, {page}  '),
(13, 'singer_songs', '«€«‰Ì {name} - {cat_name}{sp}{page}', '«€«‰Ì {name} , «·»Ê„«  {name} ,{cat_name}, {page}  ', '«€«‰Ì {name} , «·»Ê„«  {name} ,{cat_name}, {page}  '),
(14, 'singer_albums', '«·»Ê„«  {name} - {cat_name}', 'Ã„Ì⁄ «·»Ê„«  {name} , «€«‰Ì {name} , «·»Ê„«  {name} ,{cat_name}', 'Ã„Ì⁄ «·»Ê„«  {name} , «€«‰Ì {name} , «·»Ê„«  {name} ,{cat_name}'),
(15, 'singer_videos', 'ﬂ·Ì»«  {name} - {cat_name}{sp}{page}', 'ﬂ·Ì»«  {name} , «€«‰Ì {name} , «·»Ê„«  {name} ,{cat_name}, {page}  ', 'ﬂ·Ì»«  {name} , «€«‰Ì {name} , «·»Ê„«  {name} ,{cat_name}, {page}  '),
(16, 'videos', '«·ﬂ·Ì»« ', 'ﬂ·Ì»«  , ›ÌœÌÊÂ«  , Õ›·«  , «€«‰Ì', 'ﬂ·Ì»«  , ›ÌœÌÊÂ«  , Õ›·«  , «€«‰Ì'),
(17, 'singer_photos', '’Ê— {name} - {cat_name}{sp}{page}', '’Ê— {name} , «€«‰Ì {name} , «·»Ê„«  {name} ,{cat_name}, {page}  ', '’Ê— {name} , «€«‰Ì {name} , «·»Ê„«  {name} ,{cat_name}, {page}  '),
(18, 'singer_photo', '’Ê—… {id} - {name} - {cat_name}', '’Ê—… {id} , {name} , {cat_name}', '’Ê—… {id} , {name} , {cat_name}'),
(19, 'video_watch', '{name} - {cat_name}', 'ﬂ·Ì» {name} , ›ÌœÌÊ {name} , ÃœÌœ {name}, Õ’—Ì {name}, {cat_name}', 'ﬂ·Ì» {name} , ›ÌœÌÊ {name} , ÃœÌœ {name}, Õ’—Ì {name}, {cat_name}'),
(20, 'song_lyrics', 'ﬂ·„«  {name} - {singer_name} - {cat_name}', 'ﬂ·„«   {name},{singer_name} {album_name},{cat_name}', 'ﬂ·„«   {name},{singer_name} {album_name},{cat_name}'),
(21, 'albums_page_w_year', '√·»Ê„«  {year}{sp}{page}', '√·»Ê„«  {year}{sp}{page}', '√·»Ê„«  {year}{sp}{page}'),
(22, 'albums_page', '«·√·»Ê„« {sp}{page}', 'Ã„Ì⁄ «·√·»Ê„«  {page}', 'Ã„Ì⁄ «·√·»Ê„«  {page}'),
(23, 'contactus', '«·« ’«· »‰«', '«·« ’«· »‰«', '«·« ’«· »‰«'),
(24, 'votes', '«·«” › «∆« ', '«·«” › «∆« ', '«·«” › «∆« ');


INSERT INTO  `songs_meta` (
`id` ,
`name` ,
`title` ,
`description` ,
`keywords`
)
VALUES (
NULL ,  'members_page',  '«·«⁄÷«¡ {sp}{page}',  '«·«⁄÷«¡ {sp}{page}',  '«·«⁄÷«¡ {sp}{page}'
);

INSERT INTO `songs_meta` (`id`, `name`, `title`, `description`, `keywords`) VALUES (NULL, 'singer_bio', '«·”Ì—… «·–« Ì… {name} - {cat_name}', '«·”Ì—… «·–« Ì… {name} , «€«‰Ì {name} , «·»Ê„«  {name} ,{cat_name}  ', '«·”Ì—… «·–« Ì… {name} , «€«‰Ì {name} , «·»Ê„«  {name} ,{cat_name}  ');