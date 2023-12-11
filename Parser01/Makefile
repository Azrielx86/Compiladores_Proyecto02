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
	$(FLEX) --header-file=flex_header.h lexer.l

parser:
	$(BISON) -d parser.y

clean:
	@rm flex_header.h
	@rm *.yy.c
	@rm *.tab.c
	@rm *.tab.h
	@rm Proyecto
