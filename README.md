# analizador-sintactico
**Analizador sintáctico utilizando Flex/Bison para la asignatura de Lenguajes y Autómatas I.**

# Ejecución
- bison -yd sintactico.y
- lex lexico.l
- gcc y.tab.c lex.yy.c
- ./a.out < entrada-x.txt