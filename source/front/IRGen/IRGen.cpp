//
// Created by Tastror on 2022/5/29.
//

#include "IRGen.h"
#include "FrontOpt.h"

int IRGen::line_num = 0;
int IRGen::label_num = 0;
int IRGen::now_register = 0;

IRGen::IRGen(const std::shared_ptr<AST_node>& AST_head) {
    head = std::make_shared<IR_node>();
    now_ir = head;
    AST = AST_head;
}

void IRGen::create_empty_ir() {
    IR_PTR new_ir = std::make_shared<IR_node>();
    now_ir->next = new_ir;
    now_ir = new_ir;
    now_ir->index = line_num++;
}

void IRGen::create_forth(const std::string& comment, const IR_tuple& target, const std::string& opera, const IR_tuple& org_1, const IR_tuple& org_2) {
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
}

void IRGen::create_label(const std::string& comment, const std::string& target) {
    IR_PTR new_ir = std::make_shared<IR_node>();
    now_ir->next = new_ir;
    now_ir = new_ir;
    now_ir->ir_type = ir_label;
    now_ir->target = target;
    now_ir->comment = comment;
    now_ir->index = line_num++;
}


void IRGen::create_cast_or_assign(const std::string& comment, const IR_tuple& target, const IR_tuple& org_1) {
    if (target.name != org_1.name) {
        if (org_1.value_and_type.represent_type != target.value_and_type.represent_type)
            if (target.value_and_type.represent_type == basic_int || target.value_and_type.is_pointer)
                create_forth(comment, target, "cast-int", org_1);
            else if (target.value_and_type.represent_type == basic_float)
                create_forth(comment, target, "cast-float", org_1);
            else
                create_forth(comment, target, "assign", org_1);
        else
            create_forth(comment, target, "assign", org_1);
    }
}


void IRGen::create_cast_or_not(const std::string& comment, IR_tuple& target_and_org, const IR_tuple& sample) {
    if (!target_and_org.is_name) {
        if (sample.value_and_type.represent_type == basic_int || sample.value_and_type.is_pointer)
            target_and_org.value_and_type.self_float_to_int();
        else if (sample.value_and_type.represent_type == basic_float)
            target_and_org.value_and_type.self_int_to_float();
    }
    if (target_and_org.value_and_type.represent_type != sample.value_and_type.represent_type) {
        if (sample.value_and_type.represent_type == basic_int || sample.value_and_type.is_pointer) {
            target_and_org.value_and_type.self_float_to_int();
            create_forth(comment, target_and_org, "cast-int", target_and_org);
        }

        else if (sample.value_and_type.represent_type == basic_float) {
            target_and_org.value_and_type.self_int_to_float();
            create_forth(comment, target_and_org, "cast-float", target_and_org);
        }

    }
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
    now_AST->declaration_bound_sym_node->label_name = "label_" + now_AST->only_name.substr(1);
    create_label("", now_AST->declaration_bound_sym_node->label_name);
    auto func_type = (function_type) now_AST->function_type;
    AST_PTR para = now_AST->child->sister->sister->child;

    create_forth("", (std::string)"$paranum", "assign", now_AST->arg_num);

    int in = 0;
    for (auto i : now_AST->declaration_bound_sym_node->function_para_type) {
        IR_tuple assign_target(para->only_name);
        assign_target.value_and_type = para->value_and_type;
        IR_tuple par("$par" + std::to_string(++in));
        par.value_and_type = i; // i and para->value_and_type are always same here, however they are not same in function usage
        create_cast_or_assign("", assign_target, par);
        para = para->sister;
    }

    AST_PTR block = now_AST->child->sister->sister->sister;
    AST_PTR block_child = block->child;
    while (block_child != nullptr) {
        if (block_child->type == KeywordStatement && block_child->data == "return") {
            if (func_type == function_int || func_type == function_float) {
                IR_tuple res = expr_generate(block_child->child);
                IR_tuple ret("$ret");
                if (now_AST->function_type == function_int)
                    ret.value_and_type.stovt("int");
                else if (now_AST->function_type == function_float)
                    ret.value_and_type.stovt("float");
                create_cast_or_assign("", ret, res);
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
    assign_target.value_and_type = now_AST->value_and_type;

    // default construction, however, C do not use it
    if (now_AST->last_child->type != Expression) {
        create_forth("", assign_target, "assign", 0);
    }

    else {
        IR_tuple res = expr_generate(now_AST->last_child, assign_target);
        create_cast_or_assign("", assign_target, res);
    }

}



IR_tuple IRGen::expr_generate(const std::shared_ptr<AST_node>& now_AST, const IR_tuple& passing_down) {

    AST_tuple res = AST_safe::count_child_number(now_AST);
    IR_tuple ans;

    if (res.count == 0) {
        if (now_AST->count_expr_ending) {
            ans.is_name = false;
            ans.value_and_type = now_AST->value_and_type;
        }
        else {
            ans.name = now_AST->only_name;
            ans.value_and_type = now_AST->value_and_type;
        }
    }

    else if (res.count == 1) {
        ans = expr_generate(now_AST->child, passing_down);
    }

    else if (res.count == 2) {


        ans.value_and_type = now_AST->value_and_type;
        std::string end_f;
        if (now_AST->value_and_type.represent_type == basic_float)
            end_f = "f";


        ans.name = "%" + std::to_string(++now_register);

//        if (passing_down.name.empty()) {
//            ans.name = "%" + std::to_string(++now_register);
//        } else {
//            ans.name = passing_down.name;
//        }

        // no short-cut
        if (now_AST->data != "&&" && now_AST->data != "||") {
            IR_tuple ans_1 = expr_generate(now_AST->child);
            IR_tuple ans_2 = expr_generate(now_AST->last_child);

            if (now_AST->data == "+") {
                create_cast_or_not("", ans_1, ans);
                create_cast_or_not("", ans_2, ans);
                create_forth("", ans, "add" + end_f, ans_1, ans_2);
            }
            else if (now_AST->data == "-") {
                create_cast_or_not("", ans_1, ans);
                create_cast_or_not("", ans_2, ans);
                create_forth("", ans, "sub" + end_f, ans_1, ans_2);
            }
            else if (now_AST->data == "*") {
                create_cast_or_not("", ans_1, ans);
                create_cast_or_not("", ans_2, ans);
                create_forth("", ans, "mul" + end_f, ans_1, ans_2);
            }
            else if (now_AST->data == "/") {
                create_cast_or_not("", ans_1, ans);
                create_cast_or_not("", ans_2, ans);
                create_forth("", ans, "div" + end_f, ans_1, ans_2);
            }
            else if (now_AST->data == "%")
                create_forth("", ans, "mod", ans_1, ans_2);
            else if (now_AST->data == "-unary")
                create_forth("", ans, "sub" + end_f, 0, ans_2);
            else if (now_AST->data == "+unary")
                --now_register;
            else if (now_AST->data == "!") {
                create_cast_or_assign("", ans, 0);
                create_forth("", "temp_label_" + std::to_string(++label_num), "jumpn", ans_2);
                create_cast_or_assign("", ans, 1);
                create_label("! operator exit, ans is " + ans.name, "temp_label_" + std::to_string(label_num));
            }
            else if (now_AST->data == "==") {
                create_cast_or_assign("", ans, 0);
                IR_tuple foo("%" + std::to_string(++now_register));
                foo.value_and_type = Optimize_Useful::implicit_conversion(ans_1.value_and_type, ans_2.value_and_type);
                std::string end_f_addi;
                if (foo.value_and_type.represent_type == basic_float)
                    end_f_addi = "f";
                create_cast_or_not("", ans_1, foo);
                create_cast_or_not("", ans_2, foo);
                create_forth("", foo, "sub" + end_f, ans_1, ans_2);
                create_forth("", "temp_label_" + std::to_string(++label_num), "jumpn", foo);
                create_cast_or_assign("", ans, 1);
                create_label("== operator exit, ans is " + ans.name, "temp_label_" + std::to_string(label_num));
            }
            else if (now_AST->data == "!=") {
                create_cast_or_assign("", ans, 0);
                IR_tuple foo("%" + std::to_string(++now_register));
                foo.value_and_type = Optimize_Useful::implicit_conversion(ans_1.value_and_type, ans_2.value_and_type);
                std::string end_f_addi;
                if (foo.value_and_type.represent_type == basic_float)
                    end_f_addi = "f";
                create_cast_or_not("", ans_1, foo);
                create_cast_or_not("", ans_2, foo);
                create_forth("", foo, "sub" + end_f, ans_1, ans_2);
                create_forth("", "temp_label_" + std::to_string(++label_num), "jumpe", foo);
                create_cast_or_assign("", ans, 1);
                create_label("!= operator exit, ans is " + ans.name, "temp_label_" + std::to_string(label_num));
            }
            else if (now_AST->data == ">=") {
                create_forth("", ans, "goe" + end_f, ans_1, ans_2);
            }
            else if (now_AST->data == "<=") {
                create_forth("", ans, "loe" + end_f, ans_1, ans_2);
            }
            else if (now_AST->data == ">") {
                create_forth("", ans, "great" + end_f, ans_1, ans_2);
            }
            else if (now_AST->data == "<"){
                create_forth("", ans, "less" + end_f, ans_1, ans_2);
            }
            else {

            }
        }

        // short-cut
        else {
            if (now_AST->data == "&&") {
                int my_label_num = ++label_num;
                create_cast_or_assign("", ans, 0);
                IR_tuple ans_1 = expr_generate(now_AST->child);
                create_forth("", "temp_label_" + std::to_string(my_label_num), "jumpe", ans_1);
                IR_tuple ans_2 = expr_generate(now_AST->last_child);
                create_forth("", "temp_label_" + std::to_string(my_label_num), "jumpe", ans_2);
                create_cast_or_assign("", ans, 1);
                create_label("&& operator exit, ans is " + ans.name, "temp_label_" + std::to_string(my_label_num));
            }
            else if (now_AST->data == "||") {
                int my_label_num = ++label_num;
                create_cast_or_assign("", ans, 1);
                IR_tuple ans_1 = expr_generate(now_AST->child);
                create_forth("", "temp_label_" + std::to_string(my_label_num), "jumpn", ans_1);
                IR_tuple ans_2 = expr_generate(now_AST->last_child);
                create_forth("", "temp_label_" + std::to_string(my_label_num), "jumpn", ans_2);
                create_cast_or_assign("", ans, 0);
                create_label("|| operator exit, ans is " + ans.name, "temp_label_" + std::to_string(my_label_num));
            }
        }

    }

    return ans;
}