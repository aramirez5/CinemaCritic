var peliculas;
var idUser;

function recuperarURL() {
		idUser = getUrlVars()["idUser"];
}       
    
$('#listaEstadisticas').bind('pageinit', function(event) {
	getEmployeeList();
});  
     
function getEmployeeList() {
	idUser = getUrlVars()["idUser"];
	$.getJSON(serviceURL + 'estadisticasPeliculasVotadas.php?idUser='+ idUser, function(data) {
		$('#peliculasVotadas li').remove();
		peliculas = data.item;
		$('#peliculasVotadas').append('<li><p class="line1">Pel&iacute;culas votadas</p>' + 
				'<p class="line2">' + peliculas.pelisVotadas + '</p></li>');
		$('#peliculasVotadas').listview('refresh');
	}); 
	 
	$.getJSON(serviceURL + 'estadisticasCriticasTotales.php?idUser='+ idUser, function(data) {
		$('#criticasTotales li').remove();
		peliculas = data.item;
		$('#criticasTotales').append('<li><p class="line1">Cr&iacute;ticas totales</p>' + 
				'<p class="line2">' + peliculas.criticasTotales + '</p></li>');
		$('#criticasTotales').listview('refresh');
	});   
	 
	$.getJSON(serviceURL + 'estadisticasVotosMediaTotal.php?idUser='+ idUser, function(data) {
		$('#votosMedia li').remove();
		peliculas = data.item;
		$('#votosMedia').append('<li><p class="line1">Media de votos</p>' + 
				'<p class="line2">' + peliculas.votosMediaTotal + '</p></li>');
		$('#votosMedia').listview('refresh');
	}); 
	
	$.getJSON(serviceURL + 'estadisticasCriticasPositivas.php?idUser='+ idUser, function(data) {
		$('#criticasPositivas li').remove();
		peliculas = data.item;
		$('#criticasPositivas').append('<li><p class="line1">Cr&iacute;ticas positivas</p>' + 
				'<p class="line2">' + peliculas.criticasPositivas + '</p><img class="action-icon" src="img/good.png"/></li>');
		$('#criticasPositivas').listview('refresh');
	}); 
	    
	$.getJSON(serviceURL + 'estadisticasCriticasNeutras.php?idUser='+ idUser, function(data) {
		$('#criticasNeutras li').remove();
		peliculas = data.item;
		$('#criticasNeutras').append('<li><p class="line1">Cr&iacute;ticas neutras</p>' + 
				'<p class="line2">' + peliculas.criticasNeutras + '</p><img class="action-icon" src="img/regular.png"/></li>');
		$('#criticasNeutras').listview('refresh');
	});
	  
	$.getJSON(serviceURL + 'estadisticasCriticasNegativas.php?idUser='+ idUser, function(data) {
		$('#criticasNegativas li').remove();
		peliculas = data.item;
		$('#criticasNegativas').append('<li><p class="line1">Cr&iacute;ticas negativas</p>' + 
				'<p class="line2">' + peliculas.criticasNegativas + '</p><img class="action-icon" src="img/bad.png"/></li>');
		$('#criticasNegativas').listview('refresh');
	});      
	     
	$.getJSON(serviceURL + 'estadisticasPeliMenos.php?idUser='+ idUser, function(data) {
		$('#PeliMenosVotada li').remove();
		peliculas = data.item;
		$('#PeliMenosVotada').append('<li><p class="line1">Pel&iacute;cula peor votada</p>' + 
				'<p class="line2">' + peliculas.peliculaMenorPuntuada + '</p><img class="action-icon" src="img/arrowdown.png"/></li>');
		$('#PeliMenosVotada').listview('refresh');
	});
	 
	$.getJSON(serviceURL + 'estadisticasPeliMas.php?idUser='+ idUser, function(data) {
		$('#PeliMasVotada li').remove();
		peliculas = data.item;
		$('#PeliMasVotada').append('<li><p class="line1">Pel&iacute;cula mejor votada</p>' + 
				'<p class="line2">' + peliculas.peliculaMayorPuntuada + '</p><img class="action-icon" src="img/arrowup.png"/></li>');
		$('#PeliMasVotada').listview('refresh');
	}); 
	 
	$.getJSON(serviceURL + 'estadisticasDeseadasTotal.php?idUser='+ idUser, function(data) {
		$('#deseadas li').remove();
		peliculas = data.item;
		$('#deseadas').append('<li><p class="line1">Pel&iacute;culas marcadas como deseadas</p>' + 
				'<p class="line2">' + peliculas.deseadasTotal + '</p></li>');
		$('#deseadas').listview('refresh');
	}); 
}               
     
function redirigirMenu() {
		window.location='file:///android_asset/www/menu.html?idUser='+ idUser;
}                 