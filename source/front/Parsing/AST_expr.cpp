//
// Created by Tastror on 2022/5/15.
//

#include "AST_expr.h"
#include <stack>

int assign_operator(const std::string& op) {
    if (op == "begin" || op == "end") return 0;
    else if (op == "||") return 1;
    else if (op == "&&") return 2;
    else if (op == "==" || op == "!=") return 3;
    else if (op == "<" || op == ">" || op == "<=" || op == ">=") return 4;
    else if (op == "+" || op == "-") return 5;
    else if (op == "*" || op == "/" || op == "%") return 6;
    else if (op == "+unary" || op == "-unary" || op == "!") return 64;
    else return -1;
}

int assign_operator_2(const std::string& op) {
    if (op == "begin" || op == "end") return 0;
    else if (op == "||") return 1;
    else if (op == "&&") return 2;
    else if (op == "==" || op == "!=") return 3;
    else if (op == "<" || op == ">" || op == "<=" || op == ">=") return 4;
    else if (op == "+" || op == "-") return 5;
    else if (op == "*" || op == "/" || op == "%") return 6;
    else if (op == "+unary" || op == "-unary" || op == "!") return 63;
    else return -1;
}

int compare(const std::string& op1, const std::string& op2) {
    int a = assign_operator(op1), b = assign_operator_2(op2);
    return a - b;
}


// TBD, this should do from inner to outside, which should be done after AST and before IRGen
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



TNP ArrayUsageAST::Parse() {
    head->type = ArrayUsage;

    if (token_safe::type(now_token) != IDENTI) {
        RaiseError("in ArrayUsage, identify name is not valid", now_token);
        return now_token;
    }
    ANP var_name = std::make_shared<AST_node>();
    AST_node::connect_child(head, var_name);
    var_name->type = Identifier;
    var_name->data = now_token->data;
    GoNext();

    if (token_safe::data(now_token) != "[") {
        RaiseError("in ArrayUsage, begin punctuation should be [[]", now_token);
        return now_token;
    }
    GoNext();

    ExpressionAST expr(now_token, symtable_ptr);
    AST_node::connect_child(head, expr.head);
    expr.head->data = "index";
    now_token = expr.Parse();
    next_token = token_safe::next(now_token);

    if (token_safe::data(now_token) != "]") {
        RaiseError("in ArrayUsage, end punctuation should be []]", now_token);
        return now_token;
    }
    GoNext();

    while (token_safe::data(now_token) == "[") {
        GoNext();

        ExpressionAST addi_expr(now_token, symtable_ptr);
        AST_node::connect_child(head, addi_expr.head);
        addi_expr.head->data = "index";
        now_token = addi_expr.Parse();
        next_token = token_safe::next(now_token);

        if (token_safe::data(now_token) != "]") {
            RaiseError("in ArrayUsage, end punctuation should be []]", now_token);
            return now_token;
        }
        GoNext();
    }

    return now_token;
}


TNP FunctionUsageAST::Parse() {
    head->type = FunctionUsage;

    if (token_safe::type(now_token) != IDENTI) {
        RaiseError("in FunctionUsage, identify name is not valid", now_token);
        return now_token;
    }
    ANP var_name = std::make_shared<AST_node>();
    AST_node::connect_child(head, var_name);
    var_name->type = Identifier;
    var_name->data = now_token->data;
    GoNext();

    if (token_safe::data(now_token) != "(") {
        RaiseError("in FunctionUsage, begin punctuation should be [(]", now_token);
        return now_token;
    }
    GoNext();

    if (token_safe::data(now_token) == ")") {
        return now_token;
    }

    ExpressionAST expr(now_token, symtable_ptr);
    AST_node::connect_child(head, expr.head);
    expr.head->data = "argument";
    now_token = expr.Parse();
    next_token = token_safe::next(now_token);

    while (true) {

        if (token_safe::data(now_token) == ")") {
            GoNext();
            break;
        }

        if (token_safe::data(now_token) != ",") {
            RaiseError("in FunctionUsage, punctuation should be [,]", now_token);
            return now_token;
        }
        GoNext();

        ExpressionAST addi_expr(now_token, symtable_ptr);
        AST_node::connect_child(head, addi_expr.head);
        addi_expr.head->data = "argument";
        now_token = addi_expr.Parse();
        next_token = token_safe::next(now_token);
    }

    return now_token;
}


TNP ExpressionAST::Parse() {
    head->type = Expression;

    std::stack<std::string> opt;
    std::stack<ANP> sym;
    opt.push("begin");

    if (token_safe::data(now_token) == "+" || token_safe::data(now_token) == "-")
        now_token->data += "unary";

    bool quit = false;
    while (true) {

        if (now_token == nullptr) {
            RaiseError("in Expression, lost ending", now_token);
            return now_token;
        }

        const std::string expression_ending[] = {";", ",", ")", "}", "]"};
        for (const auto& i : expression_ending)
            if (token_safe::data(now_token) == i) {
                quit = true;
                break;
            }

        if (quit) {

            while (true) {

                if (opt.size() == 1 && opt.top() == "begin") {
                    opt.pop();
                    break;
                }

                if (opt.empty()) {
                    RaiseError("in Expression, fatal error occurred", now_token);
                    return now_token;
                }

                if (sym.empty()) {
                    RaiseError("in Expression, number or variable is not enough", now_token);
                    return now_token;
                }
                ANP k1 = sym.top(); sym.pop();
                if (sym.empty()) {
                    RaiseError("in Expression, number or variable is not enough", now_token);
                    return now_token;
                }
                ANP k2 = sym.top(); sym.pop();
                ANP tog = std::make_shared<AST_node>();
                tog->data = opt.top(); opt.pop();
                tog->type = Expression;
                AST_node::reverse_connect_child(tog, k1);
                AST_node::reverse_connect_child(tog, k2);
                sym.push(tog);
            }

            if (sym.size() == 1) {
                AST_node::connect_child(head, sym.top());
                sym.pop();
                break;
            }

            else {
                RaiseError("in Expression, missing operators or numbers", now_token);
                return now_token;
            }
        }

        // 1 function, variables and number
        if (token_safe::type(now_token) != OPERAT && token_safe::type(now_token) != PUNCT) {

            // 1.1 function or variables
            if (token_safe::type(now_token) == IDENTI) {

                // 1.1.1 function usage [No GoNext]
                if (token_safe::data(next_token) == "(") {
                    FunctionUsageAST func_use(now_token, symtable_ptr);
                    sym.push(func_use.head);
                    now_token = func_use.Parse();
                    next_token = token_safe::next(now_token);
                }

                // 1.1.2 array usage [No GoNext]
                else if (token_safe::data(next_token) == "[") {
                    ArrayUsageAST array_use(now_token, symtable_ptr);
                    sym.push(array_use.head);
                    now_token = array_use.Parse();
                    next_token = token_safe::next(now_token);
                }

                // 1.1.3 normal variables
                else {
                    ANP token_to_AST = std::make_shared<AST_node>();
                    token_to_AST->data = now_token->data;
                    token_to_AST->type = Identifier;
                    sym.push(token_to_AST);
                    GoNext();
                }
            }

            // 1.2 normal numbers
            else if (token_safe::type(now_token) == NUMBER) {
                ANP token_to_AST = std::make_shared<AST_node>();
                token_to_AST->data = now_token->data;
                token_to_AST->type = Number;
                token_to_AST->basic_type = now_token->basic_type;
                token_to_AST->count_expr_ending = true;
                if (token_to_AST->basic_type == basic_int) {
                    token_to_AST->value.int_value = now_token->value.int_value;
                } else if (token_to_AST->basic_type == basic_float) {
                    token_to_AST->value.double_value = now_token->value.double_value;
                }
                sym.push(token_to_AST);
                GoNext();
            }

            // 1.3 wrong name
            else {
                RaiseError("in Expression, members should only be identify name or number", now_token);
                return now_token;
            }
        }

        // 2 operators
        else {

            // find unary + and -
            if (token_safe::data(next_token) == "+" || token_safe::data(next_token) == "-")
                next_token->data += "unary";

            // unary+, unary-, ! should become unary (use a placeholder)
            if (assign_operator(token_safe::data(now_token)) == 64) {
                ANP token_to_AST = std::make_shared<AST_node>();
                token_to_AST->data = "placeholder";
                token_to_AST->count_expr_ending = true;
                token_to_AST->type = Expression;
                sym.push(token_to_AST);
            }

            // 2.1 use ( )
            if (token_safe::data(now_token) == "(") {
                GoNext();

                ExpressionAST recur_expr(now_token, symtable_ptr);
                sym.push(recur_expr.head);
                recur_expr.head->data = "brace";
                now_token = recur_expr.Parse();
                next_token = token_safe::next(now_token);

                if (token_safe::data(now_token) != ")") {
                    RaiseError("in Expression, missing punctuation [)]", now_token);
                    return now_token;
                }
                GoNext();
            }

            // 2.2 other operator
            else {
                std::string now_op = token_safe::data(now_token);

                // 2.2.1 wrong operator
                if (assign_operator(now_op) == -1) {
                    RaiseError("in Expression, unexpected operator found", now_token);
                    return now_token;
                }

                // 2.2.2 now_token - top <= 0  means you can reduce it
                while (compare(now_op, opt.top()) <= 0) {
                    if (sym.empty()) {
                        RaiseError("in Expression, number or variable is not enough", now_token);
                        return now_token;
                    }
                    ANP k1 = sym.top(); sym.pop();
                    if (sym.empty()) {
                        RaiseError("in Expression, number or variable is not enough", now_token);
                        return now_token;
                    }
                    ANP k2 = sym.top(); sym.pop();
                    ANP tog = std::make_shared<AST_node>();
                    tog->data = opt.top(); opt.pop();
                    tog->type = Expression;
                    AST_node::reverse_connect_child(tog, k1);
                    AST_node::reverse_connect_child(tog, k2);
                    sym.push(tog);
                }

                opt.push(now_op);
                GoNext();
            }

        }
    }
    return now_token;
}