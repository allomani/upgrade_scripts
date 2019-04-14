CREATE TABLE IF NOT EXISTS `songs_settings_new` (
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `songs_settings`
--

INSERT INTO `songs_settings_new` (`name`, `value`) VALUES
('snd2friend', '1'),
('vote_song', '1'),
('sitename', '��������'),
('section_name', '�������� � �������� v2.8'),
('songs_add_fields', '5'),
('letters_songs', '1'),
('letters_singers', '1'),
('html_dir', 'rtl'),
('header_keywords', '����� , ������ , ������ '),
('uploader', '1'),
('uploader_path', 'uploads'),
('uploader_msg', '���� �� , ��� ������� ��� ���� �� ������ ���������'),
('uploader_types', 'jpg,gif,png,rm,mp3'),
('songs_add_limit', '10'),
('singers_groups', '1'),
('songs_perpage', '100'),
('songs_cells', '4'),
('vote_clip', '1'),
('snd2friend_clip', '1'),
('votes_expire_hours', '24'),
('copyrights_sitename', '��������'),
('search_min_letters', '3'),
('msgs_count_limit', '30'),
('mailing_email', 'mailing@{domain_name}'),
('member_download_only', '2'),
('members_register', '1'),
('news_perpage', '20'),
('vote_file_expire_hours', '24'),
('site_pages_lang', 'ar-sa'),
('site_pages_encoding', 'utf-8'),
('enable_browsing', '1'),
('disable_browsing_msg', '<center> ���� , ������ ���� �����</center>'),
('register_sec_code', '1'),
('auto_email_activate', '0'),
('register_username_exclude_list', 'admin,mod,webmaster'),
('register_username_min_letters', '4'),
('mailing_default_use_html', '1'),
('mailing_default_encoding', ''),
('count_visitors_info', '1'),
('count_visitors_hits', '1'),
('count_online_visitors', '1'),
('enable_search', '1'),
('default_styleid', '1'),
('uploader_thumb_width', '100'),
('uploader_thumb_hieght', '100'),
('sitename_in_subpages', '0'),
('section_name_in_subpages', '0'),
('videos_perpage', '28'),
('visitors_can_sort_songs', '1'),
('songs_default_orderby', 'name'),
('songs_default_sort', 'asc'),
('videos_member_download_only', '2'),
('songs_multi_select', '1'),
('timezone', 'Asia/Baghdad'),
('date_format', 'd M Y'),
('comments_max_letters', '250'),
('commets_per_request', '10'),
('enable_news_comments', '1'),
('comments_auto_activate', '1'),
('photo_resized_width', '750'),
('photo_resized_height', '750'),
('photo_thumb_width', '100'),
('photo_thumb_height', '100'),
('enable_songs_comments', '1'),
('enable_singer_photo_comments', '1'),
('reports_enabled', '1'),
('online_members_count', '1'),
('send_sec_code', '1'),
('rating_expire_hours', '24'),
('other_votes_limit', '10'),
('other_votes_show', '1'),
('other_votes_orderby', 'id asc'),
('overview_photos_limit', '6'),
('overview_videos_limit', '6'),
('enable_singer_comments', '1'),
('enable_video_comments', '1'),
('enable_album_comments', '1'),
('prev_next_singer', '1'),
('photos_perpage', '28'),
('report_sec_code', '1'),
('reports_for_visitors', '1'),
('username_max_letters', '20'),
('albums_orderby', 'year'),
('albums_sort', 'desc'),
('default_url_id', '1'),
('prev_next_song', '1'),
('prev_next_cat', '1'),
('prev_next_album', '1'),
('prev_next_video', '1'),
('prev_next_video_cat', '1'),
('header_description', '���'),
('admin_email', 'noreply@allomani.com'),
('albums_perpage', '28'),
('singers_perpage', '300'),
('cp_singer_img', '1'),
('default_privacy_settings', 'a:9:{s:7:"profile";i:0;s:6:"gender";i:0;s:5:"birth";i:0;s:7:"country";i:0;s:10:"last_login";i:0;s:6:"online";i:0;s:7:"field_7";i:0;s:10:"fav_videos";i:0;s:8:"messages";i:0;}'),
('members_profile_pictures', '1'),
('profile_pic_width', '100'),
('profile_pic_height', '100'),
('profile_pic_thumb_width', '30'),
('profile_pic_thumb_height', '30'),
('members_perpage','20'),
('videos_orderby', 'id'),
('videos_sort', 'desc');