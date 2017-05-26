var peliculas;
var idUser;

function recuperarURL() {
		idUser = getUrlVars()["idUser"];
} 
 
$('#peliculasListaPagina').bind('pageinit', function(event) {
	getEmployeeList();
});  
  
function getEmployeeList() {
	$.getJSON(serviceURL + 'listaPeliculas.php', function(data) {
		$('#peliculasLista li').remove();
		peliculas = data.items;
		$.each(peliculas, function(index, pelicula) {
			$('#peliculasLista').append('<li><a href="fichaPelicula.html?idUser='+ idUser +'&idPelicula=' + pelicula.idPelicula +'&idGenero=' + pelicula.genero + '">' +
					'<img src="pics/' + pelicula.picture + '"/>' +
					'<h4>' + pelicula.titulo + '</h4>' +
					'<p><img src="img/' + pelicula.paisImagen + '"/>' + ' ' +  pelicula.director + '</p></a></li>');
		});
		$('#peliculasLista').listview('refresh');
	});  
}     

function redirigirMenu() {
		window.location='file:///android_asset/www/menu.html?idUser='+ idUser;
}                         