CREATE TABLE IF NOT EXISTS `songs_players` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `int_content` text NOT NULL,
  `playlist_content` text NOT NULL,
  `video_content` text NOT NULL,
  `exts` varchar(255) NOT NULL default '',
  `ext_content` text NOT NULL,
  `ext_mime` varchar(100) NOT NULL default '',
  `ext_filename` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `exts` (`exts`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `songs_players`
--

INSERT INTO `songs_players` (`id`, `name`, `int_content`, `playlist_content`, `video_content`, `exts`, `ext_content`, `ext_mime`, `ext_filename`) VALUES
(1, '������ ���������', '<center>\r\n<OBJECT id=''rvocx'' classid=''clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA''\r\n          width="500" height=''30''>\r\n          <param name=''src'' value="{url}">\r\n          <param name=''autostart'' value="true">\r\n          <param name=''controls'' value=''ControlPanel''>\r\n          <param name=''console'' value=''video''>\r\n          <EMBED src="{url}" width="500" height=''30''  controls=''ControlPanel'' type=''audio/x-pn-realaudio-plugin'' console=''video'' autostart="true">\r\n          </EMBED>\r\n          </OBJECT></center>\r\n', '<center>\r\n <embed src="{url}" width="500" height=''60''  controls=''ControlPanel,StatusBar'' type=''audio/x-pn-realaudio-plugin'' console=''one'' autostart="true" id=''RVOCX'' name=''RVOCX''></embed></center>\r\n\r\n<script>\r\nif(!tm){\r\n  var tm =  new PeriodicalExecuter(function(pe) {\r\nif($(''RVOCX'')){\r\n    var argx = $(''RVOCX'').GetLength();\r\n    var argy =  $(''RVOCX'').GetPosition();\r\n \r\n    \r\n    if(argy > 0){\r\n    if( argy >=  argx-1000){\r\n       play_song({next_index});  \r\n    }\r\n    \r\n    \r\n    }\r\n    \r\n}\r\n}, 1);\r\n}\r\n</script>', '<table border=''0'' cellpadding=''0'' align="center">\r\n        <tr><td>\r\n        <OBJECT id=''RVOCX'' classid=''clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA''\r\n        width="500" height="300">\r\n        <param name=''src'' value="{url}">\r\n        <param name=''autostart'' value="true">\r\n        <param name=''controls'' value=''imagewindow''>\r\n        <param name=''console'' value=''video''>\r\n        <param name=''loop'' value="true">\r\n        <EMBED src="{url}" width="500" height="300" \r\n        loop="true" type=''audio/x-pn-realaudio-plugin'' controls=''imagewindow'' console=''video'' autostart="true">\r\n        </EMBED>\r\n        </OBJECT>\r\n        </td></tr>\r\n          <tr><td>\r\n          <OBJECT id=''RVOCX'' classid=''clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA''\r\n          width="500" height=''30''>\r\n          <param name=''src'' value="{url}">\r\n          <param name=''autostart'' value="true">\r\n          <param name=''controls'' value=''ControlPanel''>\r\n          <param name=''console'' value=''video''>\r\n          <EMBED src="{url}" width="500" height=''30'' \r\n          controls=''ControlPanel'' type=''audio/x-pn-realaudio-plugin'' console=''video'' autostart="true">\r\n          </EMBED>\r\n          </OBJECT>\r\n          </td></tr>\r\n      </table>', '', '<?\r\nglobal $num_ramadv,$scripturl;\r\n\r\n\r\nif($num_ramadv){\r\n$adv_ram_link = "?rpcontextwidth=600&rpcontextheight=300&rpcontexturl=".$scripturl."/ram_banners.php";\r\n}else{\r\n$adv_ram_link = "";\r\n}\r\n\r\nprint "{url}".$adv_ram_link;\r\n\r\n?>', 'audio/x-pn-realaudio', 'listen.ram'),
(2, 'JW Flash Player', '<center>\r\n<div id=''player_div''></div>\r\n</center>\r\n\r\n<script>\r\n jwplayer("player_div").setup({\r\n    file: "{url}",\r\n    flashplayer: scripturl+"/players/player.swf",\r\n  ''controlbar'': ''bottom'',\r\n    height: 24,\r\n    width: 500,\r\n    autostart: true\r\n   \r\n  });\r\n</script>', '<script>\r\n jwplayer("player_div").setup({\r\n    file: "{url}",\r\n    flashplayer: scripturl+"/players/player.swf",\r\n  ''controlbar'': ''bottom'',\r\n    height: 24,\r\n    width: 500,\r\n    autostart: true\r\n   \r\n  });\r\n\r\n jwplayer("player_div").onComplete(function() {     \r\n play_song({next_index}); \r\n });\r\n</script>', '<center>\r\n<div id=''player_div''></div>\r\n</center>\r\n\r\n<script>\r\n jwplayer("player_div").setup({\r\n    file: "{url}",\r\n    flashplayer: scripturl+"/players/player.swf",\r\n    height: 300,\r\n    width: 500,\r\n    autostart: true\r\n   \r\n  });\r\n</script>', '.mp3,.flv,youtube.com,.mp4', '<?\r\nglobal $num_ramadv,$scripturl;\r\n\r\n\r\nif($num_ramadv){\r\n$adv_ram_link = "?rpcontextwidth=600&rpcontextheight=300&rpcontexturl=".$scripturl."/ram_banners.php";\r\n}else{\r\n$adv_ram_link = "";\r\n}\r\n\r\nprint "{url}".$adv_ram_link;\r\n\r\n?>', 'audio/x-pn-realaudio', 'listen.ram'),
(3, 'Windows Media Player', '    <table border=''0'' cellpadding=''0'' align="center">\r\n      <tr><td>\r\n      <OBJECT id=''mediaPlayer'' width="400" height="305"\r\n      classid=''CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95''\r\n      codebase=''http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701''\r\n      standby=''Loading Microsoft Windows Media Player components...'' type=''application/x-oleobject''>\r\n      <param name=''fileName'' value="{url}">\r\n      <param name=''animationatStart'' value=''true''>\r\n      <param name=''transparentatStart'' value=''true''>\r\n      <param name=''autoStart'' value="true">\r\n      <param name=''showControls'' value="true">\r\n      <param name=''loop'' value="false">\r\n      <EMBED type=''application/x-mplayer2''\r\n        pluginspage=''http://microsoft.com/windows/mediaplayer/en/download/''\r\n        id=''mediaPlayer'' name=''mediaPlayer'' displaysize=''4'' autosize=''-1''\r\n        bgcolor=''darkblue'' showcontrols="true" showtracker=''-1''\r\n        showdisplay=''0'' showstatusbar=''-1'' videoborder3d=''-1'' width="400" height="305"\r\n        src="{url}" autostart="true" designtimesp=''5311'' loop="false">\r\n      </EMBED>\r\n      </OBJECT>\r\n      </td></tr>\r\n      <!-- ...end embedded WindowsMedia file -->\r\n    <!-- begin link to launch external media player... -->\r\n      \r\n      </table>', '', '', '.wmv', '', '', ''),
(4, 'Divx Player', '<center>\r\n<object classid="clsid:67DABFBF-D0AB-41fa-9C46-CC0F21721616" width="600" height="358" codebase="http://go.divx.com/plugin/DivXBrowserPlugin.cab">\r\n  <param name="custommode" value="none" />\r\n  <param name="autoPlay" value="true" />\r\n  <param name="src" value="{url}" />\r\n  <embed type="video/divx"\r\n         src="{url}"\r\n         custommode="none"\r\n         width="600" height="358"\r\n         autoPlay="false"\r\n         pluginspage="http://go.divx.com/plugin/download/">\r\n  </embed>\r\n</object>\r\n', '', '', '.avi,.mkv', '', '', ''),
(6, 'Real Player', '<center>\r\n <embed src="{url}" width="500" height=''60''  controls=''ControlPanel,StatusBar'' type=''audio/x-pn-realaudio-plugin'' console=''one'' autostart="true" id=''RVOCX'' name=''RVOCX''></embed></center>', '<center>\r\n <embed src="{url}" width="500" height=''60''  controls=''ControlPanel,StatusBar'' type=''audio/x-pn-realaudio-plugin'' console=''one'' autostart="true" id=''RVOCX'' name=''RVOCX''></embed></center>\r\n\r\n<script>\r\nif(!tm){\r\n  var tm =  new PeriodicalExecuter(function(pe) {\r\nif($(''RVOCX'')){\r\n    var argx = $(''RVOCX'').GetLength();\r\n    var argy =  $(''RVOCX'').GetPosition();\r\n \r\n    \r\n    if(argy > 0){\r\n    if( argy >=  argx-1000){\r\n       play_song({next_index});  \r\n    }\r\n    \r\n    \r\n    }\r\n    \r\n}\r\n}, 1);\r\n}\r\n</script>', '<table border=''0'' cellpadding=''0'' align="center">\r\n        <tr><td>\r\n        <OBJECT id=''RVOCX'' classid=''clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA''\r\n        width="500" height="300">\r\n        <param name=''src'' value="{url}">\r\n        <param name=''autostart'' value="true">\r\n        <param name=''controls'' value=''imagewindow''>\r\n        <param name=''console'' value=''video''>\r\n        <param name=''loop'' value="true">\r\n        <EMBED src="{url}" width="500" height="300" \r\n        loop="true" type=''audio/x-pn-realaudio-plugin'' controls=''imagewindow'' console=''video'' autostart="true">\r\n        </EMBED>\r\n        </OBJECT>\r\n        </td></tr>\r\n          <tr><td>\r\n          <OBJECT id=''RVOCX'' classid=''clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA''\r\n          width="500" height=''30''>\r\n          <param name=''src'' value="{url}">\r\n          <param name=''autostart'' value="true">\r\n          <param name=''controls'' value=''ControlPanel''>\r\n          <param name=''console'' value=''video''>\r\n          <EMBED src="{url}" width="500" height=''30'' \r\n          controls=''ControlPanel'' type=''audio/x-pn-realaudio-plugin'' console=''video'' autostart="true">\r\n          </EMBED>\r\n          </OBJECT>\r\n          </td></tr>\r\n      </table>', '.rm,.rmvb,.rv', '<?\r\nglobal $num_ramadv,$scripturl;\r\n\r\n\r\nif($num_ramadv){\r\n$adv_ram_link = "?rpcontextwidth=600&rpcontextheight=300&rpcontexturl=".$scripturl."/ram_banners.php";\r\n}else{\r\n$adv_ram_link = "";\r\n}\r\n\r\nprint "{url}".$adv_ram_link;\r\n\r\n?>', 'audio/x-pn-realaudio', 'listen.ram');
