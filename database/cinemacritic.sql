-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-09-2014 a las 14:40:11
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `cinemacritic`
--
CREATE DATABASE IF NOT EXISTS `cinemacritic` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `cinemacritic`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `critica`
--

CREATE TABLE IF NOT EXISTS `critica` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(3) NOT NULL,
  `idPelicula` int(3) NOT NULL,
  `tituloComentario` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `valoracion` varchar(7) COLLATE utf8_spanish_ci NOT NULL,
  `comentario` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idUsuario` (`idUsuario`,`idPelicula`),
  KEY `idPelicula` (`idPelicula`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=26 ;

--
-- Volcado de datos para la tabla `critica`
--

INSERT INTO `critica` (`id`, `idUsuario`, `idPelicula`, `tituloComentario`, `valoracion`, `comentario`) VALUES
(3, 1, 12, 'Maravillosa', 'Buena', 'Absolutamente sublime este film'),
(4, 3, 12, 'La tapada de la temporada', 'Buena', 'Grata sorpresa con grandes actuaciones de Tom Cruise y Jamie Foxx'),
(5, 1, 4, 'T&iacute;pica americanada', 'Mala', 'Otra peli de guerra que les gusta a los americanos'),
(6, 1, 1, 'Buena peli de fantas&iacute;a', 'Regular', 'Me encatan esta precuela, pero peca de infantilismos'),
(7, 1, 7, 'Genialidad de Pixar', 'Buena', 'Merecidisimo Oscar a la mejor peli de animaci&oacute;n'),
(8, 1, 13, 'No me mola', 'Mala', 'Demasiado rara para mi gusto'),
(11, 10, 15, 'Muy buena peli del oeste', 'Buena', 'Genial cl&aacute;sico de los western americanos.'),
(12, 5, 12, 'Gran peli', 'Buena', 'Me encantan los personajes y la trama.'),
(13, 1, 24, 'Me gust&oacute; much&iacute;simo', 'Buena', 'Verdadera obra maestra que espero se lleve un Oscar'),
(14, 4, 2, 'Estupenda, pero muy larga', 'Buena', 'Me encant&oacute; la pel&iacute;cula. Si tengo que poner una pega es que es demasiado larga'),
(15, 4, 9, 'Otro gran film de Nolan', 'Buena', 'De las mejores pel&iacute;culas del a&ntilde;o. Espero que hagan una segunda parte.'),
(16, 4, 29, 'Muy cutre', 'Mala', 'Parece un telefilm de tarde, adem&aacute;s de que el argumento est&aacute; muy visto'),
(17, 3, 28, 'Imprescindible', 'Buena', 'La mejor pel&iacute;cula espa&ntilde;ola en mucho tiempo, ojal&aacute; fuera todas igual.'),
(18, 3, 25, 'Merecido Oscar', 'Regular', 'Gran pel&iacute;cula italiana, pero se hace un poco pesada.'),
(19, 5, 26, 'Entretenida, pero un poco rara', 'Regular', 'Demasiados elementos surrealistas para mi gusto, aunque est&aacute; bien'),
(20, 6, 27, 'El peor Bond', 'Mala', 'Pel&iacute;cula con buenas intenciones, pero el nuevo actor que interpreta a Bond no est&aacute; a la altura'),
(21, 6, 16, 'Espectacular', 'Buena', 'Posiblemente la mejor pel&iacute;cula b&eacute;lica de la historia, no te defraudar&aacute; si eres amante del g&eacute;nero'),
(22, 9, 22, 'Gran peli de piratas', 'Buena', 'Film perfecti para ver con la familia, muy divertida.'),
(23, 10, 20, 'No es lo que esperaba', 'Mala', 'No esboc&eacute; ni media sonrisa con esta película, un poco rara y aburrida.'),
(24, 2, 12, 'Esperaba m&aacute;s', 'Regular', 'Trama muy flojita para lo que promet&iacute;a este film.'),
(25, 9, 12, 'Cruise no salva la peli', 'Mala', 'Buenas actuaciones que resultan insuficientes ante el trillado argumento planteado.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deseadas`
--

CREATE TABLE IF NOT EXISTS `deseadas` (
  `idDeseada` int(3) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(3) NOT NULL,
  `idPelicula` int(3) NOT NULL,
  PRIMARY KEY (`idDeseada`),
  KEY `idUsuario` (`idUsuario`,`idPelicula`),
  KEY `idPelicula` (`idPelicula`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `deseadas`
--

INSERT INTO `deseadas` (`idDeseada`, `idUsuario`, `idPelicula`) VALUES
(8, 1, 11),
(9, 1, 12),
(16, 1, 13),
(10, 1, 17),
(14, 3, 17),
(13, 4, 2),
(12, 10, 15),
(15, 10, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas`
--

CREATE TABLE IF NOT EXISTS `peliculas` (
  `idPelicula` int(3) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `paisImagen` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `director` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `anyo` int(4) NOT NULL,
  `reparto` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `paisNombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `genero` varchar(3) COLLATE utf8_spanish_ci NOT NULL,
  `duracion` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `sinopsis` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `picture` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `votosTotales` int(3) NOT NULL DEFAULT '0',
  `votosMedia` float DEFAULT NULL,
  PRIMARY KEY (`idPelicula`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=30 ;

--
-- Volcado de datos para la tabla `peliculas`
--

INSERT INTO `peliculas` (`idPelicula`, `titulo`, `paisImagen`, `director`, `anyo`, `reparto`, `paisNombre`, `genero`, `duracion`, `sinopsis`, `picture`, `votosTotales`, `votosMedia`) VALUES
(1, 'El Hobbit', 'usa.png', 'Peter Jackson', 2012, 'Martin Freeman, Ian McKellen,  Richard Armitage, Ken Stott, Aidan Turner', 'Estados Unidos', 'FAN', '169 min', 'Junto con el mago Gandalf y trece enanos, el hobbit Bilbo Bols&oacute;n emprende un viaje a trav&eacute;s del pa&iacute;s de los elfos y los bosques de los trolls donde el drag&oacute;n Smaug esconde el tesoro de los Enanos.', 'hobbit.jpg', 3, 5.3),
(2, 'Titanic', 'usa.png', 'James Cameron', 1997, 'Leonardo DiCaprio, Kate Winslet, Billy Zane, Kathy Bates, Frances Fisher', 'Estados Unidos', 'ROM', '195 min', 'Jack, un joven artista, gana en una partida de cartas un pasaje para viajar a Am&eacute;rica en el Titanic, el trasatl&aacute;ntico m&aacute;s grande y seguro jam&aacute;s construido. A bordo conoce a Rose que va a contraer un matrimonio de conveniencia con Cal. Jack y Rose se enamoran, pero el prometido y la madre de ella ponen todo tipo de trabas a su relaci&oacute;n. Mientras, el gigantesco y lujoso trasatl&aacute;ntico se aproxima hacia un inmenso iceberg.', 'titanic.jpg', 2, 6),
(3, 'Django Desencadenado', 'usa.png', 'Quentin Tarantino', 2012, 'Jamie Foxx, Christoph Waltz, Leonardo DiCaprio, Kerry Washington', 'Estados Unidos', 'WES', '165 min', 'En Texas, King Schultz, un cazarecompensas alem&aacute;n que le sigue la pista a unos asesinos para cobrar por sus cabezas, le promete al esclavo negro Django dejarlo en libertad si le ayuda a atraparlos. Acepta pues luego quiere ir a buscar a su esposa Broomhilda, una esclava que est&aacute; en una plantaci&oacute;n del terrateniente Calvin Candie.', 'django.jpg', 4, 5.5),
(4, 'El &Uacute;nico Superviviente', 'usa.png', 'Peter Berg', 2013, 'Mark Wahlberg, Taylor Kitsch, Ben Foster, Emile Hirsch, Alexander Ludwig', 'Estados Unidos', 'BEL', '120 min', 'A un equipo de &eacute;lite de las fuerzas especiales SEAL del ej&eacute;rcito norteamericano, liderados por Marcus Luttrell junto a otros tres soldados les es encomendada una peligrosa misi&oacute;n, la "Operaci&oacute;n red wing": capturar o matar a un lider terrorista talib&aacute;n, Admad Shad, que se esconde en una zona boscosa de Afganist&aacute;n.', 'superviviente.jpg', 2, 9),
(5, 'Oblivion', 'usa.png', 'Joseph Kosinski', 2013, 'Tom Cruise, Andrea Riseborough, Olga Kurylenko, Morgan Freeman', 'Estados Unidos', 'FIC', '126 min', 'Es el a&ntilde;o 2073 y la Tierra fue atacada. Jack Harper es uno de los &uacute;ltimos hombres que la habitan. Es un ingeniero de Drones que participa en una operacion para extraer los recursos vitales del planeta. Un d&iacute;a, rescata a una desconocida de una nave espacial y se ve obligado a replantearse sus convicciones m&aacute;s profundas. ', 'oblivion.jpg', 3, 3.3),
(6, 'Expediente Warren', 'usa.png', 'James Wan', 2013, 'Lili Taylor, Vera Farmiga,  Patrick Wilson, Joey King', 'Estados Unidos', 'TER', '112 min', 'Narra los encuentros sobrenaturales que vivi&oacute; la familia Perron en su casa de Rhode Island a principios de los 70. Ed y Lorraine Warren, investigadores de renombre en el mundo de los fenomenos paranormales, acuden a la llamada de una familia aterrorizada por la presencia en su granja de un ser maligno. ', 'warren.jpg', 2, 8),
(7, 'Frozen', 'usa.png', 'Chris Buck, Jennifer', 2013, 'Animacion', 'Estados Unidos', 'ANI', '108 min', 'Cuando una profec&iacute;a condena a un reino a vivir un invierno eterno, la joven Anna, el temerario Kristoff y el reno Sven emprenden un viaje &eacute;pico en busca de Elsa, hermana de Anna y Reina de las Nieves, para poner fin al g&eacute;lido hechizo. ', 'frozen.jpg', 2, 5),
(8, 'El Lobo de Wall Street', 'usa.png', 'Martin Scorsese', 2013, 'Leonardo DiCaprio, Jonah Hill, Margot Robbie, Kyle Chandler', 'Estados Unidos', 'COM', '179 min', 'A mediados de los 80, Belfort era un joven honrado que persegu&iacute;a el &eacute;xito, pero pronto en la agencia de valores aprendi&oacute; que lo m&aacute;s importante no era hacer ganar a sus clientes, sino ser ambicioso y ganar una buena comisi&oacute;n. ', 'lobo.jpg', 2, 8.5),
(9, 'Origen', 'usa.png', 'Christopher Nolan', 2010, 'Leonardo DiCaprio, Joseph Gordon-Levitt, Ellen Page, Marion Cotillard', 'Estados Unidos', 'ACC', '148 min', 'Dom Cobb es un experto en el arte de apropiarse, cuando la gente duerme, de los secretos del subconsciente ajeno. La rara habilidad de Cobb le ha convertido en un hombre muy cotizado en el mundo del espionaje, pero tambi&eacute;n lo ha condenado a ser un fugitivo y, por consiguiente, a renunciar a llevar una vida normal. ', 'origen.jpg', 2, 5.5),
(10, 'Los Vengadores', 'usa.png', 'Josh Whedon', 2012, 'Robert Downey Jr., Chris Evans, Mark Ruffalo, Chris Hemsworth, Scarlett Johansson', 'Estados Unidos', 'AVE', '135 min', 'Cuando un enemigo inesperado surge como una gran amenaza para la seguridad mundial, Nick Fury, director de la Agencia SHIELD, decide reclutar a un equipo para salvar al mundo de un desastre casi seguro.', 'vengadores.jpg', 2, 5.5),
(11, 'Dallas Buyers Club', 'usa.png', 'Jean-Marc Vallee', 2013, 'Matthew McConaughey, Jared Leto,  Jennifer Garner', 'Estados Unidos', 'DRA', '117 min', 'Basada en la vida real de Ron Woodroof, un cowboy de rodeo texano, drogadicto y mujeriego, al que en 1986 le diagnosticaron SIDA y le pronosticaron un mes de vida. Empez&oacute; entonces a tomar AZT, el &uacute;nico medicamento disponible en aquella &eacute;poca para luchar contra tan terrible enfermedad.', 'dallas.jpg', 2, 3.5),
(12, 'Collateral', 'usa.png', 'Michael Mann', 2004, 'Tom Cruise, Jamie Foxx,  Jada Pinkett Smith, Mark Ruffalo', 'Estados Unidos', 'THR', '120 min', 'Max lleva mucho tiempo detr&aacute;s del volante de su taxi y est&aacute; curado de espantos. Pero una noche, en Los &Aacute;ngeles, se ve obligado a llevar como pasajero a un asesino a sueldo que est&aacute; cumpliendo un encargo. ', 'collateral.jpg', 3, 5.3),
(13, 'Big Fish', 'usa.png', 'Tim Burton', 2003, 'Ewan McGregor, Albert Finney,  Billy Crudup, Jessica Lange', 'Estados Unidos', 'FAN', '126 min', 'William Bloom no tiene muy buena relaci&oacute;n con su padre, pero tras enterarse de que padece una enfermedad terminal, regresa a su hogar para estar a su lado en sus &uacute;ltimos momentos. William se ver&aacute; obligado a escucharlo mientras cuenta las interminables historias de su juventud, aunque para ello tendr&aacute; que separar claramente realidad y fantas&iacute;a. ', 'big.jpg', 1, 9),
(14, 'El Diario de Noa', 'usa.png', 'Nick Cassavetes', 2004, 'Ryan Gosling, Rachel McAdams,  James Garner, Sam Shepard', 'Estados Unidos', 'ROM', '124 min', 'En una residencia de ancianos, un hombre lee a una mujer una historia de amor escrita en su viejo cuaderno de notas. Es la historia de Noah Calhoun y Allie Nelson, dos j&oacute;venes adolescentes que, a pesar de vivir en dos ambientes sociales muy diferentes, se enamoraron profundamente. ', 'noa.jpg', 1, 6),
(15, 'El Dorado', 'usa.png', 'Howard Hawks', 1966, 'John Wayne, Robert Mitchum, James Caan, Charlene Holt, Paul Fix', 'Estados Unidos', 'WES', '126 min', 'Bart Jason quiere contratar a Cole Thornton para que trabaje a su servicio, pero este rechaza la oferta, porque significar&iacute;a tener que enfrentarse con un antiguo amigo. Poco despu&eacute;s se entera de que el mejor pistolero de la ciudad ha aceptado el trabajo que el rechaz&oacute;.', 'dorado.jpg', 1, 6),
(16, 'Apocalypse Now', 'usa.png', 'Francis Ford Coppola', 1979, 'Martin Sheen, Marlon Brando,  Robert Duvall, Frederic Forrest, Laurence Fishburne', 'Estados Unidos', 'BEL', '153 min', 'El Capit&aacute;n Willard es un oficial de los servicios de inteligencia del ej&eacute;rcito estadounidense al que se le ha encomendado en Camboya la peligrosa misi&oacute;n de eliminar a Kurtz, un coronel renegado que se ha vuelto loco. ', 'now.jpg', 2, 8.5),
(17, 'Blade Runner', 'usa.png', 'Ridley Scott', 1982, 'Harrison Ford, Rutger Hauer, Sean Young, Daryl Hannah, Edward James Olmos', 'Estados Unidos', 'FIC', '112 min', 'A principios del siglo XXI, la poderosa Tyrell Corporation cre&oacute;, gracias a los avances de la ingenier&iacute;a gen&eacute;tica, un robot llamado Nexus 6, un ser virtualmente id&eacute;ntico al hombre pero superior a &eacute;l en fuerza y agilidad, al que se di&oacute; el nombre de Replicante.', 'blade.jpg', 1, 8),
(18, 'Insidious', 'usa.png', 'James Wan', 2010, 'Rose Byrne, Patrick Wilson, Ty Simpkins, Barbara Hershey', 'Estados Unidos', 'TER', '102 min', 'Josh, su esposa Renai y sus tres hijos acaban de mudarse a una vieja casa. Pero, tras un desgraciado accidente, uno de los hijos entra en coma y, al mismo tiempo, empiezan a producirse en la casa una serie de raros fenomenos que aterrorizan a la familia. ', 'insidious.jpg', 1, 7),
(19, 'Toy Story', 'usa.png', 'John Lasseter', 1995, 'Animacion', 'Estados Unidos', 'ANI', '80 min', 'Los juguetes de Andy temen que haya llegado su hora y que un nuevo juguete les sustituya en el coraz&oacute;n de su amo. Woody, un vaquero que ha sido hasta ahora el juguete favorito de Andy, trata de tranquilizarlos hasta que aparece Buzz Lightyear, un h&eacute;roe espacial dotado de todo tipo de avances tecnol&oacute;gicos. ', 'toystory.jpg', 1, 9),
(20, 'El Gran Lebowski', 'usa.png', 'Joel Coen', 1998, 'Jeff Bridges, John Goodman,  Julianne Moore, Steve Buscemi', 'Estados Unidos', 'COM', '117 min', 'El Nota, un vago que vive en Los &Aacute;ngeles, un d&iacute;a es confundido por un par de matones con el millonario Jeff Lebowski, con quien solo comparte apellido. Despu&eacute;s de que orinen en su alfombra, el Nota inicia la b&uacute;squeda de El Gran Lebowski. ', 'lebowski.jpg', 2, 5.5),
(21, 'Pulp Fiction', 'usa.png', 'Quentin Tarantino', 1994, 'John Travolta, Samuel L. Jackson, Uma Thurman, Bruce Willis, Harvey Keitel', 'Estados Unidos', 'ACC', '153 min', 'Jules y Vincent, dos asesinos a sueldo con muy pocas luces, trabajan para Marsellus Wallace. Cuando llega la hora de trabajar, ambos deben ponerse manos a la obra. Su misi&oacute;n: recuperar un misterioso malet&iacute;n. ', 'pulp.jpg', 1, 10),
(22, 'Piratas del Caribe', 'usa.png', 'Gore Verbinski', 2003, 'Johnny Depp, Geoffrey Rush,  Orlando Bloom, Keira Knightley', 'Estados Unidos', 'AVE', '143 min', 'Mar Caribe, siglo XVIII. El aventurero capit&aacute;n Jack Sparrow piratea por las aguas del Caribe, pero su andanzas terminan cuando su enemigo, el Capit&iacute;n Barbossa, despues de robarle su barco, el Perla Negra, ataca la ciudad de Port Royal y secuestra a Elizabeth Swann, la hija del Gobernador.', 'piratas.jpg', 2, 5.5),
(23, 'El Padrino', 'usa.png', 'Francis Ford Coppola', 1972, 'Marlon Brando, Al Pacino, James Caan, Robert Duvall, Diane Keaton', 'Estados Unidos', 'DRA', '175 min', 'Don Vito Corleone es el respetado y temido jefe de una de las cinco familias de la mafia de Nueva York. Cuando Corleone se niega a intervenir en el negocio de las drogas, el jefe de otra banda ordena su asesinato. Empieza entonces una violenta y cruenta guerra entre las familias mafiosas.', 'padrino.jpg', 1, 10),
(24, 'Cisne Negro', 'usa.png', 'Darren Aronofsky', 2010, 'Natalie Portman, Mila Kunis,  Vincent Cassel, Winona Ryder, Barbara Hershey', 'Estados Unidos', 'THR', '109 min', 'Nina, una brillante bailarina de ballet de Nueva York, vive completamente absorbida por la danza. La presi&oacute;n de su controladora madre, la rivalidad con su amiga Lily y las exigencias del severo director se ir&aacute;n incrementando a medida que se acerca el d&iacute;a del estreno.', 'swan.jpg', 1, 6),
(25, 'La Gran Belleza', 'italia.png', 'Paolo Sorrentino', 2013, 'Toni Servillo, Carlo Verdone, Sabrina Ferilli, Serena Grandi', 'Italia', 'DRA', '142 min', 'En Roma, durante el verano, nobles decadentes, arribistas, pol&iacute;ticos, criminales de altos vuelos, periodistas, actores, prelados, artistas e intelectuales tejen una trama de relaciones inconsistentes que se desarrollan en fastuosos palacios y villas.', 'belleza.jpg', 1, 6),
(26, 'Amelie', 'francia.png', 'Jean Pierre Jeunet', 2001, 'Audrey Tautou, Mathieu Kassovitz, Rufus, Lorella Cravotta', 'Francia', 'COM', '120 min', 'Amelie no es una chica como las dem&aacute;s. De repente, a los 22 a&ntilde;os, descubre su objetivo en la vida: arreglar la vida de la gente. A partir de entonces, inventa toda clase de estrategias para intervenir en los asuntos de los dem&aacute;s.', 'amelie.jpg', 2, 4),
(27, 'Casino Royale', 'england.png', 'Martin Campbell', 2006, 'Daniel Craig, Eva Green, Mads Mikkelsen, Jeffrey Wright', 'Reino Unido', 'ACC', '144 min', 'La primera misi&oacute;n del agente brit&aacute;nico James Bond como agente 007 lo lleva hasta Le Chiffre, banquero de los terroristas de todo el mundo. Para detenerlo y desmantelar la red terrorista, Bond debe derrotarlo en una arriesgada partida de p&oacute;quer en el Casino Royale.', 'casino.jpg', 2, 5),
(28, 'Celda 211', 'spain.png', 'Daniel Monz&oacute;n', 2009, 'Luis Tosar, Alberto Ammann, Antonio Resines, Carlos Bardem, Marta Etura', 'Espa&ntilde;a', 'THR', '110 min', 'El d&iacute;a en que Juan empieza a trabajar en su nuevo destino como funcionario de prisiones, se ve atrapado en un mot&iacute;n carcelario. Decide entonces hacerse pasar por un preso m&aacute;s para salvar su vida y para poner fin a la revuelta, encabezada por el temible Malamadre. Lo que ignora es que el destino le ha preparado una encerrona. ', 'celda.jpg', 1, 8),
(29, 'La Caza', 'dinamarca.png', 'Thomas Vinterberg', 2012, 'Mads Mikkelsen, Thomas Bo Larsen, Annika Wedderkopp, Alexandra Rapaport', 'Dinamarca', 'DRA', '111 min', 'Tras un divorcio dif&iacute;cil, Lucas, un hombre de 40 a&ntilde;os, ha encontrado una nueva novia, un nuevo trabajo y trata de reconstruir su relaci&oacute;n con su hijo. Pero algo empieza a ir mal: una mentira insignificante que se extiende sembrando el estupor y la desconfianza en una peque&ntilde;a poblaci&oacute;n. Lucas se ve obligado a luchar por salvar su vida y su dignidad. ', 'caza.jpg', 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `idUsuario` int(3) NOT NULL AUTO_INCREMENT,
  `nick` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `pass` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `pelisVotadas` int(3) NOT NULL,
  `criticasTotales` int(3) NOT NULL,
  `votosMediaTotal` float NOT NULL,
  `criticasPositivas` int(3) NOT NULL,
  `criticasNeutras` int(3) NOT NULL,
  `criticasNegativas` int(3) NOT NULL,
  `peliculaMenorPuntuada` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `peliculaMayorPuntuada` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `deseadasTotal` int(3) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `nick`, `pass`, `pelisVotadas`, `criticasTotales`, `votosMediaTotal`, `criticasPositivas`, `criticasNeutras`, `criticasNegativas`, `peliculaMenorPuntuada`, `peliculaMayorPuntuada`, `deseadasTotal`) VALUES
(1, 'Alvaro', 'abc123', 17, 6, 6.4, 3, 1, 2, 'Oblivion', 'Expediente Warren', 4),
(2, 'Julia', 'def456', 14, 1, 6.8, 0, 1, 0, 'El Hobbit', 'Pulp Fiction', 0),
(3, 'Marcos', 'soc34', 8, 3, 5.9, 2, 1, 0, 'Django Desencadenado', 'El Lobo de Wall Street', 1),
(4, 'Dani', 'tos677', 3, 3, 6, 2, 0, 1, 'La Caza', 'Origen', 1),
(5, 'Alberto', 'tet001', 1, 2, 5, 1, 1, 0, 'Amelie', 'Amelie', 0),
(6, 'Sandra', 'sol996', 4, 2, 5, 1, 0, 1, 'Collateral', 'Apocalypse Now', 0),
(9, 'Javi', 'lol531', 2, 2, 5.5, 1, 0, 1, 'Oblivion', 'Piratas del Caribe', 0),
(10, 'Rober', 'hii483', 2, 2, 4.5, 1, 0, 1, 'El Gran Lebowski', 'El Dorado', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valoracion`
--

CREATE TABLE IF NOT EXISTS `valoracion` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(3) DEFAULT NULL,
  `idPelicula` int(3) DEFAULT NULL,
  `puntos` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idUsuario` (`idUsuario`,`idPelicula`),
  KEY `idPelicula` (`idPelicula`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=86 ;

--
-- Volcado de datos para la tabla `valoracion`
--

INSERT INTO `valoracion` (`id`, `idUsuario`, `idPelicula`, `puntos`) VALUES
(3, 1, 1, 7),
(28, 3, 3, 2),
(30, 1, 11, 3),
(36, 3, 12, 9),
(37, 3, 8, 9),
(39, 3, 1, 6),
(40, 3, 7, 3),
(41, 3, 11, 4),
(42, 1, 12, 4),
(43, 2, 6, 9),
(44, 2, 4, 8),
(45, 2, 5, 5),
(46, 2, 3, 7),
(47, 2, 10, 4),
(48, 2, 2, 5),
(49, 2, 1, 3),
(50, 1, 8, 8),
(52, 1, 9, 3),
(53, 1, 5, 1),
(54, 1, 3, 8),
(55, 1, 7, 7),
(56, 1, 10, 7),
(57, 1, 6, 10),
(58, 1, 4, 10),
(59, 6, 3, 5),
(60, 6, 12, 3),
(61, 1, 16, 9),
(62, 1, 17, 8),
(63, 10, 15, 6),
(64, 1, 24, 6),
(65, 1, 13, 9),
(66, 2, 14, 6),
(67, 2, 18, 7),
(68, 2, 19, 9),
(69, 2, 20, 8),
(70, 2, 21, 10),
(71, 2, 22, 4),
(72, 2, 23, 10),
(73, 9, 5, 4),
(74, 4, 2, 7),
(75, 4, 9, 8),
(76, 4, 29, 3),
(77, 3, 28, 8),
(78, 3, 25, 6),
(79, 5, 26, 5),
(80, 6, 27, 4),
(81, 6, 16, 8),
(82, 9, 22, 7),
(83, 10, 20, 3),
(84, 1, 26, 3),
(85, 1, 27, 6);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `critica`
--
ALTER TABLE `critica`
  ADD CONSTRAINT `fkCriticaPelicula` FOREIGN KEY (`idPelicula`) REFERENCES `peliculas` (`idPelicula`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkCriticaUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `deseadas`
--
ALTER TABLE `deseadas`
  ADD CONSTRAINT `fkDeseadasPelicula` FOREIGN KEY (`idPelicula`) REFERENCES `peliculas` (`idPelicula`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkDeseadasUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `valoracion`
--
ALTER TABLE `valoracion`
  ADD CONSTRAINT `fkValoracionPelicula` FOREIGN KEY (`idPelicula`) REFERENCES `peliculas` (`idPelicula`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkValoracionUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
