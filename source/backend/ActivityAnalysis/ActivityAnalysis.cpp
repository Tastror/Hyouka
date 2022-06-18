//
// Created by Shirone on 2022/6/9.
//
#include <map>
#include <iostream>
#include "ActivityAnalysis.h"

std::map<int, bool> BlockVariableFactory::CFGChange;
bool BlockVariableFactory::change = true;

void BlockVariableFactory::CalculateDefinedAndUsed(CFG_node &cfgNode) {
    for (auto i: cfgNode.content) {
        if (i->opera == "sw") {
            /*Instruction sw is used to put a data into where i->target points at, so i->target is a used variable rather than a defined one*/
            if (i->target.is_name && cfgNode.defined_variables.find(i->target.name) == cfgNode.defined_variables.end())
                cfgNode.used_variables.emplace(i->target.name);
            if (i->org_1.is_name && cfgNode.defined_variables.find(i->org_1.name) == cfgNode.defined_variables.end())
                cfgNode.used_variables.emplace(i->org_1.name);


        } else if (OperatorFilter1(i->opera)) {
            /*Filter operators with 1 org*/
            if (i->target.is_name && cfgNode.used_variables.find(i->target.name) == cfgNode.used_variables.end())
                cfgNode.defined_variables.emplace(i->target.name);
            if (i->org_1.is_name && cfgNode.defined_variables.find(i->org_1.name) == cfgNode.defined_variables.end())
                cfgNode.used_variables.emplace(i->org_1.name);
            //Time Complexity O(log^n)

        } else if (OperatorFilter2(i->opera)) {
            /*Filter operators with 2 orgs*/
            if (i->target.is_name && cfgNode.used_variables.find(i->target.name) == cfgNode.used_variables.end())
                cfgNode.defined_variables.emplace(i->target.name);
            if (i->org_1.is_name && cfgNode.defined_variables.find(i->org_1.name) == cfgNode.defined_variables.end())
                cfgNode.used_variables.emplace(i->org_1.name);
            if (i->org_2.is_name && cfgNode.defined_variables.find(i->org_2.name) == cfgNode.defined_variables.end())
                cfgNode.used_variables.emplace(i->org_2.name);
            //Time Complexity O(log^n)
        }

    }

}

void BlockVariableFactory::CalculateActivity(CFG_node &cfgNode) {
    CFGChange[cfgNode.index] = false;
    for (auto suc: cfgNode.successor) {
        cfgNode.out_variables.insert(suc->in_variables.begin(), suc->in_variables.end());
    }
    std::set<std::string> difference;
    std::set_difference(cfgNode.out_variables.begin(), cfgNode.out_variables.end(),
                        cfgNode.defined_variables.begin(), cfgNode.defined_variables.end(),
                        std::inserter(difference, difference.begin()));
    std::set<std::string> newIn;
    std::set_union(cfgNode.used_variables.begin(), cfgNode.used_variables.end(), difference.begin(), difference.end(),
                   std::inserter(newIn, newIn.begin()));
    if (newIn != cfgNode.in_variables) {
        //change=true;
        CFGChange[cfgNode.index] = true;
        cfgNode.in_variables = newIn;
    }//Complexity Up to n^2log(n)
}

void CFGActivityTab::AnalyzeBlockVariables(std::vector<CFG_PTR > &list) {
    for (auto node0: list) {
        BlockVariableFactory::CalculateDefinedAndUsed(*node0);
    }
    while (BlockVariableFactory::DetectChange()/*BlockVariableFactory::change*/) {
        //BlockVariableFactory::change = false;
        for (auto it = list.rbegin(); it != list.rend(); it++) {
            BlockVariableFactory::CalculateActivity(**it);
        }
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
            std::cout << i << " ";
        std::cout << std::endl;
    }
}
