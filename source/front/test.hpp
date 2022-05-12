//
// Created by Tastror on 2022/5/13.
//

#include "include/define.h"

token_node* get_token() {
    auto head = new token_node;
    token_node* temp = head;

    { auto n = new token_node;
        n->type = (token_type) IDENT;
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
        n->type = (token_type) IDENT;
        n->data = "const";
        temp->next = n;
        temp = n; }

    { auto n = new token_node;
        n->type = (token_type) IDENT;
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
        n->type = (token_type) IDENT;
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