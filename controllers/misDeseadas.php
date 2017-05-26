<?php

include 'configuracion.php';

$idUsuario = $_GET['idUser'];

$sql = "select p.idPelicula, deseadas.idDeseada, p.titulo, p.paisImagen, p.director, p.picture, count(r.idPelicula) reportCount " . 
		"from deseadas,peliculas p left join peliculas r on r.idPelicula = p.idPelicula " .
		"where deseadas.idUsuario='$idUsuario' and p.idPelicula = deseadas.idPelicula group by p.idPelicula order by p.titulo ASC";

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