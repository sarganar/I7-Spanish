"Gente" by Grendelkhan (in spanish)

[Demostracion de Menus de opciones]

Include Basic Screen Effects Sp by Emily Short.
Include Basic Help Menu SP by Emily Short.
Include Cortos by Johan Paz.

Table of Secuencia 1
phrase
"Jamás pensé que el horror se escondía tras bellas máscaras."
"Nunca creí que me iba a suceder algo así."
"Pero, a veces, la gente..."
"no es lo que parece."

When play begins:
		tell the fragment on Table of Secuencia 1;
		wait for any key;
		clear the screen;
		display the boxed quotation
		"Gente.
			por Grendel Khan";
		show the current quotation;
		wait for any key;
		clear the screen.

When play begins:
	now the current menu is the Table of Inicio;
	carry out the displaying activity;
	clear the screen;
	try looking.		
		
Table of Inicio
title	subtable	description	toggle
"Jugar a [story title]"	--	"Esto es una demo."	quit rule
"Introducción"	--	"Esto es una introducción."	--
"Créditos"	--	"Esto son los créditos."	--
"Ayuda"	Table of Basic Help Options	--	--

Celda is a room. "[one of]Te encuentras[or]Estás[at random] en una fría y lóbrega celda."

inicing is an action applying to nothing.
understand "inicio" as inicing.

report inicing:
	now the current menu is the Table of Inicio;
	carry out the displaying activity;
	clear the screen;
	try looking.