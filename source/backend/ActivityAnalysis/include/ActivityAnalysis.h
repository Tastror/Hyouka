//
// Created by Shirone on 2022/6/9.
//

#include"backend_define.h"
#include<string>
#include<set>
#include <algorithm>

class BlockVariableSets {
    bool judgeOperator(std::string op) {
        std::vector<std::string> operats = {"add", "addf", "sub", "subf", "mul", "mulf", "div", "divf", "mod"};
        for (auto i: operats) {
            if (op == i) return true;
        }
        return false;
    }
public:
    std::set<std::string> DefinedVariables, UsedVariables;
    void CalculateVariables(const CFG_node &cfgNode);
};

class CFGActivityTab {
public:
    CFG_node cfgNode;
    BlockVariableSets blockVariableSets;
    void AnalyzeBlockVariables();
};

