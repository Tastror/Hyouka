//
// Created by Tastror on 2022/5/29.
//

#pragma once
#include <iostream>
#include <utility>

#include "define.h"

class IRGen {
public:
    IR_PTR head;
    IR_PTR now_ir;
    AST_PTR AST;
    explicit IRGen(const std::shared_ptr<AST_node>& AST_head);
    void Generate();
    void re_Generate(const std::shared_ptr<AST_node>& now_AST);
};