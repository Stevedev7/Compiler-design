%{
  #include <stdio.h>
  int s = 1;
%}
%%
[ \t\n]+[aA][nN][dD][ \t\n]+ {s = 0;}
[ \t\n]+[bB][bB][tT][ \t\n]+ {s = 0;}
[ \t\n]+[oO][rR][ \t\n]+ {s = 0;}
%%
int yywrap(){
  return 1;
}

int main(){
  printf("Enter a sentence: ");
  yylex();
  if(s == 0){
    printf("Compound\n");
  } else{
    printf("Simple\n");
  }
  return 0;
}
