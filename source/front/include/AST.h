//
// Created by Tastror on 2022/5/14.
//

#pragma once
#include "include/define.h"
#include <iostream>

void RaiseError(const std::string& error_code, const std::string& token_data);

void connect_child(ANP parent, ANP child);

void _print_all_ASTs(ANP now, int stage);

void print_all_ASTs(ANP AST_head);


class BaseAST {
public:
    ANP head;
    TNP now_token;
    TNP look_ahead;
    void GoNext() {
        now_token = look_ahead;
        look_ahead = next(now_token);
    }
    explicit BaseAST(TNP token_head) {
        head = new AST_node;
        now_token = token_head;
        look_ahead = next(now_token);
    };
    virtual ~BaseAST() = default;
};


// examples:
// 5
// 2 + 1
// x == 3
// notice:
// - no ; , ) } ]
// - end with ; , ) } ]
// - self return at ; , ) } ]
class ExpressionAST: public BaseAST {
public:
    TNP Parse();
    explicit ExpressionAST(TNP token_head): BaseAST(token_head) {}
    ~ExpressionAST() override = default;
};


// examples:
// x = 3
// y = 8 * 5 + 1
//               ^
//           expr return
// notice:
// - no , ; )
// - end with ; , )
// - self return at , ; )
class SingleAssignmentAST: public BaseAST {
public:
    TNP Parse();
    explicit SingleAssignmentAST(TNP token_head): BaseAST(token_head) {}
    ~SingleAssignmentAST() override = default;
};


// examples:
// x[2] = 3
// y[7][4] = 8 * 5 + 1
//                    ^
//               expr return
// notice:
// - no , ; )
// - end with ; , )
// - self return at , ; )
class ArrayAssignmentAST: public BaseAST {
public:
    TNP Parse();
    explicit ArrayAssignmentAST(TNP token_head): BaseAST(token_head) {}
    ~ArrayAssignmentAST() override = default;
};


// examples:
// x = 3
// y = 8 * 5 + 1
//              ^
//          expr return
// notice:
// - no , or ;
// - end with , or ;
// - self return at , or ;
class SingleDefinitionAST: public BaseAST {
public:
    TNP Parse();
    explicit SingleDefinitionAST(TNP token_head): BaseAST(token_head) {}
    ~SingleDefinitionAST() override = default;
};


// examples:
// a[]
// x[5] = {}
// y[6] = {8 * 5 + 1, 7}
// z[3][3] = {{}, {2}, 1, 3}
//                  ^
//             expr return
// notice:
// - no , or ;
// - end with , or ;
// - self return at , or ;
class ArrayDefinitionAST: public BaseAST {
public:
    TNP Parse();
    explicit ArrayDefinitionAST(TNP token_head): BaseAST(token_head) {}
    ~ArrayDefinitionAST() override = default;
};


// examples:
// int x = 3, y = 4;
//          ^      ^
//         def return
// const float x[5] = {2.5, 1};
//                            ^
//                        def return
// notice:
// - including , ;
// - self return at ;::after
class DeclarationStatementAST: public BaseAST {
public:
    TNP Parse();
    explicit DeclarationStatementAST(TNP token_head): BaseAST(token_head) {}
    ~DeclarationStatementAST() override = default;
};


// examples:
// 2 + 1;
//      ^
// expr return
// x = 5;
//       ^
// assign return
// { x = 5; }
//           ^
//      block return
// if (x == 3) x = 2;
// if (x > 2) {}
//              ^
//           if return
// notice:
// - including ;
// - self return at ;::after, }::after or at last }
class NormalStatementAST: public BaseAST {
public:
    TNP Parse();
    explicit NormalStatementAST(TNP token_head): BaseAST(token_head) {}
    ~NormalStatementAST() override = default;
};


// examples:
// { 5; 2 + 1; int x = 3; if (x > 2) {x = x - 1;} x = x + 5; return 0; }
//                       ^                       ^                     ^
//             def statement return      normal stmt return    normal stmt return
// notice:
// - including { and }
// - self return at }::after
class BlockStatementAST: public BaseAST {
public:
    TNP Parse();
    explicit BlockStatementAST(TNP token_head): BaseAST(token_head) {}
    ~BlockStatementAST() override = default;
};


// examples:
// int x, float y, int z
// notice:
// - no ( or )
// - end with )
// - self return at )
class FunctionParamsAST: public BaseAST {
public:
    TNP Parse();
    explicit FunctionParamsAST(TNP token_head): BaseAST(token_head) {}
    ~FunctionParamsAST() override = default;
};


// examples:
// void func(int a, float b) { 3 + 1; return; }
//                         ^                   ^
//                     param return       block return
// notice:
// - no ; at the end, {} is in block item
// - self return at }::after
class FunctionDefinitionAST: public BaseAST {
public:
    TNP Parse();
    explicit FunctionDefinitionAST(TNP token_head): BaseAST(token_head) {}
    ~FunctionDefinitionAST() override = default;
};


// the program itself
class ProgramAST: public BaseAST {
public:
    TNP Parse();
    explicit ProgramAST(TNP token_head): BaseAST(token_head) {}
    ~ProgramAST() override = default;
};