//
// Created by Tastror on 2022/6/21.
//

#pragma once

#include <utility>

#include "backend_define.h"

class RegisterAllocator {
public:
    std::vector<std::string> reg_var_vec;
    std::unordered_map<std::string, register_name> var_reg_map;
    std::map<std::string, std::vector<CFG_PTR>> CFG_function_chain;
    std::map<std::string, std::vector<CFG_pro_PTR>> CFG_pro_function_chain;
    explicit RegisterAllocator(std::map<std::string, std::vector<CFG_PTR>> CFG_function_chain): CFG_function_chain(std::move(CFG_function_chain)) {}
    void Generate();
    void init();
    void generate_graph();
    void generate_single_ir_pro(const IR_pro_PTR& ir_pro);

private:

};