//
// Created by Simon on 2022/6/2.
//

#include "CFG.h"

CFG::CFG(const std::shared_ptr<BBList_node>& BB_head) {
    head = std::make_shared<CFG_node>();
    now_cfg = head;
    BB = BB_head;
}

void CFG::Generate() {
    if (BB->next == nullptr) return;
    return;
    entry_generate(BB);
    basic_generate(BB);
    exit_generate(BB);
}