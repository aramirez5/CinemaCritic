<?php

include 'configuracion.php';

$con = mysql_connect($dbhost, $dbuser, $dbpass) or die ("Could not connect: " . mysql_error());

mysql_select_db($dbname, $con);

$nick = mysql_real_escape_string(htmlentities($_POST["nick"]));
$pass = mysql_real_escape_string(htmlentities($_POST["pass"]));
$confirmarPass = mysql_real_escape_string(htmlentities($_POST["confirmarPass"]));

$verificar = mysql_num_rows(mysql_query("SELECT idUsuario FROM usuarios WHERE nick='$nick'"));

if($nick=="" || $pass=="" || $confirmarPass==""){
    echo "FAIL";
}

elseif(strlen($nick) > 20){
     echo "FAIL3";
}

elseif(strlen($pass) > 20){
     echo "FAIL4";
}

elseif($pass != $confirmarPass){
     echo "FAIL2";
}

elseif($verificar==0){
    $sql = "INSERT INTO usuarios (nick, pass) ";
    $sql .= "VALUES ('$nick', '$pass')";
    echo "0";
 
    if (!mysql_query($sql, $con)) {
	   die('Error: ' . mysql_error());
    } else {
	   echo "Comment added";
    }
}

 else{
    echo "1";
 }

mysql_close($con);
?>