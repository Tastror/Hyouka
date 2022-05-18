newline [\n]
whitespsce [\t ]
comment ("/*".*"*/")|("//".*[\n])
digit [0-9]
letter [A-Za-z]
id ({letter}|_)({letter}|{digit}|_)*
decint [1-9]{digit}*|0
hexint 0(x|X)({digit}|[A-Fa-f])*
octint 0[1-7]*
floating [0-9]*\.[0-9]*

%%
while {keyword("while");}
if    {keyword("if");}
else  {keyword("else");}
break  {keyword("break");}
int  {keyword("int");}
float {keyword("float");}
void {keyword("void");}
return {keyword("return");}

{id} {id(yytext);}
{floating} {floating(yytext);}
{decint} {decint(yytext);}
{hexint} {hexint(yytext);}
{octint} {octint(yytext);}


"="   {operat("=");}
"*"   {operat("*");}
"/"   {operat("/");}
"+"   {operat("+");}
"-"   {operat("-");}
"%"   {operat("%");}
"<"   {operat("<");}
">"   {operat(">");}
"<="  {operat("<=");}
">="  {operat(">=");}
"=="  {operat("==");}
"!="  {operat("!=");}
"&&"  {operat("&&");}
"||"  {operat("||");}
"!"   {operat("!");}
"("   {operat("(");}
")"   {operat(")");}
"["   {operat("[");}
"]"   {operat("]");}
%%

extern void keyword(char *name){};

extern void operat(char *name){};

extern void id(char *name){}; 

extern void number(char *name){};

extern void floating(char *name){};

extern void integer(char *name){};