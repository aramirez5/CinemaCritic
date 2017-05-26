var idPelicula;
var idUser;
var idGenero;
var estrella;
var tipoGenero;

function recuperarURL() {
	idPelicula = getUrlVars()["idPelicula"];
	idUser = getUrlVars()["idUser"];
	idGenero = getUrlVars()["idGenero"];
}
 
$('#detallesPeliculaLista').live('pageshow', function(event) {
	idPelicula = getUrlVars()["idPelicula"];
	idUser = getUrlVars()["idUser"];
	idGenero = getUrlVars()["idGenero"];
	$.getJSON(serviceURL + 'mediaVotos.php?idPelicula='+idPelicula, mediaVotos);
	$.getJSON(serviceURL + 'detallesPelicula.php?idPelicula='+idPelicula, mostrarPelicula);
	$.getJSON(serviceURL + 'totalVotos.php?idPelicula='+idPelicula, votosTotales);
});   
 
function mostrarPelicula(data) {
	var peliculas = data.item;
	$('#imagenPelicula').attr('src', 'pics/' + peliculas.picture);
	$('#tituloPelicula').append(peliculas.titulo);
	
	console.log(peliculas.reparto);
	
	switch(peliculas.genero){
		case  "FAN":
			tipoGenero = "Fantas&iacute;a";
		break;
		case  "ANI":
			tipoGenero = "Animaci&oacute;n";
		break;
		case  "ACC":
			tipoGenero = "Acci&oacute;n";
		break;
		case  "THR":
			tipoGenero = "Thriller";
		break;
		case  "DRA":
			tipoGenero = "Drama";
		break;
		case  "COM":
			tipoGenero = "Comedia";
		break;
		case  "ROM":
			tipoGenero = "Romance";
		break;
		case  "TER":
			tipoGenero = "Terror";
		break;
		case  "AVE":
			tipoGenero = "Aventura";
		break;
		case  "BEL":
			tipoGenero = "B&eacute;lica";
		break;
		case  "FIC":
			tipoGenero = "Ciencia Ficci&oacute;n";
		break;
		case  "WES":
			tipoGenero = "Western";
		break;
	} 
	
	if (peliculas.genero) {
		$('#listaDellatesPeli').append('<li><p class="line1">G&eacute;nero</p>' +
				'<p class="line2">' + tipoGenero + '</p></li>');
		
	}
	if (peliculas.anyo) {
		$('#listaDellatesPeli').append('<li><p class="line1">A&ntilde;o</p>' +
				'<p class="line2">' + peliculas.anyo + '</p></li>');
	} 
	if (peliculas.duracion) { 
		$('#listaDellatesPeli').append('<li><p class="line1">Duraci&oacute;n</p>' +
				'<p class="line2">' + peliculas.duracion + '</p></li>');
	}
	if (peliculas.director) {
		$('#listaDellatesPeli').append('<li><p class="line1">Director</p>' +
				'<p class="line2">' + peliculas.director + '</p></li>');
	} 
	if (peliculas.reparto) { 
		$('#listaDellatesPeli').append('<li><p class="line1">Reparto</p>' +
				'<p class="line2">' + peliculas.reparto + '</p></li>');
	}
	if (peliculas.paisImagen) {
		$('#listaDellatesPeli').append('<li><p class="line1">Nacionalidad</p>' + 
				'<p class="line2">' + peliculas.paisNombre + '</p><img class="action-icon" src="img/' + peliculas.paisImagen + '"/></a></li>');
	}
	 
	if (peliculas.sinopsis) {
		$('#listaDellatesPeli').append('<li><p class="line1">Sinopsis</p>' + 
				'<p class="line2">' + peliculas.sinopsis + '</p></li>');
	}
	
	$('#listaDellatesPeli2').append('<li><a href="opciones.html?idUser='+ idUser +'&idPelicula=' + idPelicula + '&idGenero=' + idGenero + '"><font color="#5792BD"><p class="line1">Opciones</p></font>' + 
				'<p class="line2"></p></a></li>');
				
	$('#listaDellatesPeli').listview('refresh');
	   
}         
        
function votosTotales(data) {
	var peliculas = data.item; 
	console.log(peliculas.votosTotales);
	
	$('#votos').append('('+peliculas.votosTotales+' votos)');
}       
        
function mediaVotos(data) { 
	var peliculas = data.item; 
	console.log(peliculas.votosMedia);
	 
	if(peliculas.votosMedia == "10"){
		estrella = "greenStar.png";
	}
	  
	else if(peliculas.votosMedia >= "8"){
		estrella = "greenStar.png";
	}
	
	else if(peliculas.votosMedia >= "5"){
		estrella = "yellowStar.png";
	}
	 
	else{  
		estrella = "redStar.png";
	}

	$('#estrella').attr('src', 'img/'+estrella);
	
	$('#votos').append('<font size=26>'+peliculas.votosMedia+'</font><td>&nbsp;</td>');
}  

function redirigirIndex() {
		window.location='file:///android_asset/www/listaPeliculas.html?idUser='+ idUser;
}

function redirigirMenu() {
		window.location='file:///android_asset/www/menu.html?idUser='+ idUser;
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

function redirigirDeseadas() {
		window.location='file:///android_asset/www/deseadas.html?idUser='+idUser+'&idPelicula='+idPelicula+'&idGenero='+idGenero;
} 

