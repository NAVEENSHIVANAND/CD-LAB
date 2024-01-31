#include <stdio.h>
#include <string.h>
#include <ctype.h>
int isKeyword(char *str) {
    char keywords[5][10] = {"int", "float", "if", "else", "while"};
    int i;
    for (i = 0; i < 5; ++i) {
        if (strcmp(keywords[i], str) == 0) {
            return 1;
        }
    }
    return 0;
}

int isOperatorOrPunctuation(char ch) {
    char operators[] = "+-*/%=";
    char punctuations[] = "();,.{}[]";
    int i;
    for (i = 0; i < strlen(operators); ++i) {
        if (operators[i] == ch) {
            return 1;
        }
    }
    for (i = 0; i < strlen(punctuations); ++i) {
        if (punctuations[i] == ch) {
            return 1;
        }
    }
    return 0;
}

void lexicalAnalyzer(char *input) {
    int i = 0;
    int len = strlen(input);
    while (i < len) {
        // Skip spaces
        if (isspace(input[i])) {
            i++;
            continue;
        }
        if (isalpha(input[i]) || input[i] == '_') {
            char token[50];
            int j = 0;
            token[j++] = input[i++];
            while (isalnum(input[i]) || input[i] == '_') {
                token[j++] = input[i++];
            }
            token[j] = '\0';
            if (isKeyword(token)) {
                printf("Keyword: %s\n", token);
            } else {
                printf("Identifier: %s\n", token);
            }
            continue;
        }
        if (isdigit(input[i])) {
            char token[50];
            int j = 0;
            token[j++] = input[i++];
            while (isdigit(input[i])) {
                token[j++] = input[i++];
            }
            token[j] = '\0';
            printf("Number: %s\n", token);
            continue;
        }
        if (isOperatorOrPunctuation(input[i])) {
            printf("Operator or Punctuation: %c\n", input[i++]);
            continue;
        }
        i++;
    }
}

int main() {
    char input[1000];
    printf("Enter the input string: ");
    fgets(input, sizeof(input), stdin);
   
    printf("Tokenizing the input:\n");
    lexicalAnalyzer(input);
   
    return 0;
}
