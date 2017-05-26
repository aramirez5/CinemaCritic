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
                url: serviceURL + 'critica.php?idUser='+ idUser +'&idPelicula='+idPelicula,
                success: function(data){
                	if(data=="FAIL"){   	
                		navigator.notification.alert("Su comentario se ha actualizado.", alertDismissed, "Aviso", "Cerrar");
                		window.location='file:///android_asset/www/opciones.html?idUser='+ idUser+'&idPelicula='+idPelicula+'&idGenero='+idGenero;
                	}
                	else if(data=="0"){
                   		navigator.notification.alert("Por favor, rellene todos los campos.", alertDismissed, "Aviso", "Cerrar");
                	}
                	else if(data=="FAIL2"){
                		console.log(data);
                		navigator.notification.alert("El título excede los 50 caracteres permitidos.", alertDismissed, 'Aviso', 'Cerrar');
                	}
                	else if(data=="FAIL3"){
                		console.log(data);
                		navigator.notification.alert("El comentario excede los 300 caracteres permitidos.", alertDismissed, 'Aviso', 'Cerrar');
                	}
                	else{            	     	     	
	                	console.log(data);
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
 
function redirigirCriticaOpciones() {
		window.location='file:///android_asset/www/opciones.html?idUser='+idUser+'&idPelicula='+idPelicula+'&idGenero='+idGenero;
} 

function redirigirMenuOpciones() {
		window.location='file:///android_asset/www/menu.html?idUser='+idUser;
} 