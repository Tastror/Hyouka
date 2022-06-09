//
// Created by Simon on 2022/6/9.
//

#include "BasicBlock.h"

int BBList::line_num = 0;
int BBList::label_num = 0;

BBList::BBList(const std::shared_ptr<IR_node>& IR_head){
    head = std::make_shared<BBList_node>();
    now_bb_list = head;
    IR = IR_head;
}

void BBList::create_empty_bb_list(){
    BBList_PTR new_bb_list = std::make_shared<BBList_node>();
    now_bb_list->next = new_bb_list;
    now_bb_list = new_bb_list;
    now_bb_list->index = line_num++;
}

void BBList::create_basic_block(const std::shared_ptr<IR_node>& now_IR){
    BBList_PTR new_bb_list = std::make_shared<BBList_node>();
    now_bb_list->next = new_bb_list;
    now_bb_list = new_bb_list;
    auto now = now_IR;
    while (now != nullptr && now->ir_type != ir_label){
        now_bb_list->basic_block.push_back(*now);
        if(now->opera == "call" || now->opera == "jump") break;
        now = now->next;
    }
    if(now->ir_type == ir_label) label_num++;
    now_bb_list->index = line_num++;
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
            BBList::create_basic_block(now);
        }

            // function entry must be basic block entry
        else if (now->ir_type == ir_label){
            BBList::create_basic_block(now);
        }

            // instruction following jump/call must be basic block entry
        else if (now->ir_type == ir_forth && (now->opera == "jump" || now->opera == "call")){
            BBList::create_basic_block(now->next);
        }

        now = now->next;
    }
}