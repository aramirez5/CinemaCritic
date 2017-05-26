var peliculas;
var idUser;

function recuperarURL() {
		idUser = getUrlVars()["idUser"];
}
          
$('#deseadasListaPagina').bind('pageinit', function(event) {
	getEmployeeList();
});     
  
function getEmployeeList() {
	idUser = getUrlVars()["idUser"];
	idPelicula = getUrlVars()["idPelicula"];
	$.getJSON(serviceURL + 'misDeseadas.php?idUser='+ idUser, function(data) {
		$('#deseadasLista li').remove();
		peliculas = data.items;
		$.each(peliculas, function(index, pelicula) {
			$('#deseadasLista').append('<li><a href="fichaPelicula.html?idUser='+ idUser +'&idPelicula=' + pelicula.idPelicula + '">' +
					'<img src="pics/' + pelicula.picture + '"/>' +
					'<h4>' + pelicula.titulo + '</h4>' +
					'<p><img src="img/' + pelicula.paisImagen + '"/>' + ' ' +  pelicula.director + '</p></a></li>');
		});
		$('#deseadasLista').listview('refresh');
	});    
}     

function redirigirMenu() {
		window.location='file:///android_asset/www/menu.html?idUser='+ idUser;
}                         