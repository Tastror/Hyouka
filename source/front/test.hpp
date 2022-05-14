//
// Created by Tastror on 2022/5/13.
//

#pragma once
#include <iostream>
#include "include/define.h"

token_node* get_token() {
    auto head = new token_node;
    token_node* temp = head;

    /*
     * int _abc = 7 * 2;
     *
     * int main() {
     *     {}
     *     const float x = 0.14 + 3;
     *     return 0;
     * }
     */

    { auto n = new token_node;
        n->type = (token_type) KEYWORD;
        n->data = "int";
        temp->next = n;
        temp = n; }

    { auto n = new token_node;
        n->type = (token_type) RNAME;
        n->data = "_abc";
        temp->next = n;
        temp = n; }

    { auto n = new token_node;
        n->type = (token_type) OPERAT;
        n->data = "=";
        temp->next = n;
        temp = n; }

    { auto n = new token_node;
        n->type = (token_type) NUMBER;
        n->data = "7";
        temp->next = n;
        temp = n; }

    { auto n = new token_node;
        n->type = (token_type) OPERAT;
        n->data = "*";
        temp->next = n;
        temp = n; }

    { auto n = new token_node;
        n->type = (token_type) NUMBER;
        n->data = "2";
        temp->next = n;
        temp = n; }

    { auto n = new token_node;
        n->type = (token_type) PUNCT;
        n->data = ";";
        temp->next = n;
        temp = n; }

    { auto n = new token_node;
        n->type = (token_type) KEYWORD;
        n->data = "int";
        temp->next = n;
        temp = n; }

    { auto n = new token_node;
        n->type = (token_type) RNAME;
        n->data = "main";
        temp->next = n;
        temp = n; }

    { auto n = new token_node;
        n->type = (token_type) PUNCT;
        n->data = "(";
        temp->next = n;
        temp = n; }

    { auto n = new token_node;
        n->type = (token_type) PUNCT;
        n->data = ")";
        temp->next = n;
        temp = n; }

    { auto n = new token_node;
        n->type = (token_type) PUNCT;
        n->data = "{";
        temp->next = n;
        temp = n; }

    { auto n = new token_node;
        n->type = (token_type) PUNCT;
        n->data = "{";
        temp->next = n;
        temp = n; }

    { auto n = new token_node;
        n->type = (token_type) PUNCT;
        n->data = "}";
        temp->next = n;
        temp = n; }

    { auto n = new token_node;
        n->type = (token_type) KEYWORD;
        n->data = "const";
        temp->next = n;
        temp = n; }

    { auto n = new token_node;
        n->type = (token_type) KEYWORD;
        n->data = "float";
        temp->next = n;
        temp = n; }

    { auto n = new token_node;
        n->type = (token_type) RNAME;
        n->data = "x";
        temp->next = n;
        temp = n; }

    { auto n = new token_node;
        n->type = (token_type) OPERAT;
        n->data = "=";
        temp->next = n;
        temp = n; }

    { auto n = new token_node;
        n->type = (token_type) NUMBER;
        n->data = "0.14";
        n->int_or_double = 2;
        n->value.double_value = 0.14;
        temp->next = n;
        temp = n; }

    { auto n = new token_node;
        n->type = (token_type) OPERAT;
        n->data = "+";
        temp->next = n;
        temp = n; }

    { auto n = new token_node;
        n->type = (token_type) NUMBER;
        n->data = "3";
        temp->next = n;
        temp = n; }

    { auto n = new token_node;
        n->type = (token_type) PUNCT;
        n->data = ";";
        temp->next = n;
        temp = n; }

    { auto n = new token_node;
        n->type = (token_type) KEYWORD;
        n->data = "return";
        temp->next = n;
        temp = n; }

    { auto n = new token_node;
        n->type = (token_type) NUMBER;
        n->data = "0";
        temp->next = n;
        temp = n; }

    { auto n = new token_node;
        n->type = (token_type) PUNCT;
        n->data = ";";
        temp->next = n;
        temp = n; }

    { auto n = new token_node;
        n->type = (token_type) PUNCT;
        n->data = "}";
        temp->next = n;
        temp = n; }

    temp->next = nullptr;
    return head;
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

void delete_all_tokens(token_node* head) {
    auto now = head;
    while (now != nullptr) {
        auto temp = now;
        now = now->next;
        delete temp;
    }
}