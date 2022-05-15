//
// Created by Tastror on 2022/5/15.
//

#include "AST_keystmt.h"

TNP KeywordStatementAST::Parse() {
    head->type = KeywordStatement;

    if (data(now_token) == "if") {
        head->data = "if";
        GoNext();

        if (data(now_token) != "(") {
            RaiseError("in KeywordStatement, if condition statement should begin with [(]", data(now_token));
            return now_token;
        }
        GoNext();

        ExpressionAST expr(now_token);
        connect_child(head, expr.head);
        expr.head->data = "condition";
        now_token = expr.Parse();
        next_token = next(now_token);

        if (data(now_token) != ")") {
            RaiseError("in KeywordStatement, if condition statement should end with [)]", data(now_token));
            return now_token;
        }
        GoNext();

        StatementAST stmt(now_token);
        connect_child(head, stmt.head);
        now_token = stmt.Parse();
        next_token = next(now_token);

        if (data(now_token) == "else") {
            head->data = "if-else";
            GoNext();

            StatementAST else_stmt(now_token);
            connect_child(head, else_stmt.head);
            now_token = else_stmt.Parse();
            next_token = next(now_token);
        }
    }

    else if (data(now_token) == "while") {
        head->data = "while";
        GoNext();

        if (data(now_token) != "(") {
            RaiseError("in KeywordStatement, while condition statement should begin with [(]", data(now_token));
            return now_token;
        }
        GoNext();

        ExpressionAST expr(now_token);
        connect_child(head, expr.head);
        expr.head->data = "condition";
        now_token = expr.Parse();
        next_token = next(now_token);

        if (data(now_token) != ")") {
            RaiseError("in KeywordStatement, while condition statement should end with [)]", data(now_token));
            return now_token;
        }
        GoNext();

        StatementAST stmt(now_token);
        connect_child(head, stmt.head);
        now_token = stmt.Parse();
        next_token = next(now_token);
    }

    else if (data(now_token) == "break") {
        head->data = "break";
        GoNext();

        if (data(now_token) != ";") {
            RaiseError("in KeywordStatement, break should end with [;]", data(now_token));
            return now_token;
        }
        GoNext();
    }

    else if (data(now_token) == "continue") {
        head->data = "continue";
        GoNext();

        if (data(now_token) != ";") {
            RaiseError("in KeywordStatement, continue should end with [;]", data(now_token));
            return now_token;
        }
        GoNext();
    }

    else if (data(now_token) == "return") {
        head->data = "return";
        GoNext();

        ExpressionAST expr(now_token);
        connect_child(head, expr.head);
        expr.head->data = "return";
        now_token = expr.Parse();
        next_token = next(now_token);

        if (data(now_token) != ";") {
            RaiseError("in KeywordStatement, return should end with [;]", data(now_token));
            return now_token;
        }
        GoNext();
    }

    else {
        RaiseError("in KeywordStatement, begin with wrong sign", data(now_token));
        return now_token;
    }

    return now_token;
}