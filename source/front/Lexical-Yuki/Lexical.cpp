#pragma once
#include"define.h"
#include<iostream>
#include<string>

using namespace std;

token_node *token_head=new token_node();
token_node *token_now=token_head;

/* bool match_keyword(std::string key){
    token_node* now=new token_node();
    now->type=KEYWORD;
    now->data=key;
    now->int_or_double=0;
    token_now->next=now;
}
 */
token_node *token_head=new token_node();
token_node *token_now=token_head;

void keyword(char *name){
    token_node* now=new token_node();
    now->type=KEYWORD;
    now->data=string(name);
    now->int_or_double=0;
    token_now->next=now;
}

void operat(char *name){
    token_node* now=new token_node();
    now->type=OPERAT;
    now->data=string(name);
    now->int_or_double=0;
    token_now->next=now;
}

void id(char *name){
    token_node* now=new token_node();
    now->type=RNAME;
    now->data=string(name);
    now->int_or_double=0;
    token_now->next=now;
} 

void number(char *name){
    token_node* now=new token_node();
    now->type=NUMBER;
    now->data=string(name);
    now->int_or_double=0;
    token_now->next=now;
}

void floating(char *name){
    token_node* now=new token_node();
    now->type=NUMBER;
    now->data=stod(string(name));
    now->int_or_double=2;
    token_now->next=now;
}

void integer(char *name){
    token_node* now=new token_node();
    now->type=NUMBER;
    now->data=stoi(string(name));
    now->int_or_double=1;
    token_now->next=now;
}
int main(){
    char ch;
    std::string str;
    getline(std::cin,str);
    for(int i=0;i<=str.size();i++){

    }
}