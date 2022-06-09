//
// Created by Simon on 2022/6/9.
//

#pragma once

#include "backend_define.h"

class BBList{
public:
    BBList_PTR head;
    BBList_PTR now_bb;
    IR_PTR IR;
    static int line_num;
    static int label_num;
    bool is_entry= false;

    explicit BBList(const std::shared_ptr<IR_node>& IR_head);

    void set_basic_block_entry(const std::shared_ptr<IR_node>& now_IR);
    void set_basic_block_middle(const std::shared_ptr<IR_node>& now_IR);
    void set_basic_block_exit(const std::shared_ptr<IR_node>& now_IR);

    void Generate();

    void list_generate(const std::shared_ptr<IR_node>& now_IR);
};