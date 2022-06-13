//
// Created by Shirone on 2022/6/13.
//
#include "CFG_Yuki.h"

int CFGBlock::index=0;
int CFGListNode::index=0;

std::map<IR_node,int> labels;

void CFGList::GenerateCFGBlockList(IR_PTR irptr) {
    CFGListNode_PTR listNode=std::make_shared<CFGListNode>(CFGListNode());
    IR_PTR irptrnew;
    while(true){
        if(irptr){
            irptrnew=listNode->GenerateCFGBlock(irptr);
            CFGNodes.push_back(*listNode);
            listNode=std::make_shared<CFGListNode>(CFGListNode());
            irptr=irptrnew;
        }
        else return;
    }
}

IR_PTR CFGListNode::GenerateCFGBlock(IR_PTR irptr) {
    CFGBlock_PTR block= std::make_shared<CFGBlock>(CFGBlock());
    block->entry=*irptr;
    if(irptr==nullptr)
        return nullptr;
    //TODO:Maintain predecessors&successors, distinguishing function call for CFGListNode other than CFGBlocks by Shirone
    for (auto current = irptr; current; current = current->next) {
        if(current->next->ir_type==ir_label||(!current)){
            block->exit=*current;
            CFGBlocks.push_back(*block);
            return current;
        }
        else if ((current->ir_type==ir_forth&&(current->opera=="jump"||current->opera=="jumpn"||current->opera=="jumpe"||current->opera=="call"))) {
            block->exit=*current;
            CFGBlocks.push_back(*block);
        }
        else if(current->ir_type==ir_label){
            block=std::make_shared<CFGBlock>(CFGBlock());
            block->entry=*current;
        }
        else{
            block->irs.push_back(*current);
        }
    }
    return nullptr;
}

void CFGListNode::print_all() {
    std::cout<<"ListNode#"<<index<<std::endl;
    for(auto i:CFGBlocks){
        i.print_all();
        std::cout<<std::endl;
    }
}
void CFGList::print_all(){
    for(auto i:CFGNodes){
        i.print_all();
        std::cout<<std::endl;
    }
}


