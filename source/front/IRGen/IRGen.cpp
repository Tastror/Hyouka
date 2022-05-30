//
// Created by Tastror on 2022/5/29.
//

#include "IRGen.h"

IRGen::IRGen(const std::shared_ptr<AST_node>& AST_head) {
    head = std::make_shared<IR_node>();
    now_ir = head;
    AST = AST_head;
}

void IRGen::Generate() {
    re_Generate(AST);
}

void IRGen::re_Generate(const std::shared_ptr<AST_node>& now_AST) {
    if (now_AST == nullptr) return;
    // to do something
    re_Generate(now_AST->child);
    re_Generate(now_AST->sister);
}