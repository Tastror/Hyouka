#pragma once
#include"define.h"
#include<iostream>
#include<string>

token_node *token_head=new token_node();
token_node *token_now=token_head;

bool match_keyword(std::string key){
    token_node* now=new token_node();
    now->type=KEYWORD;
    now->data=key;
    now->int_or_double=0;
    token_now->next=now;
}

int main(){
    char ch;
    std::string str;
    getline(std::cin,str);
    for(int i=0;i<=str.size();i++){

    }
}