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
                url: serviceURL + 'deseadas.php?idUser='+ idUser +'&idPelicula='+idPelicula,
                success: function(data){ 
                	if(data=="FAIL"){   
                		console.log(data);	
                 		navigator.notification.alert("Película ya marcada como deseada.", alertDismissed, "Aviso", "Cerrar");
                	}
                	else if(data=="FAIL2"){  
                		console.log(data); 	
                		navigator.notification.alert("Película no marcada como deseada. No se puede eliminar.", alertDismissed, "Aviso", "Cerrar");
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

function redirigirDesearOpciones() {
		window.location='file:///android_asset/www/opciones.html?idUser='+idUser+'&idPelicula='+idPelicula+'&idGenero='+idGenero;
} 

function redirigirDesearMenu() {
		window.location='file:///android_asset/www/menu.html?idUser='+idUser;
}
