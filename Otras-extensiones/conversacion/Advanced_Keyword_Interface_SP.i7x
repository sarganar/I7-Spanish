Version 4 of Advanced Keyword Interface SP by Johan Paz begins here.

"Esta extensión está basada en la Keyword Interface de Aaron Reed pero con la intención de ir mucho más allá."

[Changelog:
  -- version 1: rama nueva de Keyword Interface intentando generalizar la actividad
]

Include Basic Screen Effects by Emily Short.

Keywords required is a truth state that varies. Keywords required is false.

Chapter - Give explanation

give-explanation is a truth state that varies. give-explanation is false.

Chapter - Hyperlinks (for Glulx only)

Include Inline Hyperlinks by Erik Temple.

Chapter - Metacommanding

[ Commanding is the rule book used very similar to Instead]
Commanding is an object based rulebook. Commanding rules have default success.

Last commanding rule:
	show KI message for not-a-verb-I-recognise.

[ Metacommanding is the action of the player fired by a keyword]
Metacommanding is an action applying to one object.
	
Carry out of metacommanding (this is the default metacommanding rule):
	follow the commanding rulebook for the noun.

[ TopicMetacommanding is the action of the player fired by a keyword in the case of topic]
TopicCommanding is an action applying to one topic.
	
Carry out of topiccommanding (this is the default topiccommanding rule):
	show KI message for not-a-verb-I-recognise.

Chapter - Things

Section - Grammar

Understand "[a thing]" as metacommanding.

Section - Definitions

Object keyword highlighting is a truth state that varies. Object keyword highlighting is true. [Global activation of object keywords.]

Every thing has a text called the keyword. The keyword of a thing is usually "". [which word of a multi-word noun should be highlighted. In practice, the player can type any word with the same effect, but for presentation purposes it's best to have a single word highlighted.]

A thing is either keyworded or keywordless. A thing is usually keyworded. Scenery is usually keywordless. [Keywordless things are not automatically highlighed in room descriptions.]

Object keywording something is an activity on objects.

Rule for printing the name of a thing (called item) while looking (this is the Keyword Interface highlight objects when looking rule):
	carry out the object keywording activity with item.

Rule for printing the name of a thing (called item) while taking inventory (this is the Keyword Interface highlight objects when taking inventory rule):
	carry out the object keywording activity with item.
	
Rule for printing the name of a thing (called item) while topiccommanding (this is the Keyword Interface highlight objects when talking rule):
	carry out the object keywording activity with item.
	
Rule for printing the name of a thing (called item) while examining (this is the Keyword Interface highlight objects when examining rule):
	carry out the object keywording activity with item.
			
Section - Rule for object keywording something

Rule for object keywording something (called item) (this is the Keyword Interface object keywording rule):
	if object keyword highlighting is false or item is keywordless:
		say the printed name of item;
		continue the action;
	let output be indexed text;
	now output is the printed name of item;
	let kw be indexed text;
	now kw is the keyword of item;
	[if kw is "", change kw to word number ( the number of words in output ) in output;]
	if kw is "", now kw is word number 1 in output;
	repeat with wordcounter running from 1 to the number of words in output:
		say "[if wordcounter > 1] [end if]";
		if word number wordcounter in output matches the regular expression "\b(?i)[kw]":
			say "[j][word number wordcounter in output][x]";
		else:
			say "[word number wordcounter in output]".


Chapter - Rooms

Section - Grammar

Understand "[any room]" as metacommanding.

Section - Definitions

Room keyword highlighting is a truth state that varies. Room keyword highlighting is true. [Global activation of object keywords.]

Every room has a text called the keyword. The keyword of a room is usually "". [which word of a multi-word noun should be highlighted. In practice, the player can type any word with the same effect, but for presentation purposes it's best to have a single word highlighted.]

A room is either keyworded or keywordless. A room is usually keyworded. [Keywordless things are not automatically highlighed in room descriptions.]

Room keywording something is an activity on objects.

Rule for printing the name of a room (called item) while looking and lookheading is false (this is the Keyword Interface highlight rooms when looking rule):
	carry out the room keywording activity with item.

Section - Rule for room keywording something
 
Rule for room keywording a room (called item) (this is the Keyword Interface room keywording rule):
	let output be indexed text;
	now output is the printed name of item;
	if room keyword highlighting is false or item is keywordless:
		say output in lower case;
		continue the action;
	let kw be indexed text;
	now kw is the keyword of item;
	[if kw is "", change kw to word number ( the number of words in output ) in output;]
	if kw is "", now kw is word number 1 in output;
	repeat with wordcounter running from 1 to the number of words in output:
		say "[if wordcounter > 1] [end if]";
		if word number wordcounter in output matches the regular expression "\b(?i)[kw]":
			say "[r][word number wordcounter in output in lower case][x]";
		else:
			say "[word number wordcounter in output in lower case]".


The room description heading rule is not listed in any rulebook.
The spanish room description heading rule is not listed in any rulebook.

Lookheading is a truth state that varies. Lookheading is false.

First carry out looking (this is the AKI room description heading rule):
	let output be indexed text;
	say bold type;
	now lookheading is true;
	if the visibility level count is 0:
		begin the printing the name of a dark room activity;
		if handling the printing the name of a dark room activity,
			say "Oscuridad" (A);
[			issue miscellaneous library message number 71;]
		end the printing the name of a dark room activity;
	otherwise if the visibility ceiling is the location:
		now output is the printed name of visibility ceiling;
		say "[output in title case]";
	otherwise:
		say "[The visibility ceiling]";
	say roman type;
	let intermediate level be the visibility-holder of the actor;
	repeat with intermediate level count running from 2 to the visibility level count:
		if the intermediate level is a supporter or the intermediate level is an animal:
			say " (sobre [the intermediate level])" (B);
		otherwise:
			say " (en [the intermediate level])" (C);
		let the intermediate level be the visibility-holder of the intermediate level;
	say line break;
	say run paragraph on with special look spacing;
	now lookheading is false.


Chapter - Exits

Section - Definitions

Direction keyword highlighting is a truth state that varies. Direction keyword highlighting is true.

Understand "[a direction]" as metacommanding. 
Understand "[a door]" as metacommanding.

Direction keywording something is an activity. 

Rule for printing the name of a direction (called dir) while looking (this is the Keyword Interface highlight directions while looking rule):
	carry out the direction keywording activity with dir.

Rule for printing the name of a direction (called dir) while exits listing (this is the Keyword Interface highlight directions while exits listing rule):
	carry out the direction keywording activity with dir.
	
Rule for printing the name of a direction (called dir) while examining (this is the Keyword Interface highlight directions while examining rule):
	carry out the direction keywording activity with dir.

Section - Rule for direction keywording something

Rule for direction keywording a direction (called dir) (this is the Keyword Interface direction keywording rule):
	if direction keyword highlighting is false:
		say the printed name of dir;
		continue the action;
	say "[d][the printed name of dir][x]".



Chapter - Topics

Topic keyword highlighting is a truth state that varies. Topic keyword highlighting is false.

Topic keywording something is an activity on objects.

Understand "[text]" as topiccommanding.

Chapter - Parser

Parser highlighting is a truth state that varies. Parser highlighting is false.

To say as the parser:
	now we-are-parser-speaking is true;
	set the text style for the style of parser-word.
	 
To say as normal:
	now we-are-parser-speaking is false; 
	reset styles with the style of parser-word.

Before printing a parser error when parser highlighting is true (this is the Keyword Interface before printing a parser error rule):
	say "[as the parser]".

After printing a parser error when parser highlighting is true (this is the Keyword Interface after printing a parser error rule):
	say "[as normal]". 

Chapter - Keyword type

A keyword type is a kind of thing. object-word is a keyword type. direction-word is a keyword type. topic-word is a keyword type. parser-word is a keyword type. room-word is a keyword type.

A keyword emphasis is a kind of value. The plural of keyword emphasis is keyword emphases. 

A keyword type has a keyword emphasis called style. 

The active style is a keyword emphasis that varies. 

we-are-parser-speaking is a truth state that varies. we-are-parser-speaking is false.  [It's possible to have, say, an emphasized object keyword within a parser error message; this variable keeps track of whether we need to return to the parser style after switching off another keyword style.]

Section - Say section Glulx (for Glulx only)
	
To say j:
	if object keyword highlighting is true:
		set the text style for the style of object-word; 
		now the active style is the style of object-word;
		if active style is keyword-link:
			say link.
	
To say t:
	if topic keyword highlighting is true:
		set the text style for the style of topic-word; 
		now the active style is the style of topic-word;
		if active style is keyword-link:
			say link.
 
To say d: 
	if direction keyword highlighting is true:
		set the text style for the style of direction-word;
		now the active style is the style of direction-word;
		if active style is keyword-link:
			say link.

		
To say r: 
	if room keyword highlighting is true:
		set the text style for the style of room-word;
		now the active style is the style of room-word;
		if active style is keyword-link:
			say link.

	 
To say x:
	if active style is keyword-link and text capturing is active:
		say end link;
	reset styles with active style.

Section - Say section Z (for Z-machine only)
	
To say j:
	if object keyword highlighting is true:
		set the text style for the style of object-word; 
		now the active style is the style of object-word.
	
To say t:
	if topic keyword highlighting is true:
		set the text style for the style of topic-word; 
		now the active style is the style of topic-word.  	      
 
To say d: 
	if direction keyword highlighting is true:
		set the text style for the style of direction-word;
		now the active style is the style of direction-word.  	  
		
To say r: 
	if room keyword highlighting is true:
		set the text style for the style of room-word;
		now the active style is the style of room-word.  
	 
To say x:
	reset styles with active style;

	         
Section - Glulx Style Definitions (for Glulx only)

Include Glulx Text Effects by Emily Short. 

The keyword emphases are keyword-color1-style, keyword-color2-style, keyword-bold-style, keyword-italics-style, keyword-fixedwidth-style, keyword-link and keyword-no-style.

The style of object-word is keyword-link. 
The style of direction-word is keyword-link. 
The style of topic-word is keyword-link. 
The style of parser-word is keyword-link. 
The style of room-word is keyword-link.

Blue is always "#0000FF".
Green is always "#008000".

Table of User Styles (continued)
style name	color	fixed width	font weight	relative size
special-style-1	blue	--	bold-weight	0
special-style-2	green	--	bold-weight	0

To set the text style for (val - a keyword emphasis):
	if val is keyword-color1-style:
		say first custom style;
	else if val is keyword-color2-style:
		say second custom style;
	else if val is keyword-bold-style:
		say bold type;
	else if val is keyword-italics-style:
		say italic type;
	else if val is keyword-fixedwidth-style:
		say fixed letter spacing;
	else if val is keyword-no-style:
		do nothing.

To reset styles with (val - a keyword emphasis):
	if val is keyword-fixedwidth-style:
		say variable letter spacing;
	else:
		say roman type;
	if we-are-parser-speaking is true, say as the parser. 

Section - Z-Machine Style Definitions (for Z-machine only)

The keyword emphases are keyword-red, keyword-green, keyword-yellow, keyword-blue, keyword-magenta, keyword-cyan, keyword-white, keyword-bold-style, keyword-italics-style, keyword-fixedwidth-style, and keyword-no-style.

The style of object-word is keyword-blue. The style of direction-word is keyword-magenta. The style of topic-word is keyword-red. [These are really the only three z-code colors that are readable on a white background.] The style of parser-word is keyword-italics-style.

To set the text style for (val - a keyword emphasis):
	if val is keyword-red:
		say red letters;
		say bold type;
	else if val is keyword-green:
		say green letters;
		say bold type;
	else if val is keyword-yellow:
		say yellow letters;
		say bold type;
	else if val is keyword-blue:
		say blue letters;
		say bold type;
	else if val is keyword-magenta:
		say magenta letters;
		say bold type;
	else if val is keyword-cyan:
		say cyan letters;
		say bold type;
	else if val is keyword-white:
		say white letters;
		say bold type;
	else if val is keyword-bold-style:
		say black letters;
		say bold type;
	else if val is keyword-italics-style:
		say italic type;
	else if val is keyword-fixedwidth-style:
		say fixed letter spacing;
	else if val is keyword-no-style:
		do nothing.

To reset styles with (val - a keyword emphasis):
	if val is keyword-fixedwidth-style:
		say variable letter spacing;
	else:
		say roman type;
		say default letters;
	if we-are-parser-speaking is true, say as the parser. 




Chapter - Changing Style


Setting the keyword emphasis is an action out of world applying to nothing. Understand "keyword" or "keywords" or "clave" or "claves" or "resaltado" as setting the keyword emphasis. 
 
tempstyles is a list of keyword emphases that varies.

Carry out setting the keyword emphasis (this is the Keyword Interface carry out setting keyword emphasis rule): 
	run the keywords routine.

To run the keywords routine:
	let mychar be 1;   
	while mychar is not 0:
		clear the screen;  
		let KInum be 0; 
		let object-number be 0;
		let direction-number be 0;
		let topic-number be 0;
		let parser-number be 0;
		let room-number be 0;
		show KI message for keyword-setting-instructions;
		say line break;
		if object keyword highlighting is true:
			increase KInum by 1;
			say "[KInum]) ";
			let object-number be KInum;
			show KI message for keyword-instructions-object;
		if direction keyword highlighting is true:
			increase KInum by 1;
			say "[KInum]) ";
			let direction-number be KInum;
			show KI message for keyword-instructions-direction;
		if topic keyword highlighting is true:
			increase KInum by 1;
			say "[KInum]) ";
			let topic-number be KInum;
			show KI message for keyword-instructions-topic;
		if room keyword highlighting is true:
			increase KInum by 1;
			say "[KInum]) ";
			let room-number be KInum;
			show KI message for keyword-instructions-room;
		if parser highlighting is true:
			say line break;
			increase KInum by 1;
			say "[KInum]) ";
			let parser-number be KInum;
			show KI message for keyword-instructions-parser;
		[Print a warning if emphasis is disabled in a game where keywords are required; note that the player is still allowed to do so, however.]
		if keywords required is true:
			if ( object keyword highlighting is true and style of object-word is keyword-no-style ) or ( direction keyword highlighting is true and  style of direction-word is keyword-no-style ) or ( topic keyword highlighting is true and style of topic-word is keyword-no-style ) :
				say line break;
				show KI message for keyword-instructions-disabled;
		[Print a warning if any two active keyword styles are the same.]
		truncate tempstyles to 0 entries;
		let dupe be false;
		if object keyword highlighting is true:
			add style of object-word to tempstyles;
		if room keyword highlighting is true:
			add style of room-word to tempstyles;
		if direction keyword highlighting is true:
			if style of direction-word is listed in tempstyles:
				now dupe is true;
			else:
				add style of direction-word to tempstyles;
		if topic keyword highlighting is true:
			if style of topic-word is listed in tempstyles:
				now dupe is true;
		if dupe is true:
			say line break;
			show KI message for keyword-instructions-distinct;
		say line break;
		show KI message for keyword-instructions-end;
		now mychar is single-character - 48; [Converts ASCII to actual number typed.]
		if mychar is object-number:
			advance style with object-word;
		otherwise if mychar is direction-number:
			advance style with direction-word;
		otherwise if mychar is room-number:
			advance style with room-word;
		otherwise if mychar is topic-number:
			advance style with topic-word;
		otherwise if mychar is parser-number:
			advance style with parser-word;
		otherwise if mychar is 9:
			clear the screen;
			try setting screen reader mode; 
			say "Pulse cualquier tecla para continuar.";
			wait for any key;
			now mychar is 0;
	clear the screen;
	if pre-game keyword setting is true:
		now pre-game keyword setting is false;
		do nothing;
	otherwise:
		try looking. 
	  
To advance style with (kwtype - a keyword type):
	now the style of kwtype is the keyword emphasis after the style of kwtype.

To decide which number is single-character: (- (VM_KeyChar()) -).

Chapter - Screen Reader Mode

Screen reader mode is a truth state that varies. 

Setting screen reader mode is an action out of world. Understand "screenreader" or "screen reader" or "lector" as setting screen reader mode.
	
Carry out setting screen reader mode (this is the Keyword Interface carry out setting screen reader mode rule):
	if screen reader mode is true:
		now screen reader mode is false;
		show KI message for screen-reader-deactivated;
	else:
		now screen reader mode is true; 
		show KI message for screen-reader-activated.

Section - Exits

[This routine is lifted straight from the example in the Inform 7 docs.]

Understand "exits" or "salidas" as exits listing. Exits listing is an action applying to nothing.

Definition: a direction (called thataway) is viable if the room thataway from the location is a room.

Carry out exits listing (this is the Keyword Interface carry out exits listing rule):
	let count of exits be the number of viable directions; 
	if the count of exits is 0:
		say "Parece que no hay salida de este lugar." instead;
	if the count of exits is 1:
		say "La única salida que parece haber desde aquí es [the list of viable directions with definite articles].";
	otherwise:
		say "Las salidas evidentes de este lugar son [the list of viable directions with definite articles]."

Section - Things

Understand "things" or "cosas" as thing listing. Thing listing is an action out of world applying to nothing.

Carry out thing listing (this is the Keyword Interface carry out thing listing rule):
	say "Por aquí [is-are the list of visible other things].".

Definition: a thing is other if it is not the player.

Rule for printing the name of a thing (called item) while thing listing:
	carry out the object keywording activity with item.


Chapter - Beginning Play
	 
Section - Keyword Interface setup rule

pre-game keyword setting is a truth state that varies. pre-game keyword setting is true.

When play begins (this is the Keyword Interface setup trigger rule):
	if keywords required is false:
		continue the action;
	clear the screen;
	let mychar be 1; 
	show KI message for welcome-message;
	while mychar is not 0:
		now mychar is single-character; 
		if mychar is 82 or mychar is 114: [ r or R: restore ]
			restore the game;  
		if mychar is 75 or mychar is 107: [ k or K: keyword ]
			run the keywords routine;
			now mychar is 0;
		if mychar is 78 or mychar is 110: [ n or N: new game ]
			now mychar is 0;
	clear the screen;
	say "[line break][line break][line break]";
	now pre-game keyword setting is false.    
 
To restore the game: (- RESTORE_THE_GAME_R(); -).


Chapter - Error Reporting

Section - Not a verb I recognise

Rule for printing a parser error when the latest parser error is the not a verb I recognise error (this is the Keyword Interface not a verb I recognise rule) : show KI message for not-a-verb-I-recognise. [Acknowledge that the player may be trying to type a keyword, not just a verb.]


Chapter - Messages

A KI message is a kind of value. Some KI messages are defined by the Table of Keyword Interface messages.

To show KI message for (whichmsg - a KI message):
	choose row with a KI message of whichmsg in Table of Keyword Interface messages;
	say KI output entry;
	say line break.

Table of Keyword Interface messages
KI message	KI output
not-a-verb-I-recognise	"(Eso no es un verbo que entienda ni una clave que se pueda usar en este momento.)"
keyword-introduction	"Mientras interctúas con [story title], verá ciertas palabras resaltadas en el texto. Pruebe a escribir cualquiera de ellas para avanzar en este relato. [if object keyword highlighting is true] Por ejemplo, puede escribir el nombre de un [j]object[x] resaltado para examinarlo. [end if][if direction keyword highlighting is true]Una [d]direccion[x] resaltada indica que escribiendo su nombre se moverá en esa dirección o hacia ese lugar. [end if][if topic keyword highlighting is true]Una palabra resaltada en una [t]conversación[x] significará que escribiendo esa palabra proseguirá la conversación hacia ese tema en concreto. [end if] Si las claves no parecen poder distinguirse del resto del texto escriba CLAVES para arreglar el problema."
welcome-message	"Bienvenido a [j][story title][x], versión [release number].[paragraph break]Si no ve ninguna palabra resaltada pulse la tecla K ahora.[paragraph break]Pulse [t]N[x] desde el principio de la historia o [t]R[x] para restaurar una posición guardada."
keyword-setting-instructions	"[story title] usa un sistema de palabras resaltadas. Es [if keywords required is true]necesario[else]recomendable[end if] que su intérprete pueda mostrar correctamente estos resaltados. Escriba un número de los inferiores hasta encontrar una forma de resaltado que se vea claramente en su intérprete."
keyword-instructions-object	"Un [j]object[x] resaltado se verá [j]así[x]."
keyword-instructions-direction	"Una [d]salida[x] resaltada se verá [d]así[x]."
keyword-instructions-topic	"Un [t]tema[x] resaltado se verá [t]así[x]."
keyword-instructions-room	"Un [r]lugar[x] resaltado se verá [r]así[x]."
keyword-instructions-parser	"[as the parser]Los mensajes del intérprete de comandos se verán así.[as normal]."
keyword-instructions-disabled	"**Aviso: El resaltado de palabras es crucial en el diseño de [story title]. Le puede resultar difícil avanzar sin el resaltado.**"
keyword-instructions-distinct	"**Aviso: Frecuentemente será útil poder distinguir entre diversas clases de resaltado.**"
keyword-instructions-end	"Teclee 0 si ha finalizado, o 9 para [if screen reader mode is true]des[end if]activar el modo lector.[run paragraph on]"
screen-reader-activated	"El modo 'lector' ha sido activado. [story title] usará letras en las palabras resaltadas para indicar aquellas que sean importantes y que podrá teclear para avanzar en este relato. Su intérprete incluirá resaltados como [j]este[x]. Puede teclear [j]cosas[x] para ver cosas relevantes que estén por las cercanías, o [d]salidas[x] para ver las salidas cercanas. Teclee [j]claves[x] para ajustar las opciones de resaltado de las palabras, o teclee 'lector' para encender y apagar esta clase de resaltado."
screen-reader-deactivated	"El modo 'lector' ha sido desactivado."


To decide what number is the number of active keyword systems:
	let ctr be 0;
	if object keyword highlighting is true, increase ctr by 1;
	if direction keyword highlighting is true, increase ctr by 1;
	if topic keyword highlighting is true, increase ctr by 1;
	decide on ctr.



Advanced Keyword Interface SP ends here.

---- DOCUMENTATION ----

Esta extensión no sólo se inspira en la extensión Keyword Interface de Aaron Reed, sino que comparte una gran cantidad de su código; por lo que la mayor parte de la documentación de esta extensión es exactamente igual a la extensión de Aaron. Puede ser una buena idea empezar familiarizándose con la extesión de Aaron antes de usar esta. Por otra parte esta extensión usa una aproximación completamente diferente a la de Aaron sobre qué se ejecutará cuando el jugador teclee una de las palabras clave. En la extensión original el comportamiento está predeterminado por el tipo de clave que representa (examinar objetos, moverse hacia una dirección, etc...), sin embargo en esta extensión se crea un nuevo libro de reglas (Commanding) que permite utilizar toda la potencia de la gestión de las reglas de I7 para modular el comportamiento. Esta librería NO determinará un comportamiento básico para nada, de hecho en lugar de usar tal cual esta extensión deberá usarse alguna de las extensiones 'AKI', como por ejemplo 'AKI Blue Lacuna' o 'AKI Basic', que serán las que realmente proporcionen un comportamiento dado, más o menos contextual, a las claves del juego. En caso de usarse esta extensión tal cual a todos los intentos de usar una clave se obtendrá tan solo el mensaje  'not-a-verb-I-recognise' de la Tabla 'Table of Keyword Interface messages'.

Adicionalmente se ha incorporado una nueva categoría Room keyword, que permite resaltar nombres de localidades y así usarlas no ya como direcciones sino como objetivos de cualquier clase.

Section: Introducción

Esta extensión simula y extiende el sistema de resaltado de palabras usado en la ficción interactiva "Blue Lacuna" para simplicar la entrada de comandos. Nombres de objetos o localidades, direcciones y temas de conversación pueden ser tecleados sin verbos para examinar, moverse o hablar, etc... Esta extensión tan sólo proporciona un soporte básico en el que las librerías reales (como 'AKI Blue Lacuna') pueden proporcionar el comportamiento adaptable de las claves soportadas. El soporte para temas está implementado sólo de forma básica para permitir su integración con cualquier sistema de conversación. Un sistema completo para permitir al usuario seleccionar sus preferencias de color o activar un sistema de compatibilidad con escáneres de pantalla o sistema sin colores está también incluído. Esta extensión es compatible tanto con máquina z como con Glulx.

Aviso: los autores de inform usando colores tienen unas opciones algo limitadas en ambas plataformas. En máquina z los colores pueden ser ajustados con libertad, pero están limitado a ocho colores algo cantosos, de los cuales además no muchos son legibles según el fondo escogido. En Glulx los usuarios pueden escoger la paleta entre muchos millones de colores, pero sólo pueden usarse algunos a la vez y además no pueden cambiarse a lo largo del relato. En máquina z los ocho colores están disponibles y pueden ser ajustados por el usuario y el autor, en cualquier momento, en Glulx los dos colores por defecto son azul y verde, y sólo los autores pueden cambiarlos. En ambas plataformas, negrita, itálica... son ofrecidas como alternativas a las claves coloreadas.

Section: Uso básico

Esta extensión permite determinar el resaltado en cinco categorías. Cada categorías puede ser habilitada o desahilitada de forma independiente por el autor y por el jugador. Las opciones por defecto son:

	Object keyword highlighting is true.
	Direction keyword highlighting is true.
	Room keyword highlighting is true.
	Topic keyword highlighting is false.
	Parser highlighting is false.
	

Estas opciones pueden ser habilitadas o deshilitadas en tiempos de juego o globalmente con una regla "first when play begins":

	First when play begins: now object keyword highlighting is false.


Section: Objetos

Cuando la opción de resaltado de objetos está activada, la extensión resaltará automáticamente los objetos listados durante un comando de "mirar" o de "inventario", o aquellos que hayan sido indicados por el autor de forma manual en cualquier texto de la siguiente forma:

	Oficina is a room. "Una solitaria [lampara] ilumina esta oficina desprovista de muebles, excepto por un solitario [escritorio].". A lampara metalica and a escritorio are scenery in the office. A listin telefonico is on the escritorio.


Este código producirá un resultado similar al siguiente (donde el resaltado están indicados por asteriscos):

	La oficina
	Una solitaria *lampara* ilumina esta oficina desprovista de muebles, excepto por un solitario *escritorio*.
	
	Sobre el *escritorio* hay un listín *telefónico*.


La palabra resaltada será la última del nombre del objeto. Para cambiar esto, puedes usar la propiedad "keyword" de un objeto, que debe ser alguna de las palabras del "printed name" del objeto. También puedes definir una objeto como carente de resaltado ("keywordless"). Además puedes indicar manualmente una palabra del texto con "[j]palabra[x]" para resaltarla al modo de un objeto.

	A telefono with keyword "teléfono" is in the Oficina. The printed name of telefono is "teléfono de origen sueco". 
	The description of the telefono is "Percibes una tenue [j]mancha[x] de lápiz de labios sobre el auricular.". Some colillas are a keywordless thing in the Oficina.

Dará como resultado:

	"Puedes ver un *teléfono* de origen sueco y algunas colillas."

El resaltado de objetos, cuando esté activada, resaltará las palabras tanto al mirar como en el inventario. Si quieres desactivar alguno de estos comportamiento usa un código como el siguiente:

	The Keyword Interface highlight objects when looking rule is not listed in any rulebook.

Similarmente si quieres resaltar objetos en alguna otra ocasión usa un código como este:
	
	Rule for printing the name of a thing (called item) while asking which do you mean:
		carry out the object keywording activity with item.

En ciertos casos el mismo objeto puede aparecer resaltado más de una vez en una descipción. El autor de esta extensión no ha encontrado una solución a este problema, si alguien la encuentra, que haga el favor de avisarle.

Section: Direcciones

Cuando el resaltado de direcciones está activado y las direcciones están entre corchetes en las descripciones de las localizaciones sus nombres serán resaltados:

	"Lánguidos pasillos se alejan hacia [south] y [east]."

Movimientos sin brújula como los que se ven en "Blue Lacuna" también están disponibles mediante el simple procedimiento de añadir una clave de dirección como sinónimo de una dirección relativa. Como puede verse en el siguiente código:

	"Lánguidos pasillos llevan hasta un conjunto de [d]escaleras[x] polvorientas y a hasta un gran [d]salón[x]." Understand "escaleras" as south when location is Pasillo Languido. Understand "salon" as east when location is Pasillo Lánguido.

Un verbo "salidas" ha sido incluído para ayudar listar las salidas. El comando lista las salidas según sus puntos cardinales, probablemente querrás incluir otras clases de salidas. Si tu relato define otras direcciones diferentes a las normales, tendrás que incluir sus "printed name" de forma explícita para poder usarlas como cualquier otra dirección:

	Estribor is a direction. The opposite of starboard is babor. The printed name of estribor is "estribor". Babor is a direction. The opposite of babor is estribor.  The printed name of babor is "babor". Cubierta superior is estribor of Camarote Capitan and babor of Aparejos. The description of Cubierta superior is "La cubierta está repleta de piratas. Las posibles salidas son [babor] y [estribor].". 
	
Section: Lugares

Cuando la opción de resaltado de lugares está activada, la extensión resaltará automáticamente los lugares listados durante un comando de "mirar" o de "inventario", o aquellos que hayan sido indicados por el autor de forma manual en cualquier texto de la siguiente forma:

	Oficina is a room. "A un lado se puede ver la puerta que lleva hasta el [garaje].". Garaje is west from oficina.

Este código producirá un resultado similar al siguiente (donde el resaltado están indicados por asteriscos):

	La oficina
	A un lado se puede ver la puerta que lleva hasta el *garaje*.

La palabra resaltada será la última del nombre del lugar. Para cambiar esto, puedes usar la propiedad "keyword" de la habitación, que debe ser alguna de las palabras del "printed name" del lugar. También puedes definir una habitación como carente de resaltado ("keywordless"). Además puedes indicar manualmente una palabra del texto con "[r]palabra[x]" para resaltarla al modo de una habitación.

	A oficina with keyword "oficina" is a room. The printed name of oficina is "oficina de extraño aspecto". 
	The description of the garaje is "Desde aquí se puede llegar hasta la [oficina].".

Dará como resultado:

	"Desde aquí se puede llegar hasta la *oficina* de extraño aspecto."

El resaltado de lugares, cuando esté activado, resaltará las palabras tanto al mirar como en el inventario. Si quieres desactivar alguno de estos comportamiento usa un código como el siguiente:

	The Keyword Interface highlight room when looking rule is not listed in any rulebook.

Similarmente si quieres resaltar lugares en alguna otra ocasión usa un código como este:
	
	Rule for printing the name of a thing (called item) while asking which do you mean:
		carry out the room keywording activity with item.

En ciertos casos el mismo lugar puede aparecer resaltado más de una vez en una descipción. El autor de esta extensión no ha encontrado una solución a este problema, si alguien la encuentra, que haga el favor de avisarle.

Section: Temas de conversación

Debido a que hay tantísimos sistemas de conversación el soporte para el resaltado de temas de conversación es casi inexistente. Puedes encenderlo o apagarlo mediante "topic keyword highlighting" así como invocarlo mediante "[t]topic[x]" pero todo lo demás deberá ser realizado en tu sistema de conversación.

Section: Mensajes del intérprete

Adicionalmente esta extensión provee de soporte para diferenciar las salidas del parser mediante una clase de resaltado. Esto puede ser útil para aquellos autores que quieran diferenciar mensajes de error de los avisos más propios del juego.

El resaltado de errores del intérprete está desactivado por defecto. Puedes activarlo mediante:

	First when play begins: now parser highlighting is true.

Si has definido tus propios 'errores del intérprete' puedes darles el mismo aspecto de esta forma:

	Understand "abracadabra" as a mistake ("[as the parser]Para lanzar un conjuro debes hacerlo sobre algo como: ABRACADABRA LA MOZA.[as normal]").

Section: Control

Como ya habrás visto los autores pueden habilitar o deshabilitar el resaltado componente a componente. Los usuarios también tiene control usando el comando CLAVE, que le proporciona un menú para gestionar las diversas opciones disponibles.

Si por alguna razón consideras crucial que el sistema de claves no sea desactivado incluye en tu relato:

	First when play begins: now keywords required is true.

Lo que provocará que se muestre un mensaje de aviso a los usuarios cuando intenten desactivarlo o escojan una mezcla de opciones poco legibles.

También puedes mostrar algunos textos aclaratorios usando:

	show KI message for keyword-introduction

Para cambiar los colores por defecto en el principio del juego puedes usar código similar a:

	First when play begins: now the style of object-word is keyword-cyan.
	
O, en el caso de querer que sea un enlace a:

	First when play begins: now the style of room-word is keyword-link.

Los cuatro modos son object-word, direction-word, topic-word, room-word y parser-word. Para relatos Glulx los posibles estilos son keyword-link, keyword-color1-style y keyword-color2-style; para máquina z son keyword-red, keyword-green, keyword-yellow, keyword-blue, keyword-magenta, keyword-cyan, keyword-white, y keyword-black. En ambos casos se proporcionan además keyword-bold-style, keyword-italics-style, keyword-fixedwidth-style,  keyword-link, and keyword-no-style.

El estilo keyword-link permite usar el ratón para interactuar directamente con el relato con simples clicks.

Para cambiar los dos colores en Glulx puede usarse:

	Table of Common Color Values (amended)
	glulx color value	assigned number   
	g-color1	15645627

Véase la documentación de "Glulx Text Effects" by Emily Short sobre los colores Glulx.

Todos los mensajes que usa la extensión se pueden cambiar modificando la tabla "Table of Keyword Interface", por ejemplo:

	Table of Keyword Interface messages (amended)
	KI message			KI output
	keyword-setting-instructions		"[story title] hace uso del resaltado de palabras."

Los mensajes actualmente incluidos son:

	not-a-verb-I-recognise	"(Eso no es un verbo que entienda ni una clave que se pueda usar en este momento.)"
	keyword-introduction	"Mientras interctúas con [story title], verá ciertas palabras resaltadas en el texto. Pruebe a escribir cualquiera de ellas para avanzar en este relato. [if object keyword highlighting is true] Por ejemplo, puede escribir el nombre de un [j]object[x] resaltado para examinarlo. [end if][if direction keyword highlighting is true]Una [d]direccion[x] resaltada indica que escribiendo su nombre se moverá en esa dirección o hacia ese lugar. [end if][if topic keyword highlighting is true]Una palabra resaltada en una [t]conversación[x] significará que escribiendo esa palabra proseguirá la conversación hacia ese tema en concreto. [end if] Si las claves no parecen poder distinguirse del resto del texto escriba CLAVES para arreglar el problema."
	welcome-message	"Bienvenido a [j][story title][x], versión [release number].[paragraph break]Si no ve ninguna palabra resaltada pulse la tecla K ahora.[paragraph break]Pulse [t]N[x] desde el principio de la historia o [t]R[x] para restaurar una posición guardada."
	keyword-setting-instructions	"[story title] usa un sistema de palabras resaltadas. Es [if keywords required is true]necesario[else]recomendable[end if] que su intérprete pueda mostrar correctamente estos resaltados. Escriba un número de los inferiores hasta encontrar una forma de resaltado que se vea claramente en su intérprete."
	keyword-instructions-object	"Un [j]object[x] resaltado se verá [j]así[x]."
	keyword-instructions-direction	"Una [d]salida[x] resaltada se verá [d]así[x]."
	keyword-instructions-room	"Un [r]lugar[x] resaltado se verá [r]así[x]."
	keyword-instructions-topic	"Un [t]tema[x] resaltado se verá [t]así[x]."
	keyword-instructions-parser	"[as the parser]Los mensajes del intérprete de comandos se verán así.[as normal]."
	keyword-instructions-disabled	"**Aviso: El resaltado de palabras es crucial en el diseño de [story title]. Le puede resultar difícil avanzar sin el resaltado.**"
	keyword-instructions-distinct	"**Aviso: Frecuentemente será útil poder distinguir entre diversas clases de resaltado.**"
	keyword-instructions-end	"Teclee 0 si ha finalizado, o 9 para [if screen reader mode is true]des[end if]activar el modo lector.[run paragraph on]"
	screen-reader-activated	"El modo 'lector' ha sido activado. [story title] usará un medio alternativo en las palabras resaltadas para indicar aquellas que sean importantes y que podrá teclear para avanzar en este relato. Su intérprete incluirá resaltados como [j]este[x]. Puede teclear [j]cosas[x] para ver cosas relevantes que estén por las cercanías, o [d]salidas[x] para ver las salidas cercanas. Teclee [j]claves[x] para ajustar las opciones de resaltado de las palabras, o teclee 'lector' para encender y apagar esta clase de resaltado."
	screen-reader-deactivated	"El modo 'lector' ha sido desactivado."

Section: Modo 'lector'

Escribiendo "lector" o seleccionando la opción apropiada en el menú de personalización, los usuarios pueden fijar el valor de la variable "screen reader mode" a verdadero. Los usuarios ciegos y aquellos que no tienen intérpretes de color pueden disfrutar del resaltado usando esta opción. Esto puede proporcionar una útil alternativa si el juego contiene componentes visuales como un mapa o usa puzzles de color. La extensión no proporciona ningún soporte real a esta tarea, sino que se limita a gestionar la variable.

La extensión proporciona los comandos "cosas" y "salidas" para mostrar los objetos y las salidas presentes. Es probable que tengas que retocar alguno de estos comandos si tu relato usa algo muy especial a este respecto o incluso incluir uno llamado "temas" si tu relato está fuertemente basado en conversaciones.

Section: Ambigüedad

La desambiguación de Inform está diseñada en torno al concepto de que todo comando empieza con un verbo, lo que puede implicar un conflicto entre palabras clave, o entre estas y verbos. Esto es básicamente imposible de controlar por completo. Asegúrate de que tus objetos, direcciones o temas no tienen superposición con los verbos usados en el relato. Ejemplos de problemas:

*Si una clave de objeto y de una dirección* están en el alcance, el intérprete asumirá que el usuario quiere decir 'la dirección' e imprimirá un inútil "(el objeto)" si el usuario examina el objeto en lugar de eso de usar la clave.

*Si una palabra realzada coincide con un verbo*, el verbo tendrá preferencia. En caso de que eso ocurra lo mejor es usar como clave una palabra (normalmente en el caso de un objeto o tema de conversación será fácil encontrar alternativas) que no coincida con un verbo.

*Los temas de conversación debería tener preferencia frente a los objetos* ya que eso es lo que esperarán los usuarios. Véase los ejemplos siguientes

Section: give-explanation

La librería incluye una variable booleana llamada 'give-explanation' que servirá como punto común para las librerías que extiendan las reglas de interacción para saber si deben dar explicaciones de su interpretación de la clave o no.


Example: * AKI Sample - Un ejemplo muy básico

La flexibilidad de esta extensión permite que se usada para propósitos múltiples, en este caso ser usado para comandos básicos.

	*: "AKI Sample"
	
	Include Spanish by Sebastian Arg.
	Include Advanced Keyword Interface Sp by Johan Paz.

	[Commading rules]
	First commanding for an open door (this is the AKI entering rule):
		try entering noun.
	
	Commanding an room:
		let way be the best route from the location to noun, using doors;;
		try going way.

	Commanding a thing (this is the AKI examing rule):
		try examining noun.

	[Relato]
	Estancia is a room. The description of Estancia is "Al [d]este[x] una [puerta].". [The printed name of estancia is "estancia".]

	The puerta is east of Estancia and west of Otro Lugar. The puerta is a door. The puerta is female.

	A platano is a thing in Estancia.
	A armario is a fixed in place thing in Estancia.

	Estribor is a direction. The opposite of estribor is babor. The printed name of estribor is "estribor". Babor is a direction. The opposite of babor is estribor. 

	Otro Lugar is estribor from lugar. The description of Otro Lugar is "Un lugar indefinido, con una [estancia] tras la [puerta].".



