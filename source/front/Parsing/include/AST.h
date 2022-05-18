//
// Created by Tastror on 2022/5/14.
//

#pragma once
#include <iostream>
#include "define.h"

void RaiseError(const std::string& error_code, const std::string& token_data);

void connect_child(ANP parent, ANP child);
void reverse_connect_child(ANP parent, ANP child);




class BaseAST {
public:
    ANP head;
    TNP now_token;
    TNP next_token;
    bool error;
    void GoNext() {
        now_token = next_token;
        next_token = next(now_token);
    }
    explicit BaseAST(TNP token_head) {
        error = false;
        head = new AST_node;
        now_token = token_head;
        next_token = next(now_token);
    };
    bool UpdateError();
    virtual ~BaseAST() = default;
};


// examples:
// x = 3
// y = 8 * 5 + 1
//              ^
//         expr return
// notice:
// - no , ; )
// - usually end with ; , )
// - self return at expr::after
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
// - usually end with ; , )
// - self return at expr::after
class ArrayAssignmentAST: public BaseAST {
public:
    TNP Parse();
    explicit ArrayAssignmentAST(TNP token_head): BaseAST(token_head) {}
    ~ArrayAssignmentAST() override = default;
};


// examples:
// x
// x = 3
// y = 8 * 5 + 1
//              ^
//         expr return
// notice:
// - no , or ;
// - usually end with , or ;
// - self return at identifyName::after or expr::after
class SingleDefinitionAST: public BaseAST {
public:
    TNP Parse();
    explicit SingleDefinitionAST(TNP token_head): BaseAST(token_head) {}
    ~SingleDefinitionAST() override = default;
};


// examples:
// {}
// {8 * 5 + 1, 7}
// {{}, {2}, 1, 3}
//        ^
//   expr return
// notice:
// - self return at }::after
class ArrayInitialBlockAST: public BaseAST {
public:
    TNP Parse();
    explicit ArrayInitialBlockAST(TNP token_head): BaseAST(token_head) {}
    ~ArrayInitialBlockAST() override = default;
};


// examples:
// a[]
// x[5] = {}
// y[6] = {8 * 5 + 1, 7}
// z[3][3] = {{}, {2}, 1, 3}
//                          ^
//                  init block return
// notice:
// - no , or ;
// - end with , or ;
// - self return at ]::after or }::after
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
// x = 51;
//       ^
// assign return
// { x = 5; }
//           ^
//      block return
// if (x == 3) x = 2;
// if (x > 2) {}
//              ^
//          key return
// return 2 + 5;
//              ^
//          key return
// notice:
// - including ;
// - self return at ;::after or }::after
class NormalStatementAST: public BaseAST {
public:
    TNP Parse();
    explicit NormalStatementAST(TNP token_head): BaseAST(token_head) {}
    ~NormalStatementAST() override = default;
};


// examples:
// 5;
// 2 + 1;
// int x = 3;
//           ^
//  def statement return
// if (x > 2) {x = x - 1;}
//                        ^
//                normal stmt return
// notice:
// - including { and }
// - self return at }::after or ;::after
class StatementAST: public BaseAST {
public:
    TNP Parse();
    explicit StatementAST(TNP token_head): BaseAST(token_head) {}
    ~StatementAST() override = default;
};


// examples:
// { 5; 2 + 1; int x = 3; if (x > 2) {x = x - 1;} x = x + 5; return 0; }
//                       ^                       ^                     ^
//                statement return        statement return      statement return
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
// int x
// float y
// notice:
// - end with , or )
// - self return at identifyName::after
class FunctionFormParamAST: public BaseAST {
public:
    TNP Parse();
    explicit FunctionFormParamAST(TNP token_head): BaseAST(token_head) {}
    ~FunctionFormParamAST() override = default;
};


// examples:
// int x, float y, int z
//               ^
//      single param return
// notice:
// - no ( or )
// - end with )
// - self return at identifyName::after
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