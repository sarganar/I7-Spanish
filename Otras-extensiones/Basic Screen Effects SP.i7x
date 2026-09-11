Version 7 of Basic Screen Effects SP by Emily Short begins here.

"Waiting for a keypress; clearing the screen. Also provides facilities for 
changing the foreground and background colors of text, when using the z-machine.
These abilities will not function under Glulx." 

"SPANISH MESSAGES by Sarganar"

Use authorial modesty.

Include Basic Screen Effects by Emily Short 

Section 3 - Foreign Lang - Spanish Localization

To limpiar la/-- pantalla:
	clear the screen.

To limpiar solo la/-- pantalla principal:
	clear only the main screen.

To limpiar solo la/-- linea de estado:
	clear only the status line.

To esperar pulsacion de tecla: 
	wait for any key.

To esperar pulsacion de ESPACIO:
	wait for the SPACE key.

To pausar el/-- juego:
	pause the game.

Standard pausing the game rule response (A) is "[paragraph break]Presiona ESPACIO para continuar.".

To centrar (quote - text):
	center quote.
	
To centrar (quote - text) en columna (depth - a number):
	center quote at the row depth.

To salir abruptamente:	
	stop the game abruptly.

To mostrar el/-- mensaje actual:
	show the current quotation.

Section 4 - Colores (for Z-machine only)

To say color normal:		[default letters:]
	(- @set_colour 1 1; -)

To say letras rojas:		[red letters:]
	(- @set_colour 3 0; -)

To say letras verdes:		[green letters:]
	(- @set_colour 4 0; -)

To say letras amarillas:		[yellow letters:]
	(- @set_colour 5 0; -)

To say letras azules:		[blue letters:]
	(- @set_colour 6 0; -)

To say letras purpura:		[magenta letters:]
	(- @set_colour 7 0; -)

To say letras cyan:		[cyan letters:]
	(- @set_colour 8 0; -)

To say letras blancas:		[white letters:]
	(- @set_colour 9 0; -)

To say letras negra:		[black letters:]
	(- @set_colour 2 0; -)

To cambiar color de fondo a negro:	[turn the background black:]
	(- @set_colour 0 2; -);

To cambiar color de fondo a rojo:	[turn the background red:]
	(- @set_colour 0 3; -);

To cambiar color de fondo a verde:	[turn the background green:]
	(- @set_colour 0 4; -);

To cambiar color de fondo a amarillo:	[turn the background yellow:]
	(- @set_colour 0 5; -);

To cambiar color de fondo a azul:	[turn the background blue:]
	(- @set_colour 0 6; -);

To cambiar color de fondo a purpura:	[turn the background magenta:]
	(- @set_colour 0 7; -);

To cambiar color de fondo a cyan:	[turn the background cyan:]
	(- @set_colour 0 8; -);

To cambiar color de fondo a blanco:	[turn the background white:]
	(- @set_colour 0 9; -);

Basic Screen Effects SP ends here.

---- DOCUMENTATION ----

Basic Screen Effects implements the following effects: pauses to wait for a keypress from the player; clearing the screen; changing the color of the foreground font; and changing the color of the background. Color changes function only on the Z-machine.

SPANISH: La documentacón completa esta en Basic Screen Effects by Emily Short.


