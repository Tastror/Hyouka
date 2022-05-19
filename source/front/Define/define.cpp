//
// Created by Tastror on 2022/5/13.
//

#include "define.h"
#include <iostream>



// Lexical

std::shared_ptr<token_node> next(const std::shared_ptr<token_node>& now) {
    if (now != nullptr)
        return now->next;
    return nullptr;
}

std::string data(const std::shared_ptr<token_node>& node) {
    if (node != nullptr)
        return node->data;
    return "";
}

token_type type(const std::shared_ptr<token_node>& now) {
    if (now != nullptr)
        return now->type;
    return NONE;
}

// only use in assign
bool search_data(std::shared_ptr<token_node> now, const std::string& target, const std::string& end) {
    while (now != nullptr) {
        if (data(now) == target)
            return true;
        if (data(now) == end)
            return false;
        now = next(now);
    }
    return false;
}

void print_all_tokens(const std::shared_ptr<token_node>& head) {
    std::shared_ptr<token_node> now(head);
    if (now != nullptr)
        now = now->next;
    while (now != nullptr) {
        std::cout << now->type << ", " << now->data << "\n";
        now = now->next;
    }
}



// Parsing

void print_all_ASTs(const ANP& now, int stage) {
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
    print_all_ASTs(now->child, stage + 1);
    print_all_ASTs(now->sister, stage);
}

void print_all_ASTs(const ANP& AST_head) {
    print_all_ASTs(AST_head, 0);
}



// Symbol Table

void print_symtable(const SNP& symtable_node_head) {
    SNP now = symtable_node_head;
    while (now != nullptr) {
        if (now->is_head) {
            std::cout << "[head] name: " << now->identifier_name << ", only_name: " << now->only_name;
            if (now->id_type != _id_none_) std::cout << ", type: " << sym_id_show_type[now->id_type];
            if (now->value_type != _value_none_) std::cout << ", value_type: " << sym_return_show_type[now->value_type];
            if (now->id_type == _function_) std::cout << ", arg_num: " << now->arg_num;
            if (now->is_const) std::cout << ", is_const";
            if (now->is_static) std::cout << ", is_static";
            std::cout << std::endl;
        } else {
            std::cout << "name: " << now->identifier_name << ", only_name: " << now->only_name;
            if (now->id_type != _id_none_) std::cout << ", type: " << sym_id_show_type[now->id_type];
            if (now->value_type != _value_none_) std::cout << ", value_type: " << sym_return_show_type[now->value_type];
            if (now->id_type == _function_) std::cout << ", arg_num: " << now->arg_num;
            if (now->is_const) std::cout << ", is_const";
            if (now->is_static) std::cout << ", is_static";
            std::cout << std::endl;
        }
        now = now->next;
    }
}

void symtable_node::rename() {
    std::string name_pre = std::to_string(table_id);
    only_name = "__" + name_pre + "_" + identifier_name;
}

void symtable_node::rename(const std::string& name) {
    identifier_name = name;
    std::string name_pre = std::to_string(table_id);
    only_name = "__" + name_pre + "_" + identifier_name;
}
