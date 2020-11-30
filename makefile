all:	y.tab.c lex.yy.c 
	gcc lex.yy.c y.tab.c -ly -lfl

y.tab.c:	sample.y
	bison -y -d --debug sample.y

lex.yy.c:	B063040010.l	y.tab.h
	flex B063040010.l

clean:
	rm a.out lex.yy.c y.tab.c y.tab.h
	clear
