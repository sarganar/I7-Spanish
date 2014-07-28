Version 1 of Multiple Sounds Sp (for Glulx only) by Massimo Stella begins here.

"Provee una solución para reproducir audio en varios canales con loops, sobre Glulx. Traductor: Sarganar."

Use authorial modesty.

[The idea for this extension was born from some code written by Eliak Blauk on rec.arts.int-fiction in 2008.]

Section - IF6 Code

Include (-
[ SoundReproduce sound chan loop;
if (glk_gestalt(gestalt_Sound,0) && glk_gestalt(gestalt_SoundMusic,0))  { 
	glk_schannel_play_ext(chan,sound,loop,0); 
	}
else { 
	"Tu intérprete no soporta reproducción de sonidos.";
	!"Your intérpreter doesn't support sound reproduction."; 
	}
];

[ VolumeControl chan val;
if (glk_gestalt(gestalt_SoundVolume,0)) {
	if ((val <= 5) && (val >=0)) {
		glk_schannel_set_volume(chan, val * 16384);
		}
	else {
		"Nivel de volumen inválido: por favor el nivel está entre 0 y 5.";
		!"Invalid Volume Level: please insert a value between 0 and 5.";
		}
	}
else {
	"Tu intérprete no soporta control de volumen.";
	!"Your intérpreter doesn't support volume control."; 
	}
];

[ SoundStopExt chan;
if (glk_gestalt(gestalt_Sound,0) && glk_gestalt(gestalt_SoundMusic,0))  { 
	glk_schannel_stop(chan);  
	}
else { 
	"Tu intérprete no soporta detener sonido.";
!	"Your intérpreter doesn't support sound stopping."; 
	}
]; -).

Section - Declaring Commands

To play (SND - a sound name) in foreground:
(- SoundReproduce(ResourceIDsOfSounds-->{SND},gg_foregroundchan,1); -)

To play (SND - a sound name) in background:
(- SoundReproduce(ResourceIDsOfSounds-->{SND},gg_backgroundchan,1); -)

To play (SND - a sound name) in foreground with loop:
(- SoundReproduce(ResourceIDsOfSounds-->{SND},gg_foregroundchan,-1); -)

To play (SND - a sound name) in background with loop:
(- SoundReproduce(ResourceIDsOfSounds-->{SND},gg_backgroundchan,-1); -)

To play (SND - a sound name) in foreground for (loop - a number) times:
(- SoundReproduce(ResourceIDsOfSounds-->{SND},gg_foregroundchan,{loop}); -)

To play (SND - a sound name) in background for (loop - a number) times:
(- SoundReproduce(ResourceIDsOfSounds-->{SND},gg_backgroundchan,{loop}); -)

To set the foreground volume to (VOL - a number):
(- VolumeControl(gg_foregroundchan,{VOL}); -)

To set the background volume to (VOL - a number):
(- VolumeControl(gg_backgroundchan,{VOL}); -)

To stop the foreground sound:
(- SoundStopExt(gg_foregroundchan); -)

To stop the background sound:
(- SoundStopExt(gg_backgroundchan); -)

Multiple Sounds SP ends here.

---- DOCUMENTATION ---- 

Esta extension permite la reproduccion simultanea de dos capas de sonido, bajo Glulx. Implementa solo un puniado de caracteristicas relativas al manejo de audio (loops, reproduccion de dos canales, control de volumen y detener reproduccion) y quedara obsoleta cuando Eliuk Blau publique su Damusix para Inform 7.


Luego de declarar en el codigo el nombre de un archivo de audio, tal como lo indica la documentacion de I7:

	Sound of frogs is the file "Frogs.ogg". 

Podemos elegir como reproducirlo, si en el canal de fondo, o en el canal de primer plano:

	play the sound of frogs in background;
	play the sound of frogs in foreground;

A veces, puede ser util un loop continuo:

	play the sound of frogs in background with loop;
	play the sound of frogs in foreground with loop;

Tambien se admite la repeticion de un audio por N veces:

	play the sound of frogs in background for 5 times;
	play the sound of sea in foreground for 10 times;
	
Glulx permite reproducir varios sonidos al mismo tiempo, desde diferentes canales para cada uno.

	play the sound of frogs in background;
	play the sound of birds in foreground;

Para detener un archivo de audio:

	stop the foreground sound;
	stop the background sound;

Para cambiar el volumen desde un nivel minimo de 0 (silencio) hasta un maximo de 5 (volumen total):

	set the foreground volume to 2;
	set the background volume to 1;
	
Example: * Rainforest - Muestra como usar multiples efectos de sonido para simular un ambiente natural.

	*:	"Rainforest"
	
	Include Multiple Sounds by Massimo Stella.
	
	The Swamp is a room. The description is "Un hermoso espejo de agua se encuentra frente tus ojos, mientras que detras de ti se hallan los arboles mas altos que jamas hayas visto. Puedes escuchar el sonido de las ranas en la distancia."
	
	Sound of frogs is the file "Frogs.ogg". 
	Sound of water is the file "Water.ogg".
	
	When play begins:
		set the background volume to 2;
		play the sound of frogs in background;
		set the foreground volume to 3;
		play the sound of water in foreground with loop.
	