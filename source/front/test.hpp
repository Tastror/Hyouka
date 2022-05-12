//
// Created by Tastror on 2022/5/13.
//

#include "include/define.h"

token_node* get_token() {
    auto head = (TNP)malloc(sizeof(token_node));
    token_node* temp = head;

    { auto n = (TNP)malloc(sizeof(token_node));
        n->type = (token_type) ident;
        n->data = "int";
        temp->next = n;
        temp = n; }

    { auto n = (TNP)malloc(sizeof(token_node));
        n->type = (token_type) rname;
        n->data = "main";
        temp->next = n;
        temp = n; }

    { auto n = (TNP)malloc(sizeof(token_node));
        n->type = (token_type) punct;
        n->data = "(";
        temp->next = n;
        temp = n; }

    { auto n = (TNP)malloc(sizeof(token_node));
        n->type = (token_type) punct;
        n->data = ")";
        temp->next = n;
        temp = n; }

    { auto n = (TNP)malloc(sizeof(token_node));
        n->type = (token_type) punct;
        n->data = "{";
        temp->next = n;
        temp = n; }

    { auto n = (TNP)malloc(sizeof(token_node));
        n->type = (token_type) ident;
        n->data = "const";
        temp->next = n;
        temp = n; }

    { auto n = (TNP)malloc(sizeof(token_node));
        n->type = (token_type) ident;
        n->data = "float";
        temp->next = n;
        temp = n; }

    temp->next = nullptr;
    return head;
}

void print_all_tokens(token_node* head) {
    token_node* now = head;
    if (now != nullptr) {
        now = now->next;
    }
    while (now != nullptr) {
        std::cout << now->type << ", " << now->data << "\n";
        now = now->next;
    }
}

void delete_all_tokens(token_node* head) {
    token_node* now = head;
    while (now != nullptr) {
        token_node* temp = now;
        now = now->next;
        free(temp);
    }
}