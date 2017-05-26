var comentarios;
var idUser;
var idPelicula;
var idGenero;
var imagenValoracion;

function recuperarURL() {
	idPelicula = getUrlVars()["idPelicula"];
	idUser = getUrlVars()["idUser"];
	idGenero = getUrlVars()["idGenero"];
}

$('#paginaListaComentarios').bind('pageinit', function(event) {
	obtenerComentarios();
});
 
function obtenerComentarios() {
	idUser = getUrlVars()["idUser"];
	idPelicula = getUrlVars()["idPelicula"];
	$.getJSON(serviceURL + 'comentarios.php?idUser='+ idUser +'&idPelicula='+idPelicula, function(data) {
		$('#listaComentarios li').remove();
		comentarios = data.items;
		$.each(comentarios, function(index, comentario) {
			
			if(comentario.valoracion == "Buena"){
				imagenValoracion = "good.png";
			}
			else if(comentario.valoracion == "Regular"){
				imagenValoracion = "regular.png";
			}
			else{ 
				imagenValoracion = "bad.png";
			}
			
			$('#listaComentarios').append('<li><a href="fichaCritica.html?id=' + comentario.id + '">' +
					'<h4>' + comentario.tituloComentario + '</h4>' +
					'<p><img src="img/' + imagenValoracion + '"/>' + ' ' +  comentario.valoracion + '</p></a></li>');
		});
		$('#listaComentarios').listview('refresh');
	}); 
}   

function redirigirComentariosOpciones() {
		window.location='file:///android_asset/www/opciones.html?idUser='+idUser+'&idPelicula='+idPelicula+'&idGenero='+idGenero;
} 

function redirigirComentariosMenu() {
		window.location='file:///android_asset/www/menu.html?idUser='+idUser;
}       
         