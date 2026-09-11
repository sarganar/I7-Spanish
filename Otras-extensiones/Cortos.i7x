Cortos by Johan Paz begins here.

Include Basic Screen Effects Sp by Emily Short.

[upgraded to I7 6M, by sarganar - 04.01.2017]

Chapter 1 - Narrator voices

A narrator voice is a kind of thing. A narrator voice has a text called voice style.

[ DEFAULT VOICE ]
Default voice is a narrator voice. The voice style of default voice is "[roman type]".


Chapter 2 - Narrator

To tell the fragment on (table - a table-name), cleaning the screen or cleaning the screen after each phrase:
	if cleaning the screen 
	begin;
		tell the fragment on table;
		clear the screen;
	otherwise if cleaning the screen after each phrase;
		let N be the number of rows in table;
		repeat through table begin;
			decrease N by 1;
			if there is voice
			begin;
				say voice style of voice entry;
			otherwise;
				say voice style of default voice;
			end if;
			say "[phrase entry]";
			if there is voice
			begin;
				say roman type;
			otherwise;
				say voice style of default voice;
			end if;
			wait for any key;
			clear the screen;
		end repeat;
	otherwise;
		let N be the number of rows in table;
		repeat through table begin;
			decrease N by 1;
			if there is voice entry
			begin;
				say voice style of voice entry;
			otherwise;
				say voice style of default voice;
			end if;
			say "[phrase entry]";
			if there is voice entry
			begin;
				say roman type;
			end if;
			say paragraph break;
			if N is not 0, wait for any key;
		end repeat;
	end if.

To tell the next fragment on (table - a table-name), cleaning the screen or cleaning the screen after each phrase:
	let next be next step of table;
	choose a row with step of next in table;
	if cleaning the screen:
		tell the fragment on narrative entry, cleaning the screen;
	otherwise if cleaning the screen after each phrase:
		tell the fragment on narrative entry, cleaning the screen after each phrase;
	otherwise:
		tell the fragment on narrative entry.


To initiate narrative (table - a table-name):
	if there is a narrative of table in the Table of Variable Narrative:
		choose row with a narrative of table in the Table of Variable Narrative;
		now the counter entry is 1;[04.01.2017]
	otherwise if the number of blank rows in the Table of Variable Narrative is not 0:
		choose a blank row in the Table of Variable Narrative;
		now the counter entry is 1;[04.01.2017]
		now the narrative entry is table.[04.01.2017]

To increase narrative (table - a table-name):
	if there is a narrative of table in the Table of Variable Narrative:
		choose row with a narrative of table in the Table of Variable Narrative;
		increase counter entry by 1;
	otherwise:
		initiate narrative table.

To decide which number is the next step of (table - a table-name):
	increase narrative table;
	choose a row with narrative of table in Table of Variable Narrative;
	if there is a step of counter entry in table:
		decide on the counter entry;
	otherwise:	
		let N be the number of rows in table;
		choose row N in table;
		decide on the step entry.

[ Tabla de contadores de narraciones variables ]
Table of Variable Narrative
counter	narrative
a number	a table-name
with 29 blank rows		

[ Just for compilation ]
Table of Fake Intro
voice			phrase
a voice 			a text

Table of Fake Next
step		narrative
a number	a table-name

Cortos ends here.

---- DOCUMENTATION ----

Esta extensión permite crear diversas formas de secuencias no interactivas -conocidas en el pasado en el mundo hispano como 'cortos', debido al peculiar nombre de la librería equivalente en Inform 6- en un relato. Estas secuencias pueden ser usadas típicamente como una introducción, o como un cambio de escena o de fase.

Section: Una secuencia no interactiva simple.

La forma de crear una secuencia es muy simple. Hay que crear una tabla con, al menos, una columna llamada 'phrase'. Bajo esta columna cada 'texto' incluído será uno de los párrafos que se irán mostrando durante la secuencia:

	Table of Secuencia 1
	phrase
	"Esto es un ejemplo de secuencia."
	"Está claro,¿no?"
	"Y puede tener partes [one of]aleatorias[or]decidas por el azar[at random], por supuesto"

Para mostrar esta secuencia basta con invocar el comando 'tell the fragment on', de esta forma:
	
	tell the fragment on Table of Secuencia 1
	
Existen además dos variantes para este comando:

	tell the fragment on Table of Secuencia 1, cleaning the screen
	
que limpiaría la pantalla al finalizar la secuencia y:

	tell the fragment on Table of Secuencia 1, cleaning the screen after each phrase
	
que limpiaría la pantalla tras cada párrafo mostrado.
	
Section: Voces

Aunque es posible incluir cualquier efecto de texto o tipografía variable a la manera tradicional de I7 en los textos de cualquier secuencia (como [italic type]), es posible clarificar qué narrador está 'contando' cada párrafo creando voces narradoras (narrator voice) y asociándoles un texto de estilo. De la siguiente forma:

	_Narrador1 is a narrator voice. The voice style of _narrador1 is "[italic type]".
	_Narrador2 is a narrator voice. The voice style of _narrador2 is "[bold type]".
	
Si no se define ninguna voz narradora, ni se declaran todas los párrafos serán 'dichos' por el narrador por defecto cuya definición es:

	Default voice is a narrator voice. The voice style of default voice is "[roman type]".
	
Y será a 'roman type' a lo que se regresará al finalizar cada párrafo.

Para determinar en cada párrafo qué narrador lo 'dice' bastará con añadir a la tabla una columna llamada 'voice' de esta forma:

	Table of Secuencia 2
	voice		phrase
	_Narrador1	"Esta frase la dice el narrador 1."
	_Narrador2	"Y esta el narrador 2."
	_Narrador1	"Y esta de nuevo el narrador 1."
	_Narrador2	"Aunque esta sea del narrador 2."

Section: Secuencias de secuencias

Finalmente es posible crear secuencias de secuencias de la siguiente manera:

	Table of Secuencias
	step	narrative
	1		Table of Secuencia 1
	2		Table of Secuencia 2
	
Esta secuencia de secuencias se puede usar mediante el comando 'tell the next fragment on', así:

	tell the next fragment on Table of Secuencias
	
que la primera vez que se invocase mostraría la secuencia 1 y la segunda vez la secuencia 2 (por los números incluídos en la columna 'step'). Este nuevo comando de secuencias de secuencias tiene las mismas opciones que el comando básico de limpiar la pantalla al finalizar o con cada párrafo. Estas secuencias de secuencias pueden ser especialmente útiles en el caso de tener que mostrar varias secuencias según el número de veces que se intenta una misma cosa, es decir, son el equivalente en secuencia al texto variable: "[one of]primera vez[or]segunda vez[or]tercera vez[stopping]".