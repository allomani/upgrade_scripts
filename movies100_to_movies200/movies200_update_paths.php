<?
include "global.php";

$qr = db_query("select id from movies_cats");

while($data = db_fetch($qr)){
    
$path = get_cat_path_str($data['id']);  
  db_query("update movies_cats set path='$path' where id='$data[id]'"); 
  
}

print "Done";
  
  