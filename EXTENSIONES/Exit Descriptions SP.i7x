Version 2 of Exit Descriptions SP by Matthew Fletcher begins here.

"Añade una lista de direcciones de salida válidas así como los nombres de las localidades previamente visitadas tras la descripción de una localidad.[6L02]"

A room can be female.[spanish need: al listar cosas como 'la Biblioteca']
A room can be plural-named or singular-named. [spanish need: al listar cosas como 'las Escaleras']

The amount is a number variable.
The amount is 0.

The num is a number variable.
The num is 0.

After looking:
    Now the amount is the number of adjacent rooms;
    REPEAT with destination running through adjacent rooms begin; 
        if the num is 0, say "Salidas:";
        let the way be the best route from the location to the destination,using even locked doors;
        if the way is a direction, say " [way]";
        if the destination is visited, say " hacia [the destination]";
        Decrease the amount by 1;
        Increase the num by 1;
        if the amount is 0, say ".";
        if the amount is 1, say " y";
        if the amount is greater than 1, say ",";
    END repeat;
    Now the amount is 0;
    Now the num is 0.

Exit Descriptions SP ends here.

---- DOCUMENTATION ----

At the moment you just include this extension and it will add a sentence which lists the exits to the end of a room description, including the names of any previously visited rooms.

In future versions I will make it so that various settings can be changed, to display doors, not name visited rooms or to name all rooms, turning the option on and off in or out of play, etc. 


SPANISH:

Esta extensión agrega en cada turno una lista con las posibles salidas de la localidad actual. Imprime el nombre de las salidas ya visitadas.
Al definir localidades con nombre femenino, indicarlo con 'It is female.'
Para usarla, solo incluye la extension al principio del código de tu juego.

Traducida al español por Sarganar.
Mejoras de código por Mel Hython.

