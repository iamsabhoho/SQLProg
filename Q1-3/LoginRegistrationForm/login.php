<?php
// --- secure connection to the database
require ("config.php");
$connection = pg_connect ("host=$DB_HOST dbname=$DB_DATABASE user=$DB_USER password=$DB_PASSWORD");

//check the connection
if(!$connection) {
    echo 'Connection Failed';
}

$name = $_POST['username'];
$pass = $_POST['password'];
$email = $_POST['email'];

$query = "SELECT username FROM users 
          WHERE username = '$name' 
          and password = crypt('$pass', password);";

$result = pg_fetch_row(pg_query($query));

#echo "The result is ".$result[0];

if (!$result){
    //not successful
    header('location: index.html#toregister');
    exit;
}else
{
    header('location: welcome.html');

}

if($name){

}

//  Login successful setting up cookies
$cookie_name = "login";
$cookie_value = "True";
setcookie($cookie_name, $cookie_value, time() + (120), "/");
print $cookie_value;

?>