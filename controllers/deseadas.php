<?php

include 'configuracion.php';

$con = mysql_connect($dbhost, $dbuser, $dbpass) or die ("Could not connect: " . mysql_error());

mysql_select_db($dbname, $con);

$idUsuario = $_GET['idUser'];
$idPelicula = $_GET['idPelicula'];

if (isset($_POST['desear'])) {
    $desear = $_POST['desear'];
} else {
    $desear = "";
}

$consulta = mysql_query("SELECT idDeseada FROM deseadas WHERE idUsuario='$idUsuario' and idPelicula='$idPelicula'");

if($desear==1){

    if(mysql_num_rows($consulta) == 0){     
        $sql = "INSERT INTO deseadas (idUsuario,idPelicula)";
        $sql .= "VALUES ('$idUsuario','$idPelicula')";
        echo "1";

        if (!mysql_query($sql, $con)) {
        die('Error: ' . mysql_error());
        } else {
            echo "Comment added"; 
        }
    }
    
    else{
        echo "FAIL";
    }
}

if($desear==2){
    if(mysql_num_rows($consulta) != 0){     
        $sql = "DELETE FROM deseadas WHERE idUsuario='$idUsuario' and idPelicula='$idPelicula'";
        echo "1";

        if (!mysql_query($sql, $con)) {
        die('Error: ' . mysql_error());
        } else {
            echo "Comment added"; 
        }
    }
    
    else{
        echo "FAIL2";
    }
}

$consulta = mysql_num_rows(mysql_query("SELECT idUsuario FROM deseadas WHERE idUsuario='$idUsuario'"));
$actualizar = mysql_query("UPDATE usuarios SET deseadasTotal='$consulta' WHERE idUsuario='$idUsuario'");

mysql_close($con);
?>