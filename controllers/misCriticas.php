<?php
 
include 'configuracion.php';

$idUsuario = $_GET['idUser'];

$sql = "select peliculas.titulo, peliculas.picture, peliculas.idPelicula, critica.id, critica.tituloComentario, critica.valoracion, critica.comentario from peliculas,critica where critica.idUsuario='$idUsuario' and peliculas.idPelicula = critica.idPelicula order by critica.valoracion";

try {
	$dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);	
	$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$stmt = $dbh->query($sql);  
	$comentarios = $stmt->fetchAll(PDO::FETCH_OBJ);
	$dbh = null;
	echo '{"items":'. json_encode($comentarios) .'}'; 
} catch(PDOException $e) {
	echo '{"error":{"text":'. $e->getMessage() .'}}'; 
}

?>