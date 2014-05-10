"History Lab" by sarganar (in spanish)

Include Text Capture by Eric Eve


Lab is a room. 

In Spanish saltar is a verb.
In Spanish gritar is a verb.

When play begins:
	now the story viewpoint is third person plural; 
	now the story tense is future tense;
	say "[Tu] [saltas] en el sitio[plm]. Al cabo de un rato[tu] [gritas] al cielo.".

[	say "[the verb amar with first letter upper case]";
	say "[the story viewpoint].";
	say "[story tense]".]

standard report waiting rule response (A) is "[Tu] [saltas] en el sitio[plm]. Al cabo de un rato[tu] [gritas] al cielo.". 
	
Test verb (internal) with saltar.

[first person singular 
second person singular 
third person singular 
first person plural 
second person plural 
third person plural 

past tense 
present tense 
future tense 
]

Include (-!% -~k
-) before "ICL Commands" in "Output.i6t".

to say plm:[primera letra en mayúscula]
	stop capturing text;
	say "[captured text]" in sentence case.

To say tu:
	now the prior named object is the player;[ object's identity is a value stored in "prior named object"]
[	if the story viewpoint is first person singular:
		start capturing text;
	if the story viewpoint is second person singular:
		start capturing text;]
	if the story viewpoint is third person singular:
		if the player is male:
			say " él";
		otherwise:
			say " ella";
[	if the story viewpoint is first person plural:
		start capturing text;
	if the story viewpoint is second person plural:
		start capturing text;	]
	if the story viewpoint is third person plural:
		if the player is male:
			say " ellos";
		otherwise:
			say " ellas".
			

To say Tu:
	now the prior named object is the player;[ object's identity is a value stored in "prior named object"]
	if the story viewpoint is first person singular:
		start capturing text;
	if the story viewpoint is second person singular:
		start capturing text;
	if the story viewpoint is third person singular:
		if the player is male:
			say "Él";
		otherwise:
			say "Ella";
	if the story viewpoint is first person plural:
		start capturing text;
	if the story viewpoint is second person plural:
		start capturing text;	
	if the story viewpoint is third person plural:
		if the player is male:
			say "Ellos";
		otherwise:
			say "Ellas".
			