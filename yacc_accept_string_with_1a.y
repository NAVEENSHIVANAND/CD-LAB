%{
#include <stdio.h>
int yylex(void);
void yyerror(char *);
%}

%token T_a T_b

%%
start : T_b start
      | T_a mid
      | /* empty */
      ;

mid : T_b mid
    | /* empty */
    ;

%%

int main(void) {
    return yyparse();
}

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
