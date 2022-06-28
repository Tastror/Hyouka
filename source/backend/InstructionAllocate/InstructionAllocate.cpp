//
// Created by Tastror on 2022/6/21.
//

#include "InstructionAllocate.h"

#include <iostream>

void InstructionAllocator::Generate() {
    normal_generate();
    static_generate();
}

void InstructionAllocator::normal_generate() {
    for (const auto& it : ir_pro_normal_chain) {
        // is function
        if (it->ir_type == ir_label && it->target.name.at(0) == '@') {
            ARM_code.push_back(it->target.name + ":");
        }
        // is other label or ir_forth
        else {
            // TODO
        }
    }
}

void InstructionAllocator::static_generate() {
    // TODO
}

