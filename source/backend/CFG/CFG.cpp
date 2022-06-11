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
    CFG_PTR new_cfg = std::make_shared<CFG_node>();
    now_cfg->successor.push_back(new_cfg);
    now_cfg = new_cfg;
    now_cfg->index = line_num++;
}

void CFG::create_basic_block(const std::shared_ptr<IR_node>& now_IR){
    CFG_PTR new_cfg = std::make_shared<CFG_node>();
    new_cfg->basic_block.push_back(*now_IR);
    new_cfg->entry_ir = *now_IR;
    now_cfg->successor.push_back(new_cfg);
    new_cfg->predecessor.push_back(now_cfg);
    now_cfg = new_cfg;

    auto now = now_IR->next;
    while (now != nullptr && now->ir_type != ir_label){
        now_cfg->basic_block.push_back(*now);
        if(now->opera == "call" || now->opera == "jump"){
            now_cfg->exit_ir = *now;
            find_successor(now);
            break;
        }
        now = now->next;
    }

    if(now->ir_type == ir_label) basic_block_num++;
    now_cfg->index = line_num++;
}

void CFG::find_successor(const std::shared_ptr<IR_node> &now_IR) {
    //TODO
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
            std::cout << now->index << std::endl;
            break;  //debug
        }

            // function entry must be basic block entry
        else if (now->ir_type == ir_label){
            CFG::create_basic_block(now);
            std::cout << now->index << std::endl;
        }

            // instruction following jump/call must be basic block entry
        else if (now->ir_type == ir_forth && (now->opera == "jump" || now->opera == "call")){
            CFG::create_basic_block(now->next);
            std::cout << now->index << std::endl;
        }
        now = now->next;
    }
}