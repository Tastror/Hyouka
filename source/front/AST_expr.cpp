//
// Created by Tastror on 2022/5/15.
//

#include "AST_expr.h"
#include <stack>
#include <queue>

int assign_operator(const std::string& op) {
    if (op == ",") return -1;
    else if (op == "||") return 0;
    else if (op == "&&") return 1;
    else if (op == "==" || op == "!=") return 2;
    else if (op == "<" || op == ">" || op == "<=" || op == ">=") return 3;
    else if (op == "+" || op == "-") return 4;
    else if (op == "*" || op == "/" || op == "%") return 5;
    else if (op == "+unary" || op == "-unary" || op == "!") return 6;
    else return 100;
}

int compare(const std::string& op1, const std::string& op2) {
    int a = assign_operator(op1), b = assign_operator(op2);
    return a - b;
}


TNP FunctionRealParamAST::Parse() {
    head->type = FunctionRealParam;
    GoNext();
    return now_token;
}


TNP FunctionUsageAST::Parse() {
    head->type = FunctionUsage;

    // just for test
    while (data(now_token) != ")")
        GoNext();

    return now_token;
}


TNP DownTopExpressionAST::Parse() {
    head->type = DownTopExpression;

    std::stack<std::string> opt;
    std::stack<ANP> sym;
    std::queue<ANP> res;

    bool quit = false;
    while (true) {

        if (now_token == nullptr) {
            RaiseError("in DownTopExpression, lost ending", data(now_token));
            return now_token;
        }

        const std::string expression_ending[] = {";", ")", "}", "]"};
        for (const auto& i : expression_ending)
            if (data(now_token) == i) {
                quit = true;
                break;
            }

        if (quit) {

            if (opt.empty()) {
                // ...
                break;
            }

            else {
                RaiseError("in DownTopExpression, missing operators or numbers", data(now_token));
                return now_token;
            }
        }

        // 1 function, variables and number
        if (type(now_token) != OPERAT && type(now_token) != PUNCT) {

            // 1.1 function or variables
            if (type(now_token) == RNAME) {

                // 1.1.1 function usage
                if (data(next_token) == "(") {

                    FunctionUsageAST func_use(now_token);
                    sym.push(func_use.head);
                    now_token = func_use.Parse();
                    next_token = next(now_token);

                    if (data(now_token) != ")") {
                        RaiseError("in DownTopExpression, missing punctuation [)]", data(now_token));
                        return now_token;
                    }
                }

                // 1.1.2 normal variables
                else {
                    ANP token_to_AST = new AST_node;
                    token_to_AST->data = now_token->data;
                    token_to_AST->type = DownTopExpression;
                    sym.push(token_to_AST);
                }
            }

            // 1.2 normal numbers
            else if (type(now_token) == NUMBER) {
                // ...
            }

            else {
                RaiseError("in DownTopExpression, members should only be identify name or number", data(now_token));
                return now_token;
            }
        }

        // 2 operators
        else {

            // 2.1 find unary + and -
            if (data(next_token) == "+" || data(next_token) == "-")
                next_token->data += "unary";

            // 2.2 use ( )
            else if (data(now_token) == "(") {
                GoNext();

                DownTopExpressionAST recur_expr(now_token);
                sym.push(recur_expr.head);
                now_token = recur_expr.Parse();
                next_token = next(now_token);

                if (data(now_token) != ")") {
                    RaiseError("in DownTopExpression, missing punctuation [)]", data(now_token));
                    return now_token;
                }
            }
        }

        GoNext();
    }
    return now_token;
}