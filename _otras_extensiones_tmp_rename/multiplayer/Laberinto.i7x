Version 1.0.0 of Laberinto by Sebastian Arg begins here.

"Motor generico de generacion procedural de laberintos."

[ RECONSTRUCCION (2026): el archivo original 'Laberinto by Sebastian Arg' (2009,
  build 6G60) se perdio - no aparecio en ningun backup ni repositorio disponible.
  MultiMaze/story.ni depende de el en mas de 15 lugares (labyrinth room, shape,
  map legend, position...at, grid position, unvisited, unplaced, etc), asi que
  esta version fue reconstruida desde cero tomando como referencia el motor de
  laberinto real usado por "The Reliques of Tolti-Aph" de Eric Eve (Seccion E,
  "Eastern Quarter" - Spatial coordinates / Shapes / Labyrinth rooms / Solid
  Rock / Terra Incognita / Exhausting and retrieving / Exploring the labyrinth),
  que es exactamente la fuente que el propio autor de MultiMaze cito en la
  descripcion del juego ("Parte del codigo fue tomado del juego Reliquias de
  Tolti Aph, seccion laberinto"). Se tradujeron a espanol los nombres de sala
  generados, las leyendas y los mensajes de juego; se mantuvieron en ingles los
  nombres de kind/propiedad/frase (labyrinth room, shape, map legend, position
  ... at ..., grid position, unvisited, unplaced, etc) porque MultiMaze/story.ni
  ya los usa textualmente y no se debe romper esa API. Se removio todo lo que
  era especifico de Tolti-Aph (Hedge Archway, Budless Grove, monstruos,
  Deep Pool Environs, la 'solitaire game') y se agrego un pool propio de salas
  en blanco para que el laberinto tenga extension real. Ver memoria del
  proyecto "labs" (topic: project/multimaze-port) para el detalle completo.
]

Chapter 1 - Spatial coordinates

A spatial coordinate is a kind of value. <9,24,24> specifies a spatial coordinate with parts maze level, easting (without leading zeros), northing (without leading zeros).

A room has a spatial coordinate called grid position.

Definition: a room is unplaced if its grid position is <0,0,0>.

To decide which number is the current maze level:
	let L be the maze level part of the grid position of the location;
	decide on L.

The previous maze level is a number that varies.

Before going:
	now the previous maze level is the current maze level.

A direction has a spatial coordinate called vector. North has vector <0,0,1>. South has vector <0,0,24>. East has vector <0,1,0>. West has vector <0,24,0>. Down has vector <1,0,0>. Up has vector <9,0,0>.

Definition: A direction is non-vectorial rather than vectorial if its vector is <0,0,0>.

Definition: A direction is vertical if it is up or it is down.

[ NOTA DE PORT (2026): el constructor nativo de Inform para kinds "with parts"
  ("the K with P1 part V1 P2 part V2...") esta roto en este build de 10.1.2 -
  falla incluso con el ejemplo textual de la documentacion oficial (Writing
  with Inform 15.14/15.15, "aspect ratio with width part W height part H").
  Reproducido en un proyecto aislado sin ninguna extension de por medio. La
  extraccion de partes (easting part of X, etc) SI funciona bien; solo la
  construccion desde partes esta rota. Se reemplaza por una fase propia con
  I6 crudo, verificada con un round-trip (empaquetar y luego extraer da los
  mismos numeros) contra el empaquetado real que usa Inform para un kind
  declarado como "<9,24,24> specifies ... with parts A, B, C": valor = A*625
  + B*25 + C (mismos modulos 10/25/25 que ya usaba la aritmetica vectorial
  original de Tolti-Aph, asi que el empaquetado coincide con lo que el propio
  motor original asumia). ]
To decide which spatial coordinate is coordinates (L - a number) by (E - a number) by (N - a number):
	(- ({L} * 625 + {E} * 25 + {N}) -)

To decide which spatial coordinate is the vector sum of (V1 - a spatial coordinate) and (V2 - a spatial coordinate):
	let L be the maze level part of V1 plus the maze level part of V2;
	let L be the remainder after dividing L by 10;
	let E be the easting part of V1 plus the easting part of V2;
	let E be the remainder after dividing E by 25;
	let N be the northing part of V1 plus the northing part of V2;
	let N be the remainder after dividing N by 25;
	if L is 0 or L is 9, decide on <0,0,0>;
	if E is 0 or E is 24, decide on <0,0,0>;
	if N is 0 or N is 24, decide on <0,0,0>;
	let the sum be coordinates L by E by N;
	decide on the sum.

Chapter 2 - Shapes of individual rooms in the labyrinth

A percentage is a kind of value. 100% specifies a percentage with parts parts per hundred.

Labyrinth shape is a kind of value. L9/1-1-1-1-1-1 specifies a labyrinth shape with parts open space, U, D, N, E, S, W.

Table of Shape Frequencies
shape		shape name					legend	frequency	shape count
L1/0-0-1-1-1-1	"Cueva de los Cuatro Caminos"			"-O-"	6%	a number
L1/0-0-0-1-1-1	"Camara Este-Sur-Oeste"				"-O-"	2%
L1/0-0-1-0-1-1	"Camara Norte-Sur-Oeste"			"-O "	2%
L1/0-0-1-1-0-1	"Camara Norte-Este-Oeste"			"-O-"	2%
L1/0-0-1-1-1-0	"Camara Norte-Este-Sur"				" O-"	2%
L1/1-0-0-1-1-1	"Amplia Camara Este-Sur-Oeste"			"-O-"	2%
L1/1-0-1-0-1-1	"Amplia Camara Norte-Sur-Oeste"			"-O "	2%
L1/1-0-1-1-0-1	"Amplia Camara Norte-Este-Oeste"		"-O-"	2%
L1/1-0-1-1-1-0	"Amplia Camara Norte-Este-Sur"			" O-"	2%
L1/0-1-0-1-1-1	"Camara Este-Sur-Oeste cubierta de musgo"	"-O-"	2%
L1/0-1-1-0-1-1	"Camara Norte-Sur-Oeste cubierta de musgo"	"-O "	2%
L1/0-1-1-1-0-1	"Camara Norte-Este-Oeste cubierta de musgo"	"-O-"	2%
L1/0-1-1-1-1-0	"Camara Norte-Este-Sur cubierta de musgo"	" O-"	2%
L0/0-0-1-1-1-1	"Cruce de Cuatro Caminos"			"-+-"	6%
L0/0-0-0-1-1-1	"Cruce Este-Sur-Oeste"				"-o-"	2%
L0/0-0-1-0-1-1	"Cruce Norte-Sur-Oeste"				"-o "	2%
L0/0-0-1-1-0-1	"Cruce Norte-Este-Oeste"			"-o-"	2%
L0/0-0-1-1-1-0	"Cruce Norte-Este-Sur"				" o-"	2%
L0/1-0-0-1-1-1	"Cruce Este-Sur-Oeste, lleno de polvo"		"-o-"	2%
L0/1-0-1-0-1-1	"Cruce Norte-Sur-Oeste, lleno de polvo"	"-o "	2%
L0/1-0-1-1-0-1	"Cruce Norte-Este-Oeste, lleno de polvo"	"-o-"	2%
L0/1-0-1-1-1-0	"Cruce Norte-Este-Sur, lleno de polvo"		" o-"	2%
L0/0-1-0-1-1-1	"Estrecho Cruce Este-Sur-Oeste"			"-o-"	2%
L0/0-1-1-0-1-1	"Estrecho Cruce Norte-Sur-Oeste"		"-o "	2%
L0/0-1-1-1-0-1	"Estrecho Cruce Norte-Este-Oeste"		"-o-"	2%
L0/0-1-1-1-1-0	"Estrecho Cruce Norte-Este-Sur"			" o-"	2%
L0/0-0-1-0-1-0	"Tunel Norte-Sur"				" | "	4%
L0/0-0-0-1-0-1	"Tunel Este-Oeste"				"---"	4%
L0/0-0-1-1-0-0	"Recodo Norte-Este"				" \-"	4%
L0/1-0-1-1-0-0	"Recodo Norte-Este, resquebrajado"		" \-"	2%
L0/0-1-1-1-0-0	"Angosto Recodo Norte-Este"			" \-"	2%
L0/0-0-0-1-1-0	"Recodo Sur-Este"				" /-"	4%
L0/1-0-0-1-1-0	"Recodo Sur-Este, resquebrajado"		" /-"	2%
L0/0-1-0-1-1-0	"Angosto Recodo Sur-Este"			" /-"	2%
L0/0-0-0-0-1-1	"Recodo Sur-Oeste"				"-\ "	4%
L0/1-0-0-0-1-1	"Recodo Sur-Oeste, resquebrajado"		"-\ "	2%
L0/0-1-0-0-1-1	"Angosto Recodo Sur-Oeste"			"-\ "	2%
L0/0-0-1-0-0-1	"Recodo Norte-Oeste"				"-/ "	4%
L0/1-0-1-0-0-1	"Recodo Norte-Oeste, resquebrajado"		"-/ "	2%
L0/0-1-1-0-0-1	"Angosto Recodo Norte-Oeste"			"-/ "	2%

Chapter 3 - Labyrinth rooms

A labyrinth room is a kind of room. A labyrinth room has a labyrinth shape called shape. A labyrinth room has a text called map legend. A labyrinth room usually has map legend "-+-". A labyrinth room has a number called minimum level. A labyrinth room usually has minimum level 1.

Definition: A labyrinth room is unshaped if its shape is L0/0-0-0-0-0-0.

Definition: A labyrinth room is ascending rather than non-ascending if the U part of its shape is 1 and the maze level part of its grid position is not 1.

Definition: A labyrinth room is descending rather than non-descending if the D part of its shape is 1 and the maze level part of its grid position is not 9.

After printing the name of an ascending labyrinth room, say " con escalera hacia arriba".
After printing the name of an descending labyrinth room, say " con escalera hacia abajo".

[Al empezar el juego, hay un gran stock de salas de laberinto sin forma ni
posicion asignada, esperando a ser incorporadas al laberinto. Esta seccion les
asigna formas al azar, respetando las frecuencias relativas de la tabla.]

To calculate how many labyrinth rooms should have each shape:
	let total space be the number of unshaped labyrinth rooms;
	let total allocated be 0;
	let total frequency be 0%;
	if the total space is 0, stop;
	repeat through the Table of Shape Frequencies:
		now the shape count entry is 0;
	repeat through the Table of Shape Frequencies:
		let N be the parts per hundred part of the frequency entry;
		let N be N multiplied by the total space;
		now the shape count entry is N divided by 100;
		now the total allocated is the total allocated plus the shape count entry;
		let total frequency be total frequency plus the frequency entry;
	while the total allocated is less than the total space:
		let total frequency be 0%;
		let R be a random number from 1 to 100;
		let the weighted percentage be the percentage with parts per hundred part R;
		repeat through the Table of Shape Frequencies:
			let total frequency be total frequency plus the frequency entry;
			if the weighted percentage > 0% and the weighted percentage <= the total frequency:
				now the shape count entry is the shape count entry plus 1;
				now the total allocated is the total allocated plus 1;
				now the weighted percentage is 0%.

To give shape to the shapeless labyrinth rooms:
	let total allocated be 0;
	repeat through the Table of Shape Frequencies:
		unless the shape count entry is 0:
			let new value be the total allocated plus 1;
			let total allocated be total allocated plus shape count entry;
			now the shape count entry is the new value;
	let total allocated be 0;
	repeat with blank room running through unshaped labyrinth rooms:
		let total allocated be total allocated plus 1;
		if there is a shape count of total allocated in the Table of Shape Frequencies, choose row with a shape count of total allocated in the Table of Shape Frequencies;
		now the shape of the blank room is the shape entry;
		now the map legend of the blank room is the legend entry;
		now the printed name of the blank room is the shape name entry;
		if the U part of the shape of the blank room is 1, now the minimum level of the blank room is 2.

Chapter 4 - Solid Rock and labyrinth boundaries

["Solid Rock" es una sala que nunca se visita, usada para indicar rutas
bloqueadas: una salida que lleva a Solid Rock se considera cerrada. Al
principio, antes de que ninguna sala del laberinto haya sido "jugada", todas
las salidas estan bloqueadas de este modo. Solid Rock tambien sirve como valor
especial que indica que no hay ninguna sala en cierta posicion.]

Solid Rock is a room.

To make all labyrinth exits lead to Solid Rock:
	repeat with blank room running through labyrinth rooms:
		let Sh be the shape of the blank room;
		if U part of Sh is 1, change the up exit of blank room to Solid Rock;
		if D part of Sh is 1, change the down exit of blank room to Solid Rock;
		if N part of Sh is 1, change the north exit of blank room to Solid Rock;
		if E part of Sh is 1, change the east exit of blank room to Solid Rock;
		if S part of Sh is 1, change the south exit of blank room to Solid Rock;
		if W part of Sh is 1, change the west exit of blank room to Solid Rock.

To decide which room is the room at (grid ref - a spatial coordinate):
	if grid ref is <0,0,0>:
		decide on Solid Rock;
	repeat with R running through rooms:
		if the grid position of R is grid ref:
			decide on R;
	decide on Solid Rock.

Chapter 5 - Terra Incognita

[Al igual que "Solid Rock", "Terra Incognita" es una sala que nunca se visita.
Una salida del laberinto lleva a Terra Incognita si y solo si llevaria a una
posicion todavia dentro de los limites del laberinto, pero en la que aun no
hay ninguna sala ubicada. La frase "position ... at ..." es la que mantiene
estas reglas al colocar cada sala nueva, revisando si las salas vecinas ya
colocadas tienen salidas que se correspondan o no.]

Terra Incognita is a room.

Egress relates a room (called the place) to a direction (called that way) when the room that way from the place is a room. The verb to exit (it exits) implies the egress relation.

To position (new room - a room) at (grid ref - a spatial coordinate):
	now the grid position of the new room is the grid ref;
	repeat with this way running through vectorial directions:
		let the further position be the vector sum of the grid ref and the vector of this way;
		if the further position is not <0,0,0>:
			let the further room be the room at the further position;
			if the further room is Solid Rock:
				if the new room exits this way:
					change this way exit of the new room to Terra Incognita;
			otherwise:
				let the reverse way be the opposite of this way;
				if this way is vertical or the new room exits this way:
					if the further room exits the reverse way:
						change this way exit of the new room to the further room;
						change the reverse way exit of the further room to the new room;
					otherwise:
						change this way exit of the new room to Solid Rock;
				otherwise:
					if the further room exits the reverse way, change the reverse way exit of the further room to Solid Rock.

Chapter 6 - Exhausting the maze and retrieving rooms

[Terra Incognita esta "abierta" mientras queden salas de laberinto por
descubrir, y "cerrada" cuando ya se jugaron todas. Cuando el laberinto se
agota, suele pasar que varias salas jugadas nunca fueron visitadas: la
recuperacion las devuelve al pool para volver a jugarlas si hace falta.]

Terra Incognita can be open or closed. Terra Incognita is open.

Definition: A labyrinth room is retrievable if it is unvisited.

To re-plumb (place - a room) to (way - a direction):
	let the connection be the room way from the place;
	if the connection is a retrievable labyrinth room, change the way exit of the place to Terra Incognita.

To retrieve inaccessible labyrinth rooms:
	repeat with maze area running through retrievable labyrinth rooms:
		re-plumb the maze area to north;
		re-plumb the maze area to east;
		re-plumb the maze area to south;
		re-plumb the maze area to west;
		re-plumb the maze area to up;
		re-plumb the maze area to down;
		now the grid position of the maze area is <0,0,0>.

Chapter 7 - Exploring the labyrinth

Definition: A labyrinth room is acceptable if it is unplaced and its minimum level <= the current maze level.

[ Una vez que el laberinto se agota (Terra Incognita queda cerrada), CUALQUIER
  jugador que intente ir hacia territorio sin explorar, desde cualquier sala,
  se topa con este mensaje una y otra vez por el resto de la partida - asi
  que conviene que tenga variedad en vez de repetir siempre la misma frase. ]
Table of Maze Closed Messages
message
"El camino esta bloqueado por algun encantamiento."
"Una fuerza invisible te impide continuar por ese lado."
"El aire se espesa aqui, y te resulta imposible seguir avanzando."
"El laberinto ya no tiene mas secretos que ofrecerte por ese camino."
"Un muro invisible corta el paso. Algo antiguo se niega a dejarte continuar."
"Por mas que insistas, no hay nada nuevo que encontrar por ahi."

To say maze closed message:
	choose a random row in the Table of Maze Closed Messages;
	say "[message entry]".

Before going a direction (called this way) to Terra Incognita:
	if Terra Incognita is closed, say "[maze closed message]" instead;
	let possibles be the number of acceptable labyrinth rooms;
	if possibles is 0:
		retrieve inaccessible labyrinth rooms;
		let possibles be the number of acceptable labyrinth rooms;
		if possibles is 0:
			now Terra Incognita is closed;
			say "El laberinto se ha agotado. El camino esta bloqueado." instead;
	if possibles > 0:
		let the new room be a random acceptable labyrinth room;
		let the current position be the grid position of the location;
		let the new position be the vector sum of the current position and the vector of this way;
		position the new room at the new position;
	otherwise:
		change this way exit of the location to Solid Rock;
	try going this way instead.

After going up to a labyrinth room from a non-ascending labyrinth room: say "Tomas una escalera secreta hacia arriba."; continue the action.

After going down to a labyrinth room from a non-descending labyrinth room: say "Tomas una escalera secreta hacia abajo."; continue the action.

Instead of going to Solid Rock:
	say "Tras unos pasos, el camino se pierde en roca solida. Retrocedes."

Chapter 8 - Setting up the labyrinth

When play begins:
	calculate how many labyrinth rooms should have each shape;
	give shape to the shapeless labyrinth rooms;
	make all labyrinth exits lead to Solid Rock;
	locate rooms.

Chapter 9 - The blank room pool

[Un stock generico de salas de laberinto en blanco, sin forma ni posicion
todavia. Cada juego que use esta extension puede reservar algunas de estas
salas para darles forma y posicion fijas explicitamente (como hace MultiMaze
con LR0 y LR1); las que queden sin tocar reciben una forma al azar de la
Table of Shape Frequencies y pueblan el resto del laberinto.]

LB1, LB2, LB3, LB4, LB5, LB6, LB7, LB8, LB9 and LB10 are labyrinth rooms.
LB11, LB12, LB13, LB14, LB15, LB16, LB17, LB18, LB19 and LB20 are labyrinth rooms.
LB21, LB22, LB23, LB24, LB25, LB26, LB27, LB28, LB29 and LB30 are labyrinth rooms.
LB31, LB32, LB33, LB34, LB35, LB36, LB37, LB38, LB39 and LB40 are labyrinth rooms.
LB41, LB42, LB43, LB44, LB45, LB46, LB47, LB48, LB49 and LB50 are labyrinth rooms.
LB51, LB52, LB53, LB54, LB55, LB56, LB57, LB58, LB59 and LB60 are labyrinth rooms.
LB61, LB62, LB63, LB64, LB65, LB66, LB67, LB68, LB69 and LB70 are labyrinth rooms.
LB71, LB72, LB73, LB74, LB75, LB76, LB77, LB78, LB79 and LB80 are labyrinth rooms.

Laberinto ends here.
