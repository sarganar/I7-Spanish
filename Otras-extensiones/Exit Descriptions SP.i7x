Version 4 of Exit Descriptions SP by Matthew Fletcher begins here.

"Añade una lista de direcciones de salida válidas así como los nombres de las localidades previamente visitadas tras la descripción de una localidad.[6L02]"

The amount is a number variable.
The amount is 0.

The num is a number variable.
The num is 0.

The ExitListTypeFlag is a truth state that varies. The ExitListTypeFlag is false.

The ShowUnvistedRoomNamesFlag is a truth state that varies. The ShowUnvistedRoomNamesFlag is false.

The ExitsMessage is some text that varies.
The ExitsMessage is "Salidas:".

The ExitsAndText is some text that varies.
The ExitsAndText is " y".

The ExitsToText is some text that varies.
The ExitsToText is " hacia".

After looking (this is the exit descriptions rule):
	Now the amount is the number of adjacent rooms;
	repeat with destination running through adjacent rooms begin;
		if the num is 0, say "[ExitsMessage]";
		if the ExitListTypeFlag is true, say "[line break]";
		let the way be the best route from the location to the destination, using even locked doors;
		if the way is a direction and the ExitListTypeFlag is false, say " ";
		if the way is a direction, say "[way]";
		if the destination is visited or ShowUnvistedRoomNamesFlag is true, say "[ExitsToText] [the destination]";
		Decrease the amount by 1;
		Increase the num by 1;
		if the amount is 0 and the ExitListTypeFlag is false, say ".";
		if the amount is 0 and the ExitListTypeFlag is true, say "[line break]";
		if the amount is 1 and the ExitListTypeFlag is false, say "[ExitsAndText]";
		if the amount is greater than 1 and the ExitListTypeFlag is false, say ",";
	end repeat;
	Now the amount is 0;
	Now the num is 0.

Exit Descriptions SP ends here.

---- DOCUMENTATION ----

At the moment you just include this extension and it will add a sentence which lists the exits to the end of a room description, including the names of any previously visited rooms.

You can set the value ExitListTypeFlag to true (it defaults to false) to change the format of the Exits from the default of a comma separated sentence to a list. e.g. When play begins: now the ExitListTypeFlag is true.

You can set the value ShowUnvistedRoomNamesFlag to true (it defaults to false) to also show the names of unvisited rooms in the exits list.


SPANISH:

Esta extensión agrega en cada turno una lista con las posibles salidas de la localidad actual. Imprime el nombre de las salidas ya visitadas.
Al definir localidades con nombre femenino, indicarlo con 'It is female.'
Al definir localidades con nombre plural, indicarlo con 'It is plural-named.'
Para usarla, solo incluye la extension al principio del código de tu juego.

IMPORTANTE: por defecto, Inform declara los rooms como 'proper-named', y en
ese caso [the destination] nunca antepone artículo (ni en inglés ni en
español), sin importar female/plural-named. Para que aparezca "la
Biblioteca"/"las Escaleras" hay que declarar también 'It is improper-named.'
en la localidad. Verificado con una compilación real (Inform 10.1.2 +
Spanish Languagev2): sin 'improper-named' imprime "hacia Biblioteca"; con
'improper-named' imprime "hacia la Biblioteca".

Traducida al español por Sarganar.
Mejoras de código por Mel Hython.
Portada sobre la base Version 4.0.0 en inglés (Matthew Fletcher) para Inform 10.1.2, 2026-09-11. La Version 5.0.0 en inglés agrega soporte para "easydoor"/"door" personalizados, pero depende implícitamente de la extensión Easy Doors by Hanon Ondricek (el kind "easydoor" no está definido en la propia Exit Descriptions v5) y no compila de forma autocontenida; se optó por v4.0.0, que sí es autocontenida.
