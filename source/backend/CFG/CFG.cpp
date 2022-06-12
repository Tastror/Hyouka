//
// Created by Simon on 2022/6/2.
//

#include "CFG.h"

#include <iostream>

int CFG::line_num = 0;
int CFG::basic_block_num = 0;

CFG::CFG(const std::shared_ptr<IR_node>& IR_head){
    head = std::make_shared<CFG_node>();
    now_cfg = head;
    IR = IR_head;
}

void CFG::create_empty_cfg(){

}

void CFG::create_basic_block(const std::shared_ptr<IR_node>& now_IR){

}

IR_node CFG::find_successor(const std::shared_ptr<IR_node> &target_IR) {

    auto now = IR->next;
    while (now != nullptr){
        if(target_IR->target.name == now->target.name)
            return *now;
        now = now->next;
    }
    //TODO: What if not found?
}

bool CFG::is_exist_basic_block(const std::shared_ptr<IR_node>& target_IR){

}

void CFG::Generate() {
    if (IR->next == nullptr) return;
    cfg_generate(IR);
}

void CFG::cfg_generate(const std::shared_ptr<IR_node>& now_IR){

    IR_PTR now = now_IR->next;
    while (now != nullptr) {
            // first instruction must be basic block entry
        if(now->index == 0){
            CFG::create_basic_block(now);
            break;  //debug
        }

            // function entry must be basic block entry
        else if (now->ir_type == ir_label){
            CFG::create_basic_block(now);
        }

            // instruction following jump/call must be basic block entry
        else if (now->ir_type == ir_forth && (now->opera == "jump" || now->opera == "call")){
            CFG::create_basic_block(now->next);
        }
        now = now->next;
    }
}

int CFG_LIST::cfg_num = 0;

CFG_LIST::CFG_LIST(const std::shared_ptr<CFG_List_node>& CFG_head){

}

void CFG_LIST::create_empty_cfg_list(){

}

void CFG_LIST::create_cfg(const std::shared_ptr<CFG_List_node>& now_CFG){

}

void CFG_LIST::Generate(){

}

void CFG_LIST::cfg_list_generate(const std::shared_ptr<CFG_List_node>& now_CFG){

}