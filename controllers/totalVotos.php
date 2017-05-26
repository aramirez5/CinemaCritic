<?php

include 'configuracion.php';

$sql = "select votosTotales from peliculas where idPelicula=:idPelicula";

try {
	$dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);	
	$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$stmt = $dbh->prepare($sql);  
	$stmt->bindParam("idPelicula", $_GET['idPelicula']);
	$stmt->execute();
	$peliculas = $stmt->fetchObject();  
	$dbh = null;
	echo '{"item":'. json_encode($peliculas) .'}'; 
} catch(PDOException $e) {
	echo '{"error":{"text":'. $e->getMessage() .'}}'; 
}

?>