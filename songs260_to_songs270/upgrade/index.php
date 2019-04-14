<?
chdir('./../');
define('CWD', (($getcwd = str_replace("\\","/",getcwd())) ? $getcwd : '.'));


require (CWD . "/config.php");
require ("ClassSQLimport.php");

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



$last_step = 8;

mysql_connect($db_host,$db_username,$db_password) or die("Connect Error");
mysql_select_db($db_name) or die("Database Name Error"); 


if(!$step){
print "<h1> Songs & Clips v2.6 to v2.7 </h1>"; 
$import["exito"]  = 1;

}elseif($step==1){
print "<h1> Upgrade Tables </h1>";

$sqlFile = CWD . "/upgrade/tables.sql";
$newImport = new sqlImport ($db_host, $db_username, $db_password,$db_name, $sqlFile);
$newImport -> import ();

@mysql_query("ALTER TABLE `songs_videos_cats` ADD `cat` INT NOT NULL ;");

}elseif($step==2){
print "<h1> Upgrade Templates </h1>";

$sqlFile = CWD . "/upgrade/templates.sql";
$newImport = new sqlImport ($db_host, $db_username, $db_password,$db_name, $sqlFile);
$newImport -> import ();
}elseif($step==3){ 
print "<h1> Upgrade Phrases </h1>";

$sqlFile = CWD . "/upgrade/phrases.sql";
$newImport = new sqlImport ($db_host, $db_username, $db_password,$db_name, $sqlFile);
$newImport -> import ();

}elseif($step==4){ 
print "<h1> Restore Templates </h1>";

$sqlFile = CWD . "/upgrade/restore_templates.sql";
$newImport = new sqlImport ($db_host, $db_username, $db_password,$db_name, $sqlFile);
$newImport -> import ();

}elseif($step==5){ 
print "<h1> Update Links </h1>";

$qr = mysql_query("select * from songs_songs");
while($data = mysql_fetch_array($qr)){
mysql_query("insert into songs_urls_data (url,cat,song_id,downloads,listens) values('$data[url]','1','$data[id]','$data[downloads]','$data[listens]')");    
}

$import["exito"]  = 1; 
}elseif($step==6){
print "<h1> Update Members Passwords</h1>"; 

//--------------------    
if (!function_exists('is_md5')) {
  function is_md5($var) {
    return preg_match('/^[A-Fa-f0-9]{32}$/',$var);
  }
}

$qr = mysql_query("select * from songs_members order by id");
while($data = mysql_fetch_array($qr)){
   if(!is_md5($data['password'])){
       mysql_query("update songs_members set password='".md5($data['password'])."' where id='".$data['id']."'");
   } 
     
}
//---------------------

$import["exito"]  = 1;

}elseif($step==7){ 
print "<h1> Update Blocks Prepairing</h1>"; 
$handle = opendir(CWD . "/upgrade");
while (($file = readdir($handle)) !== false)
{
if (!preg_match('#^block_(.*).txt$#i', $file, $matches))
{
continue;
}
$blocks_arr[] =  $file;
    }
closedir($handle);

print "<form action=index.php method=post>
<input type=hidden name=step value='".(intval($step)+1)."'>
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
    print "<option value='$data[id]'>$data[title]</option>";
}
print "</select></td>";
print "</tr>";
}

print  "<tr><td colspan=2 align=center><input type=submit value='Next'>
</td></tr></table></form>";

$next_printed =1;
$import["exito"]  = 1; 

}elseif($step==8){   
print "<h1> Update Blocks </h1>";


if(is_array($block)){
for ($i=0;$i<count($block);$i++){
if($block_id[$i]){
$file_data = file_get_contents(CWD ."/upgrade/". $block[$i]);
mysql_query("update songs_blocks set file='".mysql_real_escape_string($file_data)."' where id='".$block_id[$i]."'");

}
}
} 

 $import["exito"]  = 1;
   
}




//------------------ Show Messages !!! ---------------------------
if(!is_array($import)){
$import = $newImport -> ShowErr ();
}

if ($import["exito"] == 1)
{
if($step==$last_step){
print "<center> Upgrade Complete </center>";
}else{
if(!$next_printed){
print "... DONE ... <br><br>";

echo "<form action=index.php method=get>
<input type=hidden name=step value='".(intval($step)+1)."'>
<input type=submit value='Next'>
</form>";
}
}
} else {
echo "Error : " . $import ["errorCode"].": ".$import ["errorText"];
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
?> 