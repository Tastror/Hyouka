//
// Created by Shirone on 2022/6/9.
//
#include <map>
#include <iostream>
#include "ActivityAnalysis.h"

std::map<int, bool> BlockVariableFactory::CFGChange;

void BlockVariableFactory::CalculateDefinedAndUsed(CFG_node &cfgNode) {
    for (auto i: cfgNode.content) {
        if (judgeOperator(i->opera))
            if (cfgNode.used_variables.find(i->target.name) == cfgNode.used_variables.end() &&
                cfgNode.defined_variables.find(i->org_1.name) == cfgNode.defined_variables.end() &&
                cfgNode.defined_variables.find(i->org_1.name) == cfgNode.defined_variables.end()) {
                cfgNode.used_variables.emplace(i->org_1.name);
                cfgNode.used_variables.emplace(i->org_2.name);
                cfgNode.defined_variables.emplace(i->target.name);//optimize needed,O(n^2),slow
            }
    }
}

void BlockVariableFactory::CalculateActivity(CFG_node &cfgNode) {
    for (auto suc: cfgNode.successor) {
        cfgNode.out_variables.insert(suc->in_variables.begin(), suc->in_variables.end());
        std::set<std::string> difference;
        std::set_difference(cfgNode.out_variables.begin(), cfgNode.out_variables.end(),
                            cfgNode.defined_variables.begin(), cfgNode.defined_variables.end(),
                            std::inserter(difference, difference.begin()));
        CFGChange[cfgNode.index] = false;
        for (auto i: cfgNode.used_variables) {
            if (cfgNode.in_variables.emplace(i).second) {
                CFGChange[cfgNode.index] = true;
            };
        }
        for (auto i: difference) {
            if (cfgNode.in_variables.emplace(i).second) {
                CFGChange[cfgNode.index] = true;
            };
        }
    }
}

void CFGActivityTab::AnalyzeBlockVariables(std::vector<CFG_PTR > &list) {
    for (auto node0: list) {
        BlockVariableFactory::CalculateDefinedAndUsed(*node0);
    }
    while (BlockVariableFactory::DetectChange())
        for (auto node1: list) {
            BlockVariableFactory::CalculateActivity(*node1);
        }
}

void CFGActivityTab::print_all(const std::vector<std::shared_ptr<CFG_node>> &CFG_blocks_chain) {
    for (auto item: CFG_blocks_chain) {
        item->print();
        std::cout << "Defined:" << std::endl;
        for (auto i: item->defined_variables)
            std::cout << i << " ";
        std::cout << std::endl;
        std::cout << "Used:" << std::endl;
        for (auto i: item->used_variables)
            std::cout << i << " ";
        std::cout << std::endl;
        std::cout << "In:" << std::endl;
        for (auto i: item->in_variables)
            std::cout << i << " ";
        std::cout << std::endl;
        std::cout << "Out:" << std::endl;
        for (auto i: item->out_variables)
            std::cout << i <<" ";
        std::cout << std::endl;
    }
}
