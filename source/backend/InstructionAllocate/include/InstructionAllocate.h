//
// Created by Tastror on 2022/6/21.
//

#pragma once

#include "backend_define.h"

class InstructionAllocator {
public:
    std::vector<CFGP_PTR> CFG_pro_blocks_chain;
    std::vector<ARM_PTR> assembly_code_chain;

    void Generate();

};