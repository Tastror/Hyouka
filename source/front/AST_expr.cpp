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


TNP ArrayUsageAST::Parse() {
    head->type = ArrayUsage;

    if (type(now_token) != RNAME) {
        RaiseError("in ArrayUsage, identify name is not valid", data(now_token));
        return now_token;
    }
    ANP var_name = new AST_node;
    connect_child(head, var_name);
    var_name->type = Identifier;
    var_name->data = now_token->data;
    GoNext();

    if (data(now_token) != "[") {
        RaiseError("in ArrayUsage, begin punctuation should be [[]", data(now_token));
        return now_token;
    }
    GoNext();

    ExpressionAST expr(now_token);
    connect_child(head, expr.head);
    expr.head->data = "index";
    now_token = expr.Parse();
    next_token = next(now_token);

    if (data(now_token) != "]") {
        RaiseError("in ArrayUsage, end punctuation should be []]", data(now_token));
        return now_token;
    }
    GoNext();

    while (data(now_token) == "[") {
        GoNext();

        ExpressionAST expr(now_token);
        connect_child(head, expr.head);
        expr.head->data = "index";
        now_token = expr.Parse();
        next_token = next(now_token);

        if (data(now_token) != "]") {
            RaiseError("in ArrayUsage, end punctuation should be []]", data(now_token));
            return now_token;
        }
        GoNext();
    }

    return now_token;
}


TNP FunctionUsageAST::Parse() {
    head->type = FunctionUsage;

    if (type(now_token) != RNAME) {
        RaiseError("in FunctionUsage, identify name is not valid", data(now_token));
        return now_token;
    }
    ANP var_name = new AST_node;
    connect_child(head, var_name);
    var_name->type = Identifier;
    var_name->data = now_token->data;
    GoNext();

    if (data(now_token) != "(") {
        RaiseError("in FunctionUsage, begin punctuation should be [(]", data(now_token));
        return now_token;
    }
    GoNext();

    if (data(now_token) == ")") {
        return now_token;
    }

    ExpressionAST expr(now_token);
    connect_child(head, expr.head);
    expr.head->data = "argument";
    now_token = expr.Parse();
    next_token = next(now_token);

    while (true) {

        if (data(now_token) == ")") {
            GoNext();
            break;
        }

        if (data(now_token) != ",") {
            RaiseError("in FunctionUsage, punctuation should be [,]", data(now_token));
            return now_token;
        }
        GoNext();

        ExpressionAST addi_expr(now_token);
        connect_child(head, addi_expr.head);
        addi_expr.head->data = "argument";
        now_token = addi_expr.Parse();
        next_token = next(now_token);
    }

    return now_token;

    return now_token;
}


TNP ExpressionAST::Parse() {
    head->type = Expression;

    std::stack<std::string> opt;
    std::stack<ANP> sym;
    opt.push("begin");

    bool quit = false;
    while (true) {

        if (now_token == nullptr) {
            RaiseError("in Expression, lost ending", data(now_token));
            return now_token;
        }

        const std::string expression_ending[] = {";", ",", ")", "}", "]"};
        for (const auto& i : expression_ending)
            if (data(now_token) == i) {
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
                    RaiseError("in Expression, fatal error occurred", data(now_token));
                    return now_token;
                }

                if (sym.empty()) {
                    RaiseError("in Expression, number or variable is not enough", data(now_token));
                    return now_token;
                }
                ANP k1 = sym.top(); sym.pop();
                if (sym.empty()) {
                    RaiseError("in Expression, number or variable is not enough", data(now_token));
                    return now_token;
                }
                ANP k2 = sym.top(); sym.pop();
                ANP tog = new AST_node;  // a new here, remember to delete
                tog->data = opt.top(); opt.pop();
                tog->type = Expression;
                reverse_connect_child(tog, k1);
                reverse_connect_child(tog, k2);
                sym.push(tog);
            }

            if (sym.size() == 1) {
                connect_child(head, sym.top());
                sym.pop();
                break;
            }

            else {
                RaiseError("in Expression, missing operators or numbers", data(now_token));
                return now_token;
            }
        }

        // 1 function, variables and number
        if (type(now_token) != OPERAT && type(now_token) != PUNCT) {

            // 1.1 function or variables
            if (type(now_token) == RNAME) {

                // 1.1.1 function usage [No GoNext]
                if (data(next_token) == "(") {
                    FunctionUsageAST func_use(now_token);  // a new here, remember to delete
                    sym.push(func_use.head);
                    now_token = func_use.Parse();
                    next_token = next(now_token);
                }

                // 1.1.2 array usage [No GoNext]
                else if (data(next_token) == "[") {
                    ArrayUsageAST array_use(now_token);  // a new here, remember to delete
                    sym.push(array_use.head);
                    now_token = array_use.Parse();
                    next_token = next(now_token);
                }

                // 1.1.3 normal variables
                else {
                    ANP token_to_AST = new AST_node;  // a new here, remember to delete
                    token_to_AST->data = now_token->data;
                    token_to_AST->type = Identifier;
                    sym.push(token_to_AST);
                    GoNext();
                }
            }

            // 1.2 normal numbers
            else if (type(now_token) == NUMBER) {
                ANP token_to_AST = new AST_node;  // a new here, remember to delete
                token_to_AST->data = now_token->data;
                token_to_AST->type = Number;
                token_to_AST->int_or_double = now_token->int_or_double;
                if (token_to_AST->int_or_double == 1) {
                    token_to_AST->value.int_value = now_token->value.int_value;
                } else if (token_to_AST->int_or_double == 2) {
                    token_to_AST->value.double_value = now_token->value.double_value;
                }
                sym.push(token_to_AST);
                GoNext();
            }

            // 1.3 wrong name
            else {
                RaiseError("in Expression, members should only be identify name or number", data(now_token));
                return now_token;
            }
        }

        // 2 operators
        else {

            // find unary + and -
            if (data(next_token) == "+" || data(next_token) == "-")
                next_token->data += "unary";

            // unary+, unary-, ! should become unary (use a placeholder)
            if (assign_operator(data(now_token)) == 64) {
                ANP token_to_AST = new AST_node;  // a new here, remember to delete
                token_to_AST->data = "placeholder";
                token_to_AST->type = Expression;
                sym.push(token_to_AST);
            }

            // 2.1 use ( )
            if (data(now_token) == "(") {
                GoNext();

                ExpressionAST recur_expr(now_token);  // a new here, remember to delete
                sym.push(recur_expr.head);
                recur_expr.head->data = "brace";
                now_token = recur_expr.Parse();
                next_token = next(now_token);

                if (data(now_token) != ")") {
                    RaiseError("in Expression, missing punctuation [)]", data(now_token));
                    return now_token;
                }
                GoNext();
            }

            // 2.2 other operator
            else {
                std::string now_op = data(now_token);

                // 2.2.1 wrong operator
                if (assign_operator(now_op) == -1) {
                    RaiseError("in Expression, unexpected operator found", data(now_token));
                    return now_token;
                }

                // 2.2.2 now - top <= 0  means you can reduce it
                while (compare(now_op, opt.top()) <= 0) {
                    if (sym.empty()) {
                        RaiseError("in Expression, number or variable is not enough", data(now_token));
                        return now_token;
                    }
                    ANP k1 = sym.top(); sym.pop();
                    if (sym.empty()) {
                        RaiseError("in Expression, number or variable is not enough", data(now_token));
                        return now_token;
                    }
                    ANP k2 = sym.top(); sym.pop();
                    ANP tog = new AST_node;  // a new here, remember to delete
                    tog->data = opt.top(); opt.pop();
                    tog->type = Expression;
                    reverse_connect_child(tog, k1);
                    reverse_connect_child(tog, k2);
                    sym.push(tog);
                }

                opt.push(now_op);
                GoNext();
            }

        }
    }
    return now_token;
}