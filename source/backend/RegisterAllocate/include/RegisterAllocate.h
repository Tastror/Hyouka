//
// Created by Tastror on 2022/6/21.
//

#pragma once

#include "backend_define.h"

class RegisterAllocator {
public:
    std::vector<CFG_PTR> CFG_blocks_chain;
    std::vector<CFGP_PTR> CFG_pro_blocks_chain;
    explicit RegisterAllocator(const std::vector<CFG_PTR>& CFG_blocks_chain): CFG_blocks_chain(CFG_blocks_chain) {}
    void Generate();
    void init();

private:

};