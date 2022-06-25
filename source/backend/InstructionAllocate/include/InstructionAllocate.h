//
// Created by Tastror on 2022/6/21.
//

#pragma once

#include "backend_define.h"

class InstructionAllocator {
public:
    std::vector<CFGP_PTR> CFG_pro_blocks_chain;
    std::vector<ARM_PTR> ARM_node_chain;

    explicit InstructionAllocator(const std::vector<CFGP_PTR>& CFG_pro_blocks_chain): CFG_pro_blocks_chain(CFG_pro_blocks_chain) {}

    void Generate();

};