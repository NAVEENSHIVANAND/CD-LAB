%{
#include <stdio.h>
int d = 0, c = 0;
%}

%%
[a-zA-Z] { c++; }
[0-9]    { d++; }
. ;
\n { printf("No of characters and digits are %d and %d\n", c, d); c = 0; d = 0; }
%%

int main() {
    printf("Enter a sentence:\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
