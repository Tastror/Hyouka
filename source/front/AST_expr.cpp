//
// Created by Tastror on 2022/5/15.
//

#include "AST_expr.h"

TNP DownTopExpressionAST::Parse() {
    head->type = DownTopExpression;

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
        if (quit) break;
        GoNext();
    }
    return now_token;
}