%{
    #include "y.tab.h"
    #include <stdio.h>

    void yyerror(char *s){
        printf("\n%s\n", s);
    }

    int main (int argc,char**argv){

        yyin=fopen (argv[1],”r”);
        if (yyin == NULL){
            perror("Error al abrir el archivo");
            return 1;
        }
        yyparse();
        fclose(yyin);
        return 0;
        
    }
%}

%%
[0-1]   {
        yylval = *yytext - '0'; 
        return yytext[0]; 
        } /* Devuelve el dígito leído y almacena su valor en yylval */

.       {yyerror("character diferente de 0 o 1");}
%%
