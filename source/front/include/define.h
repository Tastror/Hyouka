//
// Created by Tastror on 2022/5/13.
//

#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <string>

enum token_type {
    ident, punct, number, rname, operat
};

struct token_node {
    token_type type;
    std::string data;
    token_node* next;
};

#define TNP token_node*

/*
input:
1 <ident, int>
2 <rname, main>
3 <punct, (>
4 <punct, )>
5 <punct, {>
6 <ident, const>
7 <ident, float>
8 <rname, pi>
9 <number, 3.14>
10 <punct, ;>
11 <ident, return>
12 <number, 0>
13 <punct, ;>
14 <punct, }>
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
