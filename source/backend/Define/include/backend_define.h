//
// Created by Simon on 2022/6/2.
//

#pragma once

#include "define.h"

#include <string>
#include <vector>

enum BB_type {
    bb_basic_block, bb_label
};

/*  similar to the IR_node  */
typedef struct BasicBlockList_node {

    int index = -1;
    BB_type bb_type = bb_label;
    std::shared_ptr<BasicBlockList_node> next = nullptr;

    static void print_all(const std::shared_ptr<BasicBlockList_node>& BBList_head);
} BBList_node;

#define BBList_PTR std::shared_ptr<BBList_node>

enum CFG_type {
    cfg_basic_block, cfg_label
};

struct CFG_node {
    int index = -1;
    CFG_type cfg_type = cfg_label;

    BBList_node current_node;
    std::vector<BBList_node> predecessor;
    std::vector<BBList_node> successor;

    static void print_all(const std::shared_ptr<CFG_node>& CFG_head);
};

#define CFG_PTR std::shared_ptr<CFG_node>
