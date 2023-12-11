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

void yyerror(char *s)
{
  printf("\n%s\n", s);
}

int main(int argc, char** argv)
{
  if (argc != 2){
    printf("Uso: %s <nombre_del_archivo>\n", argv[0]);
	  return 1;
	}

  yyin = fopen(argv[1], "r");
  if (yyin == NULL){
    perror("Error al abrir el archivo");
    return 1;
  }
  yyparse();
    
  fclose(yyin);
  yylex_destroy();

  return 0;
}
