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

$steps = array(1=>"Dump Old DB",2=>"Import utf8 to new DB",3=>"Upgrade tables fields",4=>"update paths");

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
print "<h1> Movies v1.0 to v2.0</h1>"; 

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
     
$qr = mysql_query("select id from movies_cats");

while($data = mysql_fetch_assoc($qr)){
    
$path = get_cat_path_str($data['id']);  
  mysql_query("update movies_cats set path='$path' where id='$data[id]'"); 
  
}


print "Done";

}
//--------------------------------------


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
    
   
function get_cat_path_str($cat){
             $dir_data['cat'] = intval($cat) ;
               $path_arr[] = $dir_data['cat'];
while($dir_data['cat']!=0){
   
   $dir_data = mysql_fetch_assoc(mysql_query("select id,cat from movies_cats where id='$dir_data[cat]'"));
   $path_arr[] = $dir_data['cat'];
}
return implode(",",$path_arr);
}

 
//----- valueof -------------//
function valueof($data,$index){
    return $data[$index];
}



    
?> 