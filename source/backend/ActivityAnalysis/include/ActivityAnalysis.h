//
// Created by Shirone on 2022/6/9.
//

#include"backend_define.h"
#include<string>
#include<set>
#include <algorithm>

class BlockVariableFactory {
    static bool judgeOperator(std::string op) {
        std::vector<std::string> operats = {"add", "addf", "sub", "subf", "mul", "mulf", "div", "divf", "mod"};
        for (auto i: operats) {
            if (op == i) return true;
        }
        return false;
    }
public:
    //std::set<std::string> DefinedVariables, usedVariables;
    static void CalculateDefinedAndUsed(CFG_node &cfgNode);
};

class CFGActivityTab {
public:
    void AnalyzeBlockVariables(CFG_List_node &listHead);
    void Generate();
};

