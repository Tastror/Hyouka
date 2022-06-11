//
// Created by Shirone on 2022/6/9.
//
#include"backend_define.h"
#include<string>
#include<set>
#include <algorithm>

class BlockVariableSets {
    std::set<std::string> DefinedVariables, UsedVariables;

    bool judgeOperator(std::string op) {
        std::vector<std::string> operats = {"add", "addf", "sub", "subf", "mul", "mulf", "div", "divf", "mod"};
        for (auto i: operats) {
            if (op == i) return true;
        }
        return false;
    }

    void CalculateVariables(const CFG_node &cfgNode) {
        for (auto i = cfgNode.basic_block.begin(); i != cfgNode.basic_block.end(); i++) {
            if (judgeOperator(i->opera))
                if (!((i->org_1.name == "") || (i->org_2.name == ""))) { //target cannot be empty
                    if (UsedVariables.find(i->target.name) != UsedVariables.end() &&
                        DefinedVariables.find(i->org_1.name) != DefinedVariables.end() &&
                        DefinedVariables.find(i->org_1.name) != DefinedVariables.end()) {
                        UsedVariables.insert(i->org_1.name);
                        UsedVariables.insert(i->org_2.name);
                        DefinedVariables.insert(i->target.name);//optimize needed,O(n^2),slow
                    }
                }
        }
    }

};

class ActivityTab {
    std::set<std::string> ActiveVariables;
    std::set<std::string> DeadVariables;

    void AnalyzeActivity(const CFG_node &cfgNode) {

    }
};