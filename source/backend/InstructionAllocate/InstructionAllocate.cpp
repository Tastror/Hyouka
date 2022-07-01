//
// Created by Tastror on 2022/6/21.
//

#include "InstructionAllocate.h"

#include <iostream>

void InstructionAllocator::Generate() {
    normal_generate();      //functions
    static_generate();      //global variable
}

void InstructionAllocator::static_generate() {

    for (const auto& it : ir_static_chain) {

        if (it->ir_type != ir_label) {
            global_generate(it);
        }
    }
}

void InstructionAllocator::normal_generate() {

    for (const auto& it : ir_pro_normal_chain) {

        if (it->ir_type == ir_label && it->target.name.at(0) == '@') {
            function_generate(it);
        }
    }
}

void InstructionAllocator::global_generate(const std::shared_ptr<IR_node>& now_IR) {

    ARM_node now_ARM;
    if(now_IR->opera == "assign"){

        now_ARM.type = arm_global_label;
        now_ARM.instruction = now_IR->target.name.erase(0,3) + ":";
        ARM_chain.push_back(now_ARM);

        now_ARM.type = arm_ins;
        if(now_IR->org_1.IVTT.self_type().represent_type == basic_int)
            now_ARM.instruction = ".word    "
                    + std::to_string(now_IR->org_1.IVTT.self_get_int_value());
        else
            now_ARM.instruction = ".word    "
                    + std::to_string(now_IR->org_1.IVTT.self_get_float_value());
        ARM_chain.push_back(now_ARM);
    }
    else{
        now_ARM.type = arm_global_label;
        now_ARM.instruction = now_IR->target.name.erase(0,3) + ":";
        ARM_chain.push_back(now_ARM);
    }
}

void InstructionAllocator::function_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro){

    // judge current function is Leaf or not
    bool isLeaf = true;
    for(int i=now_IR_pro->index + 1 - ir_pro_normal_chain[0]->index; i<ir_pro_normal_chain.size(); i++){

        if (ir_pro_normal_chain[i]->ir_type == ir_forth && ir_pro_normal_chain[i]->opera == "jumpr") {
            break;
        }

        if (ir_pro_normal_chain[i]->ir_type == ir_forth && ir_pro_normal_chain[i]->opera == "call") {
            isLeaf = false;
            break;
        }
    }

    // entry of function
    function_entry_generate(now_IR_pro, isLeaf);

    // content of function
    for(int i=now_IR_pro->index + 1 - ir_pro_normal_chain[0]->index; i<ir_pro_normal_chain.size(); i++){

    // exit of function
        if (ir_pro_normal_chain[i]->ir_type == ir_forth && ir_pro_normal_chain[i]->opera == "jumpr") {
            function_exit_generate(ir_pro_normal_chain[i], isLeaf);
            break;
        }

        // entry of if
        if (ir_pro_normal_chain[i]->ir_type == ir_label && ir_pro_normal_chain[i]->target.name.substr(0,8) == "if_wrong") {
            if_wrong_generate(ir_pro_normal_chain[i]);
        }

        // entry of if
        if (ir_pro_normal_chain[i]->ir_type == ir_forth
            && (ir_pro_normal_chain[i]->opera == "le"
                || ir_pro_normal_chain[i]->opera == "eq")) {
            compare_generate(ir_pro_normal_chain[i]);
        }

        // exit of if
        if (ir_pro_normal_chain[i]->ir_type == ir_label && ir_pro_normal_chain[i]->target.name.substr(0,6) == "if_end") {
            if_end_generate(ir_pro_normal_chain[i]);
        }

        // entry of while
        if (ir_pro_normal_chain[i]->ir_type == ir_label && ir_pro_normal_chain[i]->target.name.substr(0,14) == "while_continue") {
            while_continue_generate(ir_pro_normal_chain[i]);
        }

        // exit of while
        if (ir_pro_normal_chain[i]->ir_type == ir_label && ir_pro_normal_chain[i]->target.name.substr(0,11) == "while_break") {
            while_break_generate(ir_pro_normal_chain[i]);
        }

        // call
        if (ir_pro_normal_chain[i]->ir_type == ir_forth && ir_pro_normal_chain[i]->opera == "call") {
            call_generate(ir_pro_normal_chain[i]);
        }

        // jump
        if (ir_pro_normal_chain[i]->ir_type == ir_forth && ir_pro_normal_chain[i]->opera == "jumpn") {
            //jump_generate(ir_pro_normal_chain[i]);
        }

        // assign
        if (ir_pro_normal_chain[i]->ir_type == ir_forth && ir_pro_normal_chain[i]->opera == "assign") {
            assign_generate(ir_pro_normal_chain[i]);
        }

        // arithmetic
        if (ir_pro_normal_chain[i]->ir_type == ir_forth
            && (ir_pro_normal_chain[i]->opera == "add"
                || ir_pro_normal_chain[i]->opera == "sub"
                || ir_pro_normal_chain[i]->opera == "mul"
                || ir_pro_normal_chain[i]->opera == "div"
                || ir_pro_normal_chain[i]->opera == "mod")) {
            arithmetic_generate(ir_pro_normal_chain[i]);
        }

        // load
        if (ir_pro_normal_chain[i]->ir_type == ir_forth && ir_pro_normal_chain[i]->opera == "lw") {
            load_generate(ir_pro_normal_chain[i]);
        }

        // store
        if (ir_pro_normal_chain[i]->ir_type == ir_forth && ir_pro_normal_chain[i]->opera == "sw") {
            store_generate(ir_pro_normal_chain[i]);
        }

    }

}

void InstructionAllocator::function_entry_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro, bool isLeaf){

    ARM_node now_ARM;

    // set label
    // only save function name since '@' means comment in ARM,
    // for example: @0_main -> main:
    now_ARM.type = arm_func_label;
    now_ARM.instruction = now_IR_pro->target.name.erase(0,3) + ":";
    ARM_chain.push_back(now_ARM);

    if(!isLeaf){
        now_ARM.type = arm_ins;
        now_ARM.instruction = "push    {r3, lr}";
        ARM_chain.push_back(now_ARM);
    }

    //TODO: if more than 4 params are received, the rest will be saved on stack

}

void InstructionAllocator::function_exit_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro, bool isLeaf){

    ARM_node now_ARM;

    if(isLeaf){
        now_ARM.type = arm_ins;
        now_ARM.instruction = "bx      lr";
        ARM_chain.push_back(now_ARM);
    }
    else{
        now_ARM.type = arm_ins;
        now_ARM.instruction = "pop     {r3, pc}";
        ARM_chain.push_back(now_ARM);
    }

}

void InstructionAllocator::if_wrong_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro){

    ARM_node now_ARM;

    //'.' is added since it means block entry in ARM
    now_ARM.type = arm_block_label;
    now_ARM.instruction = "." + now_IR_pro->target.name + ":";
    ARM_chain.push_back(now_ARM);

}

void InstructionAllocator::compare_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro){
    ARM_node now_ARM;

    now_ARM.type = arm_ins;
    std::string operand2_str;

    if(now_IR_pro->org_2.is_name)
        operand2_str = register_name_str[now_IR_pro->src2.type];
    else if(now_IR_pro->org_2.IVTT.self_type().represent_type == basic_int)
        operand2_str = "#" + std::to_string(now_IR_pro->org_2.IVTT.self_get_int_value());
    else
        operand2_str = "#" + std::to_string(now_IR_pro->org_2.IVTT.self_get_float_value());

    now_ARM.instruction = "cmp     "
                          + register_name_str[now_IR_pro->src1.type]
                          + ", "
                          + operand2_str;
    ARM_chain.push_back(now_ARM);

    auto next_IR = now_IR_pro->next;
    now_ARM.type = arm_ins;
    std::string jump_str = "bne     ";
    if(now_IR_pro->opera == "le")
        jump_str = "bgt     ";
    else if(now_IR_pro->opera == "eq")
        jump_str = "bne     ";
    now_ARM.instruction = jump_str + "." + next_IR->target.name;
    ARM_chain.push_back(now_ARM);
}

void InstructionAllocator::if_end_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro){

    ARM_node now_ARM;

    //'.' is added since it means block entry in ARM
    now_ARM.type = arm_block_label;
    now_ARM.instruction = "." + now_IR_pro->target.name + ":";
    ARM_chain.push_back(now_ARM);

}

void InstructionAllocator::while_continue_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro){

    ARM_node now_ARM;

    //'.' is added since it means block entry in ARM
    now_ARM.type = arm_block_label;
    now_ARM.instruction = "." + now_IR_pro->target.name + ":";
    ARM_chain.push_back(now_ARM);

}

void InstructionAllocator::while_break_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro){

    ARM_node now_ARM;

    //'.' is added since it means block entry in ARM
    now_ARM.type = arm_block_label;
    now_ARM.instruction = "." + now_IR_pro->target.name + ":";
    ARM_chain.push_back(now_ARM);

}

void InstructionAllocator::call_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro){

    ARM_node now_ARM;

    now_ARM.type = arm_ins;
    std::string call_string = "bl     ";
    now_ARM.instruction = call_string + " " + now_IR_pro->target.name.erase(0,3);
    ARM_chain.push_back(now_ARM);

}

void InstructionAllocator::jump_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro){
    ARM_node now_ARM;

    now_ARM.type = arm_ins;
    std::string jump_string = "bne     ";
    now_ARM.instruction = jump_string + "." + now_IR_pro->target.name;
    ARM_chain.push_back(now_ARM);
}

void InstructionAllocator::assign_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro){

    ARM_node now_ARM;

    if(now_IR_pro->org_1.is_name){
        now_ARM.type = arm_ins;
        now_ARM.instruction = "mov     "
                              + register_name_str[now_IR_pro->tar.type]
                              + ", "
                              + register_name_str[now_IR_pro->src1.type];
        ARM_chain.push_back(now_ARM);
    }
    else{
        if(now_IR_pro->org_1.IVTT.self_get_int_value() >= 0){
            now_ARM.type = arm_ins;
            now_ARM.instruction = "movs    "
                                  + register_name_str[now_IR_pro->tar.type]
                                  + ", #"
                                  + std::to_string(now_IR_pro->org_1.IVTT.self_get_int_value());
            ARM_chain.push_back(now_ARM);
        }
        else if(now_IR_pro->org_1.IVTT.self_get_int_value() == -1){
            now_ARM.type = arm_ins;
            now_ARM.instruction = "mov     "
                                  + register_name_str[now_IR_pro->tar.type]
                                  + ", #"
                                  + std::to_string(now_IR_pro->org_1.IVTT.self_get_int_value());
            ARM_chain.push_back(now_ARM);
        }
        else {
            now_ARM.type = arm_ins;
            now_ARM.instruction = "mvn     "
                                  + register_name_str[now_IR_pro->tar.type]
                                  + ", #"
                                  + std::to_string(-now_IR_pro->org_1.IVTT.self_get_int_value() - 1);
            ARM_chain.push_back(now_ARM);
        }
    }

}

void InstructionAllocator::arithmetic_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro){
    ARM_node now_ARM;

    now_ARM.type = arm_ins;
    std::string operand2_str;

    if(now_IR_pro->org_2.is_name)
        operand2_str = register_name_str[now_IR_pro->src2.type];
    else if(now_IR_pro->org_2.IVTT.self_type().represent_type == basic_int)
        operand2_str = "#" + std::to_string(now_IR_pro->org_2.IVTT.self_get_int_value());
    else
        operand2_str = "#" + std::to_string(now_IR_pro->org_2.IVTT.self_get_float_value());

    now_ARM.instruction = now_IR_pro->opera
            + "     "
            + register_name_str[now_IR_pro->tar.type]
            + ", "
            + register_name_str[now_IR_pro->src1.type]
            + ", "
            + operand2_str;
    ARM_chain.push_back(now_ARM);
}

void InstructionAllocator::load_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro){
    ARM_node now_ARM;

    //{name}[[unused]]%15 *a2* = lw, {name}[[int*<2>] len(4)(2)]%17 *a1*
    //ldr     r3, [r7, #144]
    now_ARM.type = arm_ins;
    std::string oprand1_str = std::to_string(now_IR_pro->org_1.IVTT.self_get_int_value() * 4);
    now_ARM.instruction = "ldr     "
                            + register_name_str[now_IR_pro->tar]
                            + ", [r7, #"
                            + oprand1_str
                            + "]" ;
    ARM_chain.push_back(now_ARM);
}

void InstructionAllocator::store_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro){
    ARM_node now_ARM;

    //{name}[[int]]%5 *a1* = sw, [int] 5 *no_name*
    //str     r3, [r7, #24]
    now_ARM.type = arm_ins;
    std::string oprand1_str = std::to_string(now_IR_pro->org_1.IVTT.self_get_int_value() * 4);
    now_ARM.instruction = "str     "
                          + register_name_str[now_IR_pro->tar]
                          + ", [r7, #"
                          + oprand1_str
                          + "]" ;
    ARM_chain.push_back(now_ARM);
}