//
// Created by Tastror on 2022/6/21.
//

#pragma once

#include "backend_define.h"

class InstructionAllocator {
public:

    std::map<std::string, std::vector<CFG_pro_PTR>> CFG_map;
    ARM_code_vec ARM_code;

    explicit InstructionAllocator(const std::map<std::string, std::vector<CFG_pro_PTR>>& CFG_pro_function_chain);

    void Generate();

    void program_generate(const std::shared_ptr<CFG_pro_node>& now_CFG);
    void global_generate(const std::shared_ptr<CFG_pro_node>& now_CFG);     //global variables
    void function_generate(const std::shared_ptr<CFG_pro_node>& now_CFG);

};