%{
#include<stdlib.h>
#include<stdio.h>
#include"y.tab.h"
int yylineno;
%}
COMMENT "(*"(\*[^\)]|[^*])*"*)"
String \'(\'\'|[^'\n])*\'
%%
":="        { printf("%s",yytext); return(ASSIGNMENT);}
"="         { printf("%s",yytext); return(EQ);}
"<>"        { printf("%s",yytext); return(NE);}
"<"         { printf("%s",yytext); return(LT);}
"<="        { printf("%s",yytext); return(LE);}
">"         { printf("%s",yytext); return(GT);}
">="        { printf("%s",yytext); return(GE);}
"+"         { printf("%s",yytext); return(PLUS);}
"-"         { printf("%s",yytext); return(MINUS);}
"*"         { printf("%s",yytext); return(MUL);}
"/"         { printf("%s",yytext); return(DIV);}
"mod"       { printf("%s",yytext); return(MOD);}
"("         { printf("%s",yytext); return(OPAREN);}
")"         { printf("%s",yytext); return(CPAREN);}
"["         { printf("%s",yytext); return(OBRACK);}
"]"         { printf("%s",yytext); return(CBRACK);}
"."         { printf("%s",yytext); return(DOT);}
".."        { printf("%s",yytext); return(DOUBLEDOT);}
":"         { printf("%s",yytext); return(COLON);}
";"         { printf("%s",yytext); return(SEMICOLON);}
","         { printf("%s",yytext); return(COMMA);}
{COMMENT}   { }
{String}    { printf("%s",yytext); return(String);}
"if"        { printf("%s",yytext); return(IF);}
"then"      { printf("%s",yytext); return(THEN);}
"else"      { printf("%s",yytext); return(ELSE);}
"while"     { printf("%s",yytext); return(WHILE);}
"for"       { printf("%s",yytext); return(FOR);}
"to"        { printf("%s",yytext); return(TO);}
"do"        { printf("%s",yytext); return(DO);}
"of"        { printf("%s",yytext); return(OF);}
"program"   { printf("%s",yytext); return(PROGRAM);}
"function"  { printf("%s",yytext); return(FUNCTION);}
"begin"     { printf("%s",yytext); return(BE_GIN);}
"end"       { printf("%s",yytext); return(END);}
"var"       { printf("%s",yytext); return(VAR);}
"integer"   { printf("%s",yytext); return(INTEGER);}
"string"    { printf("%s",yytext); return(STRING);}
"array"     { printf("%s",yytext); return(ARRAY);}
"write"     { printf("%s",yytext); return(WRITE);}
"read"      { printf("%s",yytext); return(READ);}
"writeln"   { printf("%s",yytext); return(WRITELN);}
"and"       { printf("%s",yytext); return(AND);}
"or"        { printf("%s",yytext); return(OR);}
"not"       { printf("%s",yytext); return(NOT);}
[a-zA-Z_][a-zA-Z0-9_]*   { printf("%s",yytext); return(ID);}
[0-9]+\.[0-9]*           { printf("%s",yytext); return(DBL);}
[0-9]+                   { printf("%s",yytext); return(INT);}
\n                       { printf("\n"); yylineno++;}
[ \t]                    { printf(" ");}
.   { 
    }
%%

