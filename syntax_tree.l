%{
#include "y.tab.h"
#include <stdlib.h>
%}

%%

[0-9]+   {
            yylval = atoi(yytext);
            return NUM;
        }

[+\-*/^()] { return yytext[0]; }

[ \t\n]   { /* ignore whitespace */ }

.         { 
            fprintf(stderr, "Unknown character: %s\n", yytext);
            return 0;
        }

%%

int yywrap() {
    return 1;
}
