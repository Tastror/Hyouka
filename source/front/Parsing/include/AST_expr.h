//
// Created by Tastror on 2022/5/15.
//

#pragma once
#include "AST.h"

// examples:
// a[2 + 4][2]
//        ^
//   expr return
// notice:
// - including [ ]
// - self return at ]::after
class ArrayUsageAST: public BaseAST {
public:
    TNP Parse();
    explicit ArrayUsageAST(const TNP& token_head, Symtable& symtable): BaseAST(token_head, symtable) {}
    ~ArrayUsageAST() override = default;
};

// examples:
// test(2, 3)
//          ^
//     expr return
// notice:
// - including ( )
// - end with )
// - self return at )::after
class FunctionUsageAST: public BaseAST {
public:
    TNP Parse();
    explicit FunctionUsageAST(const TNP& token_head, Symtable& symtable): BaseAST(token_head, symtable) {}
    ~FunctionUsageAST() override = default;
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
    explicit ExpressionAST(const TNP& token_head, Symtable& symtable): BaseAST(token_head, symtable) {}
    ~ExpressionAST() override = default;
};

