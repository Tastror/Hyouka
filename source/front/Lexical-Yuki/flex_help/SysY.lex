{%
    #pragma once
    #include"define.h"
    #include<iostream>
    #include<string>
%}
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

{id} {id(yyout);}
{floating} {floating(yyout);}
{decint} {decint(yyout);}
{hexint} {hexint(yyout);}
{octint} {octint(yyout);}


"="   {operator("=");}
"*"   {operator("*");}
"/"   {operator("/");}
"+"   {operator("+");}
"-"   {operator("-");}
"%"   {operator("%");}
"<"   {operator("<");}
">"   {operator(">");}
"<="  {operator("<=");}
">="  {operator(">=");}
"=="  {operator("==");}
"!="  {operator("!=");}
"&&"  {operator("&&");}
"||"  {operator("||");}
"!"   {operator("!")};
"("   {operator("(");}
")"   {operator(")");}
"["   {operator("[");}
"]"   {operator("]");}
%%

token_node *token_head=new token_node();
token_node *token_now=token_head;

void keyword(char *name){
    token_node* now=new token_node();
    now->type=KEYWORD;
    now->data=string(name);
    now->int_or_double=0;
    token_now->next=now;
}

void operator(char *name){
    token_node* now=new token_node();
    now->type=OPERAT;
    now->data=string(name);
    now->int_or_double=0;
    token_now->next=now;
}

void id(char *name){
    token_node* now=new token_node();
    now->type=ID;
    now->data=string(name);
    now->int_or_double=0;
    token_now->next=now;
} 

void number(char *name){
    token_node* now=new token_node();
    now->type=NUMBER;
    now->data=string(name);
    now->int_or_double=0;
    token_now->next=now;
}

void floating(char *name){
    token_node* now=new token_node();
    now->type=NUMBER;
    now->data=string(name).stod();
    now->int_or_double=2;
    token_now->next=now;
}

void integer(char *name){
    token_node* now=new token_node();
    now->type=NUMBER;
    now->data=string(name).stoi();
    now->int_or_double=1;
    token_now->next=now;
}