//
// Created by Tastror on 2022/5/15.
//

#pragma once
#include "AST.h"
#include "AST_expr.h"
#include "define.h"

// examples:
// if (x == 3) x = 2;
//           ^
//       expr return
// if (x > 2) {}
//              ^
//       statement return
// return 2 + 5;
//             ^
//        expr return
// notice:
// - including ;
// - self return at ;::after or }::after
class KeywordStatementAST: public BaseAST {
public:
    TNP Parse();
    explicit KeywordStatementAST(const TNP& token_head, const Symtable& symtable): BaseAST(token_head, symtable) {}
    explicit KeywordStatementAST(const TNP& token_head, const std::shared_ptr<Symtable>& symtable_ptr): BaseAST(token_head, symtable_ptr) {}
    ~KeywordStatementAST() override = default;
};