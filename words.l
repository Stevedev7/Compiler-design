%{
    #include <stdio.h>
    int w = 0, l = 0, s = 0, c = 0;
%}
word [^ \t\n.,:%/;]+
space [ ]
line [\n]
%%
{word} {w++;c += yyleng;}
{space} {s++;}
{line} {l++;}
%%
int yywrap(){
  return 1;
}

int main(){
  yyin = fopen("test.c", "r");
  yylex();
  printf("\nw -> %d\nc -> %d\ns -> %d\nnl -> %d", w, c, s, l);
  return 0;
}
