%{
  #include <stdio.h>
%}
%%
[+]?[0-9]+ {printf("Positive integer\n");}
[-][0-9]+ {printf("Negative integer\n");}
[+]?[0-9]+\.[0-9]+ {printf("Positive float\n");}
[-][0-9]+\.[0-9]+ {printf("Negative float\n");}
[+]?[0-9]+[/][0-9]+ {printf("Positive fraction\n");}
[-][0-9]+[/][0-9]+ {printf("Negative fraction\n");}
.* {printf("Invalid entry\n");}
%%
int yywrap(){
  return 1;
}

int main(){
  yylex();
  return 0;
}
