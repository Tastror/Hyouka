//
// Created by Simon on 2022/6/9.
//

#include "BasicBlock.h"

BBList::BBList(const std::shared_ptr<IR_node>& IR_head){
    head = std::make_shared<BBList_node>();
    now_bb = head;
    IR = IR_head;
}

void BBList::set_basic_block_entry(const std::shared_ptr<IR_node>& now_IR){
    IR_PTR now = now_IR;
    BBList_PTR now_bb;
}

void BBList::set_basic_block_middle(const std::shared_ptr<IR_node>& now_IR){
    //TODO
}

void BBList::set_basic_block_exit(const std::shared_ptr<IR_node>& now_IR){
    //TODO
}

void BBList::Generate() {
    if (IR->next == nullptr) return;

    list_generate(IR);
}

void BBList::list_generate(const std::shared_ptr<IR_node>& now_IR){
    IR_PTR now = now_IR->next;
    while (now != nullptr) {
            // first instruction must be basic block entry
        if(now->index == 0){
            BBList::set_basic_block_entry(now);
        }

            // function entry must be basic block entry
        else if (now->ir_type == ir_label){
            BBList::set_basic_block_entry(now);
        }

            // instruction following jump/call must be basic block entry
        else if (now->ir_type == ir_forth && (now->target.name == "jump" || now->target.name == "call")){
            BBList::set_basic_block_entry(now->next);
        }
            //FIXME
        now = now->next;
    }
}