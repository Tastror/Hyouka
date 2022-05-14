//
// Created by Tastror on 2022/5/15.
//

#pragma once
#include "AST.h"

class FunctionRealParamAST: public BaseAST {
public:
    TNP Parse();
    explicit FunctionRealParamAST(TNP token_head): BaseAST(token_head) {}
    ~FunctionRealParamAST() override = default;
};

// examples:
// test(2, 3)
//          ^
//     param return
// notice:
// - including ( )
// - end with )
// - self return at )
class FunctionUsageAST: public BaseAST {
public:
    TNP Parse();
    explicit FunctionUsageAST(TNP token_head): BaseAST(token_head) {}
    ~FunctionUsageAST() override = default;
};

class DownTopExpressionAST: public BaseAST {
public:
    TNP Parse();
    explicit DownTopExpressionAST(TNP token_head): BaseAST(token_head) {}
    ~DownTopExpressionAST() override = default;
};

