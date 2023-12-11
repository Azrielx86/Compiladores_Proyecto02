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


