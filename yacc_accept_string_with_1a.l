%{
#include "y.tab.h"
#include <stdio.h>
%}

%%

"a"     { return T_a; }
"b"     { return T_b; }
\n      { return 0; }
.       { printf("Invalid character\n"); }

%%

int main(void) {
    yyparse();
    return 0;
}

int yywrap(void) {
    return 1;
}
