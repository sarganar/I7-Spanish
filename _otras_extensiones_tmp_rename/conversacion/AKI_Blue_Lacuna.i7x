AKI Blue Lacuna by Johan Paz begins here.

Include Advanced Keyword Interface Sp by Johan Paz.

First commanding for an  open door (this is the AKI entering rule):
	if give-explanation is true:
		say "(ir/entrar en [the noun])";
	try entering noun.

Commanding a thing (this is the AKI examining rule):
	if give-explanation is true:
		say "(examinar [the noun])";
	try examining noun.

AKI Blue Lacuna ends here.

---- DOCUMENTATION ----

Esta extensión usa "Advanced Keyword Interface SP" como base e incluye tan sólo dos reglas:

- The AKI entering rule: que atraviesa puertas abiertas.
- The AKI examining rule: que examina objetos.

Example: * AKI Sample - Un ejemplo muy básico

La flexibilidad de esta extensión permite que se usada para propósitos múltiples, en este caso ser usado para comandos básicos.

	*: "AKI Sample"
	
	Include Spanish by Sebastian Arg.
	Include Advanced Keyword Interface Sp by Johan Paz.
	Include Aki Blue Lacuna by Johan Paz.

	Estancia is a room. The description of Estancia is "Al [d]este[x] una [puerta].".

	The puerta is east of Estancia and west of Otro Lugar. The puerta is a door. The puerta is female.

	A platano is a thing in Estancia.
	A armario is a fixed in place thing in Estancia.

	Estribor is a direction. The opposite of estribor is babor. The printed name of estribor is "estribor". Babor is a direction. The opposite of babor is estribor.

	Otro Lugar is estribor from lugar. The description of Otro Lugar is "Un lugar indefinido, con una [estancia] tras la [puerta] y a [babor].".



