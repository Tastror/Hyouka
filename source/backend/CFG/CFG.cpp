//
// Created by Simon on 2022/6/2.
//

#include "CFG.h"

CFG::CFG(const std::shared_ptr<IR_node>& IR_head) {
    this->IR_head = IR_head;
    basic_block_num = 0;
}

void CFG::Generate() {
    init();
    for (const auto& i : IR_chain) {

    }
}

void CFG::init() {
    IR_PTR temp = IR_head;
    int i = 0;
    while (temp != nullptr) {
        IR_chain.push_back(temp);
        if (temp->ir_type == ir_label) {
            auto map_member = std::make_pair(temp->target.name, i);
            IR_maps.insert(map_member);
        }
        temp = temp->next;
        ++i;
    }
}

void CFG::create_new_block() {
    basic_block_num++;
    now_dealt_with = std::make_shared<CFG_node>();
    now_dealt_with->index = basic_block_num;
    CFG_blocks_chain.push_back(now_dealt_with);
}