var idUser;
var idPelicula;
var idGenero;

function recuperarURL() {
		idUser = getUrlVars()["idUser"];
		idPelicula = getUrlVars()["idPelicula"];
		idGenero = getUrlVars()["idGenero"];
}

function redirigirComentarios() {
		window.location='file:///android_asset/www/comentarios.html?idUser='+idUser+'&idPelicula='+idPelicula+'&idGenero='+idGenero;
}

function redirigirCritica() {
		window.location='file:///android_asset/www/critica.html?idUser='+idUser+'&idPelicula='+idPelicula+'&idGenero='+idGenero;
}

function redirigirPuntuar() {
		window.location='file:///android_asset/www/puntuar.html?idUser='+idUser+'&idPelicula='+idPelicula+'&idGenero='+idGenero;
}  

function redirigirGenero() {
		window.location='file:///android_asset/www/genero.html?idUser='+idUser+'&idPelicula='+idPelicula+'&idGenero='+idGenero;
}
