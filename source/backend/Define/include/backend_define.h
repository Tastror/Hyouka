//
// Created by Simon on 2022/6/2.
//

#pragma once

#include "define.h"

#include <string>
#include <vector>

struct CFG_node {
    int index = -1;
    IR_node entry_ir;
    IR_node exit_ir;
    std::vector<IR_node> basic_block;

    std::vector<std::shared_ptr<CFG_node>> predecessor;
    std::vector<std::shared_ptr<CFG_node>> successor;

    static void print_all(const std::shared_ptr<CFG_node>& CFG_head);
};

#define CFG_PTR std::shared_ptr<CFG_node>

struct CFG_List_node {
    int index = -1;
    std::shared_ptr<CFG_node> cfg;

    std::shared_ptr<CFG_List_node> next;

    static void print_all(const std::shared_ptr<CFG_List_node>& CFG_List_head);
};

#define CFG_LIST_PTR std::shared_ptr<CFG_List_node>