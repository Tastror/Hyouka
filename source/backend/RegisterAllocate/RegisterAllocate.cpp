//
// Created by Tastror on 2022/6/21.
//

#include "RegisterAllocate.h"

void RegisterAllocator::Generate() {
    reg_var_vec.reserve(32);
    init();
}

void RegisterAllocator::init() {

    for (auto& [name, block_chain] : CFG_function_chain) {

        CFG_pro_function_chain[name] = std::vector<CFG_pro_PTR>();

        for (auto& mem : block_chain) {

            auto now_CFG = std::make_shared<CFG_pro_node>();

            now_CFG->index = mem->index;
            now_CFG->name = mem->name;
    //        now_CFG->content = mem->content;
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


void RegisterAllocator::generate_graph() {

}

void RegisterAllocator::generate_single_ir_pro(const IR_pro_PTR& ir_pro) {

    // todo: calculate name

    if (ir_pro->org_1.is_name)
        ir_pro->src1 = var_reg_map[ir_pro->org_1.name];
    if (ir_pro->org_2.is_name)
        ir_pro->src2 = var_reg_map[ir_pro->org_2.name];

    // todo: update name
}