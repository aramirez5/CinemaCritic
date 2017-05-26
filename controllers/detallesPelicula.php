<?php

include 'configuracion.php';

$sql = "select p.idPelicula, p.titulo, p.paisImagen, p.director, p.anyo, p.sinopsis, p.duracion, p.reparto, p.paisNombre, " .
		"p.genero, p.picture, m.titulo managerFirstName, m.paisImagen managerLastName, count(r.idPelicula) " . 
		"from peliculas p left join peliculas r on r.idPelicula = p.idPelicula left join peliculas m on p.idPelicula = m.idPelicula " .
		"where p.idPelicula=:idPelicula group by p.paisImagen order by p.idPelicula";

try {
	$dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);	
	$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$stmt = $dbh->prepare($sql);  
	$stmt->bindParam("idPelicula", $_GET['idPelicula']);
	$stmt->execute();
	$peliculas = $stmt->fetchObject();  
	$dbh = null;
	echo '{"item":'. utf8_encode(json_encode($peliculas)) .'}'; 
} catch(PDOException $e) {
	echo '{"error":{"text":'. $e->getMessage() .'}}'; 
}

?>