/*** Sección de definición ***/
%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
%}

/*** Sección de reglas ***/
%%

[ \t\n\r]

"#"[a-z]+ { return(identificador); }

"-"	{ return(resta); }
"+"	{ return(suma); }
"/"	{ return(division); }
"*"	{ return(multiplicacion); }

"<"		{ return(menor_que); }
">"		{ return(mayor_que); }
"<="	{ return(menor_igual); }
">="	{ return(mayor_igual); }
"=="	{ return(comparacion); }

"&"	{ return(and); }
"|"	{ return(or); }
"~"	{ return(not); }

"program"	{ return(pr_program); }
"begin"		{ return(pr_begin); }
"end"		{ return(pr_end); }
"input"		{ return(pr_input); }
"output"	{ return(pr_output); }
"integer"	{ return(pr_integer); }
"real"		{ return(pr_real); }
"char"		{ return(pr_char); }
"string"	{ return(pr_string); }
"boolean"	{ return(pr_boolean); }
"if"		{ return(pr_if); }
"else"		{ return(pr_else); }
"then"		{ return(pr_then); }
"while"		{ return(pr_while); }
"do"		{ return(pr_do); }
"repeat"	{ return(pr_repeat); }
"until"		{ return(pr_until); }
"var"		{ return(pr_var); }
"true"		{ return(pr_true); }
"false"		{ return(pr_false); }

"("		{ return(parentesis_abre); }
")"		{ return(parentesis_cierra); }
";"		{ return(punto_coma); }
","		{ return(coma); }
":"		{ return(dos_puntos); }
"="		{ return(igual); }

"//".+

[0-9]+ { return(numero_entero); }

.

%%

int yywrap(){
    return 1;
}