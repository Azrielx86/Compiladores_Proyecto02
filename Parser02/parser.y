%{
#include <stdio.h>
int yylex(void);
void yyerror(char* s);
%}

%right '0' '1'

%%
    E   : 
        | E '\n'
        | E S       { printf("\n\n"); }
        ;

    S   : '0'       { printf("0"); }
        | '1'       { printf("1"); }
        | '0' S     { printf("%c0", $2); }
        | '1' S     { printf("%c1", $2); }
        ;
%%
