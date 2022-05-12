//
// Created by Tastror on 2022/5/11.
//
#include "include/define.h"

class BaseAST {
public:
    BaseAST() = default;
    virtual ~BaseAST() = default;
};

class ProgramAST: public BaseAST {
public:
    ANP head;
    TNP now_token;
    TNP look_ahead;
    void Parse() {
        head->type = ProgramBody;
    };
    ProgramAST(TNP token_head) {
        head = new ASP_node;
        now_token = token_head;
        look_ahead = nullptr;
        if (now_token != nullptr)
            look_ahead = now_token->next;
    }
    ~ProgramAST() override { delete head; } ;
};

class FunctionAST: public BaseAST {
public:
    ~FunctionAST() override = default;
};

class SentenceAST: public BaseAST {
public:
    ~SentenceAST() override = default;
};