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
    explicit ArrayUsageAST(const TNP& token_head, const Symtable& symtable): BaseAST(token_head, symtable) {}
    explicit ArrayUsageAST(const TNP& token_head, const std::shared_ptr<Symtable>& symtable_ptr): BaseAST(token_head, symtable_ptr) {}
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
    explicit FunctionUsageAST(const TNP& token_head, const Symtable& symtable): BaseAST(token_head, symtable) {}
    explicit FunctionUsageAST(const TNP& token_head, const std::shared_ptr<Symtable>& symtable_ptr): BaseAST(token_head, symtable_ptr) {}
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
    explicit ExpressionAST(const TNP& token_head, const Symtable& symtable): BaseAST(token_head, symtable) {}
    explicit ExpressionAST(const TNP& token_head, const std::shared_ptr<Symtable>& symtable_ptr): BaseAST(token_head, symtable_ptr) {}
    ~ExpressionAST() override = default;
};

