// declaration and definition
%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
extern int yylineno;
char* yytext;
int yydebug=1;

int yyerror(const char *s)
{
    printf("%s\n",s);
	fprintf(stderr, "line %d : %s ", yylineno, s);
}

%};

%define parse.error verbose
%token ID INTEGER STRING PROGRAM FUNCTION VAR BE_GIN END WRITE READ DBL INT
%token ASSIGNMENT EQ NE LT LE GT GE
%token OPAREN CPAREN COMMA DOT DOUBLEDOT COLON SEMICOLON
%token PLUS MINUS MUL DIV AND OR NOT MOD
%token OF OBRACK CBRACK ARRAY
%token WHILE DO
%token FOR TO
%token IF THEN ELSE
%token COMMENT_START COMMENT_END
%token UNKOWN String WRITELN
//%left PLUS MINUS
//%left MUL DIV
%start program


%%
// grammar rule
program : PROGRAM program_name SEMICOLON {printf(" -------->at Line %d is correct",yylineno);}
          VAR                            {printf(" -------->at Line %d is correct",yylineno);}
          dec_list SEMICOLON
          BE_GIN                         {printf(" -------->at Line %d is correct",yylineno);}
          statement_list SEMICOLON
          END DOT                        
        ;
program_name : ID;
dec_list : dec
         | dec_list SEMICOLON dec
         | 
         ;
dec : id_list COLON type                {printf(" -------->at Line %d is correct",yylineno);}
    ;
type : std_type
     | arr_type
     ;
std_type : INTEGER;
arr_type : ARRAY OBRACK INT DOUBLEDOT INT CBRACK OF INTEGER;
id_list : var_id 
        | String
        | id_list COMMA var_id
        | id_list COMMA String
        ;
statement_list : statement              
                | statement_list SEMICOLON statement
                | 
                ;
statement : assign                      
          | read                        
          | write                       
          | for                         
          | if_else                     
          | WRITELN                     {printf(" -------->at Line %d is correct",yylineno);}
          ;
assign : var_id ASSIGNMENT simple_expression   {printf(" -------->at Line %d is correct",yylineno);}
       ;
if_else : IF OPAREN exp CPAREN THEN           {printf(" -------->at Line %d is correct",yylineno);}
          body       
        ;
exp : simple_expression                         
    | exp relative_operator simple_expression
    ;
relative_operator : GE
                  | GT
                  | LE
                  | LT
                  | EQ
                  | NE
                  ;
simple_expression : term                        
                  | simple_expression PLUS term 
                  | simple_expression MINUS term
                  ;
term : factor 
     | term MUL factor
     | term DIV factor
     | term MOD factor
     ;
factor : var_id 
        | int 
        ;
int : PLUS INT
    | MINUS INT
    | INT
    ;
read : READ OPAREN id_list  CPAREN              {printf(" -------->at Line %d is correct",yylineno);}
     ;
write : WRITE OPAREN id_list CPAREN             {printf(" -------->at Line %d is correct",yylineno);}
      ;
for : FOR index_expression DO                   {printf(" -------->at Line %d is correct",yylineno);}
      body              
    ;
index_expression : var_id ASSIGNMENT simple_expression TO exp; 
var_id : ID
       | ID OBRACK simple_expression CBRACK
       ;
body : statement 
     | BE_GIN                                   {printf(" -------->at Line %d is correct",yylineno);}
        statement_list SEMICOLON            
        END                                     {printf(" -------->at Line %d is correct",yylineno);}
     ;





%%
// C code

int main() {
    yyparse();
    return 0;
}
