Version 11 of Patrollers SP by Michael Callaghan begins here.

"Permite que los personajes no jugadores  se muevan siguiendo rutas definidas por lugares, direcciones, o bien de forma aleatoria o hacia determinados objetivos."

Chapter 1 - Define a Patroller

Section 1.1 - The Patroller Kind

A Patroller is a kind of person.

The specification of a Patroller is "Representa un personaje no jugador cuyos movimientos pueden ser controlados mediante la determinación de una ruta, o seleccionando un objetivo o un comportamiento aleatorio."

Section 1.2 - Define whether the Patroller is On Patrol or Off Patrol

Status is a kind of Value.  The Statuses are On Patrol and Off Patrol.

A Patroller has a Status.  A Patroller is usually Off Patrol.

Section 1.3 - Specify how a Patroller's route is defined

MovementType is a kind of Value.  The MovementTypes are RoomLed, DirectionLed, Following, Aimless and Targeted.

[RoomLed		The Patroller's route is set out in a table of rooms to visit.
DirectionLed		The Patroller's route is set out in a table of directions to follow.
Following		The Patroller follows the best route to the player.
Aimless			The Patroller's route is random.
Targeted		The Patroller follows the best route to a destination.]

A Patroller has a MovementType.  A Patroller is usually RoomLed.

Section 1.4 - Define the types of route that a Patroller can follow

Route is a kind of value.  The Routes are OneWay, TwoWay, TwoWayRepeated and Circular.

[OneWay		The Patroller goes from A to B then stops.
TwoWay			The Patroller goes from A to B then B to A and stops.
TwoWayRepeated		The Patroller goes from A to B then B to A repeatedly.
Circular			The Patroller goes from A to B to A repeatedly.]

A Patroller has a Route. A Patroller is usually OneWay.

Section 1.5 - Specify where the Patroller's route is defined (relevant unless the Route is Aimless or Targeted)

A Patroller has a table-name called RoomTable. The RoomTable of a Patroller is usually Table of NoRooms.
A Patroller has a table-name called DirectionTable. The DirectionTable of a Patroller is usually Table of NoDirections.

Section 1.6 - Specify dummy tables for the Patroller 's route 

Table of NoRooms
TargetRoom
--
a Room

Table of NoDirections
TargetDirection
--
a Direction

Section 1.7 - Define a destination for Targeted Patrollers

A Patroller has a Room called Destination.

Section 1.8 - Define a value to determine if a Patroller is on the outward or inward journey for TwoWay and TwoWayRepeated Routes

RouteLeg is a kind of value.  The RouteLegs are OutwardBound and InwardBound.

A Patroller has a RouteLeg. A Patroller is usually OutwardBound.

Section 1.9 - Define values to determine the length of the Patroller's route and the position of the Patroller along that route

The Patroller has a number called PathLength. The PathLength of a Patroller is usually 1.
The Patroller has a number called PathStage. The PathStage of a Patroller is usually 1.

Section 1.10 - Define the probability that a Patroller will move on any given turn as a percentage

A Patroller has a number called Drive.  The Drive of a Patroller is usually 100.

Section 1.11 - Define the door opening capability of the Patroller

OpeningCapability is a kind of value.  The OpeningCapabilities are Universal, WithKey, UnlockedOnly and None.

[Universal		The Patroller can get through any locked door.
WithKey			The Patroller can get through locked doors if s/he holds the matching key.
UnlockedOnly		The Patroller can get through unlocked doors only
None			The Patroller cannot get through any closed door

Note:  Open doors are not treated as a barrier to the Patroller's movement.]

A Patroller has an OpeningCapability.  The OpeningCapability of a Patroller is usually None.

Section 1.12 - Define the door reclosing capability of the Patroller

ReclosingCapability is a kind of value.  The ReclosingCapabilities are Leave and Reinstate.

[Leave			The Patroller will not close a door after s/he has opened it.
Reinstate		The Patroller will return the door to its previous state after passing through it.]

A Patroller has a ReclosingCapability.  The ReclosingCapability of a Patroller is usually Leave.

Section 1.13 - Define the frequency of the patroller's movement

A Patroller has a number called Turn Frequency.  The Turn Frequency of a Patroller is usually 1.

[A Turn Frequency of 1 means move every turn (if the patroller is On Patrol), 2 means move every other turn, etc.]

Section 1.14 - Define  the start turn when the patroller becomes On Patrol

A Patroller has a number called StartTurn.

Section 1.15 - Define if rooms are ordinarily accessible to a patroller

To decide if (R - a room) is off-limits to (P - a Patroller):
	decide no.

Section 1.16 - Reporting movements of patrollers

Reporting Status is a kind of value.  The Reporting Statuses are Individual and Collective.
Reporting is a Reporting Status that varies.  Reporting is usually Individual.

Arrival List is a list of Patrollers that varies.
Departure List is a list of Patrollers that varies.

Section 1.17 - Flag to trap  best route returning nothing as a value

RouteAvailable is a truth state that varies.

Chapter 2 -  Patrolling Activity

Section 2.1 - Initialize Room Led Patrollers

When Play begins (this is the initialize room-led patrollers rule):
	repeat with Bod running through RoomLed Patrollers:
		now the PathLength of the Bod is the number of rows in the RoomTable of the Bod;
		now the PathStage of the Bod is 2.

Section 2.2 - Initialize Direction Led Patrollers

When Play begins (this is the initialize direction-led patrollers rule):
	repeat with Bod running through DirectionLed Patrollers:
		now the PathLength of the Bod is the number of rows in the DirectionTable of the Bod;
		now the PathStage of the Bod is 1.

Section 2.3 - Define the in-play movements of a Patroller

Every turn (this is the carry out patrolling rule):
	truncate the Arrival List to 0 entries;
	truncate the Departure List to 0 entries;
	repeat with Bod running through On Patrol Patrollers:
		if the Bod is ready to move:
			if a random chance of Drive of the Bod in 100 succeeds:
				carry out the Patrolling activity with the Bod;
	if Reporting is Collective:
		if the number of entries in the arrival list is not 0:
			report arrivals;
		if the number of entries in the departure list is not 0:
			report departures.

Chapter 3 - Define rules move moving patrollers

Section 3.1 - Set up the patrolling activity and associated variables

Patrolling something is an activity.
The Patrolling activity has a room called CurrentRoom.
The Patrolling activity has a room called NextRoom.
The Patrolling activity has a direction called Way.
The Patrolling activity has an object called Obstacle.
The Patrolling activity has a truth state called ObstacleLocked.
The Patrolling activity has a truth state called ObstacleClosed.

Section 3.2 - Before rules for the patrolling activity

Before Patrolling something (called the Bod) (this is the set current room for patrollers rule):
	if the Bod is a Patroller:
		now RouteAvailable is true;
		now the CurrentRoom is the location of the Bod.

Before Patrolling something (called the Bod) (this is the set room-led patrollers rule):
	if the Bod is a RoomLed Patroller:
		[Find the correct row in the Patroller's room table.]
		choose row PathStage of the Bod in the RoomTable of the Bod;
		[Set the NextRoom from the room table.]
		now the NextRoom is the TargetRoom entry;
		[Calculate the route to the next room.]
		let tempWay be the best route from the CurrentRoom to the NextRoom, using even locked doors;
		if tempWay is nothing:
			now RouteAvailable is false;
		otherwise:
			now the Way is tempWay.

Before Patrolling something (called the Bod) (this is the set direction-led patrollers rule):
	if the Bod is a DirectionLed Patroller:
		[Find the correct row in the Patroller's direction table.]
		choose row PathStage of the Bod in the DirectionTable of the Bod;
		[Set the direction if the Patroller is Outward Bound.]
		if the Bod is OutwardBound:
			now the Way is the TargetDirection entry;
		[Set the opposite direction if the Patroller in InwardBound.]
		if the Bod is InwardBound:
			now the Way is the opposite of the TargetDirection entry.

Before Patrolling something (called the Bod) (this is the set aimless patrollers rule):
	if the Bod is an Aimless Patroller:
		[Create a list to hold adjoining rooms.  We do this as a room on the other side of a door is not captured by the adjacent rooms command.]
		let RoomList be a list of objects;
		[Test each direction from the current room.]
		repeat with TestWay running through directions:
			[Look for rooms or doors]
			let NewPlace be the room-or-door the TestWay from the CurrentRoom;
			[if there is a room, add it to the room list.]
			if NewPlace is a room:
				unless NewPlace is off-limits to the Bod:
					add NewPlace to the RoomList;
			[if there is a door, add the other side of the door to the list.]
			if NewPlace is a door:
				unless the other side of NewPlace is off-limits to the Bod:
					add the other side of NewPlace to the RoomList;
		if the number of entries in RoomList is greater than 0:
			[Choose a random room from the list.]
			let Counter be a random number between 1 and the number of entries in RoomList;
			now NextRoom is entry Counter of RoomList;
		otherwise:
			[if there are no exits, setting the Next Room as the current room will ensure that Way is returned as nothing.]
			now NextRoom is the CurrentRoom;
		[Set the new direction to the way to the room.]
		let tempWay be the best route from the CurrentRoom to the NextRoom, using even locked doors;
		if tempWay is nothing:
			now RouteAvailable is false;
		otherwise:
			now the Way is tempWay.

Before Patrolling something (called the Bod) (this is the set following patrollers rule):
	if the Bod is Following Patroller:
		let tempWay be the best route from the CurrentRoom to the location of the player, using even locked doors;
		if tempWay is nothing:
			now RouteAvailable is false;
		otherwise:
			now the Way is tempWay.

Before Patrolling something (called the Bod) (this is the set targeted patrollers rule):
	if the Bod is Targeted Patroller:
		let tempWay be the best route from the CurrentRoom to the Destination of the Bod, using even locked doors;
		if tempWay is nothing:
			now RouteAvailable is false;
		otherwise:
			now the Way is tempWay.

Before Patrolling something (called the Bod) (this is the test obstacles for patrollers rule):
	if the Bod is a Patroller  and RouteAvailable is true:
		let Target be the room-or-door the Way from the CurrentRoom;
		if the Target is a door:
			now Obstacle is the Target;
			if the Obstacle is locked:
				now ObstacleLocked is true;
			otherwise:
				now ObstacleLocked is false;
			if the Obstacle is closed:
				now ObstacleClosed is true;
			otherwise:
				now ObstacleClosed is false;
			now NextRoom is the other side of the Target from the CurrentRoom;
		otherwise:
			now NextRoom is the Target.

Before Patrolling something (called the Bod) (this is the try opening doors for patrollers rule):
	if the Bod is a Patroller:
		if the Obstacle is an openable closed door:
			if the Obstacle is locked and the Obstacle is lockable:
				if the OpeningCapability of the Bod is Universal:
					now the Obstacle is open;
					now the Obstacle is unlocked;
					if the CurrentRoom is the location of the player and Reporting is Individual:
						report seen unlocking and opening of the obstacle by the Bod;
					if the NextRoom is the location of the player and Reporting is Individual:
						report unseen unlocking and opening of the obstacle;
				if the OpeningCapability of the Bod is WithKey:
					if the Bod encloses the matching key of the Obstacle:
						now the Obstacle is open;
						now the Obstacle is unlocked;
						if the CurrentRoom is the location of the player and Reporting is Individual:
							report seen unlocking and opening of the obstacle by the Bod;
						if the NextRoom is the location of the player and Reporting is Individual:
							report unseen unlocking and opening of the obstacle;
			otherwise if the Obstacle is unlocked:
				if the OpeningCapability of the Bod is not None:
					now the Obstacle is open;
					if the CurrentRoom is the location of the player and Reporting is Individual:
						report seen opening of the obstacle by the Bod;
					if the NextRoom is the location of the player and Reporting is Individual:
						report unseen opening of the obstacle.

Section 3.3 - Carry out moving the Patroller

For Patrolling something (called the Bod) (this is the move patrollers rule):
	if the Bod is a Patroller and RouteAvailable is true:
		unless the NextRoom is off-limits to the Bod:
			try the Bod going the Way;
		if the location of the Bod is not the CurrentRoom:
			if the location of the Bod is the location of the Player:
				if Reporting is Collective:
					add the Bod to the Arrival List;
				if Reporting is Individual:
					if the Way is up:
						report arrival of the Bod up from the CurrentRoom;
					otherwise:
						if the Way is down:
							report arrival of the Bod down from the CurrentRoom;
						otherwise:
							report arrival of the Bod coming the opposite of the Way from the CurrentRoom;
			if the location of the Player is the CurrentRoom:
				if Reporting is Collective:
					add the Bod to the Departure List;
				if Reporting is Individual:
					report departure of the Bod going the Way to the NextRoom.

Section 3.4 - After moving the Patroller

After Patrolling something (called the Bod) (this is the update route for patrollers rule):
	[Rules for Patrollers that have route tables.]
	if the Bod is a RoomLed Patroller or the Bod is a DirectionLed Patroller:
		[Only update information if the Patroller moved.]
		if the Location of the Bod is not the CurrentRoom:
			[Rules for Patrollers that are Outward Bound.]
			if the Bod is OutwardBound:
				[Increase the PathStage of the Patroller.]
				increase the PathStage of the Bod by 1;
				[Determine what happens if the Patroller is at the end of the route.]
				if the PathStage of the Bod is greater than the PathLength of the Bod:
					[OneWay Patrollers stop at the end of their route.]
					if the Bod is OneWay, now the Bod is Off Patrol;
					[TwoWay and TwoWayRepeated Patrollers retrace their route.]
					if the Bod is TwoWay or the Bod is TwoWayRepeated:
						[Set the Patroller to retrace the route.]
						now the Bod is InwardBound;
						[Set the correct stage on the route for the Patroller.]
						if the Bod is RoomLed:
							now the PathStage of the Bod is the PathLength of the Bod minus 1;
						if the Bod is DirectionLed:
							now the PathStage of the Bod is the PathLength of the Bod;
					[Circular Patrollers return to the beginning of their route.]
					if the Bod is Circular:
						now the PathStage of the Bod is 1;
			otherwise:
				[Rules for Patrollers that are InwardBound.]
				[Decrease the PathStage of the Patroller.]
				decrease the PathStage of the Bod by 1;
				[Determine what happens if the Patroller is at the beginning of the route.]
				if the PathStage of the Bod is 0:
					[TwoWay Patrollers stop when they arrive back at the beginning of their route.]
					if the Bod is TwoWay:
						now the Bod is Off Patrol;
					[TwoWayRepeated Patrollers start the route all over again.]
					if the Bod is TwoWayRepeated:
						[Set the correct stage on the route for the Patroller.]
						if the Bod is RoomLed:
							now the PathStage of the Bod is 2;
						if the Bod is DirectionLed:
							now the PathStage of the Bod is 1;
						now the Bod is OutwardBound.

After Patrolling something (called the Bod) (this is the reclose doors for patrollers rule):
	if the Bod is a Patroller:
		if the location of the Bod is not the CurrentRoom:
			if the ReclosingCapability of the Bod is reinstate:
				if the Obstacle is an openable door:
					if ObstacleClosed is true and ObstacleLocked is true:
						now the Obstacle is closed;
						now the Obstacle is locked;
						if the CurrentRoom is the location of the player and Reporting is Individual:
							report closing and locking of the obstacle by the Bod;
						if the NextRoom is the location of the player and Reporting is Individual:
							report closing and locking of the obstacle by the Bod;
					if ObstacleClosed is true and ObstacleLocked is false:
						now the Obstacle is closed;
						if the CurrentRoom is the location of the player and Reporting is Individual:
							report closing of the obstacle by the Bod;
						if the NextRoom is the location of the player and Reporting is Individual:
							report closing of the obstacle by the Bod.

After Patrolling something (called the Bod) (this is the reached destination for targeted patrollers rule):
	if the Bod is a Targeted Patroller and the location of the Bod is the Destination of the Bod:
		now the Bod is Off Patrol.

Section 3.5 - Reporting door rules

To report seen opening of (item - a door) by (Bod - a patroller):
	say "[The Bod] abre [the item]."
To report seen unlocking and opening of (item - a door) by (Bod - a patroller):
	say "[The Bod] abre [the item]."
To report unseen opening of (item - a door):
	say "Oyes como alguien abre [the item]."
To report unseen unlocking and opening of (item - a door):
	say "Oyes como alguien abre [the item]."
To report closing of (item - a door) by (Bod - a patroller):
	say  "[The Bod] cierra [the item]."
To report closing and locking of (item - a door) by (Bod - a patroller):
	say "[The Bod] cierra [the item]."

Section 3.6 - Reporting movement rules

[Disable the standard reporting rule for the arrival and departure of non-player characters whilst the patrolling activity is in progress.]

Report an actor going (this is the new describe room gone into rule):
	if the patrolling activity is not going on:
		abide by the describe room gone into rule.
		
The new describe room gone into rule is listed instead of the describe room gone into rule in the report going rulebook.

[Arrival rules used when the player is in the room when a patroller arrives.]

To report arrival of (Bod - a patroller) up from (place - a room):
	say "[The Bod] llega desde abajo."
To report arrival of (Bod - a patroller) down from (place - a room):
	say "[The Bod] llega desde arriba."
To report arrival of (Bod - a patroller) coming (way - a direction) from (place - a room):
	say "[The Bod] llega desde [the way]."
To report departure of (Bod - a patroller) going (way - a direction) to (place - a room):
	say "[The Bod] va hacia [way]."

To report arrivals:
	say "[Arrival List] llega[if the number of entries in the arrival list is greater than 1]n[end if]."

To report departures:
	say "[Departure List] se va[if the number of entries in the departure list  is greater than 1]n[end if]."

Section 3.7 - Activation rules

To activate (Bod - a patroller):
	now the Bod is On Patrol;
	now the startturn of the Bod is the turn count.

To deactivate (Bod - a patroller):
	now the Bod is Off Patrol.

Section 3.8 - Rule for deciding if it is the patroller's turn to move

To decide if (Bod - a patroller) is ready to move:
	[calculate how many turns have elapsed since the patroller was activated]
	let elapsed turns be the turn count minus the StartTurn of the Bod;
	[a simple error check to prevent division by 0]
	if the Turn Frequency of the Bod is less than 1:
		now the Turn Frequency of the Bod is 1;
	[calculate whether the elapsed turns is exactly divisible by the Turn Frequency]
	let decision be the remainder after dividing the elapsed turns by the Turn Frequency of the Bod;
	if decision is 0 and the location of the Bod is a room:
		decide yes;
	decide no.

Chapter 4 - Error Checking - Not for release

Section 4.1 - Code for validation

To Terminate: (- quit; -).
To say Patroller Error:
	say "[bold type]*** Error de Validación de la Extensión Patrollers ***[roman type][paragraph break]".
To say Correct Code:
	say "Debido a este problema la fuente no puede ser traducida en un juego funcional (corrija la fuente y vuelva a pulsar en Go).".

Section 4.2 - Validation

When play begins (this is the validate patrollers rule):
	repeat with Bod running through Patrollers:
		if the Bod is RoomLed and the RoomTable of the Bod is Table of NoRooms:
			say "[Patroller Error]";
			say "Has creado un Patroller guiado por habitaciones (RoomLed) sin que tenga una tabla de habitaciones (RoomTable).[paragraph break]";
			say "[Correct Code]";
			Terminate;
		if the Bod is DirectionLed and the DirectionTable of the Bod is Table of NoDirections:
			say "[Patroller Error]";
			say "Has creado un Patroller guiado por direcciones (DirectionLed) sin una tabla de direcciones (DirectionTable).[paragraph break]";
			say "[Correct Code]";
			Terminate;
		if the Bod is Targeted and the Destination of the Bod is not a room:
			say "[Patroller Error]";
			say "Has creado un Patroller guiado por objetivo (Targeted) sin un objetivo (Destination)..[paragraph break]";
			say "[Correct Code]";
			Terminate;
		if the Drive of the Bod is less than 0 or the Drive of the Bod is greater than 100:
			say "[Patroller Error]";
			say "Has creado un Patroller con valor de Drive que no está entre 0 y 100.[paragraph break]";
			say "[Correct Code]";
			Terminate;
		if the Turn Frequency of the Bod is less than 1:
			say "[Patroller Error]";
			say "Has creado un Patroller con una frecuencia (Turn Frequency) que es menor que 1.[paragraph break]";
			say "[Correct Code]";
			Terminate;

Patrollers SP ends here.

---- DOCUMENTATION ---- 

Patroller es una extensión que permite definir rutas para personajes no jugadores, de forma que las sigan durante el juego.

Chapter: lo nuevo

Section: Version 10

- los 'statuses' Active y Inactive se han renombrado a On Patrol y Off Patrol ya que la versión 6E59 de Inform 7 usa los otros.

- Se han retirado los 'phrases' de la extensión que ya no tenían sentido.

Section: Version 9

El atributo 'Frequency' se ha cambiado a 'Turn Frequency' para evitar un problema de nombrado con otra extensión.

Section: Version 8

- permite el uso de reportes conjuntos para indicar la llegada y la marcha de 'patrollers'.

Section: Version 7

- permite indicar localizaciones que estén fuera del alcance de determinados 'patrollers' de forma que no entren en ellas.

- se cambia el código para usar la nueva sintaxis de bloques de Inform.

Section: Version 6

- Resuelve un error que causaba que los 'patrollers' activo  que estuviese 'fuera del mundo' o sin salidas provocaban la ruptura del juego.

- Se adapta para que sea compativle con la versión 5T13.

Section: Version 5

Version 5:

- Mejora la regla 'before rule for aimless patrollers' de forma que habitaciones adyacente mediante una puerta tiene la misma probabilidad de ser escogidas que aquellas con conexión directa.

- Resuelve un erros que impedía que los personajes en modo 'TwoWayRepeated' reiniciasen sus rutas.

- Separa las frases que se muestran en reglas separadas.

- Añade un modo de seguimiento del jugador.

- Añade el valor de frecuencia para modular la velocidad de movimiento del personaje móvil.

- Añade comandos de activación y desactivación de los personaje móviles.

Version 5 requiere la release 5J39 de Inform 7.

Section: Version 4 

Esta versión resuelve errores que impedian a los personajes cruzar puertas.

Section: Version 3

Esta versión resuelve problemas de compatibilidad.

Section: Version 2

Se han añadido las siguientes capacidades:

- Definir la probabilidad de que un personaje se mueva en cualquier turno.

- Definir si un personaje puede cruzar o no puertas cerradas.

- Definir si un personaje puede cerrar las puertas tras de sí o no.

- Rutinas de verificación de errores.

- Las reglas han sido nombradas.

- Mejoras en la documentación.

Chapter: Creando un personaje móvil

Section: Usando la clase Patroller

Para crear un personaje movil se le define de clase Patroller.

	The perro is a Patroller in the Dog Kennel.

Section: Iniciando y deteniendo un personaje móvil

Un personaje móvil empieza el juego siendo un personaje inactivo. Así que debe ser indicado explícitamente cuando inician su ruta. Para lograr esto usamos la frase 'Activate <personaje>'. Se pude hacer esto por el ejemplo en las reglas de inicio de juego o cualqier otra regla:

	When play begins:
		activate the Dog.

	After opening the gate:
		activate the Dog.

Podemos de forma similar detener el personaje móvil:

	After giving the bone to the dog:
		deactivate the dog.

Section: Especificando la posibilidad de que un personaje móvil se mueva

Podemos especificar cómo de probable es que un personaje móvil se mueva en cada turno seleccionando un valor para el atributo 'Drive' entre 0 y 100. Un valor de 100 implica que el personaje se mueve siempre. Un ejemplo con un 40% sería:

	The Drunken Lord is a Patroller in the Bar.  The Drunken Lord is Aimless.
	The Drive of the Drunken Lord is 40.

Section: Indicando la frecuencia con el que los personajes se mueven

Se puede fijar si el personaje móvil se mueve cada turno, cada dos turnos, etc... dando un valor al atributo Frequency. Un valor de 1 indica cada turno, 2 cada dos turnos, etc... Por defecto los personajes móviles se mueven cada turno.

	The Sightseer is a Patroller in the Quadrangle.  The Turn Frequency of the Sightseer is 4.

Los personajes se mueven siempre el primer turno cuando son activados (On Patrol).

Si el valor de Turn Frequency es inferior a 1, se indicará el error.

Chapter: Definiendo la ruta de un personaje móvil 

Section: Introducción

Se puede especificar el tipo de ruta que el personaje seguirá. Las posibilidades son:

Section:  RoomLed

La ruta en este caso estará definida por una lista de localidades que el personaje habrá de visitar. Si usamos este modo hay que definir la propiedad 'RoomTable'. Además la primera habitación de la tabla debe ser necesariamente la localización inicial del personaje móvil.

	The perro is a Patroller in the Dog Kennel.  The perro is RoomLed.
	The RoomTable of the perro is the Table of Walkies.

	Table of Walkies
	TargetRoom
	Dog Kennel
	Front Yard
	Main Street
	Local Butchers

Section: DirectionLed

La ruta en este caso estará definida por una tabla de direcciones que habrán de seguirse. Si usamos este modo hay que definir la propiedad 'DirectionTable'.

	The perro is a Patroller in the Dog Kennel.  The perro is DirectionLed.
	The DirectionTable of the perro is the Table of Walkies.

	Table of Walkies
	TargetDirection
	North
	East
	Southwest
	Up

Section: Aimless

El personaje móvil vaga de forma arbitraria.

	The perro is a Patroller in the Dog Kennel.  The perro is Aimless.

Section: Following

El personaje móvil persigue al jugador.

	The sycophant is a Patroller in the Palace.  The sycophant is following.

Section: Targeted

El personaje móvil se dirije jacia una localización determinada. Esta localización habrá de ser indicada en el atributo 'Destination'. Cuando se alcanza el destino el personaje móvil se torna inactivo.

	The perro is a Patroller in the Dog Kennel.  The perro is Targeted.
	The Destination of the perro is the Local Butchers.

Chapter: Definiciendo cuántas veces el personaje recorre la ruta

Section: Introducción

Si la ruta está definida por una tabla de localizaciones o de direcciones podemos además definir cuántas veces recorre ese ruta. Las posibilidades son:

Section: OneWay

Solo realizan esta ruta una vez y se detienen.

	The dog is a Patroller in the Dog Kennel.  The dog is RoomLed.  The dog is OneWay.
	The RoomTable of the dog is the Table of Walkies.

	Table of Walkies
	TargetRoom
	Dog Kennel
	Front Yard
	Main Street
	Local Butchers

Section: TwoWay

Recorren la ruta, regresan y luego se paran.

	The dog is a Patroller in the Dog Kennel.  The dog is RoomLed.  The dog is TwoWay.
	The RoomTable of the dog is the Table of Walkies.

	Table of Walkies
	TargetRoom
	Dog Kennel
	Front Yard
	Main Street
	Local Butchers


Section: TwoWayRepeated

Recorren la ruta y vuelven una y otra vez...

	The dog is a Patroller in the Dog Kennel.  The dog is RoomLed.  The dog is TwoWayRepeated.
	The RoomTable of the dog is the Table of Walkies.

	Table of Walkies
	TargetRoom
	Dog Kennel
	Front Yard
	Main Street
	Local Butchers


Section: Circular

Realizan la ruta una y otra vez, siempre empezando por el principio.

	The dog is a Patroller in the Dog Kennel.  The dog is RoomLed.  The dog is Circular.
	The RoomTable of the dog is the Table of Walkies.

	Table of Walkies
	TargetRoom
	Dog Kennel
	Back Yard
	Greenhouse
	Side Passage
	Front Yard
	[There should be a route from the Front Yard to the Dog Kennel for the dog to follow]
	
Chapter: Abrir puertas

Section: Introducción

El personaje puede encontrar puertas entre las localidades. Podemos especificar si el personaje puede o no pasar abriendo las puertas cerradas según lo que configuremos en el atributo 'OpeningCapability'. Las reglas de apertura de puertas están sujetas a las siguientes limitaciones.

El personaje podrá siempre atravesar puertas abiertas.
Si la puerta está cerrada con llave y no puede ser abierta, el personaje no podrá pasar por ella.
Si la puerta está cerrada y no es abrible, el personaje no podrá pasar por ella.

Considerando estas limitaciones, tenemos las opciones de:

Section: Universal

El personaje puede abrir cualquier puerta que sea abrible, incluso si el personaje no lleva las llaves adecuadas.

	The guard is a patroller in the guard room.  The guard is targeted.  The destination of the guard is the High Security Unit.
	The OpeningCapability of the guard is universal.

Section: WithKey


El personaje puede abrir las puertas a no ser que no sean abribles, si están cerradas con llave el personaje tendrá que portar la llave correspondiente.

	The robot is a patroller in the store room.  The robot is aimless.
	The OpeningCapability of the robot is WithKey.

Section: UnlockedOnly

El personaje sólo puede abrir y cerrar las puertas que no estén cerradas con llave.

	The prisoner is a patroller in the exercise yard.  The prisoner is targeted.  The destination of the prisoner is the Gatehouse.
	The OpeningCapability of the prisoner is UnlockedOnly.

Section: None

El personaje no abre puertas.

	The black mamba is a patroller in laboratory.   The black mamba is aimless.
	The OpeningCapability of the black mamba is None.

Por defecto se usará la opción 'None'.

Chapter: Volver a cerrar las puertas

Section: Introducción

Tras pasar por una puerta el personaje puede dejarla en el estado que se la encontró o no. Las opciones son:

Section: Leave

El personaje no hace ningún intento de cerrar las puertas tras de sí.

	The naughty girl is a patroller.  The naughty girl is aimless.
	The OpeningCapability of the naughty girl is UnlockedOnly.  The ReclosingCapability of the naughty girl is Leave.

Esta es la opción por defecto.

Section: Reinstate

El personaje cerrará las puertas que haya abierto. Y si tenían la llave echada las cerrará con llave.

	The parent is a patroller.  The parent is aimless.
	The OpeningCapability of the parent is UnlockedOnly.  The ReclosingCapability of the parent is Reinstate.

Chapter: Textos de resultado

Section: Clases de reportes

Hay dos formas de reporte incluídos por ls extensión.  La opción por defecto es "Individual". Con esta opción cada llegada o partida de los 'patroller' se informarán de forma separada. Si hay muchos 'patrollers' eso puede llevar a un número excesivo de reportes individuales, si tiene esa clase de problemas fije como modo de reporte "Collective". Con este modo se indicará una simple línea indicando quiénes aparecen o se van de la localización.

La forma de seleccionar un tipo de reporte u otro es:

	Now Reporting is Collective;
	Now Reporting is Individual.

Véase "January Sales" como ejemplo de ambas clases de reporte..

Section: Moviendo el personaje

La llegada y marcha de los personaje es manejada por cinco frases de reporte. Podemos usar nuestras propias frases para reemplezar las que están incorporadas por defecto.

To report arrival of (bod - a patroller) up from (place - a room): say "[The bod] llega desde abajo.[line break]"

To report arrival of (bod - a patroller) down from (place - a room): say "[The bod] llega desde arriba.[line break]"

To report arrival of (bod - a patroller) coming (way - a direction) from (place - a room): say "[The bod] llega desde [the way].[line break]"

To report departure of (bod - a patroller) going (way - a direction) to (place - a room): say "[The bod] va hacia [way].[line break]"

Para cambiar cualquiera de ellas, crearemos nuestro propio "To report..." usando la misma sintaxis mostrada antes. Véase el ejemplo "January Sales" a modo de ejemplo.

Section: Abriendo y cerrando puertas

Similarmente hay seis frases que describen las acciones de abrir y cerrar las puertas:

To report seen opening of (item - a door) by (bod - a patroller): say "[The bod] abre [the item].[line break]".

To report seen unlocking and opening of (item - a door) by (bod - a patroller): say "[The bod] abre [the item].[line break]".

To report unseen opening of (item - a door): say "Escuchas como alguien abre [the item].[line break]".

To report unseen unlocking and opening of (item - a door): say "Escuchas como alguien abre [the item].[line break]".

To report closing of (item - a door) by (bod - a patroller): say  "[The Bod] cierra [the item].[line break]".

To report closing and locking of (item - a door) by (bod - a patroller): say "[The Bod] cierra [the item].[line break]".

Para cambiar cualquiera de ellas, crearemos nuestro propio "To report..." usando la misma sintaxis mostrada antes. Véase el ejemplo "The Butler" a modo de ejemplo.

Chapter: Limitando los movimientos de un patroller

Section: Posición por defecto

La forma de indicar que un patroller no debe entrar en alguna parte sería:

	To decide if (R - a Room) is off-limits to (P - a Patroller):
		decide no.

Section: Creando tus propias restricciones

Un ejemplo:

	To decide if (R - a Room) is off-limits to (P - a Patroller):
		conditions to bar or allow access;
			decide yes or no;
		other conditions to bar or allow access;
			decide yes or no;
		any further conditions to bar or allow access;
			decide year or no;
		decide no.

Siempre debería terminar con un "decide no." para que de esta forma el resto de los lugares estén dentro del ámbito del personaje no jugador.

Con más de un personaje no jugador se haría:

	To decide if (R - a Room) is off-limits to (P - a Patroller):
		if P is NPC1:
			conditions to bar or allow access;
				decide yes or no;
		if P is NPC2:
			conditions to bar or allow access;
				decide yes or no;
		decide no.

Section: Para impedir que se alcande una determinada habitación

	To decide if (R - a Room) is off-limits to (P - a Patroller):
		if R is the quagmire:
			decide yes;
		decide no.

	To decide if (R - a Room) is off-limits to (P - a Patroller):
		if R is the Dog House and P is the cat:
			if the location of the Dog is R:
				decide yes;
			decide no;
		decide no.
		
Section: Restricciones usando reguiones

Restingirlo a una región:

	To decide if (R - a Room) is off-limits to (P - a Patroller):
		if P is the troubled spirit:
			if the map region of R is the Graveyard:
				decide no;
			decide yes;
		decide no.

Impidiendo que entra en una región:

	To decide if (R - a Room) is off-limits to (P - a Patroller):
		if P is the traunt:
			if the map region of R is the School Complex:
				decide yes;
			decide no;
		decide no.

El ejemplo "Border Dispute" muestra algunos ejemplos.

No se han traducido los ejemplos.

Example: * The Chase - A short example to show the patrolling rules.

	*: "The Chase" by Michael Callaghan

	Include Patrollers by Michael Callaghan.

	The Guard Room is a room.  "From the guard room you can watch the movements of the prisoner on the monitors". 
	The Empty Corridor is a room.  "A deserted corridor leads from the Guard Room to the Exercise Yard".  The Empty Corridor is east of the Guard Room. 
	The Exercise Yard is a room.  "Here the prisoners can take their ten minute constitutional before being slammed back into their cells".  The Exercise Yard is east of the Empty Corridor. 
	The Rest Room is a room.  "The rest room is where off-duty guards can take their well deserved naps".  The Rest Room is south of the Guard Room.  The Rest Room is southwest of the Empty Corridor. 
	The Observation Room is a Room.  "Here guards can look in on the high security cell to check that the prisoner is OK".  The Observation Room is east of the Rest Room.  The Observation Room is  southwest of the Exercise Yard. 
	The Cell is a room.  "Only 10 feet by 10 feet - this is where high security prisoners are kept under close observation".   The Cell is south of the Exercise Yard.
	The Red Door is east of the Observation Room and west of the cell.  The Red Door is a door.  The red door is closed and unlocked.
  
	The Prisoner is a Patroller in the Cell.
	The Prisoner is Circular.
	The Prisoner is DirectionLed.
	The DirectionTable of the Prisoner is Table of Escape.
	The OpeningCapability of the Prisoner is UnlockedOnly.
	The ReclosingCapability of the Prisoner is Reinstate.

	Table of Escape
	TargetDirection
	North
	West
	West
	South
	East
	East

	The monitor is scenery in the Guard Room.

	The dog is a Patroller in the Guard Room.  The dog is Aimless.  The OpeningCapability of the Dog is none.

	When play begins:
		say "Here you are all alone on duty and the electronic locks chose this moment to fail. The prisoner is on the loose and the only way to retrieve him is to send the guard dog out.  There is no way that you want to tackle him.";
		activate the Prisoner;
		activate the Dog.

	Instead of examining the monitor:
		say "The monitor shows that the prisoner is in [the location of the prisoner] and the dog is in [the location of the dog]."
	Instead of going somewhere from the Guard Room:
		say "The prison rules are very clear on this point.  if a prisoner escapes, you must remain in the guard room and monitor the situation."

	Every turn:
		try examining the monitor;
		if the location of the dog is the location of the prisoner:
			if the location of the dog is the location of the player:
				say "In front of your eyes, the dog leaps on the prisoner and pins him to the ground.";
			if the location of the dog is not the location of the player:
				say "The fearsome sounds of the dog's barking tells you that the prisoner has been apprehended.";
			end the story finally.

	Test me with "wait / wait / wait / wait / wait / wait / wait / wait / wait / wait".

Example: * The Butler - A short example to show door opening by a patroller.

	*: "The Butler" by Michael Callaghan

	Include Patrollers by Michael Callaghan.

	The library is a room.  The description is "Lord Powell's collection of books is impressive.  The complete works of Enid Blyton vie for space with several thumb eared Paddington books - all contained within rickety plywood bookcases."

	Books are scenery in the library.  "You do not have time to read at the moment.  Lord Powell is expecting you for dinner and his errant nephew has locked you in the library."

	Understand "book" as books.  Instead of taking the books, try examining the books instead.

	Rickety plywood bookcases are scenery in the Library.  "The bookcases look to have been knocked together in 15 minutes by the well known carpenters 'Bodgit and Co.'"  Understand "bookcase" as the bookcases.  The bookcases are a supporter.

	After examining the bookcases:
		say "You notice Lord Powell's favourite hip flask hidden behind a book.";
		now the hip flask is on the bookcases.

	The hip flask is a thing.  "Hip flask."  The description is "Finely wrought in solid silver.  Sadly it is empty."

	Instead of pulling the bell cord:
		say "There is an imperceptible movement as the well hidden butler's door slides open (and closes again) as the butler glides into the room.";
		now the Butler is in the library.

	The Bell Cord is fixed in place in the Library.  "A bell cord hangs down".  The description is "One pulls it to summon the butler."

	Instead of taking the bell cord:
		say "That would not do.  Just try pulling it."

	The butler is a patroller.  "Lord Powell's butler."  The description is "Dressed in traditional butler's garb with his hair neatly parted, the butler is every inch the perfect gentleman's servant."

	The Butler is RoomLed.  The RoomTable of the Butler is Table of Manor Rooms.  The Butler is OneWay.

	Table of Manor Rooms
	TargetRoom
	The Library
	The Hallway
	The Dining Room

	The OpeningCapability of the Butler is Universal.  The ReClosingCapability of the Butler is Leave.

	The Library Door is a door.  It is closed and locked.
	The Library Door is north of the Library and south of the Hallway.

	The Hallway is a room.  "The parquet flooring has been polished to a high gloss.  Oak panels line the walls."

	The Dining Room is a room.  "The Lord and his family are seated, waiting for you to arrive for dinner."  The Dining Room is east of the Hallway.

	Instead of giving the hip flask to the butler:
		say "The butler thanks you profusely.  'I must take this to his Lordship immediately.'";
		now the butler carries the hip flask;
		activate the Butler.

	To report seen unlocking and opening of (item - a door) by (Bod - a patroller):
		if the Bod is the butler:
			say "The butler glides over to the library door and with a deft wrist movement unlocks and opens it.";
		otherwise:
			say "[The Bod] unlocks and opens [the item]."

	Test me with "open door / get book / x bookcase / get flask / x cord / pull cord / give flask to butler / n / e".

Example: ** January Sales - A short example to show patrollers moving on different turns.

	*: "January Sales" by Michael Callaghan

	Include Patrollers by Michael Callaghan.

	Sale Hall is a room.  "The season's bargains are piled high.  Even at 20p, it is unlikely that 2007 diaries will sell well but for those prepared to rummage there are bargains to be found.[if we have not opened the glass doors]  Through the glass doors you can see the crowds of people are waiting outside Tramlaw for the start of the January sales."

	The Entrance is a room.

	Amy is a patroller in the Entrance.  Amy is targeted.  The destination of Amy is Cubicle One.  The Turn Frequency of Amy is 1.
	Beth is a patroller in the Entrance.  Beth is targeted.  The destination of Beth is Cubicle Two.  The Turn Frequency of Beth is 2.
	Charlie is a patroller in the Entrance.  Charlie is targeted.  The destination of Charlie is Cubicle Three.  The Turn Frequency of Charlie is 3.

	A door called the Glass Doors is east of the Entrance and west of the Sale Hall.  The glass doors are closed and unlocked.  The glass doors are scenery.

	The Fitting Rooms is a region.

	Cubicle One is a room in the Fitting Rooms.  Cubicle One is east of the Sale Hall.  "A simple cubicle for trying on clothes before purchasing them."

	Cubicle Two is a room in the Fitting Rooms.  Cubicle Two is southeast of the Sale Hall.  "A simple cubicle for trying on clothes before purchasing them."

	Cubicle Three is a room in the Fitting Rooms.  Cubicle Three is south of the Sale Hall.  "A simple cubicle for trying on clothes before purchasing them."

	When play begins:
		Now Reporting is Collective.

	After opening the doors for the first time:
		say "You are nearly knocked over as the bargain hunters stampede into the store.";
		activate Amy;
		activate Beth;
		activate Charlie.

	To report departure of (Bod - a patroller) going (way - a direction) to (place - a room):
		if the map region of the place is Fitting Rooms:
			say "[The Bod] goes [way] to [place] to try on [one of]a satin evening dress[or]a cashmere shawl[or]a pair of Lycra running shorts[or]a pair of high heel boots[at random].";
		otherwise:
			say "[The Bod] goes [way] to [place]."

	Instead of going west from the Sale Hall when the Glass Doors are open:
		say "You cannot leave the store whilst the sales are on."

	Instead of going to Cubicle One when the number of patrollers in Cubicle One is greater than 0:
		say "You cannot enter a fitting room when it is occupied."

	Instead of going to Cubicle Two when the number of patrollers in Cubicle Two is greater than 0:
		say "You cannot enter a fitting room when it is occupied."

	Instead of going to Cubicle Three when the number of patrollers in Cubicle Three is greater than 0:
		say "You cannot enter a fitting room when it is occupied."

	Every turn when the location is the Sale Hall:
		let count be the number of patrollers in the Sale Hall;
		if count is greater than 0:
			now Reporting is Individual;
			if count is 1, say "[list of patrollers in the Sale Hall] rummages for a bargain.";
			if count is greater than 1, say "[list of patrollers in the Sale Hall] are rummaging for bargains.". 

	Test me with "open doors / wait / wait / wait / w / e"

Example: ** Border Dispute - A short example to show setting regions off-limits to patrollers

	*: "Border Dispute" by Michael Callaghan

	Include Patrollers by Michael Callaghan.

	Balonia is a region.  Tripea is a region.

	The Observation Post is a room.  "You have been here for days watching for border disputes between Balonia and Tripea.  Any territorial incursion by the countries' respective guards could bring about a nasty war.  It is with some trepidation that you watch the guard wander around the border zone."

	Hilltop is a room in Balonia.
	Empty meadow is a room in Balonia.
	Control point is a room in Balonia.
	West border crossing is a room in Balonia.

	Rolling plains is a room in Tripea.
	Rough terrain is a room in Tripea.
	East border crossing is a room in Tripea.
	Commanding Heights is a room in Tripea.

	Empty meadow is east of Hilltop.  Control point is south of Hilltop.  West border crossing is southeast of Hilltop.
	Control point is southwest of Empty meadow.  Control point is west of West border crossing.  West border crossing is south of Empty meadow.

	Rough terrain is east of Rolling plains.  East border crossing is south of Rolling plains.  Commanding Heights is southeast of Rolling plains.
	Rough terrain is northeast of East border crossing.  Rough terrain is north of Commanding Heights.  Commanding Heights is east of East border crossing.

	Rolling plains is east of Empty meadow.  East border crossing is east of West border crossing.  East border crossing is southeast of Empty meadow.  Rolling plains is northeast of West border crossing.

	The Balonian Guard is a patroller in Hilltop.  The Tripean Guard is a patroller in Rolling plains.
	The Tripean Guard is aimless.  The Balonian Guard is aimless.

	When play begins:
		activate the Tripean Guard;
		activate the Balonian Guard.

	Every turn:
		say "You note that the Tripean Guard is in the [the location of the Tripean Guard] in [map region of the location of the Tripean Guard] and the Balonian Guard is in the [the location of the Balonian Guard] in [map region of the location of the Balonian Guard].  ";
		if the map region of the location of the Balonian Guard is Tripea:
			say "It looks like Balonia has invaded Tripea.  All hell is likely to break loose any time soon.  ";
		if the map region of the location of the Tripean Guard is Balonia:
			say "It looks like Tripea has invaded Balonia.  Standby for fireworks.  ";
		if the location of the Balonian Guard is adjacent to the location of the Tripean Guard:
			say "The two guards eyeball each other across the border, but neither is willing to enter the other's territory.  You breath a sigh of relief.  ";
		say "[paragraph break]".

	To decide if (R - a Room) is off-limits to (P - a Patroller):
		if P is the Balonian Guard:
			if the map region of R is Balonia:
				decide no;
			decide yes;
		if P is the Tripean Guard:
			if the map region of R is Tripea:
				decide no;
			decide yes;
		decide no.

	Test me with "z /z /z/z/z/z/z/z/z/z/z/z". 