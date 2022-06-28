//
// Created by Tastror on 2022/6/21.
//

#pragma once

#include "backend_define.h"

class InstructionAllocator {

public:
    std::vector<IR_pro_PTR> ir_pro_normal_chain;
    std::vector<IR_PTR> ir_static_chain;
    ARM_code_vec ARM_code;

public:
    explicit InstructionAllocator(
        std::vector<IR_pro_PTR> ir_pro_normal_chain,
        std::vector<IR_PTR> ir_static_chain
    ):  ir_pro_normal_chain(std::move(ir_pro_normal_chain)),
        ir_static_chain(std::move(ir_static_chain)) {}

public:
    void Generate();
    void normal_generate();
    void function_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro);

    void if_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro);
    void while_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro);
    void break_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro);
    void continue_generate(const std::shared_ptr<IR_node_pro>& now_IR_pro);

    void static_generate();
    [[nodiscard]] ARM_code_vec get_result_ARM_code() const { return ARM_code; };

};