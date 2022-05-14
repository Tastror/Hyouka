//
// Created by Tastror on 2022/5/11.
//

#pragma once
#include "include/define.h"
#include <iostream>

void RaiseError(const std::string& error_code, const std::string& token_data) {
    std::cout << "ERROR: " << error_code << std::endl;
    std::cout << "    where: " << token_data << std::endl;
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

void _print_all_ASTs(ANP now, int stage) {
    if (now == nullptr) return;
    for (int i = 0; i < stage; ++i)
        std::cout << "\t";
    std::cout << ASP_show_type[now->type] << ", ";
    if (now->type == Number)
        std::cout <<
        ((now->int_or_double == 1) ? now->value.int_value : ((now->int_or_double == 2) ? now->value.double_value : 0));
    else
        std::cout << (now->data.empty() ? "no explicit data" : now->data);
    std::cout << std::endl;
    _print_all_ASTs(now->child, stage + 1);
    _print_all_ASTs(now->sister, stage);
}

void print_all_ASTs(ANP AST_head) {
    _print_all_ASTs(AST_head, 0);
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


// examples:
// 5
// 3.4 + 5
// (7 / 2) + 7 * 4.2
// notice:
// please check if it is int or float
class ValueCal: public BaseAST {  // TBD
public:
    TNP Parse() {
        head->type = ValueCalculate;
        GoNext();
        return now_token;
    }
    explicit ValueCal(TNP token_head): BaseAST(token_head) {}
    ~ValueCal() override = default;
};


// examples:
// x = 3
// y = 8 * 5 + 1
// notice:
// no , or ;
class SingleDef: public BaseAST {  // TBD
public:
    TNP Parse() {
        head->type = SingleDefinition;
        if (type(now_token) != RNAME) {
            RaiseError("in ValueDef, beginning is not a valid name", data(now_token));
            return now_token;
        }
        GoNext();
        return now_token;
    }
    explicit SingleDef(TNP token_head): BaseAST(token_head) {}
    ~SingleDef() override = default;
};


// examples:
// a[]
// x[5] = {}
// y[6] = {8 * 5 + 1, 7}
// z[3][3] = {{}, {2}, 1, 3}
// notice:
// no , or ;
class ArrayDef: public BaseAST {  // TBD
public:
    TNP Parse() {
        head->type = ArrayDefinition;
        if (type(now_token) != RNAME) {
            RaiseError("in ArrayDef, beginning is not a valid name", data(now_token));
            return now_token;
        }
        GoNext();
        return now_token;
    }
    explicit ArrayDef(TNP token_head): BaseAST(token_head) {}
    ~ArrayDef() override = default;
};


// examples:
// int x = 3, y = 4;
// const float x[5] = {2.5, 1};
// notice:
// including , and ;
class VarDecl: public BaseAST {
public:
    TNP Parse() {
        head->type = VariableDeclaration;
        if (data(now_token) != "const" && data(now_token) != "int" && data(now_token) != "float") {
            RaiseError("in ConstDecl, beginning is not [const]", data(now_token));
            return now_token;
        }
        GoNext();
        if (data(now_token) == "const") {
            head->type = ConstDeclaration;
            GoNext();
        }
        if (data(now_token) != "int" && data(now_token) != "float") {
            RaiseError("in ConstDecl, type is not [int] or [float]", data(now_token));
            return now_token;
        }
        ANP var_type = new ASP_node;
        connect_child(head, var_type);
        var_type->type = BasicType;
        var_type->data = now_token->data;
        GoNext();
        while (true) {
            if (data(look_ahead) == "[") {
                ArrayDef array_def(now_token);
                connect_child(head, array_def.head);
                now_token = array_def.Parse();
                look_ahead = next(now_token);
            } else {
                SingleDef single_def(now_token);
                connect_child(head, single_def.head);
                now_token = single_def.Parse();
                look_ahead = next(now_token);
            }
            if (data(now_token) == ";")
                break;
            else if (data(now_token) == ",")
                continue;
            else {
                RaiseError("in ConstDecl, separate punctuation is not [,] or [;]", data(now_token));
                return now_token;
            }
        }
        return now_token;
    }
    explicit VarDecl(TNP token_head): BaseAST(token_head) {}
    ~VarDecl() override = default;
};


// examples:
// int x, float y, int z
// no ( or ), end with )
class FunctionPara: public BaseAST {  // TBD
public:
    TNP Parse() {
        head->type = FunctionParams;
        if (data(now_token) == ")") {
            return now_token;
        }
        return now_token;
    }
    explicit FunctionPara(TNP token_head): BaseAST(token_head) {}
    ~FunctionPara() override = default;
};



// examples:
// 5; 2 + 1; putint(3); int x = 3; if (x > 2) x = x - 1; return 0;
// notice:
// no { or }
class Block: public BaseAST {  // TBD
public:
    TNP Parse() {
        head->type = BlockStatement;
        if (data(now_token) == "{") {
            GoNext();
            Block new_block(now_token);
            connect_child(head, new_block.head);
            now_token = new_block.Parse();
            look_ahead = next(now_token);
            if (data(now_token) != "}") {
                RaiseError("in FunctionDef, lost punctuation [}]", data(now_token));
                return now_token;
            }
        }
        return now_token;
    }
    explicit Block(TNP token_head): BaseAST(token_head) {}
    ~Block() override = default;
};


// examples:
// void func(int a, float b) { 3 + 1; return; }
// notice:
// no ; at the end
class FunctionDef: public BaseAST {
public:
    TNP Parse() {
        head->type = FunctionDefinition;
        if (data(now_token) != "int" && data(now_token) != "void" && data(now_token) != "float") {
            RaiseError("in FunctionDef, type is not [int] or [float] or [void]", data(now_token));
            return now_token;
        }
        ANP func_type = new ASP_node;
        connect_child(head, func_type);
        func_type->type = FunctionType;
        func_type->data = data(now_token);
        GoNext();
        if (type(now_token) != RNAME) {
            RaiseError("in FunctionDef, function name is not a valid name", data(now_token));
            return now_token;
        }
        ANP func_name = new ASP_node;
        connect_child(head, func_name);
        func_name->type = Identifier;
        func_name->data = data(now_token);
        GoNext();
        if (data(now_token) != "(") {
            RaiseError("in FunctionDef, lost punctuation [(]", data(now_token));
            return now_token;
        }
        GoNext();
        FunctionPara func_para(now_token);
        connect_child(head, func_para.head);
        now_token = func_para.Parse();
        look_ahead = next(now_token);
        if (data(now_token) != ")") {
            RaiseError("in FunctionDef, lost punctuation [)]", data(now_token));
            return now_token;
        }
        GoNext();
        if (data(now_token) != "{") {
            RaiseError("in FunctionDef, lost punctuation [{]", data(now_token));
            return now_token;
        }
        GoNext();
        Block func_block(now_token);
        connect_child(head, func_block.head);
        func_block.head->data = "FunctionBlock";
        now_token = func_block.Parse();
        look_ahead = next(now_token);
        if (data(now_token) != "}") {
            RaiseError("in FunctionDef, lost punctuation [}]", data(now_token));
            return now_token;
        }
        return now_token;
    }
    explicit FunctionDef(TNP token_head): BaseAST(token_head) {}
    ~FunctionDef() override = default;
};


// the program itself
class ProgramAST: public BaseAST {
public:
    TNP Parse() {
        head->type = ProgramBody;
        while (now_token != nullptr) {
            if (data(now_token) == "const") {
                VarDecl var_decl(now_token);
                connect_child(head, var_decl.head);
                now_token = var_decl.Parse();
                look_ahead = next(now_token);
            } else if (data(now_token) == "void") {
                FunctionDef funct_def(now_token);
                connect_child(head, funct_def.head);
                now_token = funct_def.Parse();
                look_ahead = next(now_token);
            } else if (data(now_token) == "int" || data(now_token) == "float") {
                TNP look_next = next(look_ahead);
                if (data(look_next) == "(") {
                    FunctionDef funct_def(now_token);
                    connect_child(head, funct_def.head);
                    now_token = funct_def.Parse();
                    look_ahead = next(now_token);
                } else {
                    VarDecl var_decl(now_token);
                    connect_child(head, var_decl.head);
                    now_token = var_decl.Parse();
                    look_ahead = next(now_token);
                }
            } else {
                RaiseError("in ProgramAST, beginning must be a keyword [int] [float] [void] or [const]",
                           data(now_token));
                break;
            }
        }
        return now_token;
    };
    explicit ProgramAST(TNP token_head): BaseAST(token_head) {}
    ~ProgramAST() override = default;
};