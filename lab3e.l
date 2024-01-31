%{
#include<stdio.h>
int c; // Declare c without extern
%}
%%
"\/\*"[^*]*\*+([^/*][^*]*\*+)*\/ {c++;}
"\/\/".* {c++;}
. ECHO;
%%
int yywrap() {
    return 1;
}
void main() {
    c = 0; // Initialize c
    yyin = fopen("input.txt", "r");
    yyout = fopen("output.txt", "w");
    yylex();
    printf("The number of comments is: %d\n", c);
    fclose(yyin);
    fclose(yyout);
}
