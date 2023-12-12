%{
  #include <stdio.h>
  #include "parser.tab.h"
  void yyerror(char*);
%}

%option noyywrap
%option yylineno

%%

0           { return '0'; }
1           { return '1'; }
.           { yyerror("caracter diferente de 0 o 1"); }

%%

void yyerror(char *s){
    printf("\n%s\n", s);
}

int main (int argc,char**argv)
{
    // yydebug = 1;
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
