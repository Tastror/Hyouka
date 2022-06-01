//
// Created by Tastror on 2022/5/29.
//

#include "FrontOpt.h"

value_and_type_tuple Optimize_Useful::implicit_conversion(const value_and_type_tuple& a, const value_and_type_tuple& b) {

    if (!a.self_check() || !b.self_check())
        AST_optimize_safe::RaiseError(
            "Develop Error in value_and_type_tuple.self_check(). You can ask Tastror for help."
        );

    value_and_type_tuple res;

    // make F(a) <= F(b), F() is a map from value_and_type_tuple types to integer
    const value_and_type_tuple* ap = &a, * bp = &b;
    int F_a = (int) a.is_pointer * 10 + (int) a.represent_type;
    int F_b = (int) b.is_pointer * 10 + (int) b.represent_type;
    if (F_a > F_b) { ap = &b; bp = &a; }

    if (ap->is_pointer == bp->is_pointer && ap->represent_type == bp->represent_type) {
        res.is_pointer = ap->is_pointer;
        res.represent_type = ap->represent_type;
        return res;
    }
    else if (!ap->is_pointer && ap->represent_type == basic_any) {
        res.is_pointer = bp->is_pointer;
        res.represent_type = bp->represent_type;
        return res;
    }
    else if (!ap->is_pointer && ap->represent_type == basic_int) {
        res.is_pointer = bp->is_pointer;
        res.represent_type = bp->represent_type;
        return res;
    }
    else if (!ap->is_pointer && ap->represent_type == basic_float) {
        AST_optimize_safe::RaiseError(
            "cannot implicitly converse " + a.type_to_string() + " and " + b.type_to_string()
        );
        return res;
    }
    else if (ap->is_pointer && ap->represent_type == basic_any) {
        res.is_pointer = bp->is_pointer;
        res.represent_type = bp->represent_type;
        return res;
    }
    else {
        AST_optimize_safe::RaiseError(
            "cannot implicitly converse " + a.type_to_string() + " and " + b.type_to_string()
        );
        return res;
    }
}

value_and_type_tuple binary_operator_implicit_conversion(
        const std::string& binary_operator,
        const value_and_type_tuple& a,
        const value_and_type_tuple& b
) {

    if (
        binary_operator == "==" || binary_operator == "!=" || binary_operator == ">=" || binary_operator == "<=" ||
        binary_operator == ">" || binary_operator == "<" || binary_operator == "!" || binary_operator == "&&" || binary_operator == "||"
    ) {
        value_and_type_tuple res;
        res.stovt("int");
        return res;
    }
    else if (binary_operator == "%") {
        if (!a.is_pointer && a.represent_type != basic_int) {
            AST_optimize_safe::RaiseError("cannot mod " + a.type_to_string() + " and " + b.type_to_string());
        }
        value_and_type_tuple res;
        res.stovt("int");
        return res;
    }
    else {
        return Optimize_Useful::implicit_conversion(a, b);
    }
}

// contains many meddle error which need to be thrown by binary_operator_implicit_conversion()
// waiting for refactor  TBD...
value_and_type_tuple calculate(
        const std::string& binary_operator,
        const value_and_type_tuple& a,
        const value_and_type_tuple& b
) {

    value_and_type_tuple res = binary_operator_implicit_conversion(binary_operator, a, b);
    if (Safe::GlobalError) return res;

    if (res.represent_type == basic_any)
        AST_optimize_safe::RaiseError("cannot calculate " + a.type_to_string() + " and " + b.type_to_string());

    if (binary_operator == "+unary") {
        res = b;
    }

    else if (binary_operator == "-unary") {
        if (res.is_pointer || res.represent_type == basic_int)
            res.assign_as(-b.literal_value.literal_value.int_value);
        else if (res.represent_type == basic_float)
            res.assign_as(-b.literal_value.literal_value.double_value);
        else
            AST_optimize_safe::RaiseError("cannot use unary minus before " + b.type_to_string());
    }

    if (binary_operator == "!") {
        if (res.is_pointer || res.represent_type == basic_int)
            res.assign_as((int) ! b.literal_value.literal_value.int_value);
        else if (res.represent_type == basic_float)
            res.assign_as((int) ! (bool) b.literal_value.literal_value.double_value);
        else
            AST_optimize_safe::RaiseError("cannot plus " + a.type_to_string() + " and " + b.type_to_string());
    }

    else if (binary_operator == "+") {
        value_and_type_tuple temp_a = a, temp_b = b;
        if (res.is_pointer) {
            if (a.is_pointer && !b.is_pointer && b.represent_type == basic_int)
                res.assign_as(temp_a.literal_value.literal_value.int_value + temp_b.literal_value.literal_value.int_value * 4);
            else
                AST_optimize_safe::RaiseError("cannot plus " + a.type_to_string() + " and " + b.type_to_string());
        }
        else if (res.represent_type == basic_int) {
            temp_a.self_float_to_int();
            temp_b.self_float_to_int();
            res.assign_as(temp_a.literal_value.literal_value.int_value + temp_b.literal_value.literal_value.int_value);
        } else if (res.represent_type == basic_float) {
            temp_a.self_int_to_float();
            temp_b.self_int_to_float();
            res.assign_as(temp_a.literal_value.literal_value.double_value + temp_b.literal_value.literal_value.double_value);
        } else {
            AST_optimize_safe::RaiseError("cannot plus " + a.type_to_string() + " and " + b.type_to_string());
        }
    }

    else if (binary_operator == "-") {
        value_and_type_tuple temp_a = a, temp_b = b;
        if (res.is_pointer) {
            if (a.is_pointer && !b.is_pointer && b.represent_type == basic_int)
                res.assign_as(temp_a.literal_value.literal_value.int_value - temp_b.literal_value.literal_value.int_value * 4);
            else
                AST_optimize_safe::RaiseError("cannot minus " + a.type_to_string() + " and " + b.type_to_string());
        }
        else if (res.represent_type == basic_int) {
            temp_a.self_float_to_int();
            temp_b.self_float_to_int();
            res.assign_as(temp_a.literal_value.literal_value.int_value - temp_b.literal_value.literal_value.int_value);
        } else if (res.represent_type == basic_float) {
            temp_a.self_int_to_float();
            temp_b.self_int_to_float();
            res.assign_as(temp_a.literal_value.literal_value.double_value - temp_b.literal_value.literal_value.double_value);
        } else {
            AST_optimize_safe::RaiseError("cannot minus " + a.type_to_string() + " and " + b.type_to_string());
        }
    }

    else if (binary_operator == "*") {
        value_and_type_tuple temp_a = a, temp_b = b;
        if (res.is_pointer) {
            AST_optimize_safe::RaiseError("cannot multiply " + a.type_to_string() + " and " + b.type_to_string());
        }
        else if (res.represent_type == basic_int) {
            temp_a.self_float_to_int();
            temp_b.self_float_to_int();
            res.assign_as(temp_a.literal_value.literal_value.int_value * temp_b.literal_value.literal_value.int_value);
        } else if (res.represent_type == basic_float) {
            temp_a.self_int_to_float();
            temp_b.self_int_to_float();
            res.assign_as(temp_a.literal_value.literal_value.double_value * temp_b.literal_value.literal_value.double_value);
        } else {
            AST_optimize_safe::RaiseError("cannot multiply " + a.type_to_string() + " and " + b.type_to_string());
        }
    }

    else if (binary_operator == "/") {
        value_and_type_tuple temp_a = a, temp_b = b;
        if (res.is_pointer) {
            AST_optimize_safe::RaiseError("cannot divide " + a.type_to_string() + " and " + b.type_to_string());
        }
        else if (res.represent_type == basic_int) {
            temp_a.self_float_to_int();
            temp_b.self_float_to_int();
            res.assign_as(temp_a.literal_value.literal_value.int_value / temp_b.literal_value.literal_value.int_value);
        } else if (res.represent_type == basic_float) {
            temp_a.self_int_to_float();
            temp_b.self_int_to_float();
            res.assign_as(temp_a.literal_value.literal_value.double_value / temp_b.literal_value.literal_value.double_value);
        } else {
            AST_optimize_safe::RaiseError("cannot divide " + a.type_to_string() + " and " + b.type_to_string());
        }
    }

    else if (binary_operator == "%") {
        value_and_type_tuple temp_a = a, temp_b = b;
        if (res.is_pointer) {
            AST_optimize_safe::RaiseError("cannot mod " + a.type_to_string() + " and " + b.type_to_string());
        }
        else if (res.represent_type == basic_int) {
            temp_a.self_float_to_int();
            temp_b.self_float_to_int();
            res.assign_as(temp_a.literal_value.literal_value.int_value % temp_b.literal_value.literal_value.int_value);
        }
        else {
            AST_optimize_safe::RaiseError("cannot mod " + a.type_to_string() + " and " + b.type_to_string());
        }
    }

    else if (binary_operator == "&&") {
        value_and_type_tuple temp_a = a, temp_b = b;
        if (res.is_pointer || res.represent_type == basic_int) {
            temp_a.self_float_to_int();
            temp_b.self_float_to_int();
            res.assign_as(temp_a.literal_value.literal_value.int_value && temp_b.literal_value.literal_value.int_value);
        } else if (res.represent_type == basic_float) {
            temp_a.self_int_to_float();
            temp_b.self_int_to_float();
            res.assign_as((bool) temp_a.literal_value.literal_value.double_value && (bool) temp_b.literal_value.literal_value.double_value);
        } else {
            AST_optimize_safe::RaiseError("cannot calculate " + a.type_to_string() + " and " + b.type_to_string());
        }
    }

    else if (binary_operator == "||") {
        value_and_type_tuple temp_a = a, temp_b = b;
        if (res.is_pointer || res.represent_type == basic_int) {
            temp_a.self_float_to_int();
            temp_b.self_float_to_int();
            res.assign_as(temp_a.literal_value.literal_value.int_value || temp_b.literal_value.literal_value.int_value);
        } else if (res.represent_type == basic_float) {
            temp_a.self_int_to_float();
            temp_b.self_int_to_float();
            res.assign_as((bool) temp_a.literal_value.literal_value.double_value || (bool) temp_b.literal_value.literal_value.double_value);
        } else {
            AST_optimize_safe::RaiseError("cannot calculate " + a.type_to_string() + " and " + b.type_to_string());
        }
    }

    else if (binary_operator == "==") {
        value_and_type_tuple temp_a = a, temp_b = b;
        if (res.is_pointer || res.represent_type == basic_int) {
            temp_a.self_float_to_int();
            temp_b.self_float_to_int();
            res.assign_as(temp_a.literal_value.literal_value.int_value == temp_b.literal_value.literal_value.int_value);
        } else if (res.represent_type == basic_float) {
            temp_a.self_int_to_float();
            temp_b.self_int_to_float();
            res.assign_as(temp_a.literal_value.literal_value.double_value == temp_b.literal_value.literal_value.double_value);
        } else {
            AST_optimize_safe::RaiseError("cannot calculate " + a.type_to_string() + " and " + b.type_to_string());
        }
    }

    else if (binary_operator == "!=") {
        value_and_type_tuple temp_a = a, temp_b = b;
        if (res.is_pointer || res.represent_type == basic_int) {
            temp_a.self_float_to_int();
            temp_b.self_float_to_int();
            res.assign_as(temp_a.literal_value.literal_value.int_value != temp_b.literal_value.literal_value.int_value);
        } else if (res.represent_type == basic_float) {
            temp_a.self_int_to_float();
            temp_b.self_int_to_float();
            res.assign_as(temp_a.literal_value.literal_value.double_value != temp_b.literal_value.literal_value.double_value);
        } else {
            AST_optimize_safe::RaiseError("cannot calculate " + a.type_to_string() + " and " + b.type_to_string());
        }
    }

    else if (binary_operator == ">=") {
        value_and_type_tuple temp_a = a, temp_b = b;
        if (res.is_pointer || res.represent_type == basic_int) {
            temp_a.self_float_to_int();
            temp_b.self_float_to_int();
            res.assign_as(temp_a.literal_value.literal_value.int_value >= temp_b.literal_value.literal_value.int_value);
        } else if (res.represent_type == basic_float) {
            temp_a.self_int_to_float();
            temp_b.self_int_to_float();
            res.assign_as(temp_a.literal_value.literal_value.double_value >= temp_b.literal_value.literal_value.double_value);
        } else {
            AST_optimize_safe::RaiseError("cannot calculate " + a.type_to_string() + " and " + b.type_to_string());
        }
    }

    else if (binary_operator == "<=") {
        value_and_type_tuple temp_a = a, temp_b = b;
        if (res.is_pointer || res.represent_type == basic_int) {
            temp_a.self_float_to_int();
            temp_b.self_float_to_int();
            res.assign_as(temp_a.literal_value.literal_value.int_value <= temp_b.literal_value.literal_value.int_value);
        } else if (res.represent_type == basic_float) {
            temp_a.self_int_to_float();
            temp_b.self_int_to_float();
            res.assign_as(temp_a.literal_value.literal_value.double_value <= temp_b.literal_value.literal_value.double_value);
        } else {
            AST_optimize_safe::RaiseError("cannot calculate " + a.type_to_string() + " and " + b.type_to_string());
        }
    }

    else if (binary_operator == ">") {
        value_and_type_tuple temp_a = a, temp_b = b;
        if (res.is_pointer || res.represent_type == basic_int) {
            temp_a.self_float_to_int();
            temp_b.self_float_to_int();
            res.assign_as(temp_a.literal_value.literal_value.int_value > temp_b.literal_value.literal_value.int_value);
        } else if (res.represent_type == basic_float) {
            temp_a.self_int_to_float();
            temp_b.self_int_to_float();
            res.assign_as(temp_a.literal_value.literal_value.double_value > temp_b.literal_value.literal_value.double_value);
        } else {
            AST_optimize_safe::RaiseError("cannot calculate " + a.type_to_string() + " and " + b.type_to_string());
        }
    }

    else if (binary_operator == "<") {
        value_and_type_tuple temp_a = a, temp_b = b;
        if (res.is_pointer || res.represent_type == basic_int) {
            temp_a.self_float_to_int();
            temp_b.self_float_to_int();
            res.assign_as(temp_a.literal_value.literal_value.int_value < temp_b.literal_value.literal_value.int_value);
        } else if (res.represent_type == basic_float) {
            temp_a.self_int_to_float();
            temp_b.self_int_to_float();
            res.assign_as(temp_a.literal_value.literal_value.double_value < temp_b.literal_value.literal_value.double_value);
        } else {
            AST_optimize_safe::RaiseError("cannot calculate " + a.type_to_string() + " and " + b.type_to_string());
        }
    }

    return res;
}

void optimize_single(const AST_PTR& now, const AST_PTR& parent) {
    if (now == nullptr) return;
    optimize_single(now->child, now);

    if (now->type == DeclarationStatement && now->data == "const") {
        AST_PTR child = now->child;

        // declaration conversion
        while (child != nullptr && child->type == SingleDefinition) {
            if (child->last_child->count_expr_ending) {
                if (child->value_and_type.represent_type == basic_int || child->value_and_type.is_pointer) {
                    child->value_and_type = child->last_child->value_and_type;
                    child->value_and_type.self_float_to_int();
                }
                else if (child->value_and_type.represent_type == basic_float){
                    child->value_and_type = child->last_child->value_and_type;
                    child->value_and_type.self_int_to_float();
                }
                child->declaration_bound_sym_node->treat_as_constexpr = true;
                child->declaration_bound_sym_node->value_and_type = child->value_and_type;
            }
            child = child->sister;
        }
    }

    if (now->type == Expression) {
        AST_tuple res = AST_safe::count_child_number(now);
        if (res.judge) now->count_expr_ending = true;
        if (res.count == 1) {
            now->value_and_type.represent_type = now->child->value_and_type.represent_type;
            if (res.judge)
                now->value_and_type = now->child->value_and_type;
        }
        if (res.count == 2) {
            value_and_type_tuple temp = binary_operator_implicit_conversion(
                now->data, now->child->value_and_type, now->last_child->value_and_type
            );
            now->value_and_type.is_pointer = temp.is_pointer;
            now->value_and_type.represent_type = temp.represent_type;
            if (res.judge)
                now->value_and_type = calculate(now->data, now->child->value_and_type, now->last_child->value_and_type);
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

