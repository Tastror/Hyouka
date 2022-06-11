//
// Created by Simon on 2022/6/8.
//

#pragma once

#include "backend_define.h"

class CFG{
public:
    CFG_PTR head;
    CFG_PTR now_cfg;
    CFG_PTR tail;
    IR_PTR IR;
    static int line_num;
    static int basic_block_num;

    explicit CFG(const std::shared_ptr<IR_node>& IR_head);

    void create_empty_cfg();
    void create_basic_block(const std::shared_ptr<IR_node>& now_IR);
    IR_node find_successor(const std::shared_ptr<IR_node>& target_IR);
    bool is_exist_basic_block(const std::shared_ptr<IR_node>& target_IR);

    void Generate();

    void cfg_generate(const std::shared_ptr<IR_node>& now_IR);
};

class CFG_LIST{
public:
    CFG_LIST_PTR head;
    CFG_LIST_PTR now_cfg_list;
    CFG_PTR IR;
    static int cfg_num;

    explicit CFG_LIST(const std::shared_ptr<CFG_node>& CFG_head);

    void create_empty_cfg_list();
    void create_cfg(const std::shared_ptr<CFG_node>& now_CFG);

    void Generate();

    void cfg_list_generate(const std::shared_ptr<CFG_node>& now_CFG);
};