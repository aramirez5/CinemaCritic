<?php

include 'configuracion.php';

$con = mysql_connect($dbhost, $dbuser, $dbpass) or die ("Could not connect: " . mysql_error());

mysql_select_db($dbname, $con);

$idUsuario = $_GET['idUser'];
$idPelicula = $_GET['idPelicula'];

if (isset($_POST['puntos'])) {
    $puntos = $_POST['puntos'];
} else {
    $puntos = "";
}

$consulta = mysql_query("SELECT id FROM valoracion WHERE idUsuario='$idUsuario' and idPelicula='$idPelicula'");

if(mysql_num_rows($consulta) == 0){     
    $sql = "INSERT INTO valoracion (idUsuario,idPelicula,puntos) ";
    $sql .= "VALUES ('$idUsuario','$idPelicula','$puntos')";
    echo "1";
    
    if (!mysql_query($sql, $con)) {
    die('Error: ' . mysql_error());
    } else {
        echo "Comment added"; 
    }
}
    
else{
    $actualizacion = mysql_query("UPDATE valoracion SET puntos='$puntos' WHERE idUsuario='$idUsuario' and idPelicula='$idPelicula'");
    echo "FAIL";
}

$consulta2 = mysql_num_rows(mysql_query("SELECT idPelicula FROM valoracion WHERE idPelicula='$idPelicula'"));
$actualizar2 = mysql_query("UPDATE peliculas SET votosTotales='$consulta2' WHERE idPelicula='$idPelicula'");

$consulta3 = mysql_query("SELECT ROUND(AVG(puntos),1) FROM valoracion WHERE idPelicula='$idPelicula'");
$total = mysql_result($consulta3,0);
$actualizar3 = mysql_query("UPDATE peliculas SET votosMedia='$total' WHERE idPelicula='$idPelicula'");

$consulta4 = mysql_num_rows(mysql_query("SELECT idUsuario FROM valoracion WHERE idUsuario='$idUsuario'"));
$actualizar4 = mysql_query("UPDATE usuarios SET pelisVotadas='$consulta4' WHERE idUsuario='$idUsuario'");

$consulta5 = mysql_query("SELECT ROUND(AVG(puntos),1) FROM valoracion WHERE idUsuario='$idUsuario'");
$total2 = mysql_result($consulta5,0);
$actualizar5 = mysql_query("UPDATE usuarios SET votosMediaTotal='$total2' WHERE idUsuario='$idUsuario'");

$consulta6 = mysql_query("SELECT MIN(puntos) FROM valoracion WHERE idUsuario='$idUsuario'");
$total3 = mysql_result($consulta6,0);
$consulta7 = mysql_query("SELECT peliculas.titulo FROM valoracion,peliculas,usuarios WHERE valoracion.puntos='$total3' AND valoracion.idUsuario='$idUsuario' AND valoracion.idPelicula=peliculas.idPelicula");
$total4 = mysql_result($consulta7,0);
$actualizar6 = mysql_query("UPDATE usuarios SET peliculaMenorPuntuada='$total4' WHERE idUsuario='$idUsuario'");

$consulta8 = mysql_query("SELECT MAX(puntos) FROM valoracion WHERE idUsuario='$idUsuario'");
$total5 = mysql_result($consulta8,0);
$consulta9 = mysql_query("SELECT peliculas.titulo FROM valoracion,peliculas,usuarios WHERE valoracion.puntos='$total5' AND valoracion.idUsuario='$idUsuario' AND valoracion.idPelicula=peliculas.idPelicula");
$total6 = mysql_result($consulta9,0);
$actualizar7 = mysql_query("UPDATE usuarios SET peliculaMayorPuntuada='$total6' WHERE idUsuario='$idUsuario'");

mysql_close($con);
?>