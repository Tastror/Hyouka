//
// Created by Tastror on 2022/6/21.
//

#include "InstructionAllocate.h"

#include <iostream>

void InstructionAllocator::Generate() {
    normal_generate();      //functions
    static_generate();      //global variable
}

void InstructionAllocator::normal_generate() {

    for (const auto& it : ir_pro_normal_chain) {

        if (it->ir_type == ir_label && it->target.name.at(0) == '@') {
            function_generate(it);
        }
    }
}

void InstructionAllocator::function_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro){

    // entry of function
    function_entry_generate(now_IR_pro);

    // content of function
    for(int i=now_IR_pro->index + 1; i<ir_pro_normal_chain.size(); i++){

        if (ir_pro_normal_chain[i]->ir_type == ir_forth && ir_pro_normal_chain[i]->opera == "call") {
            //call_generate(ir_pro_normal_chain[i]);
        }

        if (ir_pro_normal_chain[i]->ir_type == ir_label && ir_pro_normal_chain[i]->target.name.substr(0,2) == "if") {
            //if_generate(ir_pro_normal_chain[i]);
        }

    // exit of function
        if (ir_pro_normal_chain[i]->ir_type == ir_forth && ir_pro_normal_chain[i]->target.to_string(false) == "$ret") {  //FIXME
            function_exit_generate(ir_pro_normal_chain[i]);

            break;
        }

    }

}

// reg a1-a4 stores params, more params will be stored on stack, which needed to reload using ldr
void InstructionAllocator::function_entry_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro){

    ARM_node now_ARM;

    // only save function name since '@' means comment in ARM,
    // for example: @0_main -> main:
    now_ARM.type = arm_func_label;
    now_ARM.instruction = now_IR_pro->target.name.erase(0,3) + ":";
    ARM_chain.push_back(now_ARM);

    now_ARM.type = arm_ins;
    now_ARM.instruction = "sub     sp, sp, #4";
    ARM_chain.push_back(now_ARM);

    now_ARM.type = arm_ins;
    now_ARM.instruction = "mov     r0, #0";
    ARM_chain.push_back(now_ARM);
}

void InstructionAllocator::function_exit_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro){

    ARM_node now_ARM;

    now_ARM.type = arm_ins;
    now_ARM.instruction = "str     r0, [sp]";
    ARM_chain.push_back(now_ARM);

    if(now_IR_pro->org_2.to_string() != "0"){
        now_ARM.type = arm_ins;
        now_ARM.instruction = "mov     r0, #3";
        ARM_chain.push_back(now_ARM);
    }

    now_ARM.type = arm_ins;
    now_ARM.instruction = "add     sp, sp, #4";
    ARM_chain.push_back(now_ARM);

    now_ARM.type = arm_ins;
    now_ARM.instruction = "bx      lr";
    ARM_chain.push_back(now_ARM);

}

void InstructionAllocator::call_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro){

    // TODO:save context

    // jump to callee
    ARM_node now_ARM;

    now_ARM.type = arm_ins;
    std::string call_string = "b     ";
    now_ARM.instruction = call_string + " " + now_IR_pro->target.name.erase(0,3);
    ARM_chain.push_back(now_ARM);

}

void InstructionAllocator::if_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro){

    ARM_node now_ARM;

    //'.' is added since it means block entry in ARM
    now_ARM.type = arm_func_label;
    now_ARM.instruction = "." + now_IR_pro->target.name + ":";
    ARM_chain.push_back(now_ARM);

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

