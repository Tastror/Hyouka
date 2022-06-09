//
// Created by Simon on 2022/6/2.
//

#include "backend_define.h"
#include <iostream>

void BBList_node::print_all(const std::shared_ptr<BBList_node>& BB_head){
    std::shared_ptr<BBList_node> now = BB_head;
    std::cout << "print BasicBlock" << std::endl;
    return;
}

void CFG_node::print_all(const std::shared_ptr<CFG_node>& CFG_head){
    std::shared_ptr<CFG_node> now = CFG_head;
    std::cout << "print CFG" << std::endl;
    return;
}