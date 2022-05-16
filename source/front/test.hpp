//
// Created by Tastror on 2022/5/13.
//

#pragma once
#include <iostream>
#include "define.h"

token_node* get_token() {
    auto head = new token_node;
    token_node* temp = head;

    /*
     *
     * float test(int a, float x) {
     *     return a + x;
     * }
     *
     * const int k[8][6] = {{5}, {8, 2}, 11};
     *
     * int _abc = 7 + 5 / 3 + 4 * (8 - 2) - k[2 + 3][5] +  (-3 || 4 >= 2) + test(7, 16);
     *
     * int main() {
     *
     *     {}
     *
     *     float x = 0.14 + 3 * 1;
     *
     *     if (x > 3 || x < 2)
     *         x = x - 2;
     *     else if (x <= 3.5)
     *         x = x + 1;
     *     else { ; }
     *
     *     while (x < 20) {
     *         x = x + 3;
     *     }
     *
     *     return 0;
     * }
     */


    { auto n = new token_node; n->type = KEYWORD; n->data = "float"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = RNAME; n->data = "test"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = "("; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = KEYWORD; n->data = "int"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = RNAME; n->data = "a"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = ","; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = KEYWORD; n->data = "float"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = RNAME; n->data = "x"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = ")"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = "{"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = KEYWORD; n->data = "return"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = RNAME; n->data = "a"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "+"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = RNAME; n->data = "x"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = ";"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = "}"; temp->next = n; temp = n; }


    { auto n = new token_node; n->type = KEYWORD; n->data = "int"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = RNAME; n->data = "k"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "["; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = NUMBER; n->data = "6"; n->int_or_double = 1; n->value.int_value = 2; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "]"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "["; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = NUMBER; n->data = "8"; n->int_or_double = 1; n->value.int_value = 2; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "]"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "="; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = "{"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = "{"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = NUMBER; n->data = "5"; n->int_or_double = 1; n->value.int_value = 5; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = "}"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = ","; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = "{"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = NUMBER; n->data = "8"; n->int_or_double = 1; n->value.int_value = 8; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = ","; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = NUMBER; n->data = "2"; n->int_or_double = 1; n->value.int_value = 2; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = "}"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = ","; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = NUMBER; n->data = "11"; n->int_or_double = 1; n->value.int_value = 11; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = "}"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = ";"; temp->next = n; temp = n; }

    { auto n = new token_node; n->type = KEYWORD; n->data = "const"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = KEYWORD; n->data = "int"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = RNAME; n->data = "_abc"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "="; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = NUMBER; n->data = "7"; n->int_or_double = 1; n->value.int_value = 7; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "+"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = NUMBER; n->data = "5"; n->int_or_double = 1; n->value.int_value = 5; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "/"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = NUMBER; n->data = "3"; n->int_or_double = 1; n->value.int_value = 3; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "+"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = NUMBER; n->data = "4"; n->int_or_double = 1; n->value.int_value = 4; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "*"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "("; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = NUMBER; n->data = "8"; n->int_or_double = 1; n->value.int_value = 8; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "-"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = NUMBER; n->data = "2"; n->int_or_double = 1; n->value.int_value = 2; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = ")"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "-"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = RNAME; n->data = "k"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "["; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = NUMBER; n->data = "2"; n->int_or_double = 1; n->value.int_value = 2; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "+"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = NUMBER; n->data = "3"; n->int_or_double = 1; n->value.int_value = 3; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "]"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "["; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = NUMBER; n->data = "5"; n->int_or_double = 1; n->value.int_value = 5; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "]"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "+"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "("; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "-"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = NUMBER; n->data = "3"; n->int_or_double = 1; n->value.int_value = 3; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "||"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = NUMBER; n->data = "4"; n->int_or_double = 1; n->value.int_value = 4; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = ">="; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = NUMBER; n->data = "2"; n->int_or_double = 1; n->value.int_value = 2; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = ")"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "+"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = RNAME; n->data = "test"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "("; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = NUMBER; n->data = "7"; n->int_or_double = 1; n->value.int_value = 7; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "-"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = NUMBER; n->data = "4"; n->int_or_double = 1; n->value.int_value = 4; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = ","; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = NUMBER; n->data = "16"; n->int_or_double = 1; n->value.int_value = 16; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = ")"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = ";"; temp->next = n; temp = n; }


    { auto n = new token_node; n->type = KEYWORD; n->data = "int"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = RNAME; n->data = "main"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = "("; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = ")"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = "{"; temp->next = n; temp = n; }

    { auto n = new token_node; n->type = PUNCT; n->data = "{"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = "}"; temp->next = n; temp = n; }

    { auto n = new token_node; n->type = KEYWORD; n->data = "float"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = RNAME; n->data = "x"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "="; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = NUMBER; n->data = "0.14"; n->int_or_double = 2; n->value.double_value = 0.14; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "+"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = NUMBER; n->data = "3"; n->int_or_double = 1; n->value.int_value = 3; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = ";"; temp->next = n; temp = n; }

    { auto n = new token_node; n->type = KEYWORD; n->data = "if"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = "("; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = RNAME; n->data = "x"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "<"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = NUMBER; n->data = "3"; n->int_or_double = 1; n->value.int_value = 3; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "||"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = RNAME; n->data = "x"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = ">"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = NUMBER; n->data = "4"; n->int_or_double = 1; n->value.int_value = 3; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = ")"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = RNAME; n->data = "x"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "="; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = RNAME; n->data = "x"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "-"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = NUMBER; n->data = "2"; n->int_or_double = 1; n->value.int_value = 2; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = ";"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = KEYWORD; n->data = "else"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = KEYWORD; n->data = "if"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = "("; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = RNAME; n->data = "x"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "<"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = NUMBER; n->data = "3.5"; n->int_or_double = 2; n->value.double_value = 3.5; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = ")"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = RNAME; n->data = "x"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "="; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = RNAME; n->data = "x"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "+"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = NUMBER; n->data = "1"; n->int_or_double = 1; n->value.int_value = 1; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = ";"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = KEYWORD; n->data = "else"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = "{"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = ";"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = "}"; temp->next = n; temp = n; }

    { auto n = new token_node; n->type = KEYWORD; n->data = "while"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = "("; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = RNAME; n->data = "x"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "<"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = NUMBER; n->data = "20"; n->int_or_double = 1; n->value.int_value = 20; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = ")"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = "{"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = RNAME; n->data = "x"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "="; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = RNAME; n->data = "x"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = OPERAT; n->data = "+"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = NUMBER; n->data = "3"; n->int_or_double = 1; n->value.int_value = 3; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = ";"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = "}"; temp->next = n; temp = n; }

    { auto n = new token_node; n->type = KEYWORD; n->data = "return"; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = NUMBER; n->data = "0"; n->int_or_double = 1; n->value.int_value = 0; temp->next = n; temp = n; }
    { auto n = new token_node; n->type = PUNCT; n->data = ";"; temp->next = n; temp = n; }

    { auto n = new token_node; n->type = PUNCT; n->data = "}"; temp->next = n; temp = n; }


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