//
// Created by Tastror on 2022/5/15.
//

#pragma once
#include <utility>

#include "AST.h"
#include "define.h"


class DownTopExpressionAST: public BaseAST {
public:
    TNP Parse();
    explicit DownTopExpressionAST(TNP token_head): BaseAST(token_head) {}
    ~DownTopExpressionAST() override = default;
};

