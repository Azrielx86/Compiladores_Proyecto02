%{
  #include <stdio.h>
  #include "parser.tab.h"

  void yyerror(char*);
%}

%option noyywrap
%option yylineno

DIG             [0-9]
NUM             {DIG}+("."{DIG}+)?

%%

{NUM}                 { yylval=atoi(yytext); return NUMBER; }

[-+*/()\n]            { return *yytext; }

[[:blank:]] ;

.                     { yyerror("Unknown character."); }

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
