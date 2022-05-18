//
// Created by Tastror on 2022/5/13.
//

#include "define.h"
#include <iostream>



// Lexical

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

// only use in assign
bool search_data(token_node* now, const std::string& target, const std::string& end) {
    while (now != nullptr) {
        if (data(now) == target)
            return true;
        if (data(now) == end)
            return false;
        now = next(now);
    }
    return false;
}

void print_all_tokens(token_node* head) {
    auto now = head;
    if (now != nullptr)
        now = now->next;
    while (now != nullptr) {
        std::cout << now->type << ", " << now->data << "\n";
        now = now->next;
    }
}



// Parsing

void _print_all_ASTs(ANP now, int stage) {
    if (now == nullptr) return;
    for (int i = 0; i < stage; ++i)
        std::cout << "    ";
    std::cout << AST_show_type[now->type];
    if (now->type == Number) {
        std::cout  << ", ";
        if (now->int_or_double == 1) {
            std::cout  << "int: " << now->value.int_value;
        } else if (now->int_or_double == 2) {
            std::cout  << "float: " << now->value.double_value;
        } else {
            std::cout << "data: " << now->data;
        }
    }
    else
        std::cout << (now->data.empty() ? "" : ", " + now->data);
    std::cout << std::endl;
    _print_all_ASTs(now->child, stage + 1);
    _print_all_ASTs(now->sister, stage);
}

void print_all_ASTs(ANP AST_head) {
    _print_all_ASTs(AST_head, 0);
}



// Symbol Table

int symtable_node::count = 0;

void print_symtable(SNP symtable_node_head) {
    SNP now = symtable_node_head;
    while (now != nullptr) {
        std::cout << "name: " << now->identifier_name
                  << ", only_name: " << now->only_name
                  << ", type: " << sym_id_show_type[now->id_type]
                  << ", return_type: " << sym_return_show_type[now->return_type]
                  << ", arg_num: " << now->arg_num
                  << ", is_const: " << now->is_const
                  << ", is_static: " << now->is_static << std::endl;
        now = now->next;
    }
}

void symtable_node::update_only_name() {
    std::string name_pre = std::to_string(symtable_node::count);
    only_name = "__" + name_pre + "_" + identifier_name;
}