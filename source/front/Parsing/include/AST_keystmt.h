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
    explicit KeywordStatementAST(TNP token_head): BaseAST(token_head) {}
    ~KeywordStatementAST() override = default;
};