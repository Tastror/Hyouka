//
// Created by Simon on 2022/6/2.
//

#pragma once

#include "define.h"

#include <string>
#include <vector>

typedef struct BasicBlockList_node {

    int index = -1;
    std::shared_ptr<BasicBlockList_node> next = nullptr;

    std::vector<IR_node> basic_block;

    static void print_all(const std::shared_ptr<BasicBlockList_node>& BBList_head);
} BBList_node;

#define BBList_PTR std::shared_ptr<BBList_node>

struct CFG_node {
    int index = -1;

    BBList_node current_node;
    std::vector<BBList_node> predecessor;
    std::vector<BBList_node> successor;

    static void print_all(const std::shared_ptr<CFG_node>& CFG_head);
};

#define CFG_PTR std::shared_ptr<CFG_node>
