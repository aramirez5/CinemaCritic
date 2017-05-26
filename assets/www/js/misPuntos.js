var valoraciones;
var idUser;
var imagenValoracion;

$('#paginaListaPuntos').bind('pageinit', function(event) {
	obtenerValoraciones();
});
 
function obtenerValoraciones() { 
	idUser = getUrlVars()["idUser"];
	$.getJSON(serviceURL + 'misPuntos.php?idUser='+ idUser, function(data) {
		$('#listaPuntos li').remove();
		valoraciones = data.items;
		$.each(valoraciones, function(index, valoracion) {
			 
			$('#listaPuntos').append('<li><a href="fichaPelicula.html?idUser='+ idUser +'&idPelicula=' + valoracion.idPelicula +'&idGenero=' + valoracion.genero + '">' +
					'<img src="pics/' + valoracion.picture + '"/>' +
					'<h4>' + valoracion.titulo + '</h4>' +
					'<p><img src="img/ministar.png"/>' + ' ' + "Mi puntuaci&oacute;n: " + valoracion.puntos + '</p></a></li>');
		});
		$('#listaPuntos').listview('refresh');
	});  
}    
 
function redirigirIndex() {
		window.location="file:///android_asset/www/menu.html";
}       
         