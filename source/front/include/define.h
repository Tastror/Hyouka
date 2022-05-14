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

enum ASP_type {
    None,
    ProgramBody,
    IncludeSharp,
    Identifier,
    FunctionDefinition, FunctionType, FunctionParams, FunctionArguments,
    ConstDeclaration, VariableDeclaration, ConstDefinition, VariableDefinition, BasicType,
    Number
};

struct ASP_node {
    ASP_type type = None;
    std::string data;
    ASP_node* sister = nullptr;
    ASP_node* child = nullptr;
    ASP_node* parent = nullptr;
    ASP_node* last_child = nullptr;
};

#define TNP token_node*
#define ANP ASP_node*
