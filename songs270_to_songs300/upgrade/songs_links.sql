CREATE TABLE IF NOT EXISTS `songs_links` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `songs_links`
--

INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(1, 'cat', 'cat/{id}-{name}.html');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(2, 'browse_news', 'news_{cat}.html');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(3, 'browse_news_w_pages', 'news_{cat}_{start}.html');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(4, 'singer', 'singer/{id}-{name}.html');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(5, 'album', 'album-{id}-{album_id}.html');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(6, 'browse_songs_w_pages', 'singer-{id}-{album_id}-{orderby}-{sort}-{start}.html');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(7, 'browse_videos', 'videos-{id}.html');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(8, 'browse_videos_w_pages', 'videos-{id}-{start}.html');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(9, 'song_download', 'song_download_{id}_{cat}');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(10, 'song_listen', 'song_listen_{id}_{cat}.html');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(11, 'video_download', 'video_download_{id}');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(12, 'video_watch', 'video_watch_{id}.html');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(26, 'singer_songs', 'singer/{id}-{name}-songs.html');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(14, 'album_w_name', 'album/{singer_id}-{id}-{singer_name}-{name}.html');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(16, 'news', 'news.html');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(17, 'news_details', 'news_view_{id}.html');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(18, 'singer_photo', 'photo_{id}.html');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(19, 'singer_photos', 'singer/{id}-{name}-photos.html');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(20, 'singer_videos', 'singer/{id}-{name}-videos.html');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(21, 'pages', 'page_{id}.html');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(22, 'profile', 'profile_{id}.html');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(23, 'letters_songs_w_pages', 'songs-letter-{letter}-{start}.html');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(24, 'letters_songs', 'songs-letter-{letter}.html');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(25, 'singer_w_pages', 'singer/{id}-{album_id}-{orderby}-{sort}-{start}-{name}.html');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(27, 'singer_albums', 'singer/{id}-{name}-albums.html');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(28, 'singer_overview', 'singer/{id}-{name}.html');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(29, 'singer_videos_w_pages', 'singer/{id}-{name}-videos-{start}.html');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(30, 'singer_photos_w_pages', 'singer/{id}-{name}-photos-{start}.html');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(31, 'singer_bio', 'singer/{id}-{name}-bio.html');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(32, 'song_ext_listen', 'song_listen_{id}_{cat}');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(33, 'albums_page', 'albums.html');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(34, 'albums_page_w_pages', 'albums-{year}-{start}.html');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(35, 'albums_page_w_year', 'albums-{year}.html');
INSERT INTO `songs_links` (`id`, `name`, `value`) VALUES(36, 'letters_singers', 'singers-letter-{letter}.html');