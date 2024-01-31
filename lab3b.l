%{
     #include<stdio.h>
     int flag=0;
%}

%%
.*[ ][or|and|nevertheless|but|if|because|then][" "]+  {flag=1;}
. ;
\n  {if(flag==1)
                  printf("Its a compound sentence\n"),exit(0);
        else 
                  printf("Its a simple sentence\n"),exit(0);}
               
%%

int yywrap(){}
int main(){
        printf("enter the Sentence:");
        yylex();     
        return 0;
}
