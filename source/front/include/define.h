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

token_node* next(token_node* now) {
    if (now != nullptr)
        return now->next;
    return nullptr;
}

std::string data(token_node* node) {
    if (node != nullptr)
        return node->data;
    return "";
}

token_type type(token_node* now) {
    if (now != nullptr)
        return now->type;
    return NONE;
}

enum ASP_type {
    None,
    ProgramBody,

    Number, ValueCalculate,

    Identifier, BasicType, FunctionType,

    NormalStatement, BlockStatement,

    VariableAssign, SingleAssign, ArrayAssign,

    SingleDefinition, ArrayDefinition,
    ConstDeclaration, VariableDeclaration,

    FunctionParams, FunctionArguments,
    FunctionDefinition,
};

std::string ASP_show_type[] = {
    "None",
    "ProgramBody",
    "Number", "ValueCalculate",
    "Identifier", "BasicType", "FunctionType",
    "NormalStatement", "BlockStatement",
    "VariableAssign", "SingleAssign", "ArrayAssign",
    "SingleDefinition", "ArrayDefinition",
    "ConstDeclaration", "VariableDeclaration",
    "FunctionParams", "FunctionArguments",
    "FunctionDefinition",

};

struct ASP_node {
    ASP_type type = None;
    std::string data;
    int int_or_double = 0; // 1 is int, 2 is double, 0 is not use
    union int_double {
        int int_value;
        double double_value = 0.0;
    } value;
    ASP_node* sister = nullptr;
    ASP_node* child = nullptr;
    ASP_node* parent = nullptr;
    ASP_node* last_child = nullptr;
};

#define TNP token_node*
#define ANP ASP_node*
