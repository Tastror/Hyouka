//
// Created by Tastror on 2022/5/13.
//

#pragma once
#include <string>

enum token_type {
    NONE, KEYWORD, PUNCT, NUMBER, RNAME, OPERAT
};

struct token_node {
    token_type type = NONE;
    std::string data;
    int int_or_double = 0; // 1 is int, 2 is double, 0 is not use
    union int_double {
        int int_value;
        double double_value = 0.0;
    } value;
    token_node* next = nullptr;
};

token_node* next(token_node* now);
std::string data(token_node* node);
token_type type(token_node* now);
bool search_data(token_node* now, const std::string& target, const std::string& end);

enum AST_type {
    None, ProgramBody,

    Number, Identifier, BasicType, FunctionType,

    Expression, FunctionUsage,

    BlockStatement, Statement, KeywordStatement,
    NormalStatement, DeclarationStatement,
    ConstDeclarationStatement, VariableDeclarationStatement,

    SingleAssign, ArrayAssign,
    SingleDefinition, ArrayDefinition,

    FunctionDefinition,
    FunctionParams, FunctionFormParam,
};

const std::string AST_show_type[] = {
        "None", "ProgramBody",
        "Number", "Identifier", "BasicType", "FunctionType",
        "Expression", "FunctionUsage",
        "BlockStatement", "Statement", "KeywordStatement",
        "NormalStatement", "DeclarationStatement",
        "ConstDeclarationStatement", "VariableDeclarationStatement",
        "SingleAssign", "ArrayAssign",
        "SingleDefinition", "ArrayDefinition",
        "FunctionDefinition",
        "FunctionParams", "FunctionFormParam",
};

struct AST_node {
    AST_type type = None;
    std::string data;
    int int_or_double = 0; // 1 is int, 2 is double, 0 is not use
    union int_double {
        int int_value;
        double double_value = 0.0;
    } value;
    AST_node* sister = nullptr;
    AST_node* child = nullptr;
    AST_node* parent = nullptr;
    AST_node* last_child = nullptr;
};

#define TNP token_node*
#define ANP AST_node*
