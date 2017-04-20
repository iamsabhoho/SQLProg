<?php
   //require ('config.php');
   $connection = pg_connect ("host=localhost dbname=postgres user=sab password=sqlsql12345");

   if($connection) {
      echo 'Connected';
   } else {
      echo 'There has been an error connecting';
   }

   $query = "INSERT INTO myTeachers (teacher_id, firstname, lastname, email)
   VALUES ('$_POST[id]','$_POST[firstname]','$_POST[lastname]','$_POST[email]')";
   $result = pg_query($query);

    if (!$result) {
       echo "An error occurred.\n";
       exit;
    }


?>

<html>
<body>
   <div id="container">
       <table>
           <tr>
                <th>Teacher ID</th>
                <th>First name</th>
                <th>Last name</th>
                <th>Email Address</th>
           </tr>
           <?php
               $students = pg_query("select * from myTeacher");
               while ($row = pg_fetch_array($myTeacher)) {
                    echo "<tr>\n";
                    echo " <td>", $row["teacher_id"], "</td>
                    <td>", $row["firstname"], "</td>
                    <td>", $row["lastname"], "</td>
                    <td>", $row["email"], "</td>
                    </tr>  ";
                }
                pg_close($connection);
           ?>
       </table>
   </div>
</body>
</html>

