delete from songs_templates where cat=1 and name='header';
delete from songs_templates where cat=1 and name='footer';
delete from songs_templates where cat=1 and name='block';
delete from songs_templates where cat=1 and name='table';
delete from songs_templates where cat=1 and name='contactus';


update songs_templates set cat=1 where cat=2 and name IN ('header','footer','block','table','contactus');