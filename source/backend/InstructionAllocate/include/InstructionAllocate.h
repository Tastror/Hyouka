//
// Created by Tastror on 2022/6/21.
//

#pragma once

#include "backend_define.h"

class InstructionAllocator {
public:

    std::vector<CFG_pro_PTR> CFG_pro_blocks_chain;
    std::vector<ARM_PTR> ARM_node_chain;
    explicit InstructionAllocator(const std::map<std::string, std::vector<CFG_pro_PTR>>& CFG_pro_function_chain) {}
    void Generate();
};