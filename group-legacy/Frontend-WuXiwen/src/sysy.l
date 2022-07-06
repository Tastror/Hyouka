%option noyywrap
%option nounput
%option noinput

%{

#include <cstdlib>
#include <string>
#include <iostream>

#include "sysy.tab.hpp"

using namespace std;

%}

/* 空白符和注释 */
WhiteSpace    [ \t\n\r]*
LineComment   "//".*

/* 标识符 */
Identifier    [a-zA-Z_][a-zA-Z0-9_]*

/* 整数字面量 */
Decimal       [1-9][0-9]*
Octal         0[0-7]*
Hexadecimal   0[xX][0-9a-fA-F]+

%%

{WhiteSpace}    { /* 忽略, 不做任何操作 */ }
{LineComment}   { /* 忽略, 不做任何操作 */ }

"int"           { yylval.str_val = new string(yytext); return INT; }
"return"        { yylval.str_val = new string(yytext); return RETURN; }
"const"        { yylval.str_val = new string(yytext); return CONST; }

{Identifier}    { yylval.str_val = new string(yytext); return IDENT; }

"+"		{ yylval.str_val = new string(yytext); return ADD; }
"-"		{ yylval.str_val = new string(yytext); return SUB; }
"*"		{ yylval.str_val = new string(yytext); return MUL; }
"/"		{ yylval.str_val = new string(yytext); return DIV; }
"%"		{ yylval.str_val = new string(yytext); return MOD; }
"!"		{ yylval.str_val = new string(yytext); return NOT; }
"&&"		{ yylval.str_val = new string(yytext); return AND; }
"||"		{ yylval.str_val = new string(yytext); return OR; }
"<"		{ yylval.str_val = new string(yytext); return LT; }
">"		{ yylval.str_val = new string(yytext); return GT; }
"<="		{ yylval.str_val = new string(yytext); return LEQ; }
">="		{ yylval.str_val = new string(yytext); return GEQ; }
"=="		{ yylval.str_val = new string(yytext); return EQ; }
"!="		{ yylval.str_val = new string(yytext); return NEQ; }
"="		{ yylval.str_val = new string(yytext); return ASSIGN; }
"{"		{ yylval.str_val = new string(yytext); return LBRACE; }
"}"		{ yylval.str_val = new string(yytext); return RBRACE; }
"("		{ yylval.str_val = new string(yytext); return LPAREN; }
")"		{ yylval.str_val = new string(yytext); return RPAREN; }
","		{ yylval.str_val = new string(yytext); return COMMA; }
";"		{ yylval.str_val = new string(yytext); return SEMI; }

{Decimal}       { yylval.int_val = strtol(yytext, nullptr, 0); return INT_CONST; }
{Octal}         { yylval.int_val = strtol(yytext, nullptr, 0); return INT_CONST; }
{Hexadecimal}   { yylval.int_val = strtol(yytext, nullptr, 0); return INT_CONST; }

.               { return yytext[0]; }

%%