<?php

include 'configuracion.php';

$sql = "select usuarios.nick, peliculas.titulo, peliculas.idPelicula, critica.id, critica.tituloComentario, critica.valoracion, critica.comentario from usuarios,peliculas,critica where critica.id=:id and peliculas.idPelicula = critica.idPelicula and usuarios.idUsuario = critica.idUsuario order by critica.id";

try {
	$dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);	
	$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$stmt = $dbh->prepare($sql);  
	$stmt->bindParam("id", $_GET['id']);
	$stmt->execute();
	$comentario = $stmt->fetchObject();  
	$dbh = null;
	echo '{"item":'. json_encode($comentario) .'}'; 
} catch(PDOException $e) {
	echo '{"error":{"text":'. $e->getMessage() .'}}'; 
}


?>