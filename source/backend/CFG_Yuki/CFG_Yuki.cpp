//
// Created by Shirone on 2022/6/13.
//
#include "CFG_Yuki.h"

void CFG::GenerateCFG(IR_PTR irptr) {
    CFGBlock_PTR block= std::make_shared<CFGBlock>(CFGBlock());
    block->entry=*irptr;
    //TODO:Maintain predecessors&successors, distinguishing function call for CFGListNode other than CFGBlocks by Shirone
    for (auto current = irptr; current; current = current->next) {
        if (current->next->ir_type==ir_label||(current->ir_type==ir_forth&&(current->opera=="jump"||current->opera=="jumpn"||current->opera=="jumpe"||current->opera=="call"))) {
            block->exit=*current;
            CFG.push_back(*block);
        }
        else if(current->ir_type==ir_label){
            block=std::make_shared<CFGBlock>(CFGBlock());
            block->index=size++;
            block->entry=*current;
        }
        else{
            block->irs.push_back(*current);
        }
    }
}


