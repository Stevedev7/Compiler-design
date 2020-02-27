%{
  #include <stdio.h>
  #include <string.h>
  int c = 0;
%}
%s comment
%%
"//".*\n {c++;}
"/*" {BEGIN comment;}
<comment>"*/" {BEGIN 0; c++;}
<comment>\n {c++;}
<comment>. {;}
.|\n {fprintf(yyout, "%s", yytext);}
%%

int yywrap(){
  return 1;
}

int main(int argc, char *argv[]){
  yyin = fopen("test.c", "r");
  yyout = fopen("outputTest.c", "w");
  yylex();
  printf("The number of comment lines: %d\n", c);
  return 0;
}
