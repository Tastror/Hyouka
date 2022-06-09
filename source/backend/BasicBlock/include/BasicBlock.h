//
// Created by Simon on 2022/6/9.
//

#pragma once

#include "backend_define.h"

class BBList{
public:
    BBList_PTR head;
    BBList_PTR now_bb_list;
    IR_PTR IR;
    static int line_num;
    static int label_num;

    explicit BBList(const std::shared_ptr<IR_node>& IR_head);

    void create_empty_bb_list();
    void create_basic_block(const std::shared_ptr<IR_node>& now_IR);

    void Generate();

    void list_generate(const std::shared_ptr<IR_node>& now_IR);
};