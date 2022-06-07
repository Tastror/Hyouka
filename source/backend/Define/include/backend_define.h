//
// Created by Simon on 2022/6/2.
//

#pragma once

#include "define.h"

#include <string>
#include <vector>

typedef struct BasicBlock {
    std::string name;
    int index = -1;

    std::vector<IR_tuple> vec;
} BB;

struct CFG_node {
    std::string name;
    int index = -1;

    BB node;
    std::vector<BB> predecessor;
    std::vector<BB> successor;

    static void print_all(const std::shared_ptr<CFG_node>& CFG_head);
};

#define CFG_PTR std::shared_ptr<CFG_node>
