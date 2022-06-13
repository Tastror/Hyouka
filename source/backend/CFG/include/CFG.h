//
// Created by Simon on 2022/6/8.
//

#pragma once

#include "backend_define.h"

class CFG_builder {
public:

    IR_PTR IR_head;
    int basic_block_num;

    CFG_PTR last_CFG;
    CFG_PTR now_CFG;
    std::vector<IR_PTR> IR_chain;
    std::vector<CFG_PTR> CFG_blocks_chain;
    std::unordered_map<std::string, int> IR_maps;  // label -> index
    std::unordered_map<IR_PTR, CFG_PTR> CFG_maps;  // ir -> cfg

    explicit CFG_builder(const IR_PTR& IR_head);
    void Generate();

    void init();
    void first_generate();
    void second_generate();
    void create_new_block(const IR_PTR& connect_IR, int ir_index);
    void add_to_now(const IR_PTR& now_IR);
    void add_last_to_now();
    void add_predecessor_to_now(const std::string& CFG_str);
    void add_successor_to_now(const std::string& CFG_str);
};