$(document).bind('deviceready', function(){
    $(function(){
        $('form').submit(function(){
            var landmarkID = $(this).parent().attr('data-landmark-id');
            var postData = $(this).serialize();
            
            $.ajax({
                type: 'POST',
                data: postData+'&lid='+landmarkID,
                url: serviceURL + 'usuarios.php',
                success: function(data){
                	
                	if(data=="FAIL"){
                		console.log(data);
                		navigator.notification.alert('Por favor, rellene todos los campos.', alertDismissed, 'Aviso', 'Cerrar');
                	}
                	
                	else if(data=="FAIL3"){
                		console.log(data);
                		navigator.notification.alert("El nombre de usuario excede los 20 caracteres permitidos.", alertDismissed, 'Aviso', 'Cerrar');
                	}
                	
                	else if(data=="FAIL4"){
                		console.log(data);
                		navigator.notification.alert("La contrase"+'\u00f1'+"a excede los 20 caracteres permitidos.", alertDismissed, 'Aviso', 'Cerrar');
                	}
                	
                	else if(data=="FAIL2"){
                		console.log(data);
                		navigator.notification.alert("Las contrase"+'\u00f1'+"as no coinciden.", alertDismissed, 'Aviso', 'Cerrar');
                	}
                	
                	else if(data=="0Comment added"){
                		console.log(data);
                		window.location="file:///android_asset/www/login.html";
                	}
                	   
                	else{
                		console.log(data);
                		navigator.notification.alert('El usuario ya se encuentra registrado.', alertDismissed, 'Aviso', 'Cerrar');
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

function redirigirLogin() {
		window.location="file:///android_asset/www/login.html";
}