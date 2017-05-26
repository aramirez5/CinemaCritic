<?php

include 'configuracion.php';

$sql = "select p.idPelicula, p.titulo, p.genero, p.paisImagen, p.director, p.picture, count(r.idPelicula) " . 
		"from peliculas p left join peliculas r on r.idPelicula = p.idPelicula " .
		"group by p.idPelicula order by p.titulo ASC";

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