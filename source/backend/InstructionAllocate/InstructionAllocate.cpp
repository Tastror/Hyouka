//
// Created by Tastror on 2022/6/21.
//

#include "InstructionAllocate.h"

#include <iostream>

void InstructionAllocator::Generate() {
    static_generate();      //global variable
    normal_generate();      //functions
}

void InstructionAllocator::normal_generate() {

    for (const auto& it : ir_pro_normal_chain) {

        if (it->ir_type == ir_label && it->target.name.at(0) == '@') {
            function_generate(it);
        }
    }
}

void InstructionAllocator::static_generate() {

    for (const auto& it : ir_static_chain) {

        if (it->ir_type != ir_label) {
            global_generate(it);
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
        else    //FIXME: how to deal with float
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

        if (ir_pro_normal_chain[i]->ir_type == ir_forth && ir_pro_normal_chain[i]->target.to_string(false) == "$ret") {
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

        if (ir_pro_normal_chain[i]->ir_type == ir_forth && ir_pro_normal_chain[i]->opera == "assign" && ir_pro_normal_chain[i]->target.to_string(false) != "$ret") {
            assign_generate(ir_pro_normal_chain[i]);
        }

        if (ir_pro_normal_chain[i]->ir_type == ir_forth && ir_pro_normal_chain[i]->opera == "call") {
            call_generate(ir_pro_normal_chain[i]);
        }

        if (ir_pro_normal_chain[i]->ir_type == ir_label && ir_pro_normal_chain[i]->target.name.substr(0,2) == "if") {
            if_generate(ir_pro_normal_chain[i]);
        }

        if (ir_pro_normal_chain[i]->ir_type == ir_label && ir_pro_normal_chain[i]->target.name.substr(0,5) == "while") {
            while_generate(ir_pro_normal_chain[i]);
        }

    // exit of function
        if (ir_pro_normal_chain[i]->ir_type == ir_forth && ir_pro_normal_chain[i]->target.to_string(false) == "$ret") {
            function_exit_generate(ir_pro_normal_chain[i], isLeaf);
            break;
        }

    }

}

// reg a1-a4 stores params, more params will be stored on stack, which needed to reload using ldr
void InstructionAllocator::function_entry_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro, bool isLeaf){

    ARM_node now_ARM;

    // set label
    // only save function name since '@' means comment in ARM,
    // for example: @0_main -> main:
    now_ARM.type = arm_func_label;
    now_ARM.instruction = now_IR_pro->target.name.erase(0,3) + ":";
    ARM_chain.push_back(now_ARM);

    //事实上，在 arm 官方的手册中，帧指针是 r11，r11 的别名也是 fp(frame point)，
    //但是在实际的编译器实现中，从反汇编代码可以看出，r7 被作为帧指针而不是官方指定的 r11，
    now_ARM.type = arm_ins;
    if(isLeaf)
        now_ARM.instruction = "push     {r7}";      // r7 -> fp(frame pointer)
    else
        now_ARM.instruction = "push     {r7, lr}";
    ARM_chain.push_back(now_ARM);

    //FIXME: if ret val is used, sp needed to be descended in stack
    //now_ARM.type = arm_ins;
    //now_ARM.instruction = "sub     sp, sp, #8";
    //ARM_chain.push_back(now_ARM);

    now_ARM.type = arm_ins;
    now_ARM.instruction = "add     r7, sp, #0";
    ARM_chain.push_back(now_ARM);
}

void InstructionAllocator::function_exit_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro, bool isLeaf){

    ARM_node now_ARM;

    if(now_IR_pro->opera == "assign") {
        if(now_IR_pro->org_1.IVTT.self_get_int_value() >= 0){
            now_ARM.type = arm_ins;
            now_ARM.instruction = "movs     r3, #" + std::to_string(now_IR_pro->org_1.IVTT.self_get_int_value());
            ARM_chain.push_back(now_ARM);
        }
        else if(now_IR_pro->org_1.IVTT.self_get_int_value() == -1){
            now_ARM.type = arm_ins;
            now_ARM.instruction = "mov     r3, #" + std::to_string(now_IR_pro->org_1.IVTT.self_get_int_value());
            ARM_chain.push_back(now_ARM);
        }
        else {
            now_ARM.type = arm_ins;
            now_ARM.instruction = "mvn     r3, #" + std::to_string(-now_IR_pro->org_1.IVTT.self_get_int_value() - 1);
            ARM_chain.push_back(now_ARM);
        }
    }

    now_ARM.type = arm_ins;
    now_ARM.instruction = "mov     r0, r3";
    ARM_chain.push_back(now_ARM);

    now_ARM.type = arm_ins;
    now_ARM.instruction = "mov     sp, r7";
    ARM_chain.push_back(now_ARM);

    now_ARM.type = arm_ins;
    now_ARM.instruction = "ldr     r7, [sp], #4";
    ARM_chain.push_back(now_ARM);

    now_ARM.type = arm_ins;
    if(isLeaf)
        now_ARM.instruction = "bx     lr";
    else
        now_ARM.instruction = "pop     {r7, lr}";
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

void InstructionAllocator::assign_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro){

    ARM_node now_ARM;

    //movs    r3, #2
    //str     r3, [r7, #8]

    if(now_IR_pro->org_1.IVTT.self_get_int_value() >= 0){
        now_ARM.type = arm_ins;
        now_ARM.instruction = "movs     "
                              + register_name_str[now_IR_pro->src2]
                              + ", #"
                              + std::to_string(now_IR_pro->org_1.IVTT.self_get_int_value());
        ARM_chain.push_back(now_ARM);
    }
    else if(now_IR_pro->org_1.IVTT.self_get_int_value() == -1){
        now_ARM.type = arm_ins;
        now_ARM.instruction = "mov     "
                              + register_name_str[now_IR_pro->src2]
                              + ", #"
                              + std::to_string(now_IR_pro->org_1.IVTT.self_get_int_value());
        ARM_chain.push_back(now_ARM);
    }
    else {
        now_ARM.type = arm_ins;
        now_ARM.instruction = "mvn     "
                              + register_name_str[now_IR_pro->src2]
                              + ", #"
                              + std::to_string(-now_IR_pro->org_1.IVTT.self_get_int_value() - 1);
        ARM_chain.push_back(now_ARM);
    }

    now_ARM.type = arm_ins;
    now_ARM.instruction = "str     r3, [r7, #4]";   //FIXME
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
    ARM_node now_ARM;

    //'.' is added since it means block entry in ARM
    now_ARM.type = arm_func_label;
    now_ARM.instruction = "." + now_IR_pro->target.name + ":";
    ARM_chain.push_back(now_ARM);

    for(int i=now_IR_pro->index + 1; i<ir_pro_normal_chain.size(); i++){

        //TODO

        // exit of while
        if (ir_pro_normal_chain[i]->ir_type == ir_label) {
            break;
        }
    }
}

