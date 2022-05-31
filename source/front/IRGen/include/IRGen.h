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
    static int line_num;

    static int now_register;

    explicit IRGen(const std::shared_ptr<AST_node>& AST_head);

    IR_PTR create_empty_ir();
    IR_PTR create_label(const std::string& comment, const std::string& target);
    IR_PTR create_forth(const std::string& comment, const IR_tuple& target,
                        const std::string& opera, const IR_tuple& org_1, const IR_tuple& org_2 = IR_tuple());

    void Generate();

    void basic_generate(const std::shared_ptr<AST_node>& now_AST);
    void program_generate(std::shared_ptr<AST_node> now_AST);
    void function_generate(std::shared_ptr<AST_node> now_AST);
    void single_define_generate(std::shared_ptr<AST_node> now_AST);
    void if_generate(std::shared_ptr<AST_node> now_AST);
    IR_tuple expr_generate(std::shared_ptr<AST_node> now_AST, const IR_tuple& passing_down = IR_tuple());
};