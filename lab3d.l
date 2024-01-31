%{
     #include<stdio.h>
     int flag=0;
%}

%%
^[A|An|AN|an|a|The|the|THE][" "] {flag=1;}
. ;      
\n  {if(flag==1)
                  printf("This sentence begins with article\n"),exit(0);
        else 
                  printf("This sentence doesn't begins with article\n"),exit(0);}
               
%%

int yywrap(){}
int main(){
        printf("enter the Sentence:");
        yylex();
                  
        return 0;
}
