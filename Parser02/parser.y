%{
#include <stdio.h>
int yylex(void);
void yyerror(char* s);
%}

%right '0' '1' // Se usa right en este caso para la precedencia de los símbolos

%%
    E   : 
        | E '\n'    { printf("\n"); }
        | E S
        ;

    S   : '0'       { printf("0"); }
        | '1'       { printf("1"); }
        | '0' S     { printf("%c0", $2); }
        | '1' S     { printf("%c1", $2); }
        ;
%%
