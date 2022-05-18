#pragma once
#include"define.h"
#include<iostream>
#include<string>

bool match_if(){
    token_node* now=new token_node();
    now->type=KEYWORD;
    now->data="if";
    now->int_or_double=0;
}
bool match_else(){
    token_node* now=new token_node();
    now->type=KEYWORD;
    now->data="else";
    now->int_or_double=0;
}
bool match_while(){
    token_node* now=new token_node();
    now->type=KEYWORD;
    now->data="while";
    now->int_or_double=0;
}
bool match_for(){
    token_node* now=new token_node();
    now->type=KEYWORD;
    now->data="for";
    now->int_or_double=0;
}

int main(){
    char ch;
    std::string str;
    getline(std::cin,str);
    for(int i=0;i<=str.size();i++){

    }
}