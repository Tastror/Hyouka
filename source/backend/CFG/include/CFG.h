//
// Created by Simon on 2022/6/8.
//

#pragma once

#include "backend_define.h"

class CFG{
public:
    CFG_PTR head;
    CFG_PTR now_cfg;
    BBList_PTR BB;
    static int line_num;
    static int label_num;
    static int now_register;

    explicit CFG(const std::shared_ptr<BBList_node>& BB_head);

    void create_empty_cfg();
    void create_label(const std::string& comment, const std::string& target);
    void create_basic_block(const std::shared_ptr<IR_node>& IR_node);

    void Generate();

    void entry_generate(const std::shared_ptr<BBList_node>& now_BB);
    void basic_generate(const std::shared_ptr<BBList_node>& now_BB);
    void exit_generate(const std::shared_ptr<BBList_node>& now_BB);
};