//
// Created by Simon on 2022/6/2.
//

#include "CFG.h"

BB::BB(const std::shared_ptr<IR_node>& IR_head) {
    head = std::make_shared<BB_node>();
    now_bb = head;
    IR = IR_head;
}

CFG::CFG(const std::shared_ptr<BB_node>& BB_head) {
    head = std::make_shared<CFG_node>();
    now_cfg = head;
    BB = BB_head;
}

void BB::Generate() {
    if (IR->next == nullptr) return;
    return;
    basic_generate(IR);
}

void CFG::Generate() {
    if (BB->next == nullptr) return;
    return;
    entry_generate(BB);
    basic_generate(BB);
    exit_generate(BB);
}