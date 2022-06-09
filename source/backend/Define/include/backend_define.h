//
// Created by Simon on 2022/6/2.
//

#pragma once

#include "define.h"

#include <string>
#include <vector>

struct CFG_node {
    int index = -1;

    std::vector<IR_node> basic_block;
    std::shared_ptr<std::vector<CFG_node>> predecessor = nullptr;
    std::shared_ptr<std::vector<CFG_node>> successor = nullptr;

    static void print_all(const std::shared_ptr<CFG_node>& CFG_head);
};

#define CFG_PTR std::shared_ptr<CFG_node>
