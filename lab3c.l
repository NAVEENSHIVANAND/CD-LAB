%{
    #include<stdio.h>
    int flag=0;
%}

%%
[!|?|.]$  { flag=1; }
.  ;
\n  { if(flag==0)
        printf("This sentence doesnot ends with punctuation marks\n");
    else
        printf("This sentence ends with punctuation marks\n"); }
%%

int yywrap( )
{
    return 1;
}
int main()
{
    printf("Enter the sentence:\n");
    yylex();
    
    return 0;
}
