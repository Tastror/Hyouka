//
// Created by Tastror on 2022/6/21.
//

#pragma once

#include "backend_define.h"

class InstructionAllocator {

public:
    std::vector<IR_pro_PTR> ir_pro_normal_chain;
    std::vector<IR_PTR> ir_static_chain;
    std::vector<ARM_node> ARM_chain;

    [[nodiscard]] std::vector<ARM_node> get_result_ARM_code() const { return ARM_chain; };

    explicit InstructionAllocator(
        std::vector<IR_pro_PTR> ir_pro_normal_chain,
        std::vector<IR_PTR> ir_static_chain
    ):  ir_pro_normal_chain(std::move(ir_pro_normal_chain)),
        ir_static_chain(std::move(ir_static_chain)) {}

    void Generate();

private:
    void text_section_generate();
    void global_section_generate();
    void code_section_generate();
    void data_section_generate();

    void global_generate(const std::shared_ptr<IR_node>& now_IR);

    void function_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro);
    void function_label_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro);
    void function_entry_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro, bool isLeaf);
    void function_exit_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro, bool isLeaf);

    void block_label_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro);

    void call_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro);
    void jump_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro);

    void compare_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro);
    void assign_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro);
    void arithmetic_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro);
    void logical_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro);

    void load_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro);
    void store_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro);

    void alloc_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro);
    //todo: cast-int
    //todo: float

};