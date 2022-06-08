//
// Created by Simon on 2022/6/2.
//

#pragma once

#include "define.h"

#include <string>
#include <vector>

/*  similar to the IR_node  */
typedef struct BasicBlock_node {

    int index = -1;
    //IR_type ir_type = ir_label;
    std::shared_ptr<BasicBlock_node> next = nullptr;

    // normal
    IR_tuple target;

    // target: "jump"
    // target + org_1: "alloca", "cast-float", "cast-int", "assign", "jumpe", "jumpn"
    // target + org_1 + org_2: "add", "addf", "sub", "subf", "mul", "mulf", "div", "divf", "mod"
    std::string opera;

    IR_tuple org_1;
    IR_tuple org_2;

    std::string comment;

    static void print_all(const std::shared_ptr<BasicBlock_node>& BB_head);
} BB_node;

#define BB_PTR std::shared_ptr<BB_node>

struct CFG_node {
    int index = -1;

    BB_node current_node;
    std::vector<BB_node> predecessor;
    std::vector<BB_node> successor;

    static void print_all(const std::shared_ptr<CFG_node>& CFG_head);
};

#define CFG_PTR std::shared_ptr<CFG_node>
