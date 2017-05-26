<?php

include 'configuracion.php';

$con = mysql_connect($dbhost, $dbuser, $dbpass) or die ("Could not connect: " . mysql_error());

mysql_select_db($dbname, $con);

$idUsuario = $_GET['idUser'];
$idPelicula = $_GET['idPelicula'];

if (isset($_POST['tituloComentario'])) {
    $tituloComentario = htmlentities($_POST['tituloComentario']);
} else {
    $tituloComentario = "";
}

if (isset($_POST['valoracion'])) {
    $valoracion = $_POST['valoracion'];
} else {
    $valoracion = "";
}

if (isset($_POST['comentario'])) {
    $comentario = htmlentities($_POST['comentario']);
} else {
    $comentario = "";
}

$consulta = mysql_query("SELECT id FROM critica WHERE idUsuario='$idUsuario' and idPelicula='$idPelicula'");

if($tituloComentario=="" || $comentario==""){
    echo "0";
}

elseif(strlen($tituloComentario) > 50){
     echo "FAIL2";
}

elseif(strlen($comentario) > 300){
     echo "FAIL3";
}

elseif(mysql_num_rows($consulta) == 0){ 
    $sql = "INSERT INTO critica (idUsuario, idPelicula, tituloComentario, valoracion, comentario) ";
    $sql .= "VALUES ('$idUsuario', '$idPelicula', '$tituloComentario', '$valoracion', '$comentario')";
    echo "1";
 
    if (!mysql_query($sql, $con)) {
	   die('Error: ' . mysql_error());
    } else {
	   echo "Comment added";
    }
}

else{
    $actualizacion = mysql_query("UPDATE critica SET tituloComentario='$tituloComentario', valoracion='$valoracion', comentario='$comentario' WHERE idUsuario='$idUsuario' and idPelicula='$idPelicula'");
    echo "FAIL";
}

$consulta2 = mysql_num_rows(mysql_query("SELECT idUsuario FROM critica WHERE idUsuario='$idUsuario'"));
$actualizar2 = mysql_query("UPDATE usuarios SET criticasTotales='$consulta2' WHERE idUsuario='$idUsuario'");

$consulta3 = mysql_num_rows(mysql_query("SELECT valoracion FROM critica WHERE valoracion='Buena' AND idUsuario='$idUsuario'"));
$actualizar3 = mysql_query("UPDATE usuarios SET criticasPositivas='$consulta3' WHERE idUsuario='$idUsuario'");

$consulta4 = mysql_num_rows(mysql_query("SELECT valoracion FROM critica WHERE valoracion='Regular' AND idUsuario='$idUsuario'"));
$actualizar4 = mysql_query("UPDATE usuarios SET criticasNeutras='$consulta4' WHERE idUsuario='$idUsuario'");

$consulta5 = mysql_num_rows(mysql_query("SELECT valoracion FROM critica WHERE valoracion='Mala' AND idUsuario='$idUsuario'"));
$actualizar5 = mysql_query("UPDATE usuarios SET criticasNegativas='$consulta5' WHERE idUsuario='$idUsuario'");

mysql_close($con);
?>