<?php
// --- secure connection to the database
require ("config.php");
$connection = pg_connect ("host=$DB_HOST dbname=$DB_DATABASE user=$DB_USER password=$DB_PASSWORD");

#add the php code to insert new user with encrypt password

if($connection) {
    echo 'Connected';
} else {
    echo 'There has been an error connecting';
}

$query = "INSERT INTO users (username, email, password) 
    VALUES ('$_POST[usernamesignup]','$_POST[emailsignup]',crypt('$_POST[passwordsignup]',gen_salt('md5')))";
$result = pg_query($query);

if ($result == false) {
    echo 'error';
    exit;
}

?>




