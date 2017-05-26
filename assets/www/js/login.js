$(document).bind('deviceready', function(){
    $(function(){
        $('form').submit(function(){
            var landmarkID = $(this).parent().attr('data-landmark-id');
            var postData = $(this).serialize();
            
            $.ajax({  
                type: 'POST',
                dataType: 'json',
                data: postData+'&lid='+landmarkID,
                url: serviceURL + 'login.php',
                success: function(data){
                	if(data=="FAIL"){  
                		console.log(data); 
                		navigator.notification.alert('Por favor, rellene todos los campos.', alertDismissed, 'Aviso', 'Cerrar');        		
                	}  
                	else if(data=="0"){
                		console.log(data);
                		navigator.notification.alert("Contrase"+'\u00f1'+"a o usuario incorrectos.", alertDismissed, "Aviso", "Cerrar");
                	}
                	else{  
	                	var idUser = console.log(data);  
	                	window.location='file:///android_asset/www/menu.html?idUser='+data;
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

function redirigir() {
		window.location="file:///android_asset/www/registro.html";
}