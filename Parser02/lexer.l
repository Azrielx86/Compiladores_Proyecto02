%{
  #include <stdio.h>
  #include "parser.tab.h"
  void yyerror(char*);
  int yywrap();
%}

%option yylineno

%%

0           { return '0'; }
1           { return '1'; }
\n          { return '\n'; }
.           { yyerror("caracter diferente de 0 o 1"); }

%%

void yyerror(char *s){
    printf("\n%s\n", s);
}

int yywrap() {
    /* printf("\n"); */
    return 1;
}

int main (int argc,char**argv)
{
    // yydebug = 1; // Se usa para ver el proceso de análisis de bison, necesario compilar con la bandera -t
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
  printf("\n");
  fclose(yyin);
  yylex_destroy();
  return 0;
}
