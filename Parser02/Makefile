CC = clang
FLEX = flex
BISON = bison
# -g : Información de debug.
# -gdwarf-4 : Para utilizar valgrind y clang.
# -Wall : Para advertencias adicionales
FLAGS = -g -gdwarf-4 -Wall

all: program

program: lexer
	$(CC) lex.yy.c parser.tab.c $(FLAGS) -o Proyecto

lexer: parser
	$(FLEX) lexer.l

parser:
	$(BISON) -dt parser.y

clean:
	@rm *.yy.c
	@rm *.tab.c
	@rm *.tab.h
	@rm Proyecto
