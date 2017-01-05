"Librojuego" by Grendelkhan (in spanish)

[Demostracion de salidas como enlaces]

Include Inline Hyperlinks by Erik Temple.
Use no scoring.

The printed name of a room is "Laberinto". The description of a room is usually "Un laberinto de oscuros y tortuosos corredores. Salidas: [exits]".

To say exits:
	let count be the number of adjacent rooms;
	if count is greater than 0:
		repeat with destination running through adjacent rooms:
			let the way be the best route from the location to the destination, using even locked doors;
			let dir be indexed text;
			let dir be "[way]";
			let dir be "[dir]";
			say "[link][way][as]ir al [dir][end link]";
			let count be count minus 1;
			if count > 0:
				say ", ";
		say ". ";

R01 is a room. R02 is north of R01. R03 is east of R01. R04 is north of R02 and northwest of R03. R05 is northeast of R02. R06 is north of R05. R07 is west of R06. R08 is southwest of R04 and northwest of R02. R09 is east of R06. R10 is northeast of R06. R11 is east of R10. R12 is southeast of R09. R13 is south of R12. R14 is northeast of R12. R14 is southeast of R11. R15 is up from R03. R16 is east of R15. R17 is north of R16. R18 is down from R17. The description of R18 is "Oscuros y tortuosos corredores, pero... espera, al noreste... ¡Puedes ver una salida! Salidas: [exits]"

Exit is northeast of R18. Exit is outside from R18. The printed name of Exit is "Afuera". "Has salido hacia la luz." Southwest from Exit is nowhere. Inside from Exit is nowhere. After looking in Exit, end the story saying "Conseguiste salir del laberinto".
