%{
#include <stdio.h>
#include <stdlib.h>
%}

%union {
    struct node *a;
}

%token <a> NUM
%type  <a> expr

%right '^'
%left '*' '/'
%left '+' '-'
%nonassoc '(' ')'

%%

expr:   expr '+' expr   { $$ = create_node("+", $1, $3); }
    |   expr '-' expr   { $$ = create_node("-", $1, $3); }
    |   expr '*' expr   { $$ = create_node("*", $1, $3); }
    |   expr '/' expr   { $$ = create_node("/", $1, $3); }
    |   expr '^' expr   { $$ = create_node("^", $1, $3); }
    |   '(' expr ')'    { $$ = $2; }
    |   NUM             { $$ = create_leaf_node($1); }
    ;

%%

struct node {
    char *token;
    struct node *left;
    struct node *right;
};

struct node *create_node(char *token, struct node *left, struct node *right) {
    struct node *newnode = (struct node *) malloc(sizeof(struct node));
    newnode->token = token;
    newnode->left = left;
    newnode->right = right;
    return newnode;
}

struct node *create_leaf_node(int num) {
    struct node *newnode = (struct node *) malloc(sizeof(struct node));
    newnode->token = (char *) malloc(sizeof(char) * 2);
    sprintf(newnode->token, "%d", num);
    newnode->left = NULL;
    newnode->right = NULL;
    return newnode;
}

int main() {
    yyparse();
    return 0;
}

int yyerror(char *s) {
    fprintf(stderr, "error: %s\n", s);
    return 0;
}
