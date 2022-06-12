//
// Created by Shirone on 2022/6/9.
//

#include"backend_define.h"
#include<string>
#include<set>
#include <algorithm>

class BlockVariableFactory {
    bool judgeOperator(std::string op) {
        std::vector<std::string> operats = {"add", "addf", "sub", "subf", "mul", "mulf", "div", "divf", "mod"};
        for (auto i: operats) {
            if (op == i) return true;
        }
        return false;
    }
public:
    std::set<std::string> DefinedVariables, usedVariables;
    void CalculateDefinedAndUsed(const CFG_node &cfgNode);
};

class CFGActivityTab {
public:
    void AnalyzeBlockVariables(CFG_LIST_PTR node);
    void Generate();
};

