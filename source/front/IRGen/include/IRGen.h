//
// Created by Tastror on 2022/5/29.
//

#pragma once
#include <iostream>
#include <utility>

#include "define.h"

namespace IRGEN {

    struct tuple {
        int count;
        bool judge;
        bool is_value;
        std::string name;
        value_tuple value;
        std::string to_string() {
            return (is_value ? value.to_string() : name);
        }
    };

}

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
    IR_PTR create_forth(const std::string& comment,
                        const std::string& target,
                        const std::string& opera,
                        const std::string& org_1 = "",
                        const std::string& org_2 = "");
    IR_PTR create_forth(const std::string& comment, const std::string& target, const std::string& opera, int org_1, int org_2 = 0);
    IR_PTR create_forth(const std::string& comment, const std::string& target, const std::string& opera, int org_1, double org_2);
    IR_PTR create_forth(const std::string& comment, const std::string& target, const std::string& opera, int org_1, const std::string& org_2);
    IR_PTR create_forth(const std::string& comment, const std::string& target, const std::string& opera, double org_1, int org_2 = 0);
    IR_PTR create_forth(const std::string& comment, const std::string& target, const std::string& opera, double org_1, double org_2);
    IR_PTR create_forth(const std::string& comment, const std::string& target, const std::string& opera, double org_1, const std::string& org_2);
    IR_PTR create_forth(const std::string& comment, const std::string& target, const std::string& opera, const std::string& org_1, int org_2);
    IR_PTR create_forth(const std::string& comment, const std::string& target, const std::string& opera, const std::string& org_1, double org_2);

    void Generate();

    void basic_generate(const std::shared_ptr<AST_node>& now_AST);
    void program_generate(std::shared_ptr<AST_node> now_AST);
    void function_generate(std::shared_ptr<AST_node> now_AST);
    void single_define_generate(std::shared_ptr<AST_node> now_AST);
    void if_generate(std::shared_ptr<AST_node> now_AST);
    IRGEN::tuple expr_generate(std::shared_ptr<AST_node> now_AST, const std::string& passing_down_name = "");
};