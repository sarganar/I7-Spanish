"Una prueba de conversacion" by Grendelkhan (in spanish)

Part 1 - Introducción

Section 1 - Extensiones

[Code 19: conversaciones por menus]

Include Basic Screen Effects Sp by Emily Short.
[Include Basic Help Menu SP by Emily Short.]
Include Quip-Based Conversation SP by Michael Martin.


Section 2 - La tienda

Tienda is a room. "Te encuentras en una tienda de ropa femenina. Tienes que hacerle un regalo a tu novia y no sabes por dónde empezar a mirar."

La dependienta is a woman in Tienda. The description is "Una impresionante dependienta te observa divertida tras el mostrador." 

The litany of the dependienta is the Table of dependienta Comments.

Table of Quip Texts (continued)
quip	quiptext
atender	"'No. Ahora estoy muy ocupada.'"
disculpe	"'¡Ahora no puedo atenderle!'"
nada	"'¡Claro que hago algo: estoy hablando con usted!'"


Table of dependienta Comments
prompt	response	enabled
"Hola, ¿me puede atender?"	atender	1
"¡Ah! Disculpe, es que estoy..."	disculpe	0
"¡Pero si no está haciendo nada!"	nada	0

After quipping when the current quip is atender:
	enable the disculpe quip;
	enable the nada quip.

