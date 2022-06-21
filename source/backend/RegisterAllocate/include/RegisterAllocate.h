//
// Created by Tastror on 2022/6/21.
//

#pragma once

#include "backend_define.h"

class RegisterAllocator {
public:
    std::vector<CFG_PTR> CFG_blocks_chain;
    RegisterAllocator(const std::vector<CFG_PTR>& CFG_blocks_chain): CFG_blocks_chain(CFG_blocks_chain) {}
    void Generate();

private:

};