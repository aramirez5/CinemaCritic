var imagenValoracion;
var idUser;
var idPelicula;
var idGenero;

function recuperarURL() {
	idPelicula = getUrlVars()["idPelicula"];
	idUser = getUrlVars()["idUser"];
	idGenero = getUrlVars()["idGenero"];
}

$('#detallesCritica').live('pageshow', function(event) {
	var id = getUrlVars()["id"];
	$.getJSON(serviceURL + 'detallesCritica.php?id='+id, displayEmployee);
});
 
function displayEmployee(data) {
	var comentario = data.item;
	 
	if(comentario.valoracion == "Buena"){
		imagenValoracion = "good.png";
	}
	else if(comentario.valoracion == "Regular"){
		imagenValoracion = "regular.png";
	} 
	else{ 
		imagenValoracion = "bad.png";
	}
	   
	if (comentario.nick) {
		$('#detalles').append('<li><p class="line1">Usuario</p>' + 
				'<p class="line2">' + comentario.nick + '</p></li>');
	}
	
	if (comentario.titulo) {
		$('#detalles').append('<li>' +
				'<p class="line1">Pel&iacute;cula comentada</p>' + 
				'<p class="line2">' + comentario.titulo + '</p></li>');
	}
	 
	if (comentario.valoracion) {
		$('#detalles').append('<li><p class="line1">Valoraci&oacute;n</p>' + 
				'<p class="line2">' + comentario.valoracion + '</p><img class="action-icon" src="img/' + imagenValoracion + '"/></li>');
	}
	if (comentario.tituloComentario) {
		$('#detalles').append('<li><p class="line1">T&iacute;tulo</p>' +
				'<p class="line2">' + comentario.tituloComentario + '</p></li>');
	}
	if (comentario.comentario) {
		$('#detalles').append('<li><p class="line1">Comentario</p>' +
				'<p class="line2">' + comentario.comentario + '</p></li>');
	}
	 
	$('#detalles').listview('refresh');
	 
}    
