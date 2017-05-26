<?php

include 'configuracion.php';

$con = mysql_connect($dbhost, $dbuser, $dbpass) or die ("Could not connect: " . mysql_error());

mysql_select_db($dbname, $con);

$nick = mysql_real_escape_string(htmlentities($_POST["nick"]));
$pass = mysql_real_escape_string(htmlentities($_POST["pass"]));

$consulta = mysql_num_rows(mysql_query("SELECT idUsuario FROM usuarios WHERE nick='$nick' and pass='$pass'"));

if($nick=="" || $pass==""){
    echo json_encode("FAIL");
}

elseif($consulta==0){
    echo "0";
}

else{
    $consulta2 = mysql_query("SELECT idUsuario FROM usuarios WHERE nick='$nick' and pass='$pass'");
    while($result = mysql_fetch_assoc($consulta2)){
        echo json_encode($result['idUsuario']);
    }
}

if($consulta === FALSE) {
    die(mysql_error()); 
}

mysql_close($con);
?>