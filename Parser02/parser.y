%{
#include <stdio.h>
int yylex(void);
void yyerror(char* s);
%}

%define api.value.type { char* }

%left '0' '1'

%%
    E   : 
        | E '\n' 
        | E S
        ;

    S   : '0'       { $$ = $1; printf("-0"); }
        | '1'       { $$ = $1; printf("-1"); }
        | '0' S     { $$ = $1; printf("%s", $1); }
        | '1' S     { $$ = $1; printf("%s", $1); }
        ;
%%
