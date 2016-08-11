"La isla misteriosa" by Grendelkhan (in spanish)

Part 1 - Introducción

Section 1 - Extensiones

Include Basic Screen Effects Sp by Emily Short.
Include Basic Help Menu SP by Emily Short.

[Datos Bibligráficos]
The story title is "La isla misteriosa".
The story author is "Grendelkhan".
The story headline is "'Una aventura de impredecibles consecuencias'".
The story genre is "Mystery".
The release number is 1.
The story creation year is 2011.
The story description is "El gran conquistador Hernán Cortés se encuentra a merced del peligro en una tierra exótica buscando un tesoro perdido... ¿logrará encontrarlo? ¡Solo depende de tu pericia en esta aventura singular!".

Release along with a website and an interpreter.



Section 2 - Mensaje inicial y ayuda extendida
  
When play begins:
clear the screen;
display the boxed quotation
"La isla.
por Grendelkhan";
show the current quotation;
wait for any key;
say "Teclea 'AYUDA' durante el juego para recibir instrucciones.[paragraph break]Bienvenido a...";
choose row 1 in Table of Basic Help Options;
	 now description entry is "[italic type]El gran conquistador Hernán Cortés se encuentra a merced del peligro en una tierra exótica buscando un tesoro perdido... ¿logrará encontrarlo? ¡Solo depende de tu pericia en esta aventura singular![paragraph break][roman type]Este es un juego que sirve como ejemplo para el tutorial de Inform 7 de Grendelkhan.".

Table of Basic Help Options (continued)
title	subtable	description
"Contactar con el autor"	--	"Si tienes dificultades con [story title], contacta conmigo a través de mi e-mail: blabla@blabla.com o entra en los foros del portal CAAD: http://foro.caad.es/. "
"Pistas"	--	"A continuación van unas cuantas pistas para [story title].[paragraph break][bold type]1. La serpiente odia las piedras.[line break]2. ¿Has probado a nadar en el mar?[line break]3. El mendigo tiene sed.[line break]4. ¡Piensa un poco y lo conseguirás![roman type]".



Part 2 - Escenario

Section 1 - El bosque

Bosque is a room. The description is "Te encuentras en un bosque de enormes árboles.".
Some arboles are in the Bosque. They are scenery. The printed name of arboles is "árboles". The description is "Los árboles son tan altos que apenas dejan pasar la luz del sol.".
[Instead of taking the arboles, say "¡No puedes cargar con todos los árboles del bosque! Si quieres madera, tendrás que conseguirla de otra forma.".]



Section 2 - La playa

Playa is south of Bosque. The description is "Estás en una larga playa desde la que se divisa una lejana isla. Puedes ver muchas palmeras por aquí.".

Some palmeras (f) are in the Playa. They are scenery. The description is "La playa está repleta de palmeras, que se inclinan hacia el mar a causa del viento.".
Instead of taking the palmeras, say "¡No puedes cargar con todas las palmeras de la playa! Si quieres madera, vete al bosque.".

El cofre is in the Playa. The description is "[if open]El pequeño cofre está abierto. Su interior es impermeable y por lo tanto el agua del mar no ha estropeado su contenido...[otherwise]Un pequeño cofre misterioso, bellamente adornado, aunque algo deteriorado por las inclemencias del mar."
It is container, openable, lockable and locked. 

Section 2 - El mapa del tesoro

El mapa del tesoro is carried by player. The mapa del tesoro can be seco or mojado. The mapa del tesoro is seco. The description is "¡Parece un mapa auténtico! Tal vez si logro descifrarlo encontraré un tesoro... ¡y seré rico! ¡Ja!".


Before nadaring en the costa:
	if the mapa is carried:
		now the description of the mapa del tesoro is "¡Maldición! El agua lo ha destrozado... ¡No debí haber nadado con el mapa en la mano! Tendría que haberlo protegido... ¡ahora no sirve de nada!";
		now the mapa is mojado.

Before nadaring en the mar:
	if the mapa is carried:
		now the description of the mapa del tesoro is "¡Maldición! El agua lo ha destrozado... ¡No debí haber nadado con el mapa en la mano! Tendría que haberlo protegido... ¡ahora no sirve de nada!";
		now the mapa is mojado.


La costa is scenery in Playa. The description is "Estas aguas son tan bellas como peligrosas, piensas mientras observas la diminuta isla, allá a lo lejos.". Understand "isla", "mar", "playa", "aguas", "agua", "linea" and "oceano" as the costa. 


Instead of nadaring en the costa:
	say "Decidido y sin temor te adentras en el mar, nadando hacia la lejana isla...[paragraph break]";
	wait for any key;
	if a random chance of 1 in 5 succeeds:
		say "Pero de repente observas una amenazadora aleta de tiburón que se aproxima hacia tí... ¡intentas huir con todas tus fuerzas! Pero...[paragraph break]";
		end the story saying "Mueres en las fauces del tiburón.";
	otherwise:
		say "Finalmente, y tras un gran esfuerzo, llegas a la costa. Contemplas maravillado la paradisíaca isla...[paragraph break]";
		wait for any key;
		now the player is in Isla.


Instead of nadaring in Playa, try nadaring en the costa.

Instead of nadaring en the costa for the first time:
	say "Decidido y sin temor te adentras en el mar, nadando hacia la lejana isla...[paragraph break]";
	wait for any key;
	say "De repente, en mitad de la travesía, te das cuenta... ¡el mar está infestado de tiburones! Nadas todo lo rápido que puedes hasta llegar exhausto a la costa... ¡esta vez has tenido suerte![paragraph break]";
	wait for any key;
	now the player is in Isla.
	
Section 3 - La montaña

Montana is north of Bosque. The printed name of Montana is "Montaña". The description is "Te encuentras en una alta montaña con multitud de piedras. Desde aquí se divisa un bosque y una playa, allá a lo lejos.".

Some piedras (f) are in the Montana. They are scenery. The description is "Puedes ver numerosas piedras por aquí y por allá.". Understand "piedra" as the piedras.

The piedra (f) is nowhere. The description is "Una piedra con la que podrías hacer mucho daño.".

Instead of taking the piedras:
	move the piedra to player;
	say "Coges una piedra.".
	
Section 4 - La isla

The islas is a region. The Isla, the Isla2, the Isla3 and the Isla4 are in the islas.

The vegetacion is a backdrop in the islas. The description is "Multitud de árboles frutales y flores de vivos colores te sorprenden a tu paso, ¡es un auténtico paraiso!.". Understand "arboles", "plantas", "flores", "flor", "bosque" and "oceano" as the vegetacion.

The arena is a backdrop in the islas. The description is "La playa está cubierta de fina arena, que se te escurre entre los dedos.". 

Isla is a room. The printed name of Isla is "Costa de la isla". The description is "[if unvisited]Has llegado a una exótica isla en mitad de la inmensidad del mar. Te sorprende la singular belleza de estas costas, que se extienden de este a oeste hasta donde alcanza la vista.[else]La línea de la costa se extiende de este a oeste en esta paradisíaca isla, hasta donde alcanza la vista.".

Isla2 is west of Isla and east of Isla4. The printed name of Isla2 is "Costa de la isla". The description is "[if unvisited]Continúas explorando la isla. Te sorprende la singular belleza de estas costas, que se extienden de este a oesta hasta donde alcanza la vista.[else]La vegetación es más densa en esta parte de la isla y te obliga a meterte en el agua hasta casi la cintura. La línea de la costa continúa de este a oeste.".

Isla3 is west of Isla4 and east of Isla. The printed name of Isla3 is "Costa de la isla". The description is "[if unvisited]Sigues explorando la isla. Te sorprende la singular belleza de estas costas, pero más adentro, al norte, te llama la atención un camino que conduce a un espeso bosque.[else]La isla se extiende en una larga playa de fina arena hasta donde alcanza la vista. Más adentro, al norte, puedes ver un camino que conduce a un espeso bosque.".

Isla4 is east of Isla3 and west of Isla2 and south of Bosque2. The printed name of Isla4 is "Costa de la isla". The description is "[if unvisited]Continúas explorando la isla. Te sorprende la singular belleza de estas costas, que se extienden de este a oesta hasta donde alcanza la vista.[else]La isla se extiende en una larga playa de fina arena hasta donde alcanza la vista.".

Bosque2 is north of Isla3. The printed name of Bosque2 is "Bosque de la isla". The description is "[if unvisited]Has llegado a un exótico bosque. Las plantas, los árboles y las flores de vivos colores te hacen sentir como si estuvieras en un paraíso.[else]Contemplas la gran variedad de vegetación que hay en la isla, algunas plantas jamás las habías visto antes. Más allá, al sur, se vislumbra la costa.".

The riachuelo is fixed in place in Bosque2. "Un pequeño riachuelo cruza serpenteando el bosque.". The description is "El agua del pequeño riachuelo fluye limpia y clara.". Understand "rio", "agua", "caudal" and "fondo" as the riachuelo.

Instead of turning or touching or pushing or pulling the riachuelo, try taking the riachuelo.
Instead of putting the riachuelo on the cantimplora, try taking the riachuelo.
Instead of llenaring the cantimplora when the player is in Bosque2, try taking the riachuelo. [definimos verbo llenaring en Vocabulario]

Check taking the riachuelo:
	if the player carries the cantimplora:
		say "Llenas la cantimplora con el agua del riachuelo.";
		now the cantimplora is llena;
		rule succeeds;
	otherwise:
		say "Coges el agua del riachuelo con tus manos... y se escurre entre tus dedos.";
		rule succeeds.

The sol is a backdrop. The sol is everywhere. The description is "El sol se muestra imponente en mitad del cielo azul.".

Some tablones are in Isla4. They are fixed in place. "Unos tablones de madera procedentes de un naufragio se encuentran tirados por la arena.". The description is "Restos de un naufragio, y por su aspecto no hace mucho que llegaron a estas costas.". Understand "tablas", "tablon", "restos" and "naufragio" as the tablones.

La cantimplora is nowhere. The cantimplora can be llena or vacia. The cantimplora is vacia. The description is "La cantimplora está algo roñosa, pero parece en buen estado, [if vacia]aunque no contiene nada.[else]está llena de agua.".

Understand "agua" as the cantimplora.

[Para evitar conflicto con el agua de la cantimplora]
Does the player mean drinking the mar: it is very unlikely. 
Does the player mean drinking the cantimplora when the player is in Bosque2: it is very unlikely. 


Instead of turning or touching or pushing or pulling the tablones, try taking the tablones.
Instead of taking the tablones for the first time:
	move the cantimplora to Isla4;
	say "Los tablones pesan demasiado, pero al moverlos has dejado al descubierto una cantimplora.".
Instead of taking the tablones, say "Los tablones pesan demasiado para llevarlos tu solo.".

Section 4.1 - El mar

The mar is a backdrop in the islas. The description is "Estas aguas son tan bellas como peligrosas, piensas mientras observas la línea de la costa, allá a lo lejos.". Understand "costa", "costas", "playa", "aguas", "agua", "linea" and "oceano" as the mar. 


Instead of nadaring en the mar:
	say "Decidido y sin temor te adentras en el mar, nadando hacia la costa...[paragraph break]";
	wait for any key;
	if a random chance of 1 in 5 succeeds:
		say "Pero de repente observas una amenazadora aleta de tiburón que se aproxima hacia tí... ¡intentas huir con todas tus fuerzas! Pero...[paragraph break]";
		end the story saying "Mueres en las fauces del tiburón.";
	otherwise:
		say "Finalmente, y tras un gran esfuerzo, llegas a la playa...[paragraph break]";
		wait for any key;
		now the player is in Playa.

Instead of nadaring in the islas, try nadaring en the mar.


Part 3 - Reparto


Section 1 - El jugador

conquistador is a man in the Bosque. The printed name of conquistador is "Hernán Cortés". The description is "Eres un conquistador español del siglo XIV, tu nombre es Hernán Cortés y te encuentras perdido en una tierra desconocida.". The player is conquistador.

Section 2 - El naufrago

The naufrago is a man in the Isla. The printed name of naufrago is "náufrago". The description is "Un hombre vestido con arapos está tumbado sobre la arena, moribundo.". Understand "hombre", "arapos", "moribundo" as the naufrago. 

The naufrago can be moribundo or recuperado. The naufrago is moribundo. 


Rule for printing room description details of naufrago:
if the Isla is unvisited, say " moribundo tumbado sobre la arena, por";
if the cofre is carried and Isla is visited, say " mirando con sorpresa tu misterioso cofre, por";
omit contents in listing.


Instead of touching naufrago, say "El hombre sigue vivo, tal vez puedas ayudarle dándole un poco de agua.". 
Instead of attacking naufrago, say "El hombre no representa ningún peligro.".

Instead of waving hands in the presence of the naufrago, say "El hombre entorna los ojos y dice: 'Por dios, ¡qué esperanza me dais!'".
	
Instead of throwing the piedra at the naufrago, say "El hombre no representa ningún peligro.".

Instead of telling someone about something, try asking the noun about it. Instead of answering the noun that something, try asking the noun about it. 

After asking naufrago about "hola", say "El hombre te observa detenidamente y te pregunta '¿Eres amigo o enemigo?.'".

After asking naufrago about "amigo": say "El hombre sonríe con debilidad y te dice 'Mi nombre es Antonio Velasco y hace dos días arribé a estas costas, tras un naufragio...'";
now the printed name of naufrago is "Antonio".

After asking naufrago about "el/-- naufragio", say "'Los piratas nos abordaron y hundieron el barco, creo que soy el único superviviente...'".
After asking naufrago about something, say "El hombre no atiende a lo que dices, prueba con otras palabras".


Instead of giving the cantimplora to the naufrago when the cantimplora is llena:
	say "El hombre coge nerviosamente la cantimplora con las dos manos y bebe de ella hasta la última gota...";
	now the naufrago is recuperado;
	now the description of naufrago is "Un hombre vestido con arapos, ahora tiene mejor aspecto. Es un tipo alto y delgado que parece haber sobrevivido a terrible naufragio.";
	now the cantimplora is vacia.

Instead of giving the cantimplora to the naufrago when the cantimplora is vacia:
	say "El hombre coge nerviosamente la cantimplora con las dos manos... ¡y ve que está vacía![paragraph break]Encolerizado te la arroja, aunque sin fuerzas, y te implora '¡Dame agua, por favor!'";
	move the cantimplora to Isla.    


Section 3 - La serpiente

The serpiente (f) is in the bosque. It is an animal. The description is "Una serpiente se aproxima hacia tí desde el sur, con aspecto amenazador...".

Instead of going south in the presence of the serpiente:
	say "Intentas rodear a la serpiente para ir al sur, pero esta se abalanza hacia tí con los colmillos y...";
	end the story saying "¡Estás muerto!".
	
Instead of throwing the piedra at the serpiente:
	say "Lanzas la piedra a la serpiente, que retrocede asustada, perdiéndose por entre el follaje del bosque...";
	remove the serpiente from play;
	remove the piedra from play.    
	
Rule for printing room description details of serpiente:
if the Bosque is unvisited, say " aproximándose hacia tí desde el sur,";
otherwise say " siseando amenazadoramente, impidiéndote el paso hacia el sur,";
omit contents in listing.


Part 4 - Nudo

Section 1 - Escena del náufrago

Tener sed is a recurring scene. Tener sed begins when the Isla is visited for the first time.
Tener sed ends happily when the naufrago is recuperado.
Tener sed ends sadly when the time since Tener sed began is 30 minutes.

When Tener sed begins:
	now contador is 0.

When Tener sed ends happily:
	say "El náufrago empieza a tener mejor aspecto, te mira agradecido[line break]-¡Gracias, amigo! -te dice el hombre, levantándose con dificultad."

When Tener sed ends sadly:
	end the story saying "El náufrago cae inconsciente en la arena, muerto de sed.'"

The contador is a number that varies.
Every turn during Tener sed:
	increase contador by 1;
	if contador is 1, say "-¡Tengo sed! Ahh...- le oyes decir.";
	if contador is 2, say "El náufrago parece estar sediento, apenas puede apoyarse en la arena.";
	if contador is 7, say "Aún puedes escuchar los lamentos del náufrago...";
	if contador is 15, say "Deberías pensar en darle algo de agua al náufrago...";
	if contador is 20, say "Deberías darle algo de agua al náufrago rápidamente, o caerá inconsciente.";
	if contador is 28, say "El náufrago apenas está ya consciente...".



Part 5 – Vocabulario

llenaring is an action applying to one thing. Understand "llena [something]" as llenaring.
report llenaring: say "No parece que [the noun] pueda llenarse, ¿qué pretendes hacer exactamente?.".


nadaring is an action applying to nothing. 
understand "nada" and "bucea" as nadaring.
Check nadaring:
	say "No hay suficiente agua aquí, ¿dónde he de nadar?".
Report nadaring:
	say "Aquí acaba la acción.".

nadaring en is an action applying to one thing.
understand "nada a/en/hacia/-- [something]",  "nadia hacia la [something]", "bucea a/hacia/-- [something]"  and "bucea hacia la [something]" as nadaring en.
report nadaring en something:
	say "No puedo nadar en [the noun], mejor será nadar en el mar...".

rezaring is an action applying to nothing. 
understand "reza" as rezaring.
report rezaring:
	say "¡Quiera Dios que mis plegarias sean escuchadas!".

Instead of rezaring for the first time, say "Alzas tus brazos al cielo y suplicas al altísimo: 'Padre nuestro, que estás en el cielo, santificado sea tu Nombre; venga a nosotros tu reino...'".


