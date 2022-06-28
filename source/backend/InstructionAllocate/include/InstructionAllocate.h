//
// Created by Tastror on 2022/6/21.
//

#pragma once

#include "backend_define.h"

class InstructionAllocator {

<<<<<<< HEAD
public:
    std::vector<IR_pro_PTR> ir_pro_normal_chain;
    std::vector<IR_PTR> ir_static_chain;
||||||| 74843ae
    std::vector<CFG_pro_PTR> CFG_pro_blocks_chain;
=======
    std::map<std::string, std::vector<CFG_pro_PTR>> CFG_map;
>>>>>>> 9d8fc842f0f97d1c48e17cf07d2b0a1f0e17b838
    ARM_code_vec ARM_code;
<<<<<<< HEAD

public:
    explicit InstructionAllocator(
        std::vector<IR_pro_PTR> ir_pro_normal_chain,
        std::vector<IR_PTR> ir_static_chain
    ):  ir_pro_normal_chain(std::move(ir_pro_normal_chain)),
        ir_static_chain(std::move(ir_static_chain)) {}

public:
||||||| 74843ae
    explicit InstructionAllocator(const std::map<std::string, std::vector<CFG_pro_PTR>>& CFG_pro_function_chain) {}
=======

    explicit InstructionAllocator(const std::map<std::string, std::vector<CFG_pro_PTR>>& CFG_pro_function_chain);

>>>>>>> 9d8fc842f0f97d1c48e17cf07d2b0a1f0e17b838
    void Generate();
<<<<<<< HEAD

||||||| 74843ae
=======

    void program_generate(const std::map<std::string, std::vector<CFG_pro_PTR>>& CFG_pro_function_chain);
    void global_generate(const std::shared_ptr<CFG_pro_node>& now_CFG);     //global variables
    void function_generate(const std::vector<std::shared_ptr<CFG_pro_node>>& now_CFG);

>>>>>>> 9d8fc842f0f97d1c48e17cf07d2b0a1f0e17b838
};