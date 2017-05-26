<?php

include 'configuracion.php';

$sql = "select p.idPelicula, usuarios.votosMediaTotal from usuarios, peliculas p left join peliculas r on r.idPelicula = p.idPelicula left join peliculas m on p.idPelicula = m.idPelicula where usuarios.idUsuario=:idUsuario";

try {
	$dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);	
	$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$stmt = $dbh->prepare($sql);  
	$stmt->bindParam("idUsuario", $_GET['idUser']);
	$stmt->execute();
	$peliculas = $stmt->fetchObject();  
	$dbh = null;
	echo '{"item":'. json_encode($peliculas) .'}'; 
} catch(PDOException $e) {
	echo '{"error":{"text":'. $e->getMessage() .'}}'; 
}

?>