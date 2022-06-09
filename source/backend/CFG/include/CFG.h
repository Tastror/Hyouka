//
// Created by Simon on 2022/6/8.
//

#pragma once

#include "backend_define.h"

class CFG{
public:
    CFG_PTR head;
    CFG_PTR now_cfg;
    IR_PTR IR;
    static int line_num;
    static int label_num;

    explicit CFG(const std::shared_ptr<IR_node>& IR_head);

    void create_empty_cfg();
    void create_basic_block(const std::shared_ptr<IR_node>& now_IR);

    void Generate();

    void cfg_generate(const std::shared_ptr<IR_node>& now_IR);
};