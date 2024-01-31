%%
[0-9][0-9][0-9][0-9] {
    int num = atoi(yytext);
    int sum = 0;

    // Calculate the sum of digits
    while (num > 0) {
        sum += num % 10;
        num /= 10;
    }

    // Check if the sum is 9
    if (sum == 9) {
        printf("%s is a four-digit number whose sum of digits is 9\n", yytext);
    }
    else {
        printf("%s is not 9 when added, its digit sum is %d\n", yytext, sum);
    }
}
.|\n {
    // Ignore other characters and newlines
}
%%

int yywrap() {
    return 0;
}

int main() {
    printf("Enter four-digit numbers:\n");
    yylex();
    return 0;
}
