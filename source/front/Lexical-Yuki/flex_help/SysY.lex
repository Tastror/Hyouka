newline [\n]
whitespsce [\t ]
comment ("/*".*"*/")|("//".*[\n])
digit [0-9]
letter [A-Za-z]
id ({letter}|_)({letter}|{digit}|_)*
decint [1-9]{digit}*|0
hexint 0(x|X)({digit}|[A-Fa-f])*
octint 0[1-7]*

%%
while {keyword("while");}
if    {keyword("if");}
else  {keyword("else");}
break  {keyword("break");}
int  {keyword("int");}
float {keyword("float");}
void {keyword("void");}
return {keyword(Return);}
"*"   {operator(star);}
"+"   {Operator(plus);}
"-"   {Operator(minus);}
"="   {Operator(assign);}
"<"   {Operator(relop_lt);}
">"   {Operator(relop_gt);}
"<="  {Operator(relop_le);}
">="  {Operator(relop_ge);}
"=="  {Operator(relop_eq);}
"/"   {Operator(div);}
%%

void keyword(char *name){
    token_node* now=new token_node();
    now->type=KEYWORD;
    now->data=string(name);
    now->int_or_double=0;
    token_now->next=now;
}

