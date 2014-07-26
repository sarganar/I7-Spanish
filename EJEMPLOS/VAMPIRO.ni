"-Memorias de reXXe-" (in spanish)

[Esta es la versión en Inform 7 de "Memorias de reXXe", también
 conocido como "Vampiro". Este código fuente forma parte del
 "Proyecto Vampiro", del cual puedes encontrar más información en
  http://www.caad.es/informate/vampiro/

 Para procesar este fichero necesitarás Inform 7 y la librería INFSP de la
 cual puedes encontrar más información en
http://wiki.caad.es/Infsp7 ]

Part 0 - Library Card, Includes y Uses

 [ Datos bibliográficos ]
 The story headline is "(c) 1998 Jaume Alcanzo Castellarnau adaptada a Inform 7 por Sarganar".
 The story genre is "Terror".
 The release number is 2.
 The story creation year is 2007.
 The story description is "Version para Inform 7 de Memorias de reXXe, también conocido como 'Vampiro'. Esta es la versión programada en Inform 7 del juego 'Vampiro' original de Aventuras ALCAZO. Para más información teclea HISTORIA en el juego. Despiertas aturdido. Después de unos segundos te incorporas en el frío suelo de piedra y ves que estás en un castillo. ¡Ahora recuerdas! Eres reXXe y tu misión es la de matar al vampiro. TIENES que matar al vampiro que vive en la parte superior del castillo...".

  Include Exit Descriptions Sp by Matthew Fletcher.

  Use full-length room descriptions and no scoring.
[  Release along with the source text, [cover art,] a solution and a website.]


Part 1 - Inicializaciones

 The carrying capacity of the player is 5.
 
 The player wear un traje barato.
    The description of the traje barato is "Es un traje barato comprado en las rebajas."
    Report taking off the traje barato: say "Cuando el vampiro me vea desnudo, flipa."

[ Objetos flotantes (aparecen en varios lugares)]
La pared is backdrop. It is everywhere.
   The description is "Las paredes son muy gruesas, húmedas y frías al contacto."
   Understand "paredes" as pared.
   Rule for deciding whether all includes scenery: it does not. [para que no entren en 'coge todo']

[ Redefiniremos algunos de los mensajes estándares de la librería.
   En concreto queremos
  - que el prompt sea >> en vez de >
  - que si el jugador no escribe nada, el juego no responda nada (en vez
    de responder "¿Perdón?")
  - que el comando Puntuacion no de puntuación.]
 When play begins: now the command prompt is ">>";
 
 Parser error internal rule response (X) is "".

 Check requesting the score: say "No hay puntuación. El único objetivo es acabar con el vampiro." instead.
 Check examining a direction (called target):
	if the target is up, say "El techo está muy alto y es de piedras." instead;
	if the target is down, say "El suelo es de piedras y está muy frío." instead.

[  En la variable 'elementos poseidos' almacenamos cuántos elementos "básicos" lleva el jugador. Estos son: el crucifijo, la estaca, el martillo y la ristra de ajos. Si este número no es 4 no se permite al jugador que abra el ataud (y termine el juego).
  Este número tiene que cambiar cada vez que el jugador tome o deje uno
  de los elementos básicos.]
 The elementos poseidos is a number that varies. [por defecto arranca valiendo 0]

[  Nueva clase: Elemento. 
  Los objetos que servirán para matar al vampiro serán de la clase
  "Elemento" para tomar nota de cuándo se cogen y cuándo se dejan.]
The element is a kind of thing. [capa english]
Element translates into Spanish as elemento.[capa spanish, para los plurales, etc]

 Report taking an elemento:
	increment the elementos poseidos;
	say "El aire vibra un momento, densa y misteriosamente".
 Report dropping an elemento: decrement the elementos poseidos .

[ Inicio del juego - El texto que aparece primero]
 When play begins, say "Esta es la versión programada en Inform del juego 'Vampiro' original de Aventuras ALCAZO. Para más información teclea HISTORIA en el juego. Muchas gracias por jugar.[paragraph break]
Despiertas aturdido. Después de unos segundos te incorporas en el frío suelo de piedra y ves que estás en un castillo. ¡Ahora recuerdas  Eres reXXe y tu misión es la de matar al vampiro. TIENES que matar al vampiro que vive en la parte superior del castillo...".


Part 2 - El mundo del juego

Section 1 - El Vestíbulo

[Por defecto, el juego empieza en la primera localidad que se define; o sea el Vestibulo]
 The Vestibulo is a room. "Estás en el vestíbulo del castillo. El ambiente es muy húmedo y frío. Estás en un pasillo que se extiende hacia el norte. Al sur queda la puerta de entrada al castillo."

 Instead of exiting when the player is in the vestibulo, say "¡Tu misión es aquí dentro!".

La puerta is a scenery. "Es muy grande y está cerrada. No la vas a poder abrir."
	Understand "salida" and "entrada" as puerta.
	Instead of opening the puerta, say "¡Te he dicho que no la puedes abrir, melón!".

 The PasilloDesdeVestibulo is here. "Es el pasillo principal, se extiende hacia el norte."
	The printed name is "pasillo". It is scenery.
	Understand "pasillo" as PasilloDesdeVestibulo.


El cielo is a backdrop. The description is "Un cielo alto y estrellado."
The RegionJuego is a region.
Pasillo, Jardin, Biblioteca, Vestibulo, Escaleras are in RegionJuego.
El cielo is in RegionJuego.

Before examining the cielo when the actor is in Vestibulo:
	say "El techo no me deja verlo." instead;
	now the cielo is nowhere.

Before jumping when the actor is in Vestibulo:
	move cielo to RegionJuego.
	
Section 2 - El Pasillo

 El Pasillo is north of Vestibulo. "Te encuentras en medio del pasillo principal
 de este piso. Al oeste está la cocina y al este la biblioteca. El pasillo sigue hacia el norte."


Section 3 - La Biblioteca

La Biblioteca is east of Pasillo."Te hallas en la biblioteca del castillo.
 Obviamente esta llena de libros interesantes, pero desgraciadamente no
 tienes tiempo para leerlos."

 El crucifijo is here. The description is "Es un pequeño crucifijo plateado.
	 Es uno de los cuatro elementos que nos servirán para derrotar al vampiro."
	The printed name is "crucifijo plateado".
	Understand "plateado", "plateada" and "de plata" as "[plateada]".
	Understand "cruz" or "cruz [plateada]" and "crucifijo [plateada]" as crucifijo.

 La palanca is here. The description is "Es una palanca de acero toledano.
	Sirve para forzar cosas."
	Understand "acero" or "toledano" as "[acero]".
	Understand "palanca de [acero]" or "[acero]" as palanca.

 Some libros (m) are here. The description is "Montones de libros, pero no tengo
	tiempo para leer ahora."
	They are scenery.
	Understand "libro" as libros.
	Instead of taking libros, say "No quiero cargar con los libros, no hay tiempo
	  para leerlos."


Section 4 - La Cocina

 La Cocina is west of Pasillo. "Estás en la cocina del castillo. Esto está lleno
 de cacerolas y de cacharros para cocinar. Hay un horno, un fregadero y un
 armario pequeño." 

 El horno is here. The description is "Un simple horno, no tiene ninguna
	importancia." It is scenery.
	Instead of opening the horno, say "Está cerrado. (Este vampiro no come precisamente 
	  cookies)."

 Some cacharros (m) are here. The description is "Simples cacerolas y cacharros de cocina."
	They are scenery.
	Understand "cacharro" as cacharros.

 El cuchillo is here. The description is "Un simple cuchillo de cocina. Pincha."

[  Vamos a dejar que el fregadero sea un recipiente. De este modo el
  jugador podrá meter y sacar cosas en él (aunque en realidad esto no
  sirve para nada en el juego) .
  Como descripción del fregadero queremos que muestre sus
  contenidos. La forma más sencilla es generar la acción Searching, ya
  que esta acción en el caso de recipientes listará lo que contienen.
  Mientras jugamos, el comando 'actions' nos dirá el nombre interno de la acción.]
  El fregadero is here. It is a container and scenery.
	 The description is "Es un fregadero de piedra." 
	 After examining the fregadero, try searching the noun.


[  El armario también es un recipiente, pero estará cerrado con
  llave. Además queremos que al examinar el armario por primera vez
  después de abrirlo caiga una ristra de ajos de dentro. Esto exigirá
  que la descripción sea una rutina.
 
  Incialmente, los ajos estarán en el 'Limbo' (off-stage)por lo que podemos preguntar
  por ello para saber si "los ajos ya han sido encontrados"
 
  Además, haremos que la acción Unlocking automáticamente abra el
  armario. De lo contrario el jugador tendría que poner ABRIR ARMARIO
  CON LLAVECITA para quitar el cerrojo y seguidamente ABRIR ARMARIO
  para abrirlo. Esta repetición es antinatural en español]
 El armario is here. It is a container and scenery.
	It is openable, closed, lockable and locked. 

Instead of examining the armario:
	if armario is locked:
		say "Está cerrado con llave.";
		stop;
	if ajos is off-stage:
		say "Al examinarlo se te cae al suelo una ristra de ajos que estaba en su interior.";
		move ajos to Cocina;
	otherwise:
		try searching the armario;

	
	After unlocking armario with llavecita, try opening armario.
[ Especificamos qué objeto sirve para abrirlo.]
 La llavecita unlocks the armario.


Section 5 - La Escalera

 Las Escaleras is north of Pasillo. The description is "Te hallas en el final del pasillo. Delante de ti ves unas escaleras que suben y otras que bajan. Al oeste está el dormitorio y al este la sala de estar." [It is plural-named.] The printed name is "las escaleras".

 El escalon (f) is here. The description is "Unas polvorientas escaleras. Unas suben y otras bajan." The printed name is "escalera".  It is fixed in place. Understand "escalera/escaleras" as escalon.

Section 6 - El Dormitorio

 El Dormitorio is west of Escaleras."Estás en un dormitorio no muy grande ni tampoco muy pequeño. Es bastante austero. Sólo hay una cama y un armario."

[ Este armario no tiene nada. Pero pueden meterse cosas dentro (aunque
  no sirva para nada)]
 El armario_dormitorio is here. The printed name is "armario".
	It is scenery, container, openable and open.
	Understand "armario" as armario_dormitorio.

[ La cama tampoco tiene nada de especial. El jugador ni siquiera puede
  echarse en ella (pues no tiene el atributo entrable)]
 La cama is here. The description is "Está cubierta de sábanas."
	It is supporter and scenery.

[ Las sábanas harán aparecer la llavecita si se examinan. Usaremos el
  adjetivo "off-stage" (estar en el limbo) para saber si la llavecita ya ha sido
  encontrada.]
 Las sabanas are here. They are scenery.

Instead of examining the sabanas:
	if llavecita is off-stage:
		move llavecita to the cama;
		say "Entre ellas encuentras una pequeña llavecita.";
	otherwise:
		say "Sábanas corrientes y molientes.";

Instead of looking under sabanas, try examining the sabanas.[mira bajo las sabanas]
Understand "mira entre [something]" as examining. [extendiendo la gramatica]

Section 7 - La Sala de Estar

 La Sala is east of Escaleras."Es la sala más acogedora de todo el castillo. En la chimenea los últimos restos de algún fuego chisporrotean alegremente. Hay una mesa grande con una silla al lado. De la pared cuelgan bastantes trofeos de caza y adornos varios."

[  Los dos siguiente objetos realmente no pintan nada en el juego. De
  hecho no se puede hacer nada con ellos por ser de tipo "escenario"
  salvo examinarlos.]

 Some trofeos (m) are here. The description is "Insignificantes trofeos."
	They are scenery.

 Some adornos (m) are here. The description is "Adornan." They are scenery.

[  La chimenea capturará la acción de Searching para convertirla en la
  acción Examining Restos. Además, como una pequeña diversión,
  capturamos la acción Entering (Meterse) por si el jugador intenta entrar en la
  chimenea. Observar que realmente no hacía falta capturar esta acción
  pues al no ser el objeto "entrable" la librería impediría de todas
  formas que el jugador se metiera. Lo que ocurriría es que el mensaje
  de la librería sería "No es algo donde puedas
  meterte". Evidentemente este no parece un buen mensaje para una
  chimenea y por esa razón capturamos esta acción, para ofrecer un
  mensaje mejor.]

 La chimenea is here. The description is "Es una chimenea hecha de ladrillos y muy elegante." It is scenery. 
	Understand "ladrillo/ladrillos" as chimenea.
	Instead of entering chimenea, say "No he venido aquí a hacer de Santa Claus."
	Instead of searching chimenea, try examining restos.

[  Los restos del fuego revelan un madero si se examinan. El truco es
  el de siempre: el adjetivo off-stage indica si el madero ya ha sido
  encontrado o no.]
 Some restos (m) are here. They are scenery.
	Understand "fuego" as restos.
Instead of examining the restos:
	if madero is off-stage:
		move madero to the location;
		say "Entre los restos del fuego encuentras un trozo de madera.";
	otherwise:
		say "Son los restos de algún fuego reciente.".

[  La mesa es otro objeto inútil.]
 La mesa is here. The description is "Una mesa de caoba, bastante grande."
	It is supporter and scenery.

[  La silla originalmente era otro objeto inútil, pero aqui le hemos
  añadido la posibilidad de sentarse en ella. Para ello basta capturar
  la acción Entering (Meterse). No es necesario hacerla "entrable" ya que en
  realidad el jugador no va a entrar nunca en ella (sólo el mensaje
  impreso dice que ha entrado, pero lo cierto es que la librería nunca
  ha movido al jugador al interior de la silla).]
 La silla is here. The description is "Una cómoda silla."
	It is scenery.
	Instead of entering silla, say "Te sientas en la silla, y después del breve descanso te levantas otra vez.";


Section 8 - El Sótano

El Sotano is down of Escaleras."En este pequeño sótano hace mucho calor, sientes una sensación de recogimiento. Está todo muy sucio. Hay un
barril aquí, también hay unas escaleras que suben." The printed name is "Sótano".

 Los escalones_sotano (f) are here.
	The description is "Estos escalones conducen al piso superior."
	The printed name is "escalera". It is scenery.
	Understand "escalon", "escalones", "escalera" and "escaleras" as escalones_sotano.

[  El barril es un objeto que no puede abrirse, a menos que se use la
  palanca. Por tanto debemos capturar las acciones Opening ( Abrir - que aparece
  cuando el jugador pone "ABRE BARRIL") y la acción Unlocking (QuitarCerrojo - que
  se genera cuando el jugador pone "ABRE BARRIL CON LOQUESEA"). En este
  segundo caso abrá que ver si LOQUESEA es la palanca.]

El barril is here. It is a container and scenery.
It is openable, closed, lockable and locked.
Instead of opening barril, say "Intentas abrirlo, pero no tienes la suficiente fuerza."
Instead unlocking barril with something (called herramienta):
	if barril is open:
		say "Ya está abierto." instead;
	if the herramienta is palanca:
		say "-¡Clack - Haciendo palanca logras abrir el barril.";
		now barril is open;
	otherwise:
		say "Intentas abrirlo, pero no tienes la suficiente fuerza.".


[ Dentro del barril está el martillo]
 El martillo is an elemento. It is inside the barril.
	The description is "Un martillo grande. Es uno de los elementos que me permitirán acabar con el vampiro."

Section 9 - Rellano Superior

El Rellano is up of Escaleras."Estás en el piso superior del castillo. Aquí hace aún más frío que abajo. Detrás de tí están las escaleras que bajan y hacia el oeste está la habitación del vampiro."

 Los escalones_rellano (f) is here.
	The description is "Estos escalones conducen al piso inferior."
	The printed name is "escalera". It is scenery.
	Understand "escalon", "escalones", "escalera" and "escaleras" as escalones_rellano.


Section 10 - La Habitación del Vampiro

El Vampiro is west of Rellano. "Estás en una habitación desnuda. Unicamente hay un altar en el centro. Encima del altar puedes ver un ataud."

[  Hay un altar. Tal vez el jugador intente subirse o sentarse en
  él. El mensaje estándar diciendo que no parece algo a donde pueda
  subirse parece inapropiado, por tanto capturamos la acción meterse
  para dar un mensaje mejor.]
 El altar is here.
	The description is "Es un altar de dura piedra. Encima de éste está el ataud."
	It is scenery.
	Instead of entering altar, say "No es necesario."

[  El ataud es el final del juego. Si el jugador intenta abrirlo
  debemos comprobar que lleva los cuatro elementos básicos y en ese
  caso ha ganado. Si no los lleva no le dejamos abrir el ataud.]
 El ataud is here. The description is "Una sencilla caja de pino."
	It is scenery.
Instead of opening the ataud:
	if elementos poseidos is less than 4:
		say "Necesito cuatro cosas antes de poner fin a la 'vida' del vampiro. A saber: un crucifijo, una ristra de ajos, una estaca afilada y un martillo." instead;
	otherwise:
		say "Abres el ataud. Dentro contemplas la horrible cara del vampiro. Protegido por los ajos y el crucifijo empiezas tu horrible tarea. Le clavas la estaca en el pecho y de un terrible golpe de martillo la hundes en lo más profundo de su ser. Con un grito de agonía se deshace en polvo y tú acabas tu misión aquí.[paragraph break]Por ahora...[paragraph break]";
	  end the story. [* FIN DEL JUEGO]


Section 11 - Limbo

[  La estaca inicialmente no está en el juego. Aparece sólo al tratar
  de afilar el madero usando el cuchillo. Si un objeto no se sitúa en ninguna localidad,  I7 los pone incialmente en el limbo.
  Capturaremos la acción Sharpening (Afilar) para que no salga el mensaje estándar de que no puede ser afilada.]

 La estaca afilada is an elemento.
	The description is "Un cacho de madera rectangular y alargado, uno de sus extremos 
	esta afilado cuidadosamente."
	Understand "madera" as estaca.
	Instead of sharpening the estaca with something, say "Ya está bastante afilada." 

[  El trozo de madera inicialmente no está en el juego. Aparece sólo al
  examinar los restos. 
  Este objeto es afilable, lo que quiere decir que capturaremos la
  acción Sharpening  (Afilar), comprobaremos que intenta afilarse con un cuchillo y si es así haremos desaparecer al madero apareciendo la estaca en su lugar.]

 El madero is an elemento.
	The description is "Un trozo de madera, rectangular y alargado."
	The printed name is "trozo de madera".
	Understand "trozo", "trozo de madera" and "madera" as madero.

	Instead of sharpening the madero with cuchillo:
	  now the madero is nowhere; [directo al limbo]
	  move estaca to player;	  
	  increment the elementos poseidos;
	  say "Afilas la madera con el cuchillo ¡y obtienes una estaca!"

[  Los ajos no están en ningún lugar, hasta que aparecen.
  Así que inicialmente no se situan en ninguna localidad, por lo que I7 los pone en el limbo. 
  Interceptaremos las acciones de oler y comer los ajos, para mostrar un mensaje simpático.]

 Unas ajos are elements. The printed name is "ristra de ajos".
	Understand "ajo" as ajos.
	Instead of eating ajos, say "Ni hablar, me daría halitosis."
	Instead of smelling ajos, say "Puagh."

 Un hilo are elements.
 
[  La llavecita que abre el armario]
 La llavecita is a thing.
	The description is "Esta pequeña llavecita tiene la pinta de abrir un armario o algo así."
	Understand "llave" and "llave/llavecita pequena" as llavecita.


Section 12 - Gramática

 [ Accion AFILAR (sharpening)]
 Understand "afila [something] con [something preferably held]" as sharpening it with.  
 Sharpening it with is an action applying to one thing and one carried thing. 
 Check sharpening it with: if the second noun is not a cuchillo,
	say "[The second noun] no sirve para afilar." instead. 
 Report sharpening it with: say "No creo que sirva de nada afilar [the noun]." [Accion por 
   defecto]

[  Mensaje a mostrar ante HISTORIA]
 Understand "historia" as a mistake ("Este juego es original de Aventuras Alcazo y el 
	copyright pertenece a Jaume Alcazo Castellarnau quien ha cedido los 
	fuentes con fines educativos. (Teclea ALCAZO para saber más 
	del juego original). La versión que estás jugando ha sido 
	reprogramada usando el lenguaje Inform 7 a partir de la version para InformATE
	que hizo Zak del original, en un proyecto ideado por JLD consistente en 
	implementar el mismo juego usando diferentes lenguajes, para 
	poder comparar unos con otros. En todo caso, la idea del juego
	y su desarrollo sigue siendo (c) de Jaume Alcazo
	Castellarnau.[paragraph break]Aunque el juego es esencialmente el mismo,
	el aspecto de la pantalla al jugar no intenta parecerse al original de Alcazo,
	sino que tiene 
		el típico aspecto de los juegos programados en Inform.[line break]
	Version I7 testeada por Baltasar.").

[  Mensaje a mostrar ante el comando ALCAZO]
 Understand "alcazo" as a mistake("Primera aventura 'seria' de Aventuras Alcazo. Guión, 
	textos y programación de Jaime Alcazo, pruebas Jaime Alcazo, 
	pruebas adicionales Iván Alcazo.[line break]Fue necesaria una mañana 
	de estrujamiento neuronal de Jaime Alcazo para obtener el 
	argumento (ya ves). Fue necesaria una tarde para programarla 
	y ha sido revisada en algunas ocasiones en días posteriores 
	a los citados.[line break]Versión 1.75.[paragraph break]Teclea AYUDA para 
	obtener 	la solución de la aventura.[paragraph break]Gracias por jugar.").

[  Mensaje a mostrar ante el comando AYUDA.]
 Understand "ayuda" or "help" as a mistake ("Ja, ¡Te lo has creído  :-))) No; piensa un 
	poco, amigo, es la aventura más sencilla del mundo, si no puedes con esto, no 
	podrás con ninguna.").