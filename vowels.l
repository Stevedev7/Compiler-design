%{
    #include <stdio.h>
    int c = 0, v = 0;
%}

%%
[aeiouAEIOU] {v++;}
[a-zA-Z] {c++;}
%%
int yywrap(){
  return 1;
}

int main(){
  printf("Enter a word\n");
  yylex();
  printf("v -> %d\nc -> %d\n", v, c);
  return 0;
}
