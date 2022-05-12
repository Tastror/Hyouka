//
// Created by Tastror on 2022/5/13.
//

#include <string>

enum token_type {
    KEYWORD, PUNCT, NUMBER, RNAME, OPERAT
};

struct token_node {
    token_type type;
    std::string data;
    token_node* next;
};

enum ASP_type {
    ProgramBody,
    IncludeSharp,
    Identifier,
    FunctionDefinition, FunctionType, FunctionParams, FunctionArguments,
    ConstDeclaration, VariableDeclaration, ConstDefinition, VariableDefinition, BasicType,
    Number
};

struct ASP_node {
    ASP_type type;
    std::string data;
    ASP_node* sister;
    ASP_node* child;
    ASP_node* parent;
};

#define TNP token_node*
#define ANP ASP_node*

/*
input:
1 <KEYWORD, int>
2 <RNAME, main>
3 <PUNCT, (>
4 <PUNCT, )>
5 <PUNCT, {>
6 <KEYWORD, const>
7 <KEYWORD, float>
8 <RNAME, pi>
9 <OPEART, =>
10 <NUMBER, 0.14>
11 <OPEART, +>
12 <NUMBER, 3>
13 <PUNCT, ;>
14 <KEYWORD, return>
15 <NUMBER, 0>
16 <PUNCT, ;>
17 <PUNCT, }>
*/

/*
Risou na output:

PROGRAM
|
function
|     |     |    |       |    |    |              |
type  name  (    param   )    {    block-content  }
|     |          |
int   main       epsilon


block-content
|                             |
block                         block
|          |                  |         |
statement  ;                  statement ;
|                             |
define                        return_state
|         |     |             |      |
typeident type  name-define   return value
|         |     |    | |             |
const     float name = value         0
                |      |
                pi     3.14

数据全用链表保存。

*/
