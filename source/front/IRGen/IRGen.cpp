//
// Created by Tastror on 2022/5/29.
//

#include "IRGen.h"

int IRGen::line_num = 0;
int IRGen::now_register = 0;

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

IR_PTR IRGen::create_forth(const std::string& comment, const IR_tuple& target, const std::string& opera, const IR_tuple& org_1, const IR_tuple& org_2) {
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
    program_generate(AST);
}



void IRGen::program_generate(const std::shared_ptr<AST_node>& now_AST) {
    AST_PTR now = now_AST->child;
    while (now != nullptr) {
        basic_generate(now);
        now = now->sister;
    }
}



void IRGen::basic_generate(const std::shared_ptr<AST_node>& now_AST) {
    if (now_AST == nullptr) return;
    else if (now_AST->type == FunctionDefinition)
        function_generate(now_AST);
    else if (now_AST->type == SingleDefinition)
        single_define_generate(now_AST);
    else if (now_AST->type == BlockStatement) {
        AST_PTR now = now_AST->child;
        while (now != nullptr) {
            basic_generate(now);
            now = now->sister;
        }
    }
}



void IRGen::function_generate(const std::shared_ptr<AST_node>& now_AST) {
    create_label("", now_AST->only_name);
    auto func_type = (function_type) now_AST->function_type;
    AST_PTR para = now_AST->child->sister->sister->child;

    create_forth("", (std::string)"$paranum", "assign", now_AST->arg_num, 0);

    for (int i = 0; i < now_AST->arg_num; ++i) {
        IR_tuple assign_target = para->only_name;
        assign_target.str_type = para->basic_type;
        create_forth("", assign_target, "assign", "$par" + std::to_string(i), 0);
        para = para->sister;
    }

    AST_PTR block = now_AST->child->sister->sister->sister;
    AST_PTR block_child = block->child;
    while (block_child != nullptr) {
        if (block_child->type == KeywordStatement && block_child->data == "return") {
            if (func_type == function_int || func_type == function_float) {
                IR_tuple res = expr_generate(block_child->child);
                create_forth("", (std::string)"$ret", "assign", res);
            }
            create_forth("", (std::string)"$ra", "jump");

            // ! important
            // this break is an optimizer, can be removed
            break;
        }
        else
            basic_generate(block_child);
        block_child = block_child->sister;
    }

}



void IRGen::single_define_generate(const std::shared_ptr<AST_node>& now_AST) {

    IR_tuple assign_target = now_AST->only_name;
    assign_target.str_type = now_AST->basic_type;

    if (now_AST->last_child->type != Expression) {
        create_forth("", assign_target, "assign", 0);
    }

    else {
        IR_tuple res = expr_generate(now_AST->last_child, assign_target);
        if (assign_target.str != res.str) {
            if ((res.is_str && res.str_type != assign_target.str_type) || (!res.is_str && res.value.type != assign_target.str_type))
                if (assign_target.str_type == basic_int || assign_target.str_type == basic_pointer)
                    create_forth("", assign_target, "cast-int", res);
                else if (assign_target.str_type == basic_float)
                    create_forth("", assign_target, "cast-float", res);
                else
                    create_forth("", assign_target, "assign", res);
            else
                create_forth("", assign_target, "assign", res);
        }
    }

}



IR_tuple IRGen::expr_generate(const std::shared_ptr<AST_node>& now_AST, const IR_tuple& passing_down) {

    AST_tuple res = AST_safe::count_child_number(now_AST);
    IR_tuple ans;

    if (res.count == 0) {
        if (now_AST->count_expr_ending) {
            ans.is_str = false;
            ans.value.type = (basic_type) now_AST->basic_type;
            ans.value.value = now_AST->value;
        }
        else {
            ans.str = now_AST->only_name;
            ans.str_type = now_AST->basic_type;
        }
    }

    else if (res.count == 1) {
        ans = expr_generate(now_AST->child, passing_down);
    }

    else if (res.count == 2) {
        IR_tuple ans_1 = expr_generate(now_AST->child);
        IR_tuple ans_2 = expr_generate(now_AST->last_child);

        ans.str_type = now_AST->basic_type;
        std::string end_f;
        if (now_AST->basic_type == basic_float)
            end_f = "f";

        if (passing_down.str.empty()) {
            now_register++;
            ans.str = "%" + std::to_string(now_register);
        } else {
            ans.str = passing_down.str;
        }

        if (now_AST->data == "+")
            create_forth("", ans, "add" + end_f, ans_1, ans_2);
        else if (now_AST->data == "-")
            create_forth("", ans, "sub" + end_f, ans_1, ans_2);
        else if (now_AST->data == "*")
            create_forth("", ans, "mul" + end_f, ans_1, ans_2);
        else if (now_AST->data == "/")
            create_forth("", ans, "div" + end_f, ans_1, ans_2);
        else if (now_AST->data == "%")
            create_forth("", ans, "mod", ans_1, ans_2);
        else if (now_AST->data == "-unary")
            create_forth("", ans, "sub" + end_f, 0, ans_2);
        else if (now_AST->data == "+unary")
            now_register--;
    }

    return ans;
}