//
// Created by Tastror on 2022/5/29.
//

#include "FrontOpt.h"

int_double_storage int_to_double(basic_type x_type, int_double_storage x) {
    if (x_type == basic_int || x_type == basic_pointer)
        x.double_value = (double) x.int_value;
    return x;
}

int_double_storage double_to_int(basic_type x_type, int_double_storage x) {
    if (x_type == basic_float)
        x.int_value = (int) x.double_value;
    return x;
}

basic_type implicit_conversion(basic_type a, basic_type b) {
    if (a == basic_none || b == basic_none) {
        return basic_none;
    }
    if (a == basic_pointer || b == basic_pointer) {
        if (a == basic_float || b == basic_float) {
            return basic_none;
        }
        return basic_pointer;
    }
    if (a == basic_float || b == basic_float) {
        return basic_float;
    }
    return basic_int;
}

int_double_storage calculate(
        basic_type& type,
        const std::string& binary_operator,
        basic_type a_type, int_double_storage a,
        basic_type b_type, int_double_storage b
) {
    int_double_storage res;
    if (type == basic_none) return res;

    if (binary_operator == "+unary") {
        res = b;
    }

    else if (binary_operator == "-unary") {
        if (b_type == basic_int || b_type == basic_pointer)
            res.int_value = -b.int_value;
        else if (b_type == basic_float)
            res.double_value = -b.double_value;
    }

    if (binary_operator == "!") {
        type = basic_int;
        if (b_type == basic_int || b_type == basic_pointer)
            res.int_value = !b.int_value;
        else if (b_type == basic_float)
            res.int_value = !(bool)b.double_value;
    }

    else if (binary_operator == "+") {
        int_double_storage temp_a, temp_b;
        if (type == basic_float) {
            temp_a = int_to_double(a_type, a);
            temp_b = int_to_double(b_type, b);
            res.double_value = temp_a.double_value + temp_b.double_value;
        }
        else if (type == basic_int || type == basic_pointer) {
            temp_a = double_to_int(a_type, a);
            temp_b = double_to_int(b_type, b);
            res.int_value = temp_a.int_value + temp_b.int_value;
        }
    }

    else if (binary_operator == "-") {
        int_double_storage temp_a, temp_b;
        if (type == basic_float) {
            temp_a = int_to_double(a_type, a);
            temp_b = int_to_double(b_type, b);
            res.double_value = temp_a.double_value - temp_b.double_value;
        }
        else if (type == basic_int || type == basic_pointer) {
            temp_a = double_to_int(a_type, a);
            temp_b = double_to_int(b_type, b);
            res.int_value = temp_a.int_value - temp_b.int_value;
        }
    }

    else if (binary_operator == "*") {
        int_double_storage temp_a, temp_b;
        if (type == basic_float) {
            temp_a = int_to_double(a_type, a);
            temp_b = int_to_double(b_type, b);
            res.double_value = temp_a.double_value * temp_b.double_value;
        }
        else if (type == basic_int || type == basic_pointer) {
            temp_a = double_to_int(a_type, a);
            temp_b = double_to_int(b_type, b);
            res.int_value = temp_a.int_value * temp_b.int_value;
        }
    }

    else if (binary_operator == "/") {
        int_double_storage temp_a, temp_b;
        if (type == basic_float) {
            temp_a = int_to_double(a_type, a);
            temp_b = int_to_double(b_type, b);
            if (temp_b.double_value == 0) {
                AST_optimize_safe::RaiseError("Divided by zero!");
                return res;
            }
            res.double_value = temp_a.double_value / temp_b.double_value;
        }
        else if (type == basic_int || type == basic_pointer) {
            temp_a = double_to_int(a_type, a);
            temp_b = double_to_int(b_type, b);
            if (temp_b.int_value == 0) {
                AST_optimize_safe::RaiseError("Divided by zero!");
                return res;
            }
            res.int_value = temp_a.int_value / temp_b.int_value;
        }
    }

    else if (binary_operator == "%") {
        int_double_storage temp_a, temp_b;
        if (type == basic_float) {
            AST_optimize_safe::RaiseError("Using float number between or after [%] operator!");
            return res;
        }
        if (type == basic_int || type == basic_pointer) {
            temp_a = double_to_int(a_type, a);
            temp_b = double_to_int(b_type, b);
            res.int_value = temp_a.int_value % temp_b.int_value;
        }
    }

    else if (binary_operator == "&&") {
        int_double_storage temp_a, temp_b;
        if (type == basic_float) {
            type = basic_int;
            temp_a = int_to_double(a_type, a);
            temp_b = int_to_double(b_type, b);
            res.int_value = (int) ((bool)temp_a.double_value && (bool)temp_b.double_value);
        }
        else if (type == basic_int || type == basic_pointer) {
            temp_a = double_to_int(a_type, a);
            temp_b = double_to_int(b_type, b);
            res.int_value = (int) (temp_a.int_value && temp_b.int_value);
        }
    }

    else if (binary_operator == "||") {
        int_double_storage temp_a, temp_b;
        if (type == basic_float) {
            type = basic_int;
            temp_a = int_to_double(a_type, a);
            temp_b = int_to_double(b_type, b);
            res.int_value = (int) ((bool)temp_a.double_value || (bool)temp_b.double_value);
        }
        else if (type == basic_int || type == basic_pointer) {
            temp_a = double_to_int(a_type, a);
            temp_b = double_to_int(b_type, b);
            res.int_value = (int) (temp_a.int_value || temp_b.int_value);
        }
    }

    else if (binary_operator == "==") {
        int_double_storage temp_a, temp_b;
        if (type == basic_float) {
            type = basic_int;
            temp_a = int_to_double(a_type, a);
            temp_b = int_to_double(b_type, b);
            res.int_value = (int) ((bool)temp_a.double_value == (bool)temp_b.double_value);
        }
        else if (type == basic_int || type == basic_pointer) {
            temp_a = double_to_int(a_type, a);
            temp_b = double_to_int(b_type, b);
            res.int_value = (int) (temp_a.int_value == temp_b.int_value);
        }
    }

    else if (binary_operator == "!=") {
        int_double_storage temp_a, temp_b;
        if (type == basic_float) {
            type = basic_int;
            temp_a = int_to_double(a_type, a);
            temp_b = int_to_double(b_type, b);
            res.int_value = (int) ((bool)temp_a.double_value != (bool)temp_b.double_value);
        }
        else if (type == basic_int || type == basic_pointer) {
            temp_a = double_to_int(a_type, a);
            temp_b = double_to_int(b_type, b);
            res.int_value = (int) (temp_a.int_value != temp_b.int_value);
        }
    }

    else if (binary_operator == ">=") {
        int_double_storage temp_a, temp_b;
        if (type == basic_float) {
            type = basic_int;
            temp_a = int_to_double(a_type, a);
            temp_b = int_to_double(b_type, b);
            res.int_value = (int) ((bool)temp_a.double_value >= (bool)temp_b.double_value);
        }
        else if (type == basic_int || type == basic_pointer) {
            temp_a = double_to_int(a_type, a);
            temp_b = double_to_int(b_type, b);
            res.int_value = (int) (temp_a.int_value >= temp_b.int_value);
        }
    }

    else if (binary_operator == "<=") {
        int_double_storage temp_a, temp_b;
        if (type == basic_float) {
            type = basic_int;
            temp_a = int_to_double(a_type, a);
            temp_b = int_to_double(b_type, b);
            res.int_value = (int) ((bool)temp_a.double_value <= (bool)temp_b.double_value);
        }
        else if (type == basic_int || type == basic_pointer) {
            temp_a = double_to_int(a_type, a);
            temp_b = double_to_int(b_type, b);
            res.int_value = (int) (temp_a.int_value <= temp_b.int_value);
        }
    }

    else if (binary_operator == ">") {
        int_double_storage temp_a, temp_b;
        if (type == basic_float) {
            type = basic_int;
            temp_a = int_to_double(a_type, a);
            temp_b = int_to_double(b_type, b);
            res.int_value = (int) ((bool)temp_a.double_value > (bool)temp_b.double_value);
        }
        else if (type == basic_int || type == basic_pointer) {
            temp_a = double_to_int(a_type, a);
            temp_b = double_to_int(b_type, b);
            res.int_value = (int) (temp_a.int_value > temp_b.int_value);
        }
    }

    else if (binary_operator == "<") {
        int_double_storage temp_a, temp_b;
        if (type == basic_float) {
            type = basic_int;
            temp_a = int_to_double(a_type, a);
            temp_b = int_to_double(b_type, b);
            res.int_value = (int) ((bool)temp_a.double_value < (bool)temp_b.double_value);
        }
        else if (type == basic_int || type == basic_pointer) {
            temp_a = double_to_int(a_type, a);
            temp_b = double_to_int(b_type, b);
            res.int_value = (int) (temp_a.int_value < temp_b.int_value);
        }
    }

    return res;
}

void optimize_single(const AST_PTR& now, const AST_PTR& parent) {
    if (now == nullptr) return;
    optimize_single(now->child, now);

    if (now->type == DeclarationStatement && now->data == "const") {
        AST_PTR child = now->child;
        while (child != nullptr && child->type == SingleDefinition) {
            if (child->last_child->count_expr_ending) {
                if (child->basic_type == basic_int || child->basic_type == basic_pointer)
                    child->value = double_to_int(child->last_child->basic_type, child->last_child->value);
                else if (child->basic_type == basic_pointer)
                    child->value = int_to_double(child->last_child->basic_type, child->last_child->value);
                child->declaration_bound_sym_node->treat_as_constexpr = true;
                child->declaration_bound_sym_node->value = child->value;
            }
            child = child->sister;
        }
    }

    if (now->type == Expression) {
        AST_tuple res = AST_safe::count_child_number(now);
        if (res.judge) now->count_expr_ending = true;
        if (res.count == 1) {
            now->basic_type = now->child->basic_type;
            if (res.judge)
                now->value = now->child->value;
        }
        if (res.count == 2) {
            now->basic_type = implicit_conversion(now->child->basic_type, now->last_child->basic_type);
            if (res.judge)
                now->value = calculate(
                        now->basic_type, now->data,
                        now->child->basic_type, now->child->value,
                        now->last_child->basic_type, now->last_child->value
                );
        }

        // vvv --- ! important --- vvv //
        // let shared_ptr destroy all the child tree node.
        if (res.judge) now->child = now->last_child = nullptr;
        // ^^^ --- ! important --- ^^^ //
    }

    // destroy redundant statement
    if (now->type == Statement || now->type == NormalStatement || now->type == DeclarationStatement) {
        if (now->child != nullptr)
            if (
                now->child->type == SingleDefinition || now->child->type == ArrayDefinition ||
                now->child->type == SingleAssignment || now->child->type == ArrayAssignment ||
                now->child->type == NormalStatement || now->child->type == BlockStatement ||
                now->child->type == KeywordStatement
            )
            {
                now->copy(now->child);
                AST_PTR temp = now->child;
                now->child = temp->child;
                now->last_child->sister = now->sister;
                now->sister = temp->sister;
                now->last_child = temp->last_child;
            }
    }

    optimize_single(now->sister, parent);
}

void Front::Optimiser::Optimize(const AST_PTR& source_AST_head) {
    optimize_single(source_AST_head, nullptr);
}

