//
// Created by Tastror on 2022/5/14.
//

//
// Created by Tastror on 2022/5/13.
//

#include "define.h"

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