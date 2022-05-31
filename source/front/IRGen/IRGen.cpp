//
// Created by Tastror on 2022/5/29.
//

#include "IRGen.h"

int IRGen::line_num = 0;
int IRGen::now_register = 0;

namespace IRGEN {

    tuple count_child_number(const AST_PTR& now_node) {
        if (now_node == nullptr) return (tuple){0, false};
        tuple res = {0, true};
        AST_PTR temp = now_node->child;
        while (temp != nullptr) {
            res.count++;
            if (!temp->count_expr_ending)
                res.judge = false;
            if (temp->declaration_bound_sym_node != nullptr) {
                if (temp->declaration_bound_sym_node->treat_as_constexpr) {
                    res.judge = true;
                    temp->value = temp->declaration_bound_sym_node->value;
                    temp->basic_type = temp->declaration_bound_sym_node->basic_type;
                }
            }
            temp = temp->sister;
        }
        return res;
    }

}

IRGen::IRGen(const std::shared_ptr<AST_node>& AST_head) {
    head = std::make_shared<IR_node>();
    now_ir = head;
    AST = AST_head;
}

IR_PTR IRGen::create_empty_ir() {
    IR_PTR new_ir = std::make_shared<IR_node>();
    now_ir->next = new_ir;
    now_ir = new_ir;
    now_ir->index = line_num++;
    return now_ir;
}

IR_PTR IRGen::create_forth(const std::string& comment, const std::string& target, const std::string& opera, const std::string& org_1, const std::string& org_2) {
    IR_PTR new_ir = std::make_shared<IR_node>();
    now_ir->next = new_ir;
    now_ir = new_ir;
    now_ir->ir_type = ir_forth;
    now_ir->comment = comment;
    now_ir->target = target;
    now_ir->opera = opera;
    now_ir->org_1 = org_1;
    now_ir->org_2 = org_2;
    now_ir->index = line_num++;
    return now_ir;
}

IR_PTR IRGen::create_forth(const std::string& comment, const std::string& target, const std::string& opera, int org_1, int org_2) {
    create_forth(comment, target, opera);
    now_ir->org_1_using_value = true;
    now_ir->value_1.type = basic_int;
    now_ir->value_1.value.int_value = org_1;
    now_ir->org_2_using_value = true;
    now_ir->value_2.type = basic_int;
    now_ir->value_2.value.int_value = org_2;
    return now_ir;
}

IR_PTR IRGen::create_forth(const std::string& comment, const std::string& target, const std::string& opera, int org_1, double org_2) {
    create_forth(comment, target, opera);
    now_ir->org_1_using_value = true;
    now_ir->value_1.type = basic_int;
    now_ir->value_1.value.int_value = org_1;
    now_ir->org_2_using_value = true;
    now_ir->value_2.type = basic_float;
    now_ir->value_2.value.double_value = org_2;
    return now_ir;
}

IR_PTR IRGen::create_forth(const std::string& comment, const std::string& target, const std::string& opera, int org_1, const std::string& org_2) {
    create_forth(comment, target, opera, "", org_2);
    now_ir->org_1_using_value = true;
    now_ir->value_1.type = basic_int;
    now_ir->value_1.value.int_value = org_1;
    return now_ir;
}

IR_PTR IRGen::create_forth(const std::string& comment, const std::string& target, const std::string& opera, double org_1, int org_2) {
    create_forth(comment, target, opera);
    now_ir->org_1_using_value = true;
    now_ir->value_1.type = basic_float;
    now_ir->value_1.value.double_value = org_1;
    now_ir->org_2_using_value = true;
    now_ir->value_2.type = basic_int;
    now_ir->value_2.value.int_value = org_2;
    return now_ir;
}

IR_PTR IRGen::create_forth(const std::string& comment, const std::string& target, const std::string& opera, double org_1, double org_2) {
    create_forth(comment, target, opera);
    now_ir->org_1_using_value = true;
    now_ir->value_1.type = basic_float;
    now_ir->value_1.value.double_value = org_1;
    now_ir->org_2_using_value = true;
    now_ir->value_2.type = basic_float;
    now_ir->value_2.value.double_value = org_2;
    return now_ir;
}

IR_PTR IRGen::create_forth(const std::string& comment, const std::string& target, const std::string& opera, double org_1, const std::string& org_2) {
    create_forth(comment, target, opera, "", org_2);
    now_ir->org_1_using_value = true;
    now_ir->value_1.type = basic_float;
    now_ir->value_1.value.double_value = org_1;
    return now_ir;
}

IR_PTR IRGen::create_forth(const std::string& comment, const std::string& target, const std::string& opera, const std::string& org_1, int org_2) {
    create_forth(comment, target, opera, org_1);
    now_ir->org_2_using_value = true;
    now_ir->value_2.type = basic_int;
    now_ir->value_2.value.int_value = org_2;
    return now_ir;
}

IR_PTR IRGen::create_forth(const std::string& comment, const std::string& target, const std::string& opera, const std::string& org_1, double org_2) {
    create_forth(comment, target, opera, org_1);
    now_ir->org_2_using_value = true;
    now_ir->value_2.type = basic_float;
    now_ir->value_2.value.double_value = org_2;
    return now_ir;
}

IR_PTR IRGen::create_label(const std::string& comment, const std::string& target) {
    IR_PTR new_ir = std::make_shared<IR_node>();
    now_ir->next = new_ir;
    now_ir = new_ir;
    now_ir->ir_type = ir_label;
    now_ir->target = target;
    now_ir->comment = comment;
    now_ir->index = line_num++;
    return now_ir;
}

void IRGen::Generate() {
    basic_generate(AST);
}

void IRGen::basic_generate(const std::shared_ptr<AST_node>& now_AST) {
    if (now_AST == nullptr) return;
    if (now_AST->type == ProgramBody)
        program_generate(now_AST);
    else if (now_AST->type == FunctionDefinition)
        function_generate(now_AST);
    else if (now_AST->type == SingleDefinition)
        single_define_generate(now_AST);
}

void IRGen::program_generate(std::shared_ptr<AST_node> now_AST) {
    now_AST = now_AST->child;
    while (now_AST != nullptr) {
        basic_generate(now_AST);
        now_AST = now_AST->sister;
    }
}

void IRGen::function_generate(std::shared_ptr<AST_node> now_AST) {
    create_label("args num = " + std::to_string(now_AST->arg_num), now_AST->only_name);
    auto func_type = (function_type) now_AST->function_type;
    AST_PTR para = now_AST->child->sister->sister->child;
    create_forth("", "$paranum", "assign", (int) now_AST->arg_num, 0);
    for (int i = 0; i < now_AST->arg_num; ++i) {
        create_forth("", para->only_name, "assign", "$par" + std::to_string(i), 0);
        para = para->sister;
    }
    AST_PTR block = now_AST->child->sister->sister->sister;
    AST_PTR block_child = block->child;
    while (block_child != nullptr) {
        if (block_child->type == KeywordStatement && block_child->data == "return") {
            if (func_type == function_int || func_type == function_float) {
                IRGEN::tuple res = expr_generate(block_child->child);
                create_forth("", "$ret", "assign", res.to_string());
            }
        }
        else
            basic_generate(block_child);
        block_child = block_child->sister;
    }
}

void IRGen::single_define_generate(std::shared_ptr<AST_node> now_AST) {
    if (now_AST->last_child->type != Expression) {
        create_forth("", now_AST->only_name, "assign", 0);
    } else {
        IRGEN::tuple res = expr_generate(now_AST->last_child, now_AST->only_name);
        if (now_AST->only_name != res.to_string())
            create_forth("", now_AST->only_name, "assign", res.to_string());
    }
}

IRGEN::tuple IRGen::expr_generate(std::shared_ptr<AST_node> now_AST, const std::string& passing_down_name) {
    IRGEN::tuple res = IRGEN::count_child_number(now_AST);
    IRGEN::tuple ans = {0, false, false, ""};
    if (res.count == 0) {
        if (now_AST->count_expr_ending) {
            ans.is_value = true;
            ans.value.type = (basic_type) now_AST->basic_type;
            ans.value.value = now_AST->value;
        }
        else {
            ans.name = now_AST->only_name;
        }
    }
    else if (res.count == 1) {
        ans = expr_generate(now_AST->child, passing_down_name);
    }
    else if (res.count == 2) {
        IRGEN::tuple ans_1 = expr_generate(now_AST->child);
        IRGEN::tuple ans_2 = expr_generate(now_AST->last_child);

        std::string end_f;
        if (now_AST->basic_type == basic_float)
            end_f = "f";

        if (passing_down_name.empty()) {
            now_register++;
            ans.name = "%" + std::to_string(now_register);
        } else {
            ans.name = passing_down_name;
        }


        if (now_AST->data == "+")
            create_forth("", ans.name,
                         "add" + end_f,
                         ans_1.to_string(),
                         ans_2.to_string());
        else if (now_AST->data == "-")
            create_forth("", ans.name,
                         "sub" + end_f,
                         ans_1.to_string(),
                         ans_2.to_string());
        else if (now_AST->data == "*")
            create_forth("", ans.name,
                         "mul" + end_f,
                         ans_1.to_string(),
                         ans_2.to_string());
        else if (now_AST->data == "/")
            create_forth("", ans.name,
                         "div" + end_f,
                         ans_1.to_string(),
                         ans_2.to_string());
        else if (now_AST->data == "%")
            create_forth("", ans.name,
                         "mod",
                         ans_1.to_string(),
                         ans_2.to_string());
    }

    return ans;
}