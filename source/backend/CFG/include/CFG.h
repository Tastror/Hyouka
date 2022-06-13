//
// Created by Simon on 2022/6/8.
//

#pragma once

#include "backend_define.h"

class CFG {
public:
    IR_PTR IR_head;
    int basic_block_num;
    CFG_PTR now_dealt_with;
    std::vector<IR_PTR> IR_chain;
    std::vector<CFG_PTR> CFG_blocks_chain;
    std::unordered_map<std::string, int> IR_maps;
    std::unordered_map<std::string, CFG_PTR> CFG_maps;

    explicit CFG(const IR_PTR& IR_head);
    void Generate();

    void init();
    void create_new_block();
    void add_to_now(const IR_PTR& now_IR);
};