//
// Created by Simon on 2022/6/2.
//

#include "backend_define.h"
#include <iostream>

void CFG_node::print() const{

    std::cout << "str predecessor:";
    for (const auto& mem : str_predecessor) {
        std::cout << " " << mem;
    }
    std::cout << std::endl;

    std::cout << "predecessor:";
    for (const auto& mem : predecessor) {
        std::cout << " " << mem;
    }
    std::cout << std::endl;

    std::cout << index << ", " << name << ", " << this << std::endl;

    for (const auto& mem : content) {
        mem->print();
    }

    std::cout << "str successor:";
    for (const auto& mem : str_successor) {
        std::cout << " " << mem;
    }
    std::cout << std::endl;

    std::cout << "successor:";
    for (const auto& mem : successor) {
        std::cout << " " << mem;
    }
    std::cout << std::endl;
}

void CFG_list::print_all(const std::vector<CFG_PTR>& CFG_blocks_chain_){
    for (const auto& mem : CFG_blocks_chain_) {
        mem->print();
        std::cout << std::endl;
    }
}

void CFG_safe::RaiseError(const std::string &error_code) {
    std::cout << "CFG Error: " << error_code << std::endl;
    Safe::GlobalError = true;
}

void CFG_safe::RaiseWarning(const std::string& warning_code) {
    std::cout << "CFG Warning: " << warning_code << std::endl;
}