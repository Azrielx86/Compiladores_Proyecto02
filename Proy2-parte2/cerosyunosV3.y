%{
    #include <stdio.h>
    #include <stdlib.h>
    int yylex(void);
    void yyerror(char *s);
%}

%token 0 1

%%
    E   : S        {printf("La traducción es %s\n", $1);}
        ;
    S   : 0 '{' 0 '}'   { printf("Acción: %s\n", $3); $$ = $3; }
        | 1 '{' 1 '}'   { printf("Acción: %s\n", $3); $$ = $3; }
        | 0 S '{' 0 '}' { printf("Acción: %s\n", $4); $$ = $4; }
        | 1 S '{' 1 '}' { printf("Acción: %s\n", $4); $$ = $4; }
        ;
%%
