//
// Created by Tastror on 2022/5/15.
//

#include "AST_expr.h"
#include <stack>
#include <queue>

int assign_operator(const std::string& op) {
    if (op == "||") return 0;
    else if (op == "&&") return 1;
    else if (op == "==" || op == "!=") return 2;
    else if (op == "<" || op == ">" || op == "<=" || op == ">=") return 3;
    else if (op == "+" || op == "-") return 4;
    else if (op == "*" || op == "/" || op == "%") return 5;
    else if (op == "+unary" || op == "-unary" || op == "!") return 6;
    else if (op == "(" || op == ")") return 7;
    else return 100;
}

int compare(const std::string& op1, const std::string& op2) {
    int a = assign_operator(op1), b = assign_operator(op2);
    return a - b;
}

TNP DownTopExpressionAST::Parse() {
    head->type = DownTopExpression;

    std::stack<TNP> sym;
    std::stack<TNP> opt;
    std::queue<ANP> res;

    bool quit = false;
    while (true) {
        if (now_token == nullptr) {
            RaiseError("in DownTopExpression, lost ending", data(now_token));
            return now_token;
        }
        for (int i = 0; i < 5; ++i)
            if (data(now_token) == expression_ending[i]) {
                quit = true;
                break;
            }
        if (quit) {
            if (opt.empty()) {
                // ...
                break;
            } else if (data(now_token) == ")") {
                quit = false;
            } else {
                RaiseError("in DownTopExpression, missing operators or numbers", data(now_token));
                return now_token;
            }
        }

        if (type(now_token) != OPERAT && type(now_token) != PUNCT) {
            if (type(now_token) == RNAME)
                sym.push(now_token);
        } else {
            // find unary + and -
            if (data(next_token) == "+" || data(next_token) == "-") next_token->data += "unary";

            // just for test
            if (data(now_token) == "(") {
                opt.push(now_token);
            } else if (data(now_token) == ")") {
                if (opt.empty()) {
                    RaiseError("in DownTopExpression, you may missing [(] or have much [)]", data(now_token));
                    return now_token;
                } else {
                    opt.pop();
                }
            }
            // just for test
        }


        GoNext();
    }
    return now_token;
}