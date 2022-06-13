//
// Created by Simon on 2022/6/2.
//

#include "backend_define.h"
#include <iostream>

void CFG_node::print() const{

    std::cout << name << ", " << this << std::endl;

    for (const auto& mem : block_content) {
        mem.print();
    }

    std::cout << "predecessor:";
    for (const auto& mem : predecessor) {
        std::cout << " " << mem;
    }

    std::cout << "successor:" << std::endl;
    for (const auto& mem : successor) {
        std::cout << " " << mem;
    }
}

void CFG_List::print_all(const std::vector<CFG_node>& CFG_blocks_chain_){
    for (const auto& mem : CFG_blocks_chain_) {
        mem.print();
    }
}