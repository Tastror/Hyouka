//
// Created by Tastror on 2022/6/21.
//

#pragma once

#include <utility>

#include "backend_define.h"

class RegisterAllocator {
public:
    std::map<std::string, std::vector<CFG_PTR>> CFG_function_chain;
    std::map<std::string, std::vector<CFG_pro_PTR>> CFG_pro_function_chain;
    explicit RegisterAllocator(std::map<std::string, std::vector<CFG_PTR>> CFG_function_chain): CFG_function_chain(std::move(CFG_function_chain)) {}
    void Generate();
    void init();
    void generate_graph(const std::string& name, std::vector<CFG_pro_PTR>& block_chain);
    void generate_single_ir_pro(const std::string& name, const IR_pro_PTR& ir_pro);
    [[nodiscard]] std::map<std::string, std::vector<CFG_pro_PTR>> get_result_pro_function_chain() const { return CFG_pro_function_chain; };
private:
    std::map<std::string, std::vector<std::string>> function_map_reg_var_vec;
    std::map<std::string, std::unordered_map<std::string, register_name>> function_map_var_reg_map;
    struct name_weight { std::string name; int weight; };
    std::map<std::string, std::vector<name_weight>> function_map_var_weight;
};