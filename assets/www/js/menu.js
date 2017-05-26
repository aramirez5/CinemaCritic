var idUser;

function recuperarURL() {
		idUser = getUrlVars()["idUser"];
}

function indice() {
		window.location='file:///android_asset/www/listaPeliculas.html?idUser='+idUser;
}

function critica() {
		window.location='file:///android_asset/www/critica.html?idUser='+idUser;
}

function misCriticas() {
		window.location='file:///android_asset/www/misCriticas.html?idUser='+idUser;
}

function misDeseadas() {
		window.location='file:///android_asset/www/misDeseadas.html?idUser='+idUser;
}

function misValoraciones() {
		window.location='file:///android_asset/www/misPuntos.html?idUser='+idUser;
}

function misEstadisticas() {
		window.location='file:///android_asset/www/estadisticas.html?idUser='+idUser;
}

function redirigirMenu() {
		window.location='file:///android_asset/www/login.html?idUser='+idUser;
} 

function redirigirDetalles() {
		window.location='file:///android_asset/www/fichaPelicula.html?idUser='+idUser;
}