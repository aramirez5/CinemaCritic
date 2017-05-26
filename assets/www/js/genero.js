var idUser;
var idPelicula;
var idGenero;
var tipoGenero;

function recuperarURL() {
		idUser = getUrlVars()["idUser"];
		idPelicula = getUrlVars()["idPelicula"];
		idGenero = getUrlVars()["idGenero"];
}    
         
$('#generoListaPagina').live('pageshow', function(event) {
	var idGenero = getUrlVars()["idGenero"];   
	  
	switch(idGenero){
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
	
$('#header2').append('<h2>Pel&iacute;culas de g&eacute;nero: ' + tipoGenero + '</h2>');
	$.getJSON(serviceURL + 'genero.php?idGenero='+idGenero, function (data) {
		var reports = data.items;
		$.each(reports, function(index, peliculas) {
			$('#generoLista').append('<li><a href="fichaPelicula.html?idUser='+ idUser +'&idPelicula=' + peliculas.idPelicula +'&idGenero=' + peliculas.genero + '">' +
					'<img src="pics/' + peliculas.picture + '"/>' +
					'<h4>' + peliculas.titulo + '</h4>' + 
					'<p><img src="img/' + peliculas.paisImagen + '"/>' + ' ' +  peliculas.director + '</p></a></li>');
		});
		$('#generoLista').listview('refresh');
	}); 
});

function redirigirGeneroOpciones() {
		window.location='file:///android_asset/www/opciones.html?idUser='+idUser+'&idPelicula='+idPelicula+'&idGenero='+idGenero;
} 

function redirigirGeneroMenu() {
		window.location='file:///android_asset/www/menu.html?idUser='+idUser;
}