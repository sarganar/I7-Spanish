"Conversaciones con Juan" by Xavi (in spanish)

The story headline is "Hablar por hablar".
Include Basic Screen Effects SP by Emily Short.
Include Quip-Based Conversation SP by Michael Martin.
Use no scoring and no deprecated features.

Chapter 1 - The Setup

When play begins, say "¡Habla con Juan!"

Bar is a room. "Estás en el bar."

Juan is a man in Bar. The description is "Aquí está tu colega Juan." The litany of Juan is the Table of Juan Comments.

The greeting of yourself is selftalk.

Casting Xyzzy is an action applying to nothing. Understand "xyzzy" as casting xyzzy. Carry out casting xyzzy: deliver the xyzzy quip; run a conversation on the Table of Magic Followups.

Chapter 2 - The Script

Section 1 - The Text

Table of Quip Texts (continued)
quip	quiptext
selftalk	"Hablar contigo no es particularmente divertido."
who-am-i	"'Mal. Inform me odia.'"
why-hate	"'Intento compilar pero me salen 40 errores.'"
yay-inform	"'¿Has hecho un tutorial? ¡Voy a leerlo!"
hate-you	"'¡Te odio!'[paragraph break] Juan te mata."
hate-you-2	"'¡Te odio!'[paragraph break] Juan te mata.."
hate-you-3	"'¡Te odio!'[paragraph break] Juan te mata."
hate-pedants	"'¡Odio a los pedantes como tú!'[paragraph break] Juan te mata."
yay-monkeys	"'Claro que me gustan los monos.'"
yay-you	"'¡Ahora somos realmente amigos!'"
say-nothing	"Te quedas callado."
ehn-apes	"'Los gorilas molan, claro que sí.'"
ehn-lemurs	"'No tengo una opinión formada sobre los lemures.'"
xyzzy	"¿Cuál es la otra palabra mágica?"

Table of Juan Comments
prompt	response	enabled
"¿Qué tal, Juan?"	who-am-i	1
"¿Porqué te odia Inform?"	why-hate	0
"Ahá... ¿has leído mi tutorial?"	yay-inform	0
"No me extraña..."	hate-you	0
"Ja ja ja, ¡Inform te odia!"	hate-you-2	0
"Hey, ¿te gustan los monos?"	yay-monkeys	1
"¡Solo a los locos les gustan!"	hate-you-3	0
"Pensaba que sabías más sobre simios."	hate-pedants	0
"A mí también me gustan."	yay-you	0
"Mejor me callo."	say-nothing	1

Table of Quip Followups (continued)
quip	option	result
yay-monkeys	"¿Y los gorilas?"	ehn-apes
yay-monkeys	"¿Y los lemures?"	ehn-lemurs

Table of Magic Followups
prompt	response	enabled
"PLUGH"	yay-you	1
"Hay al menos dos más, ¿cuál de ellas?"	hate-pedants	1

Section 2 - Dialogue affects itself

After quipping when the current quip is who-am-i:
	enable the why-hate quip;
	enable the hate-you quip.

After quipping when the current quip is why-hate:
	disable the hate-you quip;
	enable the hate-you-2 quip;
	enable the yay-inform quip.

After quipping when the current quip is yay-monkeys:
	disable the who-am-i quip;
	enable the hate-you-3 quip;
	enable the hate-pedants quip;
	enable the yay-you quip.

After quipping when the current quip is say-nothing:
	enable the say-nothing quip;
	terminate the conversation.

Section 3 - Dialogue affects the game

After quipping when the current quip is hate-you: end the story saying "Estás muerto".
After quipping when the current quip is hate-you-2: end the story saying "Estás muerto".
After quipping when the current quip is hate-you-3: end the story saying "Estás muerto".
After quipping when the current quip is hate-pedants: end the story saying "Estás muerto".
After quipping when the current quip is yay-inform: end the story finally saying "Has ganado".
After quipping when the current quip is yay-you: end the story finally saying "Has ganado".
