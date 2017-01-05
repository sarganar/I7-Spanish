"Librojuego" by Grendelkhan (in spanish)

[Demostracion de Librojuego en Inform]

Include Basic Screen Effects SP by Emily Short.
Include Inline Hyperlinks by Erik Temple.
Use no scoring.

The castillo is a room. "Te encuentras en el tenebroso castillo del conde Drácula. La débil luz de tu [link]lámpara[as]examinar lampara[end link] apenas ilumina una lúgubre estancia llena de [link]telarañas[as]examinar telaranas[end link]. Unas tortuosas [link]escaleras[as]ir arriba[end link] son la única salida posible...". 

The lampara (f) is carried by the player. The description is "Debes darte prisa, se está acabando la luz...".

Some telaranas (f) are here. They are scenery. The printed name of telaranas is "telarañas". The description is "Terroríficas telarañas... ¡un momento! Parece que tras ellas hay una [link]puerta[as]examinar puerta[end link]."

A puerta_enigmatica (f) is here. It is scenery. The description is "Una enigmática puerta tras las telarañas parece albergar un mal aún mayor... [link]¿qué se esconderá tras ella?[as]abrir puerta[end link]".
Understand "puerta" as puerta_enigmatica.

Instead of opening the puerta_enigmatica, end the story saying "¡Has encontrado la tumba del conde Drácula!".

The escaleras is up of the castillo. "Te sorprende encontrar una habitación vacía... la única opción es volver [link]abajo[end link]."

