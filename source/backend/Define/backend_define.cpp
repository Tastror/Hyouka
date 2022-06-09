//
// Created by Simon on 2022/6/2.
//

#include "backend_define.h"
#include <iostream>

void CFG_node::print_all(const std::shared_ptr<CFG_node>& CFG_head){
    std::shared_ptr<CFG_node> now = CFG_head;
    if(now != nullptr){
        std::cout << "print CFG" << std::endl;
    }
    return;
}