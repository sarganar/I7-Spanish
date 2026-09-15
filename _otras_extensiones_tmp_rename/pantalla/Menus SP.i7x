Version 3 of Menus SP by Emily Short begins here.

"A table-based way to display full-screen menus to the player."

Use authorial modesty.


Include Menus by Emily Short.
Include Basic Screen Effects SP by Emily Short.

Section 1

When play begins:
	now the current menu title is "Instrucciones";
	now the left in row 3 of the Table of Deep Menu Status is " S = Siguiente";
	now the left in row 4 of the Table of Deep Menu Status is " A = Anterior";
	now the right in row 3 of the Table of Deep Menu Status is "F = [if menu depth > 1]Ult. Menú[otherwise]Fin Menú[end if]";
	now the right in row 4 of the Table of Deep Menu Status is "ENTER = Selec.";
	now the number in row 1 of the Table of Menu Commands is 83;
	now the number in row 2 of the Table of Menu Commands is 115;
	now the number in row 3 of the Table of Menu Commands is 65;
	now the number in row 4 of the Table of Menu Commands is 97;
	now the number in row 5 of the Table of Menu Commands is 70;
	now the number in row 6 of the Table of Menu Commands is 102.




To say known hints from (hint booklet - table name):
	let __index be 0;
	clear only the main screen; 
	repeat through hint booklet
	begin;
		increase __index by 1;
		if there is a used entry
		begin;
			say "[__index]/[number of rows in hint booklet]: [hint entry][paragraph break]";
		otherwise;
			if __index is 1
			begin;
				now used entry is turn count;
				say "[__index]/[number of rows in hint booklet]: [hint entry][paragraph break]";
			end if;
		end if;
	end repeat; 
		say "Pulsa la tecla espaciadora para retornar al menú o H para enseñar otra pista."

To say hints from (hint booklet - table name): 
	let __index be 0;
	clear only the main screen; 
	repeat through hint booklet
	begin;
		increase __index by 1;
		say "[__index]/[number of rows in hint booklet]: [hint entry][paragraph break]"; 
		if there is a used entry
		begin;
			do nothing;
		otherwise;
			now used entry is turn count;
			say "Pulsa la tecla espaciadora para retornar al menú[if __index < number of rows in hint booklet] o H para desvelar otra pista[end if].";
			make no decision; 
		end if;  
	end repeat; 
	say "Pulsa la tecla espaciadora para retornar al menú[if __index < number of rows in hint booklet]  o H para desvelar otra pista[end if]."


Menus SP ends here.

---- Documentation ----

SPANISH: La documentacón completa esta en Menus by Emily Short.

