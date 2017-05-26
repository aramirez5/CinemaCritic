var comentarios;
var idUser;
var imagenValoracion;

function recuperarURL() {
		idUser = getUrlVars()["idUser"];
} 
 
$('#paginaListaCriticas').bind('pageinit', function(event) {
	obtenerComentario();
});
 
function obtenerComentario() {
	idUser = getUrlVars()["idUser"];
	$.getJSON(serviceURL + 'misCriticas.php?idUser='+ idUser, function(data) {
		$('#listaCriticas li').remove();
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
			 
			$('#listaCriticas').append('<li><a href="fichaMisCriticas.html?id=' + comentario.id +'&idUser=' + idUser +'">' +
					'<img src="pics/' + comentario.picture + '"/>' +
					'<h4>' + comentario.titulo + '</h4>' +
					'<p><img src="img/' + imagenValoracion + '"/>' + ' ' +  comentario.tituloComentario + '</p></a></li>');
		});
		$('#listaCriticas').listview('refresh');
	});  
}    
 
function redirigirMenu() {
		window.location='file:///android_asset/www/menu.html?idUser='+ idUser;
}       
         