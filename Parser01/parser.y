%{
#include <stdio.h>
#include "flex_header.h"
int yylex(void);
void yyerror(char* s);
%}

%token NUMBER
%left '+' '-'
%left '*' '/'

%%

list    :
        | list '\n'
        | list exp { printf("Resultado = %d\n", $2); }
        ;

exp     : exp '+' term    { $$ = $1 + $3; }
        | exp '-' term    { $$ = $1 - $3; }
        | term            { $$ = $1; }
        ;

term    : term '*' factor { $$ = $1 * $3; }
        | term '/' factor { 
                                if($3 == 0) {
                                        yyerror("El dividendo no puede ser cero");
                                }
                                else
                                        $$ = $1 / $3;
                          }
        | factor          { $$ = $1; }
        ;

factor  : NUMBER       { $$ = $1; }
        | '(' exp ')'  { $$ = $2; }
        ;
%%
