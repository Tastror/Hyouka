//
// Created by Simon on 2022/6/8.
//

#pragma once

#include "backend_define.h"

class BB{
public:
    BB_PTR head;
    BB_PTR now_bb;
    IR_PTR IR;
    static int line_num;
    static int label_num;
    static int now_register;

    explicit BB(const std::shared_ptr<IR_node>& IR_head);

    void Generate();

    void basic_generate(const std::shared_ptr<IR_node>& now_IR);
};

class CFG{
public:
    CFG_PTR head;
    CFG_PTR now_cfg;
    BB_PTR BB;
    static int line_num;
    static int label_num;
    static int now_register;

    explicit CFG(const std::shared_ptr<BB_node>& BB_head);

    void Generate();

    void entry_generate(const std::shared_ptr<BB_node>& now_BB);
    void basic_generate(const std::shared_ptr<BB_node>& now_BB);
    void exit_generate(const std::shared_ptr<BB_node>& now_BB);
};