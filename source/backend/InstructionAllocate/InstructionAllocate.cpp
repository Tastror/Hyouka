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
            function_generate(it);
        }
    }
}

void InstructionAllocator::function_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro){

    //'@' is deleted since it means comment in ARM
    now_IR_pro->target.name = now_IR_pro->target.name.erase(0,1);
    ARM_code.push_back(now_IR_pro->target.name + ":");
    //auto now_IR_pro = std::make_shared<IR_node_pro>();
    //now_IR_pro = now_IR_pro->next;

    IR_pro_PTR it =now_IR_pro;
    while (it != nullptr) {
        // is block
        if (it->ir_type == ir_label && it->target.name.substr(0,2) == "if") {
            if_generate(it);
        }
        // end of function
        if (it->ir_type == ir_label && it->target.name.at(0) == '@') {
            break;
        }

        //it = it->next;      //FIXME
    }
}

void InstructionAllocator::if_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro){
    //TODO
}

void InstructionAllocator::while_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro){
    //TODO
}

void InstructionAllocator::break_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro){
    //TODO
}

void InstructionAllocator::continue_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro){
    //TODO
}

void InstructionAllocator::static_generate() {
    // TODO
}

