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
        // entry of function
        if (it->ir_type == ir_label && it->target.name.at(0) == '@') {
            function_generate(it);
        }
    }
}

void InstructionAllocator::function_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro){

    //'@' is deleted since it means comment in ARM
    auto function_entry = now_IR_pro->target.name.erase(0,1) + ":";
    ARM_code.push_back(function_entry);

    for(int i=now_IR_pro->index + 1; i<ir_pro_normal_chain.size(); i++){
        if (ir_pro_normal_chain[i]->ir_type == ir_label && ir_pro_normal_chain[i]->target.name.substr(0,2) == "if") {
            if_generate(ir_pro_normal_chain[i]);

        }
        // exit of function
        if (ir_pro_normal_chain[i]->ir_type == ir_label && ir_pro_normal_chain[i]->target.name.at(0) == '@') {
            break;
        }
    }


}

void InstructionAllocator::if_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro){

    //'.' is added since it means block entry in ARM
    auto if_entry = "." + now_IR_pro->target.name + ":";
    ARM_code.push_back(if_entry);

    for(int i=now_IR_pro->index + 1; i<ir_pro_normal_chain.size(); i++){

        //TODO

        // exit of if
        if (ir_pro_normal_chain[i]->ir_type == ir_label) {
            break;
        }
    }
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

