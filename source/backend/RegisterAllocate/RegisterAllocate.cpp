//
// Created by Tastror on 2022/6/21.
//

#include "RegisterAllocate.h"

#include <iostream>

void RegisterAllocator::Generate() {
    init();
    for (const auto& [name, block_chain] : CFG_pro_function_chain) {
        function_map_reg_var_vec[name].reserve(16);
        function_map_var_reg_map[name].clear();
        generate_global_graph(name, block_chain);

        for (const auto& single_block : block_chain) {
            generate_single_block(name, single_block);
        }

        // debug-output
        if (debug)
            for (const auto& [n, d] : function_map_neighbor_form[name]) {
                std::cout << n << std::endl;
                for (const auto& m : d) {
                    std::cout << m << ", ";
                }
                std::cout << std::endl;
            }

    }
}

void RegisterAllocator::init() {

    for (auto& [name, block_chain] : CFG_function_chain) {

        CFG_pro_function_chain[name] = std::vector<CFG_pro_PTR>();

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

            for (auto& r : mem->content) {

                auto now_IR = std::make_shared<IR_node_pro>();
                now_IR->index = r->index;
                now_IR->ir_type = r->ir_type;
                now_IR->next = r->next;
                now_IR->target = r->target;
                now_IR->opera = r->opera;
                now_IR->org_1 = r->org_1;
                now_IR->org_2 = r->org_2;
                now_IR->comment = r->comment;
                now_CFG->content_pro.push_back(now_IR);
            }

            CFG_pro_function_chain[name].push_back(now_CFG);
        }
    }
}


// in each CFG_pro_block
// there are defined, used, in, out

void RegisterAllocator::generate_global_graph(const std::string& name, const std::vector<CFG_pro_PTR>& block_chain) {
    for (const auto& mem : block_chain) {
        const auto& in = mem->in_variables;
        for (const auto& var : in) {
            for (const auto& var_2 : in) {
                if (var != var_2)
                    function_map_neighbor_form[name][var].insert(var_2);
            }
        }
    }
}

void RegisterAllocator::generate_single_block(const std::string& name, const CFG_pro_PTR& single_block) {
    std::map<std::string, std::set<std::string>> single_block_neighbor_form;
    for (const auto& sen : single_block->content_pro) {
        if (sen->org_1.is_name && !sen->org_1.name.empty() && sen->org_2.is_name && !sen->org_2.name.empty()) {
            single_block_neighbor_form[sen->org_1.name].insert(sen->org_2.name);
            single_block_neighbor_form[sen->org_2.name].insert(sen->org_1.name);
        }
    }

    // debug-output
    if (debug)
        for (const auto& [n, d] : single_block_neighbor_form) {
            std::cout << "single_block: " << n << std::endl;
            for (const auto& m : d) {
                std::cout << m << ", ";
            }
            std::cout << std::endl;
        }

    function_map_var_reg_map[name];
}

void RegisterAllocator::generate_single_ir_pro(const std::string& name, const IR_pro_PTR& ir_pro) {

    // todo: calculate name

    if (ir_pro->org_1.is_name)
        ir_pro->src1 = function_map_var_reg_map[name][ir_pro->org_1.name];
    if (ir_pro->org_2.is_name)
        ir_pro->src2 = function_map_var_reg_map[name][ir_pro->org_2.name];

    // todo: update name
}