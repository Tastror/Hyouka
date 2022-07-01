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
    if (org_1.IVTT.self_basic_type() != target.IVTT.self_basic_type())
        if (target.IVTT.self_basic_type() == basic_int || target.IVTT.self_is_pointer())
            create_forth(comment, target, "cast-int", org_1);
        else if (target.IVTT.self_basic_type() == basic_float)
            create_forth(comment, target, "cast-float", org_1);
        else
            create_forth(comment, target, "assign", org_1);
    else if (target.name != org_1.name)
        create_forth(comment, target, "assign", org_1);
}


IR_tuple IRGen::create_cast_or_not(const std::string& comment, IR_tuple& target_and_org, const IR_tuple& sample) {
    if (!target_and_org.is_name) {
        if (sample.IVTT.self_basic_type() == basic_int || sample.IVTT.self_is_pointer())
            target_and_org.IVTT.self_change_to_int();
        else if (sample.IVTT.self_basic_type() == basic_float)
            target_and_org.IVTT.self_change_to_float();
        return target_and_org;
    }
    if (target_and_org.IVTT.self_basic_type() != sample.IVTT.self_basic_type()) {
        if (sample.IVTT.self_basic_type() == basic_int || sample.IVTT.self_is_pointer()) {
            if (target_and_org.name[0] == '@') {
                IR_tuple new_tuple("%" + std::to_string(++now_register));
                new_tuple.IVTT = sample.IVTT;
                create_forth(comment, new_tuple, "cast-int", target_and_org);
                return new_tuple;
            }
            else {
                target_and_org.IVTT.self_change_to_int();
                create_forth(comment, target_and_org, "cast-int", target_and_org);
                return target_and_org;
            }
        }

        else if (sample.IVTT.self_basic_type() == basic_float) {
            if (target_and_org.name[0] == '@') {
                IR_tuple new_tuple("%" + std::to_string(++now_register));
                new_tuple.IVTT = sample.IVTT;
                create_forth(comment, new_tuple, "cast-float", target_and_org);
                return new_tuple;
            }
            else {
                target_and_org.IVTT.self_change_to_float();
                create_forth(comment, target_and_org, "cast-float", target_and_org);
                return target_and_org;
            }
        }
    }
    return target_and_org;
}





void IRGen::Generate() {
    if (AST->type != ProgramBody) return;
    program_generate(AST);
}



void IRGen::program_generate(const std::shared_ptr<AST_node>& now_AST) {
    AST_PTR now = now_AST->child;
    while (now != nullptr) {
        if (now->is_static)
            create_label("", "static_data");
        basic_generate(now);
        now = now->sister;
    }
}

void IRGen::basic_generate(const std::shared_ptr<AST_node>& now_AST) {

    if (now_AST == nullptr) return;

    // recursive

    else if (now_AST->type == BlockStatement) {
        AST_PTR now = now_AST->child;
        while (now != nullptr) {
            basic_generate(now);
            now = now->sister;
        }
    }

    // Defines

    else if (now_AST->type == FunctionDefinition) {
        function_generate(now_AST);
    }

    else if (now_AST->type == SingleDefinition) {
        single_define_generate(now_AST);
    }

    else if (now_AST->type == ArrayDefinition) {
        array_define_generate(now_AST);
    }

    // Assigns

    else if (now_AST->type == SingleAssignment) {
        single_assign_generate(now_AST);
    }

    else if (now_AST->type == ArrayAssignment) {
        array_assign_generate(now_AST);
    }


    // Expression

    else if (now_AST->type == KeywordStatement) {
        if (now_AST->data == "while")
            while_generate(now_AST);
        else if (now_AST->data == "if" || now_AST->data == "if-else")
            if_generate(now_AST);
        else if (now_AST->data == "break")
            break_generate(now_AST);
        else if (now_AST->data == "continue")
            continue_generate(now_AST);
    }
    else if (now_AST->type == NormalStatement) {
        expr_generate(now_AST);
    }

}



void IRGen::function_generate(const std::shared_ptr<AST_node>& now_AST) {
    now_AST->declaration_bound_sym_node->label_name = now_AST->only_name;
    create_label("", now_AST->declaration_bound_sym_node->label_name);
    type_storage func_type = now_AST->IVTT.return_type();
    AST_PTR para = now_AST->child->sister->child;

    // create_forth("", (std::string)"$paranum", "assign", now_AST->arg_num);

    int in = 0;
    for (const auto& i : now_AST->declaration_bound_sym_node->IVTT.additional_storage_vector) {
        IR_tuple assign_target(para->only_name);
        assign_target.IVTT = para->IVTT;
        IR_tuple par("$par" + std::to_string(++in));
        par.IVTT = i; // i and para->IVTT are always same here, however they are not same in function usage
        create_cast_or_assign("", assign_target, par);
        para = para->sister;
    }

    AST_PTR block = now_AST->child->sister->sister;
    AST_PTR block_child = block->child;
    while (block_child != nullptr) {
        if (block_child->type == KeywordStatement && block_child->data == "return") {
            if (func_type.represent_type == basic_int || func_type.represent_type == basic_float) {
                IR_tuple ret("$ret");
                    ret.IVTT.reset_and_parse_from_basic_type(now_AST->IVTT.return_basic_type());
                IR_tuple res = expr_generate(block_child->child, ret);
                create_cast_or_assign("", ret, res);
            }
            create_forth("", (std::string)"$ra", "jumpr");

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
    assign_target.IVTT = now_AST->IVTT;

    if (now_AST->last_child->type != Expression) {
        if (now_AST->is_static)
            create_forth("", assign_target, "assign", 0);
    }
    else {
        IR_tuple res = expr_generate(now_AST->last_child, assign_target);
        create_cast_or_assign("", assign_target, res);
    }

}



void IRGen::count_array_init_block(
        const std::shared_ptr<AST_node>& init,
        const std::vector<int>& index_list,
        const IR_tuple& assign_unit,
        const IR_tuple& assign_target,
        int stair, int offset_base
) {
    std::shared_ptr<AST_node> ini = init;
    if (stair > (int) index_list.size()) {
        IR_safe::RaiseError("array index initial blocks are too much");
        return;
    }

    int up = 1;
    for (int i = stair; i < index_list.size(); ++i) {
        up *= index_list[i];
    }

    while (ini != nullptr) {
        if (ini->type == Expression) {
            IR_tuple res = expr_generate(ini, assign_unit);
            if (offset_base == 0) {
                create_forth("", assign_target, "sw", res);
            } else {
                create_forth("", assign_unit, "add", assign_target, offset_base * 4);
                create_forth("", assign_unit, "sw", res);
            }
        }
        else if (ini->type == ArrayInitialBlock) {
            count_array_init_block(ini->child, index_list, assign_unit, assign_target, stair + 1, offset_base);
        }
        offset_base += up;
        ini = ini->sister;
    }
}



void IRGen::array_define_generate(const std::shared_ptr<AST_node>& now_AST) {

    IR_tuple assign_target(now_AST->only_name);
    assign_target.IVTT = now_AST->IVTT;

    int volume = 1;
    for (int i : now_AST->declaration_bound_sym_node->IVTT.array_length)
        volume *= i;

    if (now_AST->is_static) {
        create_forth("", assign_target, "alloc-static", (int)volume * 4);
    } else {
        create_forth("", assign_target, "alloc-stack", (int)volume * 4);
    }

    if (now_AST->last_child->type != Index) {
        auto index = now_AST->child->sister->child;
        IR_tuple assign_unit("%" + std::to_string(++now_register));
        assign_unit.IVTT.reset_and_parse_from_basic_type(basic_int, true);
        count_array_init_block(now_AST->last_child, now_AST->declaration_bound_sym_node->IVTT.array_length,
                               assign_unit, assign_target, 0, 0);
    }
}



void IRGen::single_assign_generate(const std::shared_ptr<AST_node> &now_AST) {
    IR_tuple assign_target(now_AST->only_name);
    assign_target.IVTT = now_AST->declaration_bound_sym_node->IVTT;
    IR_tuple res = expr_generate(now_AST->last_child, assign_target);
    create_cast_or_assign("", assign_target, res);
}



void IRGen::array_assign_generate(const std::shared_ptr<AST_node>& now_AST) {
    IR_tuple assign_target(now_AST->only_name);
    std::vector<int> index_list;
    int k = 1;
    for (int i = (int) now_AST->declaration_bound_sym_node->IVTT.array_length.size() - 1; i > 0; --i) {
        k *= now_AST->declaration_bound_sym_node->IVTT.array_length[i];
        index_list.insert(index_list.begin(), k);
    }
    const AST_PTR& index = now_AST->child->sister;
    if (index->type != Index) {
        IR_safe::RaiseError("index->type != Index, opt or ast need to be fixed");
        return;
    }
    AST_PTR temp = index->child;
    int i = -1;
    IR_tuple offset("%" + std::to_string(++now_register));
    offset.IVTT.reset_and_parse_from_string("int");

    while (temp != nullptr) {

        if (i < 0) {
            IR_tuple index_res = expr_generate(temp);
            create_forth("", offset, "assign", index_res);
        }
        else {
            create_forth("", offset, "mul", offset, index_list[i]);
            IR_tuple index_res = expr_generate(temp);
            create_forth("", offset, "add", offset, index_res);
        }
        temp = temp->sister;
        i++;
    }
    create_forth("", offset, "mul", offset, 4);
    IR_tuple assign_unit("%" + std::to_string(++now_register));
    assign_unit.IVTT = now_AST->declaration_bound_sym_node->IVTT;
    create_forth("", assign_unit, "add", assign_target, offset);
    IR_tuple res = expr_generate(now_AST->last_child, assign_target);
    create_forth("", assign_unit, "sw", res);
}



void IRGen::if_generate(const std::shared_ptr<AST_node>& now_AST) {

    auto now = now_AST->child;

    // if
    if (now_AST->data == "if") {
        IR_tuple condition_res("%" + std::to_string(++now_register));
        IR_tuple res = expr_generate(now->child, condition_res);
        create_forth("", "if_end_" + std::to_string(++label_num), "jumpn", res);
        now = now->sister;
        basic_generate(now);
        create_label("", "if_end_" + std::to_string(label_num));
    }

    // if-else
    else {
        IR_tuple condition_res("%" + std::to_string(++now_register));
        IR_tuple res = expr_generate(now->child, condition_res);
        create_forth("", "if_wrong_" + std::to_string(++label_num), "jumpn", res);
        now = now->sister;
        basic_generate(now);
        create_forth("", "if_end_" + std::to_string(++label_num), "jump");
        now = now->sister;
        create_label("", "if_wrong_" + std::to_string(label_num - 1));
        basic_generate(now);
        create_label("", "if_end_" + std::to_string(label_num));
    }
}



void IRGen::while_generate(const std::shared_ptr<AST_node>& now_AST) {

    auto now = now_AST->child;

    std::string continue_label_name = "while_continue_" + std::to_string(++label_num);
    std::string break_label_name = "while_break_" + std::to_string(label_num);
    now_continue.push(continue_label_name);
    now_break.push(break_label_name);

    create_label("", now_continue.top());
    IR_tuple condition_res("%" + std::to_string(++now_register));
    IR_tuple res = expr_generate(now->child, condition_res);
    create_forth("", now_break.top(), "jumpn", res);

    now = now->sister;
    basic_generate(now);

    create_label("", now_break.top());
    now_continue.pop();
    now_break.pop();
}


void IRGen::break_generate(const std::shared_ptr<AST_node>& now_AST) {
    auto now = now_AST->child;
    create_forth("", now_continue.top(), "jump");
}

void IRGen::continue_generate(const std::shared_ptr<AST_node>& now_AST) {
    auto now = now_AST->child;
    create_forth("", now_break.top(), "jump");
}


IR_tuple IRGen::function_usage_generate(const std::shared_ptr<AST_node>& now_AST, const IR_tuple& passing_down) {

    IR_tuple ans, ret("$ret");
    ret.IVTT.reset_and_parse_from_basic_type(now_AST->IVTT.return_storage.storage_type.represent_type);

    if (passing_down.name.empty()) {
        ans.name = "%" + std::to_string(++now_register);
    } else {
        ans.name = passing_down.name;
    }

    AST_tuple test = AST_safe::count_child_number(now_AST);
    if (test.count - 1 != now_AST->declaration_bound_sym_node->IVTT.parameter_num()) {
        IR_safe::RaiseError("function parameters' number does not match");
        return ans;
    }

    int in = 0;
    AST_PTR para = now_AST->child->sister;
    for (const auto& i : now_AST->IVTT.additional_storage_vector) {
        IR_tuple par("$par" + std::to_string(++in));
        par.IVTT = i;
        IR_tuple giving_target = expr_generate(para, par);
        giving_target.IVTT = para->IVTT;
        create_cast_or_assign("", par, giving_target);
        para = para->sister;
    }

    create_forth("", (std::string)now_AST->declaration_bound_sym_node->label_name, "call");

    create_cast_or_assign("", ans, ret);
    return ans;
}


IR_tuple IRGen::array_usage_generate(const std::shared_ptr<AST_node>& now_AST, const IR_tuple& passing_down) {

    IR_tuple ans;
    IR_tuple giving_target(now_AST->only_name);

    if (passing_down.name.empty()) {
        ans.name = "%" + std::to_string(++now_register);
    } else {
        ans.name = passing_down.name;
    }

    std::vector<int> index_list;
    int k = 1;
    for (int i = (int) now_AST->declaration_bound_sym_node->IVTT.array_length.size() - 1; i > 0; --i) {
        k *= now_AST->declaration_bound_sym_node->IVTT.array_length[i];
        index_list.insert(index_list.begin(), k);
    }
    const AST_PTR& index = now_AST->child->sister;
    if (index->type != Index) {
        IR_safe::RaiseError("index->type != Index, opt or ast need to be fixed");
        return ans;
    }
    AST_PTR temp = index->child;
    int i = -1;
    IR_tuple offset("%" + std::to_string(++now_register));
    offset.IVTT.reset_and_parse_from_string("int");

    while (temp != nullptr) {

        if (i < 0) {
            IR_tuple index_res = expr_generate(temp);
            create_forth("", offset, "assign", index_res);
        }
        else {
            create_forth("", offset, "mul", offset, index_list[i]);
            IR_tuple index_res = expr_generate(temp);
            create_forth("", offset, "add", offset, index_res);
        }
        temp = temp->sister;
        i++;
    }
    create_forth("", offset, "mul", offset, 4);
    IR_tuple giving_unit("%" + std::to_string(++now_register));
    giving_unit.IVTT = now_AST->declaration_bound_sym_node->IVTT;
    create_forth("", giving_unit, "add", giving_target, offset);
    create_forth("", ans, "lw", giving_unit);
    return ans;
}



IR_tuple IRGen::expr_generate(const std::shared_ptr<AST_node>& now_AST, const IR_tuple& passing_down) {

    AST_tuple res = AST_safe::count_child_number(now_AST);
    IR_tuple ans;

    if (now_AST->type == FunctionUsage) {
        ans = function_usage_generate(now_AST, passing_down);
    }

    else if (now_AST->type == ArrayUsage) {
        ans = array_usage_generate(now_AST, passing_down);
    }

    else if (res.count == 0) {
        if (now_AST->count_expr_ending) {
            ans.is_name = false;
            ans.IVTT = now_AST->IVTT;
        }
        else {
            ans.name = now_AST->only_name;
            ans.IVTT = now_AST->IVTT;
        }
    }

    else if (res.count == 1) {
        ans = expr_generate(now_AST->child, passing_down);
    }

    else if (res.count == 2) {


        ans.IVTT = now_AST->IVTT;
        std::string end_f;
        if (now_AST->IVTT.self_basic_type() == basic_float)
            end_f = "f";

        if (passing_down.name.empty()) {
            ans.name = "%" + std::to_string(++now_register);
        } else {
            ans.name = passing_down.name;
        }

        // no short-cut
        if (now_AST->data != "&&" && now_AST->data != "||") {
            IR_tuple ans_1 = expr_generate(now_AST->child);
            IR_tuple ans_2 = expr_generate(now_AST->last_child);

            if (now_AST->data == "+") {
                ans_1 = create_cast_or_not("", ans_1, ans);
                ans_2 = create_cast_or_not("", ans_2, ans);
                create_forth("", ans, "add" + end_f, ans_1, ans_2);
            }
            else if (now_AST->data == "-") {
                ans_1 = create_cast_or_not("", ans_1, ans);
                ans_2 = create_cast_or_not("", ans_2, ans);
                create_forth("", ans, "sub" + end_f, ans_1, ans_2);
            }
            else if (now_AST->data == "*") {
                ans_1 = create_cast_or_not("", ans_1, ans);
                ans_2 = create_cast_or_not("", ans_2, ans);
                create_forth("", ans, "mul" + end_f, ans_1, ans_2);
            }
            else if (now_AST->data == "/") {
                ans_1 = create_cast_or_not("", ans_1, ans);
                ans_2 = create_cast_or_not("", ans_2, ans);
                create_forth("", ans, "div" + end_f, ans_1, ans_2);
            }
            else if (now_AST->data == "%")
                create_forth("", ans, "mod", ans_1, ans_2);
            else if (now_AST->data == "-unary")
                create_forth("", ans, "sub" + end_f, 0, ans_2);
            else if (now_AST->data == "+unary")
                --now_register;
            else if (now_AST->data == "!") {
//                create_cast_or_assign("", ans, 0);
//                create_forth("", "temp_label_" + std::to_string(++label_num), "jumpn", ans_2);
//                create_cast_or_assign("", ans, 1);
//                create_label("! operator exit, ans is " + ans.name, "temp_label_" + std::to_string(label_num));
                create_forth("", ans, "not", ans_1);
            }
            else if (now_AST->data == "==") {
//                create_cast_or_assign("", ans, 0);
//                IR_tuple foo("%" + std::to_string(++now_register));
//                foo.IVTT = Optimize_Useful::implicit_conversion(ans_1.IVTT, ans_2.IVTT);
//                std::string end_f_addi;
//                if (foo.IVTT.self_basic_type() == basic_float)
//                    end_f_addi = "f";
//                ans_1 = create_cast_or_not("", ans_1, foo);
//                ans_2 = create_cast_or_not("", ans_2, foo);
//                create_forth("", foo, "sub" + end_f, ans_1, ans_2);
//                create_forth("", "temp_label_" + std::to_string(++label_num), "jumpn", foo);
//                create_cast_or_assign("", ans, 1);
//                create_label("== operator exit, ans is " + ans.name, "temp_label_" + std::to_string(label_num));
                create_forth("", ans, "eq", ans_1, ans_2);
            }
            else if (now_AST->data == "!=") {
//                create_cast_or_assign("", ans, 0);
//                IR_tuple foo("%" + std::to_string(++now_register));
//                foo.IVTT = Optimize_Useful::implicit_conversion(ans_1.IVTT, ans_2.IVTT);
//                std::string end_f_addi;
//                if (foo.IVTT.self_basic_type() == basic_float)
//                    end_f_addi = "f";
//                ans_1 = create_cast_or_not("", ans_1, foo);
//                ans_2 = create_cast_or_not("", ans_2, foo);
//                create_forth("", foo, "sub" + end_f, ans_1, ans_2);
//                create_forth("", "temp_label_" + std::to_string(++label_num), "jumpe", foo);
//                create_cast_or_assign("", ans, 1);
//                create_label("!= operator exit, ans is " + ans.name, "temp_label_" + std::to_string(label_num));
                create_forth("", ans, "neq", ans_1, ans_2);
            }
            else if (now_AST->data == ">=") {
                create_forth("", ans, "gre", ans_1, ans_2);
            }
            else if (now_AST->data == "<=") {
                create_forth("", ans, "lee", ans_1, ans_2);
            }
            else if (now_AST->data == ">") {
                create_forth("", ans, "gr", ans_1, ans_2);
            }
            else if (now_AST->data == "<"){
                create_forth("", ans, "le", ans_1, ans_2);
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