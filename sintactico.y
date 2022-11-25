%{
#include <stdio.h>
int yylex();
int yyerror(char *s);
%}

%token identificador

%token resta
%token suma
%token division
%token multiplicacion

%token menor_que
%token mayor_que
%token menor_igual
%token mayor_igual
%token comparacion

%token and
%token or
%token not

%token pr_program
%token pr_begin
%token pr_end
%token pr_input
%token pr_output
%token pr_integer
%token pr_real
%token pr_char
%token pr_string
%token pr_boolean
%token pr_if
%token pr_else
%token pr_then
%token pr_while
%token pr_do
%token pr_repeat
%token pr_until
%token pr_var
%token pr_true
%token pr_false

%token parentesis_abre
%token parentesis_cierra
%token punto_coma
%token coma
%token dos_puntos
%token igual

%token numero_entero

%%

PROGRAMA: CABEZA CUERPO { printf("El código fuente es sintácticamente correcto.\n"); };

CABEZA: NOM_PROG DEC_VAR;

NOM_PROG: pr_program identificador punto_coma ;

DEC_VAR: pr_var DEF_VAR | pr_var ;

DEF_VAR:        SEC_VAR dos_puntos TIPO_DATO punto_coma DEF_VAR | 
                SEC_VAR dos_puntos TIPO_DATO punto_coma ;

SEC_VAR: identificador coma SEC_VAR | identificador ;

TIPO_DATO: pr_integer | pr_real | pr_char | pr_string | pr_boolean ;

CUERPO: pr_begin CONTENIDO pr_end ;

CONTENIDO:      EXPR_ASIGN CONTENIDO |
                ESTR_CTRL CONTENIDO |
                EXPR_ASIGN | ESTR_CTRL ;

EXPR_ASIGN: CABEZA_EXPR_ASIGN CUERPO_EXPR_ASIGN punto_coma ;

CABEZA_EXPR_ASIGN: identificador dos_puntos igual ;

CUERPO_EXPR_ASIGN: SIMPLE | COMPUESTO ;

SIMPLE: numero_entero | identificador | pr_false | pr_true ;

COMPUESTO:      SIMPLE OPERADOR COMPUESTO |
                SIMPLE OPERADOR SIMPLE |
                parentesis_abre COMPUESTO parentesis_cierra |
                parentesis_abre SIMPLE parentesis_cierra |
                parentesis_abre COMPUESTO parentesis_cierra OPERADOR COMPUESTO |
                parentesis_abre COMPUESTO parentesis_cierra OPERADOR SIMPLE ;

OPERADOR: OP_ARITMETICOS | OP_RELACIONALES | OP_LOGICOS | igual;

OP_ARITMETICOS: resta | suma | division | multiplicacion ;

OP_RELACIONALES: menor_que | mayor_que | menor_igual | mayor_igual | comparacion ;

OP_LOGICOS: and | or | not ;

ESTR_CTRL: CONDICIONAL | WHILE | REPETIR ;

CONDICIONAL:    pr_if parentesis_abre COMPUESTO parentesis_cierra pr_then pr_begin CONTENIDO_ESTR_CTRL pr_end | 
                pr_if parentesis_abre COMPUESTO parentesis_cierra pr_then pr_begin CONTENIDO_ESTR_CTRL pr_end pr_else pr_begin CONTENIDO_ESTR_CTRL pr_end;

WHILE: pr_while parentesis_abre COMPUESTO parentesis_cierra pr_do pr_begin CONTENIDO_ESTR_CTRL pr_end ;

REPETIR: pr_repeat pr_begin CONTENIDO_ESTR_CTRL pr_end pr_until parentesis_abre COMPUESTO parentesis_cierra punto_coma ;

CONTENIDO_ESTR_CTRL:    EXPR_ASIGN CONTENIDO_ESTR_CTRL |
                        ESTR_CTRL CONTENIDO_ESTR_CTRL |
                        ENTRADA CONTENIDO_ESTR_CTRL |
                        SALIDA CONTENIDO_ESTR_CTRL |
                        EXPR_ASIGN |
                        ESTR_CTRL | 
                        ENTRADA |
                        SALIDA; 

ENTRADA: pr_input parentesis_abre identificador parentesis_cierra punto_coma ;

SALIDA: pr_output parentesis_abre identificador parentesis_cierra punto_coma ;

%%

int yyerror(char *s)
{
        printf("Error de sintaxis en el código fuente.\n");
}

int main()
{
        yyparse();
}

