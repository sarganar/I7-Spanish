Version 2 of Conversacion Por Clave by El Enano Malauva begins here.

"Pretende usar un nuevo tipo de conversación mediante claves resaltadas, lamentablemente todo es casi manual..."

[Los PNJs que puedan ser referentes de conversación tendrán una tabla matriz que contendrá toda la conversación]

A ConversadorPorClave is a kind of person. 
A ConversadorPorClave has a table-name called tablaDeConversacion.
The tablaDeConversacion of a ConversadorPorClave is normally the Table of ConversacionesPorClave.
A ConversadorPorClave has a text that varies called dialogoVacio.
The dialogoVacio of a ConversadorPorClave is normally "No parece que haya mucho que decir a ese respecto.".


To conversar con (receptor - a ConversadorPorClave) sobre (palabra - a Text):
	let contador be 0;
	repeat with N running from 1 to the number of rows in the tablaDeConversacion of the receptor
	begin;
		if contador is less than 1 and there is clave in row N of  the tablaDeConversacion of the receptor
		begin;
			choose row N in the tablaDeConversacion of the receptor;
			if clave entry is palabra
			begin;
				if estado entry is 1
				begin;
					increase contador by 1;
					let oid be id entry;
					let tabladialogo be dialogo entry;
					choose row with id of oid in the tabladialogo;
					say "Le dices a [receptor]: '[fraseJugador entry]'.";
					say "[receptor] contesta: '[respuestaPNJ entry]'.";
					procesar oid de tablaDeConversacion of the receptor;
				end if;
			end if;
		end if;
	end repeat;
	if contador is less than 1
	begin;
		say "[dialogoVacio of receptor][line break]";
	end if.


Instead of asking a ConversadorPorClave (called the preguntado) about a topic listed in the tablaDeConversacion of the noun:
	if estado entry is 1
	begin;
		let oid be id entry;
		let tabla-dialogo be dialogo entry;
		choose row with id of oid in the tabla-dialogo;
		say "Le dices a [the preguntado]: '[fraseJugador entry]'.";
		say "[the preguntado] contesta: '[respuestaPNJ entry]'.";
		procesar oid de tablaDeConversacion of the noun;
	otherwise;
		say "[dialogoVacio of preguntado][line break]";
	end if.

To procesar (oid - a number) de (tabla - table-name):
		choose row with id of oid in the tabla;
		change estado entry to 0;
		if there is activar1 entry
		begin;
			let id1 be activar1 entry;
			choose row with id of id1 in the tabla;
			change estado entry to 1;
		end if;
		choose row with id of oid in the tabla;
		if there is activar2 entry
		begin;
			let id2 be activar2 entry;
			choose row with id of id2 in the tabla;
			change estado entry to 1;
		end if;
		choose row with id of oid in the tabla;
		if there is activar3 entry
		begin;
			let id3 be activar3 entry;
			choose row with id of id3 in the tabla;
			change estado entry to 1;
		end if;
		choose row with id of oid in the tabla;
		if there is activar4 entry
		begin;
			let id4 be activar4 entry;
			choose row with id of id4 in the tabla;
			change estado entry to 1;
		end if.




Instead of asking a ConversadorPorClave about something:
	say "[dialogoVacio of the noun][line break]". 



To say i -- running on:
	(- style underline; -).

To say /i -- running on:
	(- style roman; -).


[Tabla de conversaciones generales]
Table of ConversacionesPorClave
topic	clave	id		estado		dialogo		activar1		activar2		activar3		activar4
a topic	a Text	a number	a number	table-name	a number	a number	a number	a number

Conversacion Por Clave ends here.

---- DOCUMENTATION ----

Esta librería permite crear un nuevo tipo de conversación con los PNJs.

Example: **  Prueba De Conversación - un ejemplo de habitación diálogo cansino y absurdo.

*:"Prueba De Conversacion" by Mel Hython

Include Spanish Localization by Sarganar.
Include Conversacion Por Clave by Enano Malauva.

LugarDePruebas is a room. 
The description of LugarDePruebas is "Un lugar vacío sin nada que hacer más que hablar.".

The player is in LugarDePruebas.

Lorjeck is a ConversadorPorClave and in LugarDePruebas.
The tablaDeConversacion of Lorjeck is Table of ConversacionLorjeck.
The dialogoVacio of Lorjeck is "Empiezas a hablar de ello, pero Lorjeck levanta la mano dejando ver claramente que NO es el momento.".

Mija is a ConversadorPorClave and in LugarDePruebas.
The dialogoVacio of Mija is "Por un momento piensas en hablar con Mija, pero está demasiado ensimismado, mejor hablar con Lorjeck.".

When play begins:
	conversar con Lorjeck sobre "el vacio";
	say line break;
	conversar con Lorjeck sobre "el miedo";


Table of ConversacionLorjeck
topic		clave		id	estado	dialogo			activar1	activar2	activar3	activar4	
"el vacio"	"el vacio"	1	1	Table of LorjeckResp 	2	--	--	--
"el miedo"	"el miedo"	2	0	Table of LorjeckResp  	1	--	--	--
"Lorjeck"	"Lorjeck"	3	1	Table of LorjeckResp 	1	2	3	--

Table of LorjeckResp 
id	fraseJugador	respuestaPNJ	
1	"Es increíble que todo esté así de vacío, da mucho miedo."	"Sí, da un poco de [i]miedo[/i]."
2	"¿Y eso no te hace sentir vacío?"	"No, ya estaba [i]vacio[/i] antes."
3	"Pero, ¿tú quién eres?"	"¿Yo? Sólo soy [i]Lorjeck[/i], un habitante de [i]el miedo[/i] y [i]el vacio[/i]."
 
