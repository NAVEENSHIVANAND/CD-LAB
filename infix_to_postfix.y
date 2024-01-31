%{
#include <ctype.h>
#include<stdio.h>
#include<stdlib.h>
%}

%token digit

%%
S: E { printf("\n\n"); };
E: E '+' T { printf("+"); }
  | E '-' T { printf("-"); }
  | T
  ;

T: T '*' F { printf("*"); }
  | T '/' F { printf("/"); }
  | F
  ;

F: K '^' F { printf("^"); }
  | K
  ;

K: '(' E ')'
  | digit { printf("%d", $1); }
  ;
%%

int main()
{
    printf("Enter infix expression: ");
    yyparse();
    return 0;
}

void yyerror()
{
    printf("Error\n");
}

