AKI Basic by Johan Paz begins here.

Include Advanced Keyword Interface Sp by Johan Paz.

A thing can be examined. A thing is usually not examined.

After examining a not examined thing (this is the AKI after examining rule):
	now noun is examined.
	
Commanding a thing (this is the AKI examining rule):
	if give-explanation is true:
		say "(examinar [the noun])";
	try examining noun.

Commanding a closed openable container (this is the AKI opening object rule):
	if give-explanation is true:
		say "(abrir [the noun])";
	try opening noun.
	
Commanding a examined scenery (this is the AKI searching one rule) :
	if give-explanation is true:
		say "(buscar en [the noun])";
	try searching noun.
	
First commanding for an open door (this is the AKI entering rule):
	if give-explanation is true:
		say "(ir/entrar en [the noun])";
	try entering noun.	

Commanding a examined fixed in place thing (this is the AKI searching two rule):
	if give-explanation is true:
		say "(buscar en [the noun])";
	try searching noun.
	
Commanding a examined thing carried by player (this is the AKI dropping rule):
	if give-explanation is true:
		say "(dejar [the noun])";
	try dropping noun.
	
Commanding a examined thing (this is the AKI taking rule):
	if give-explanation is true:
		say "(coger [the noun])";
	try taking noun.
	
Commanding an room (this is the AKI going rule):
	let way be the best route from the location to noun, using doors;
	if give-explanation is true:
		say "(ir [al way])";
	try going way.	
	
Commanding a examined closed door (this is the AKI opening door rule):
	if give-explanation is true:
		say "(abrir [the noun])";
	try opening noun.

AKI Basic ends here.

---- DOCUMENTATION ----

Esta extensión usa "Advanced Keyword Interface SP" como base e incluye las reglas:

- The AKI entering rule: que atraviesa puertas abiertas.
- The AKI examining rule: que examina objetos.
- The AKI opening object rule: que abre objetos abribles y cerrados.
- The AKI searching one rule: que registra objetos de escenarios ya examinados.
- The AKI searching two rule: que registra objetos fijos ya examinados.
- The AKI taking rule: que coge un objeto ya examinado.
- The AKI dropping rule: que deja caer un objeto que se lleva y ya está examinado.
- The AKI going rule: que va hacia una localidad.
- The AKI opening door rule: que abre puertas cerradas y examinadas.

Example: * AKI Sample - Un ejemplo muy básico

La flexibilidad de esta extensión permite que se usada para propósitos múltiples, en este caso ser usado para comandos básicos.

	*: "AKI Basic"
	
	Include Spanish by Sebastian Arg.
	Include Advanced Keyword Interface Sp by Johan Paz.
	Include Aki Basic by Johan Paz.

	Estancia is a room. The description of Estancia is "Al [d]este[x] una [puerta].".

	The puerta is east of Estancia and west of Otro Lugar. The puerta is a door. The puerta is female.

	A platano is a thing in Estancia.
	A armario is a fixed in place thing in Estancia.

	Estribor is a direction. The opposite of estribor is babor. The printed name of estribor is "estribor". Babor is a direction. The opposite of babor is estribor.

	Otro Lugar is estribor from lugar. The description of Otro Lugar is "Un lugar indefinido, con una [estancia] tras la [puerta] y a [babor].".