var idUser;
var idPelicula;
var idGenero;

function recuperarURL() {
	idPelicula = getUrlVars()["idPelicula"];
	idUser = getUrlVars()["idUser"];
	idGenero = getUrlVars()["idGenero"];
}

$(document).bind('deviceready', function(){
    $(function(){	
        $('form').submit(function(){
            var landmarkID = $(this).parent().attr('data-landmark-id');
            var postData = $(this).serialize();
           	idUser = getUrlVars()["idUser"];
			idPelicula = getUrlVars()["idPelicula"];
		
            $.ajax({ 
                type: 'POST', 
                data: postData+'&lid='+landmarkID,
                url: serviceURL + 'puntuar.php?idUser='+ idUser +'&idPelicula='+idPelicula,
                success: function(data){ 
                	if(data=="FAIL"){   	
                		navigator.notification.alert("Su voto se ha actualizado", alertDismissed, "Aviso", "Cerrar");
                		window.location='file:///android_asset/www/opciones.html?idUser='+ idUser+'&idPelicula='+idPelicula+'&idGenero='+idGenero;
                	}
                	else{ 
                		window.location='file:///android_asset/www/opciones.html?idUser='+ idUser+'&idPelicula='+idPelicula+'&idGenero='+idGenero;
                	}
                },
                error: function(){
                   navigator.notification.alert('No se pudo acceder al servidor.', alertDismissed, 'Aviso', 'Cerrar');
                }
            });       
               
            return false;   
        }); 
    }); 
});     
 
function alertDismissed() {

} 

function redirigirPuntuarOpciones() {
		window.location='file:///android_asset/www/opciones.html?idUser='+idUser+'&idPelicula='+idPelicula+'&idGenero='+idGenero;
} 

function redirigirPuntuarMenu() {
		window.location='file:///android_asset/www/menu.html?idUser='+idUser;
}     
