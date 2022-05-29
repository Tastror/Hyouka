//
// Created by Tastror on 2022/5/29.
//

#include "FrontOpt.h"

struct tuple {
    int count;
    bool judge;
};

int_double_storage int_to_double(int x_type, int_double_storage x) {
    if (x_type == basic_int || x_type == basic_pointer)
        x.double_value = (double) x.int_value;
    return x;
}

int_double_storage double_to_int(int x_type, int_double_storage x) {
    if (x_type == basic_float)
        x.int_value = (int) x.double_value;
    return x;
}

basic_type implicit_conversion(int a, int b) {
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
        int& type,
        const std::string& binary_operator,
        int a_type, int_double_storage a,
        int b_type, int_double_storage b
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
            res.double_value = temp_a.double_value / temp_b.double_value;
        }
        else if (type == basic_int || type == basic_pointer) {
            temp_a = double_to_int(a_type, a);
            temp_b = double_to_int(b_type, b);
            res.int_value = temp_a.int_value / temp_b.int_value;
        }
    }

    else if (binary_operator == "%") {
        int_double_storage temp_a, temp_b;
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


tuple count_child_number(const ANP& now_node) {
    if (now_node == nullptr) return (tuple){0, false};
    tuple res = {0, true};
    ANP temp = now_node->child;
    while (temp != nullptr) {
        res.count++;
        if (!temp->count_expr_ending)
            res.judge = false;
        temp = temp->sister;
    }
    return res;
}

void optimize_single(const ANP& now) {
    if (now == nullptr) return;
    optimize_single(now->child);
    if (now->type == Expression) {
        tuple res = count_child_number(now);
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
    }
    optimize_single(now->sister);
}

void Front::Optimiser::Optimize(const ANP& source_AST_head) {
    optimize_single(source_AST_head);
}

