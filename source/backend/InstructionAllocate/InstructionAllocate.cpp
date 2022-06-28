//
// Created by Tastror on 2022/6/21.
//

#include "InstructionAllocate.h"

#include <iostream>

InstructionAllocator::InstructionAllocator(const std::map<std::string, std::vector<CFG_pro_PTR>>& CFG_pro_function_chain) {

    for (auto& [name, block_chain] : CFG_pro_function_chain) {

        CFG_map[name] = std::vector<CFG_pro_PTR>();

        for (auto& mem : block_chain) {

            auto now_CFG = std::make_shared<CFG_pro_node>();

            now_CFG->index = mem->index;
            now_CFG->name = mem->name;
            //* now_CFG->content = mem->content; *//
            now_CFG->in_variables = mem->in_variables;
            now_CFG->out_variables = mem->out_variables;
            now_CFG->used_variables = mem->used_variables;
            now_CFG->defined_variables = mem->defined_variables;
            now_CFG->in_expressions = mem->in_expressions;
            now_CFG->out_expressions = mem->out_expressions;
            now_CFG->generated_expressions = mem->generated_expressions;
            now_CFG->killed_expressions = mem->killed_expressions;
            now_CFG->str_predecessor = mem->str_predecessor;
            now_CFG->str_successor = mem->str_successor;
            now_CFG->predecessor = mem->predecessor;
            now_CFG->successor = mem->successor;

            for (auto& r : mem->content_pro) {

                auto now_IR = std::make_shared<IR_node_pro>();
                now_IR->index = r->index;
                now_IR->ir_type = r->ir_type;
                now_IR->next = r->next;
                now_IR->tar = r->tar;
                now_IR->opera = r->opera;
                now_IR->src1 = r->src1;
                now_IR->src2 = r->src2;
                now_IR->comment = r->comment;
                now_CFG->content_pro.push_back(now_IR);
            }

            CFG_map[name].push_back(now_CFG);
        }
    }
}

void InstructionAllocator::Generate() {

    for(auto &it : CFG_map){
       std::cout << it.first << std::endl;      //for debug
    }
}

