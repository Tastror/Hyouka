//
// Created by Simon on 2022/6/2.
//

#pragma once

#include "define.h"

#include <string>
#include <vector>
#include <set>
#include <unordered_map>

struct CFG_node {
    int index = -1;
    IR_node entry_ir;
    IR_node exit_ir;
    std::vector<IR_node> basic_block;

    //For ActivityAnalysis
    std::set<std::string> in_variables;
    std::set<std::string> out_variables;
    std::set<std::string> used_variables;
    std::set<std::string> defined_variables;
    //End ActivityAnalysis

    // save linear index of other basic block in the cfg
    std::vector<CFG_node> predecessor;
    std::vector<CFG_node> successor;

    static void print_all(std::vector<CFG_node> cfg_head);
};

#define CFG_PTR std::shared_ptr<std::vector<CFG_node>>

struct CFG_List_node {
    int index = -1;
    std::shared_ptr<CFG_node> cfg;

    static void print_all(std::unordered_map<std::string, CFG_PTR> cfg_list);
};
