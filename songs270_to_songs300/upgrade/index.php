<?
//chdir('./../');
define('CWD', (($getcwd = str_replace("\\","/",getcwd())) ? $getcwd : '.'));

//$u_direname  = "/upgrade";

require ("../config.php");
require (CWD.$u_direname."/ClassSQLimport.php");

print "<html>
<head>
<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />
<meta http-equiv=\"Content-Language\" content=\"ar-sa\" />
<title>Upgrade</title>
</head>";

//----------------- php5 varialbs support -----------------------------
$ver_str = phpversion();
list($php_major, $php_minor, $php_sub) = explode( ".", $ver_str);
if( intval($php_major) >= 5) {
$reg_long_arrays = ini_get('register_long_arrays');
if( $reg_long_arrays == 0 ) {

$HTTP_POST_VARS   = !empty($HTTP_POST_VARS)   ? $HTTP_POST_VARS   : $_POST;
$HTTP_GET_VARS    = !empty($HTTP_GET_VARS)    ? $HTTP_GET_VARS    : $_GET;
$HTTP_COOKIE_VARS = !empty($HTTP_COOKIE_VARS) ? $HTTP_COOKIE_VARS : $_COOKIE;
$HTTP_SERVER_VARS = !empty($HTTP_SERVER_VARS) ? $HTTP_SERVER_VARS : $_SERVER;
$HTTP_POST_FILES = !empty($HTTP_POST_FILES) ? $HTTP_SERVER_VARS : $_FILES;
$HTTP_ENV_VARS = !empty($HTTP_ENV_VARS) ? $HTTP_SERVER_VARS : $_ENV;

}
}
if (!empty($HTTP_POST_VARS)) {extract($HTTP_POST_VARS);}
if (!empty($HTTP_GET_VARS)) {extract($HTTP_GET_VARS);}
//------------------------------------

$steps = array(1=>"Dump Old DB",2=>"Import utf8 to new DB",3=>"Upgrade tables fields",4=>"Upgrade tables fields 2",5=>"Update Urls",6=>"Update Songs Custom Fields",7=>"Update Members Custom Fields",8=>"Add Links",9=>"Add Meta",10=>"Add Players",11=>"Upgrade Templates",12=>"New Settings",13=>"New Phrases",14=>"Update Counters",15=>"update videos paths",16=>"Prepare Blocks",17=>"Upgrade Blocks");

$last_step = count($steps);





$cn = mysql_connect($db_host,$db_username,$db_password) or die("New DB Connect Error");
$dbn = mysql_select_db($db_name,$cn) or die("New Database Name Error");
mysql_query("set names 'utf8'",$cn); 

if($step < 2){
$co = mysql_connect($old_db_host,$old_db_username,$old_db_password,true) or die("Old DB Connect Error");
$dbo = mysql_select_db($old_db_name,$co) or die("Old Database Name Error"); 
}

if($step){
    print "<h1> ".$steps[$step]." </h1>
    <br><br>";
}

if(!$step){
print "<h1> Audio & Video  v2.7 to v3.00 </h1>"; 

$data1 = mysql_num_rows(mysql_query("show tables",$co));
$data2 = mysql_num_rows(mysql_query("show tables",$cn)); 

print "OLD DB Tables : $data1 <br> New DB Tables : $data2 <br><br> iConv :";
if(function_exists("iconv")){
    print "Available";
}else{
   
    die("iconv not available");
}


if(!is_writable(CWD .$u_direname. "/")){
    die("Folder Not writable");
}        

if($data2){
    die("<br><br>Error : New DB should be Clean");
}

}

//------------- 1 ----------------
if($step==1){
    
require('class_mysql_db_backup.php');
$backup_obj = new MySQL_DB_Backup();
$backup_obj->server = $old_db_host ;
$backup_obj->port = 3306;
$backup_obj->username = $old_db_username;
$backup_obj->password = $old_db_password;
$backup_obj->database = $old_db_name;
$backup_obj->drop_tables = false;
$backup_obj->create_tables = true;
$backup_obj->struct_only = false;
$backup_obj->locks = false;
$backup_obj->comments = false;
//$backup_obj->fname_format = 'old_db';
$backup_obj->null_values = array( '0000-00-00', '00:00:00', '0000-00-00 00:00:00');
$filename = CWD .$u_direname. "/old_db.sql";
$task = MSX_SAVE;
$use_gzip = false;

@rename(CWD .$u_direname."/old_db.sql",CWD .$u_direname."/old_db_".rand(0,99).".sql");
$result_bk = $backup_obj->Execute($task, $filename, $use_gzip);
    if (!$result_bk)
        {
                 die($backup_obj->error);
        
        }
        else
        {
                print "Dump Complete .... <br>";

        }



}
//-------------- 2 -----------------

if($step==2){

$sqlFile = CWD . $u_direname."/old_db.sql";
$newImport = new sqlImport ($sqlFile,false,$db_host, $db_username, $db_password,$db_name,true);
$newImport -> import ();
if ($newImport->error){die($newImport->error);}else{print "Done";} 
}
//--------------------------------------



//--------------3 -----------------

if($step==3){

$sqlFile = CWD . $u_direname."/tables_upgrade.sql";
$newImport = new sqlImport ($sqlFile,false,$db_host, $db_username, $db_password,$db_name,true);
$newImport -> import ();
if ($newImport->error){die($newImport->error);}else{print "Done";} 
}
//--------------------------------------




//--------------4  -----------------

if($step==4){

$sqlFile = CWD . $u_direname."/tables_upgrade2.sql";
$newImport = new sqlImport ($sqlFile,false,$db_host, $db_username, $db_password,$db_name,true);
$newImport -> import ();
if ($newImport->error){die($newImport->error);}else{print "Done";} 
}
//--------------------------------------


//---------- 5 --------------------
if($step==5){
$qr1 = mysql_query("select id from songs_urls_fields");
while($d = mysql_fetch_array($qr1)){
@mysql_query("alter table songs_songs add `url_".$d['id']."` TEXT NOT NULL");
@mysql_query("alter table songs_songs add `listens_".$d['id']."` INT(11) NOT NULL , ADD INDEX (`listens_".$d['id']."`)");
@mysql_query("alter table songs_songs add `downloads_".$d['id']."` INT(11) NOT NULL , ADD INDEX (`downloads_".$d['id']."`)");
}

$qr = mysql_query("select * from songs_urls_data");
while($data=mysql_fetch_array($qr)){
    mysql_query("update songs_songs set url_".$data['cat']."='".db_escape($data['url'])."',downloads_".$data['cat']."='$data[downloads]',listens_".$data[cat]."='$data[listens]' where id='$data[song_id]'",$cn);
    
}

print " DONE .... <br><br>";
}
//---------------------------------



//---------- 6  --------------------
if($step==6){
$qr1 = mysql_query("select id from songs_songs_fields",$cn);
while($d = mysql_fetch_array($qr1)){
@mysql_query("alter table songs_songs add `field_".$d['id']."` VARCHAR(255) NOT NULL , ADD INDEX (`field_".$d['id']."`)");                                        
}

$qr = mysql_query("select * from songs_custom_fields");
while($data=mysql_fetch_array($qr)){
    mysql_query("update songs_songs set field_".$data['cat']."='".db_escape($data['value'])."' where id='$data[song_id]'");
    
}

print " DONE .... <br><br>";
}
//---------------------------------



//----------   7  --------------------
if($step==7){
$qr1 = mysql_query("select id from songs_members_sets",$cn);
while($d = mysql_fetch_array($qr1)){
@mysql_query("alter table songs_members add `field_".$d['id']."` VARCHAR(255) NOT NULL , ADD INDEX (`field_".$d['id']."`)");                                        
}

$qr = mysql_query("select * from songs_members_fields");
while($data=mysql_fetch_array($qr)){
    mysql_query("update songs_members set field_".$data['cat']."='".db_escape($data['value'])."' where id='$data[member]'");
    
}

print " DONE .... <br><br>";
}
//---------------------------------


//-------------- 8 -----------------

if($step==8){

$sqlFile = CWD . $u_direname."/songs_links.sql";
$newImport = new sqlImport ($sqlFile,false,$db_host, $db_username, $db_password,$db_name,true);
$newImport -> import ();
if ($newImport->error){die($newImport->error);}else{print "Done";} 
}
//--------------------------------------



//-------------- 9 -----------------

if($step==9){

$sqlFile = CWD . $u_direname."/songs_meta.sql";
$newImport = new sqlImport ($sqlFile,false,$db_host, $db_username, $db_password,$db_name,true);
$newImport -> import ();
if ($newImport->error){die($newImport->error);}else{print "Done";} 
}
//--------------------------------------



//--------------  10 -----------------

if($step==10){

$sqlFile = CWD . $u_direname."/songs_players.sql";
$newImport = new sqlImport ($sqlFile,false,$db_host, $db_username, $db_password,$db_name,true);
$newImport -> import ();
if ($newImport->error){die($newImport->error);}else{print "Done";} 
}
//--------------------------------------



//-------------- 11 -----------------

if($step==11){

mysql_query("insert into songs_templates_cats (name) values ('Default OLD')");
$new_id = mysql_insert_id();
mysql_query("update songs_templates set cat='$new_id' where cat='1'");

mysql_query("update songs_templates_cats set name=concat(name,' OLD ') where id > 1 and name not like '%OLD%'");

$sqlFile = CWD . $u_direname."/templates.sql";
$newImport = new sqlImport ($sqlFile,false,$db_host, $db_username, $db_password,$db_name,true);
$newImport -> import ();
if ($newImport->error){die($newImport->error);}else{

mysql_query("update songs_templates_cats set selectable=0 where id > 1");


$odata = mysql_fetch_array(mysql_query("select value from songs_settings where name like 'default_styleid'"));
   $old_id = $odata['value']; 
if($old_id == 1){$old_id = $new_id;}

  $qr = mysql_query("select * from songs_templates where cat='$old_id' and name IN ('header','footer','block','table')");
  while($data  = mysql_fetch_array($qr)){
      mysql_query("update songs_templates set content='".db_escape($data['content'])."' where name like '".$data['name']."' and cat=1");
  }
  
  
  
 mysql_query("update songs_settings set value='1' where name like 'default_styleid'");  
 mysql_query("update songs_templates set views=0");
 
   
    print "Done";} 
}
//--------------------------------------


//-------------- 12 -----------------

if($step==12){


$sqlFile = CWD . $u_direname."/settings_new.sql";
$newImport = new sqlImport ($sqlFile,false,$db_host, $db_username, $db_password,$db_name,true);
$newImport -> import ();
if ($newImport->error){die($newImport->error);}else{
   
   
   $qr = mysql_query("select * from songs_settings_new");
   while($data = mysql_fetch_array($qr)){
       $cnt = mysql_fetch_array(mysql_query("select count(*) as count from songs_settings where name like '$data[name]'"));
       if(!$cnt['count']){
           mysql_query("insert into songs_settings (name,value) values ('".db_escape($data['name'])."','".db_escape($data['value'],false)."')");
       }
   }
  
  
 mysql_query("update songs_settings set value='utf-8' where name like 'site_pages_encoding'");
     

mysql_query("DROP TABLE  `songs_settings_new`");   
    print "Done";

} 



}
//--------------------------------------



//-------------- 13 -----------------

if($step==13){


$sqlFile = CWD . $u_direname."/phrases_new.sql";
$newImport = new sqlImport ($sqlFile,false,$db_host, $db_username, $db_password,$db_name,true);
$newImport -> import ();
if ($newImport->error){die($newImport->error);}else{
   
   
   $qr = mysql_query("select * from songs_phrases_new");
   while($data = mysql_fetch_array($qr)){
       $cnt = mysql_fetch_array(mysql_query("select count(*) as count from songs_phrases where name like '$data[name]'"));
       if(!$cnt['count']){
           mysql_query("insert into songs_phrases (name,value,cat) values ('".db_escape($data['name'])."','".db_escape($data['value'])."','".db_escape($data['cat'])."')");
       }
   }
                                                                                       

mysql_query("DROP TABLE  `songs_phrases_new`");   
    print "Done";

} 



}
//--------------------------------------



 //-------------- 14 -----------------

if($step==14){
$qr = mysql_query("select id,name from songs_singers");
    while($data=mysql_fetch_array($qr)){
        update_singer_counters($data['id'],'songs');
        update_singer_counters($data['id'],'albums');
        update_singer_counters($data['id'],'videos');
        update_singer_counters($data['id'],'photos');
        
    }
    
    print " .. Done ...";
}
//---------------------------


 //-------------- 15 -----------------

if($step==15){
$qr = mysql_query("select id,name from songs_videos_cats");
    while($data=mysql_fetch_array($qr)){
 $path = get_videos_cat_path_str($data['id']);  
  mysql_query("update songs_videos_cats set path='$path' where id='$data[id]'"); 
        
    }
    
    print " .. Done ...";
}
//---------------------------

//------------- 16 --------------
if($step==16){

$handle = opendir( CWD . $u_direname."/");
while (($file = readdir($handle)) !== false)
{
if (!preg_match('#^block_(.*).txt$#i', $file, $matches))
{
continue;
}
$blocks_arr[] =  $file;
    }
closedir($handle);

$next_step = (intval($step)+1);    
print "<form action=index.php method=post>                
<table>";
for($i=0;$i<count($blocks_arr);$i++){
    print  "<tr><td>
    <input type=hidden name=\"block[$i]\" value=\"".$blocks_arr[$i]."\">
".$blocks_arr[$i]."
</td>";
print "<td><select name=block_id[$i]>
<option value=0>None</option>";
$qr = mysql_query("select title,id from songs_blocks order by pos,ord");
while($data = mysql_fetch_array($qr)){
    print "<option value='$data[id]'".iif(substr($blocks_arr[$i],6,2)==$data['id']," selected").">$data[title]</option>";
}
print "</select></td>";
print "</tr>";
}

print  "<tr><td colspan=2 align=center>
<input type=hidden name=step value='".$next_step."'>
<input type=submit value='".$next_step.". ".$steps[$next_step]."' style='height:40;'>
</td></tr></table></form>";

$next_printed =1;    
}  

//-------------- 17 ------------
if($step == 17){
    
    if(is_array($block)){
for ($i=0;$i<count($block);$i++){
if($block_id[$i]){
$file_data = file_get_contents(CWD . $u_direname."/". $block[$i]);
mysql_query("update songs_blocks set file='".db_escape(iconv("cp1256","utf-8",$file_data))."' where id='".$block_id[$i]."'");

}
}
} 

print "Done ";

}

//------------------ Footer ---------------------------

if($step==$last_step){
print "<center> Upgrade Complete </center>";
}else{
if(!$next_printed){
if($step){
print "... DONE ... <br><br>";
}

$next_step = (intval($step)+1);
echo "<br><br>
<form action=index.php method=get>
<input type=hidden name=step value='".$next_step."'>
<input type=submit value='".$next_step.". ".$steps[$next_step]."' style='height:40;'>
</form>";
}
}



//----------- select row ------------
function print_select_row($name, $array, $selected = '', $options="" , $size = 0, $multiple = false,$same_values=false)
{
    global $vbulletin;

    $select = "<select name=\"$name\" id=\"sel_$name\"" . iif($size, " size=\"$size\"") . iif($multiple, ' multiple="multiple"') . iif($options , " $options").">\n";
    $select .= construct_select_options($array, $selected,$same_values);
    $select .= "</select>\n";

    print $select;
}


function construct_select_options($array, $selectedid = '',$same_values=false)
{
    if (is_array($array))
    {
        $options = '';
        foreach($array AS $key => $val)
        {
            if (is_array($val))
            {
                $options .= "\t\t<optgroup label=\"" . $key . "\">\n";
                $options .= construct_select_options($val, $selectedid, $tabindex, $htmlise);
                $options .= "\t\t</optgroup>\n";
            }
            else
            {
                if (is_array($selectedid))
                {
                    $selected = iif(in_array($key, $selectedid), ' selected="selected"', '');
                }
                else
                {
                    $selected = iif($key == $selectedid, ' selected="selected"', '');
                }
                $options .= "\t\t<option value=\"".($same_values ? $val : $key). "\"$selected>" . $val . "</option>\n";
            }
        }
    }
    return $options;
}

//--------- iif expression ------------
function iif($expression, $returntrue, $returnfalse = '')
{
    return ($expression ? $returntrue : $returnfalse);
}


 //------------ db escape -------------//
 function db_escape($str,$specialchars=false){
 if($specialchars) { $str =  htmlspecialchars($str) ;}
 return db_escape_string($str); 
 }
 //----------- escape String -----------
 function db_escape_string($str){
               //                  print_r($str);
 if(function_exists('mysql_real_escape_string')){
     return mysql_real_escape_string($str);
     }else{
     return mysql_escape_string($str);
     }
 }
 
 
 function update_singer_counters($id,$op='songs'){
    switch($op){
        case "songs" :
        $count = valueof(mysql_fetch_array(mysql_query("select count(*) as count from songs_songs where album='$id'")),"count"); 
        mysql_query("update songs_singers set songs_count = '$count' where id='$id'");
        break;
        
        case "albums" :
        $count = valueof(mysql_fetch_array(mysql_query("select count(*) as count from songs_albums where cat='$id'")),"count");    
        mysql_query("update songs_singers set albums_count = '$count' where id='$id'");  
        break;
        
        case "photos" :
        $count = valueof(mysql_fetch_array(mysql_query("select count(*) as count from songs_singers_photos where cat='$id'")),"count");
        mysql_query("update songs_singers set photos_count = '$count' where id='$id'");    
        break;
        
        
        case "videos" :
        $count = valueof(mysql_fetch_array(mysql_query("select count(*) as count from songs_songs where album='$id' and video_id > 0")),"count");
        mysql_query("update songs_singers set videos_count = '$count' where id='$id'"); 
        break;
    }
 }
    
    
//----- valueof -------------//
function valueof($data,$index){
    return $data[$index];
}

  //------ video cat path str -----
function get_videos_cat_path_str($cat){
             $dir_data['cat'] = intval($cat) ;
               $path_arr[] = $dir_data['cat'];
while($dir_data['cat']!=0){
   
   $dir_data = mysql_fetch_array(mysql_query("select id,cat from songs_videos_cats where id='$dir_data[cat]'"));
   $path_arr[] = $dir_data['cat'];
}
return implode(",",$path_arr);
}

    
?> 