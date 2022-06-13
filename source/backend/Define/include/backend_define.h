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
    std::string name;

    std::vector<IR_node> block_content;

    //For ActivityAnalysis
    std::set<std::string> in_variables;
    std::set<std::string> out_variables;
    std::set<std::string> used_variables;
    std::set<std::string> defined_variables;
    //End ActivityAnalysis

    // save linear index of other basic block in the cfg
    std::vector<std::shared_ptr<CFG_node>> predecessor;
    std::vector<std::shared_ptr<CFG_node>> successor;

    void print() const;
};

#define CFG_PTR std::shared_ptr<CFG_node>

namespace CFG_List {
    void print_all(const std::vector<CFG_node>& CFG_blocks_chain_);
};
