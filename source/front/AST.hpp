//
// Created by Tastror on 2022/5/11.
//

#pragma once
#include "include/define.h"
#include <iostream>

void RaiseError(const std::string& error_code) {
    std::cout << "ERROR: " << error_code << std::endl;
}

void connect_child(ANP parent, ANP child) {
    if (parent->child == nullptr) {
        parent->child = child;
        parent->last_child = child;
        child->parent = parent;
    } else {
        parent->last_child->sister = child;
        parent->last_child = child;
        child->parent = parent;
    }
}

void print_all_ASTs(ANP AST_head) {

}

class BaseAST {
public:
    ANP head;
    TNP now_token;
    TNP look_ahead;
    void GoNext() {
        now_token = look_ahead;
        look_ahead = next(now_token);
    }
    explicit BaseAST(TNP token_head) {
        head = new ASP_node;
        now_token = token_head;
        look_ahead = next(now_token);
    };
    virtual ~BaseAST() = default;
};



class FunctionDef: public BaseAST {
public:
    TNP Parse() {
        head->type = FunctionDefinition;
        GoNext();
        return now_token;
    }
    explicit FunctionDef(TNP token_head): BaseAST(token_head) {}
    ~FunctionDef() override = default;
};

class ConstDecl: public BaseAST {
public:
    TNP Parse() {
        head->type = ConstDeclaration;
        GoNext();
        return now_token;
    }
    explicit ConstDecl(TNP token_head): BaseAST(token_head) {}
    ~ConstDecl() override = default;
};

class VariableDecl: public BaseAST {
public:
    TNP Parse() {
        head->type = VariableDeclaration;
        GoNext();
        return now_token;
    }
    explicit VariableDecl(TNP token_head): BaseAST(token_head) {}
    ~VariableDecl() override = default;
};

class ProgramAST: public BaseAST {
    // First: void, int, float, const
    //
public:
    TNP Parse() {
        head->type = ProgramBody;
        while (now_token != nullptr) {
            if (data(now_token) == "const") {
                ConstDecl const_decl(now_token);
                connect_child(head, const_decl.head);
                now_token = const_decl.Parse();
            } else if (data(now_token) == "void") {
                FunctionDef funct_def(now_token);
                connect_child(head, funct_def.head);
                now_token = funct_def.Parse();
            } else if (data(now_token) == "int" || data(now_token) == "float") {
                TNP look_next = next(look_ahead);
                if (data(look_next) == "(") {
                    FunctionDef funct_def(now_token);
                    connect_child(head, funct_def.head);
                    now_token = funct_def.Parse();
                } else {
                    VariableDecl variable_decl(now_token);
                    connect_child(head, variable_decl.head);
                    now_token = variable_decl.Parse();
                }
            } else {
                RaiseError("No match under ProgramAST");
                break;
            }
        }
        return now_token;
    };
    explicit ProgramAST(TNP token_head): BaseAST(token_head) {}
    ~ProgramAST() override = default;
};