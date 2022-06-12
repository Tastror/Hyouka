//
// Created by Shirone on 2022/6/9.
//
#include "ActivityAnalysis.h"

void BlockVariableFactory::CalculateDefinedAndUsed(const CFG_node &cfgNode) {
    for (auto i = cfgNode.basic_block.begin(); i != cfgNode.basic_block.end(); i++) {
        if (judgeOperator(i->opera))
            if (!((i->org_1.name == "") || (i->org_2.name == ""))) { //target cannot be empty
                if (cfgNode.used_variables.find(i->target.name) != cfgNode.used_variables.end() &&
                    DefinedVariables.find(i->org_1.name) != DefinedVariables.end() &&
                    DefinedVariables.find(i->org_1.name) != DefinedVariables.end()) {
                    cfgNode.used_variables.insert(i->org_1.name);
                    cfgNode.used_variables.insert(i->org_2.name);
                    DefinedVariables.insert(i->target.name);//optimize needed,O(n^2),slow
                }
            }
    }
}

void CFGActivityTab::AnalyzeBlockVariables(CFG_LIST_PTR listNode) {

}