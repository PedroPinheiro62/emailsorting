%{

#include <stdio.h>
#include <string.h>

int validCounter = 0;
int unicampCounter = 0;
int feeCounter = 0;

%}

USUARIO [0-9a-zA-Z]+
DOMINIO [a-z]+([.][a-z]+)*
UNICAMP unicamp.br

%%

{USUARIO}[@]([a-z]+[.])*fee[.]{UNICAMP} {validCounter++; unicampCounter++; feeCounter++;}
{USUARIO}[@]([a-z]+[.])*{UNICAMP} {validCounter++; unicampCounter++;}
{USUARIO}[@]{DOMINIO} {validCounter++;}

[[:space:]]+ ;
[[:^space:]]+ ;

[.\n]* ;

%%

int main() {
  yylex();
  printf("%d %d %d\n", validCounter, unicampCounter, feeCounter);
  return 0;
}
