<?php
 
include 'configuracion.php';

$idUsuario = $_GET['idUser'];

$sql = "select peliculas.titulo, peliculas.idPelicula, peliculas.picture, peliculas.genero, valoracion.id, valoracion.puntos from peliculas,valoracion where valoracion.idUsuario='$idUsuario' and peliculas.idPelicula = valoracion.idPelicula order by valoracion.puntos";

try {
	$dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);	
	$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$stmt = $dbh->query($sql);  
	$peliculas = $stmt->fetchAll(PDO::FETCH_OBJ);
	$dbh = null;
	echo '{"items":'. json_encode($peliculas) .'}'; 
} catch(PDOException $e) {
	echo '{"error":{"text":'. $e->getMessage() .'}}'; 
}

?>