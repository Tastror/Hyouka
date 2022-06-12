//
// Created by Shirone on 2022/6/9.
//
#include "ActivityAnalysis.h"

void BlockVariableFactory::CalculateDefinedAndUsed(CFG_node &cfgNode) {
    for (auto i = cfgNode.basic_block.begin(); i != cfgNode.basic_block.end(); i++) {
        if (judgeOperator(i->opera))
            if (!((i->org_1.name == "") || (i->org_2.name == ""))) { //target cannot be empty
                if (cfgNode.used_variables.find(i->target.name) != cfgNode.used_variables.end() &&
                    cfgNode.defined_varibles.find(i->org_1.name) != cfgNode.defined_varibles.end() &&
                        cfgNode.defined_varibles.find(i->org_1.name) != cfgNode.defined_varibles.end()) {
                    cfgNode.used_variables.insert(i->org_1.name);
                    cfgNode.used_variables.insert(i->org_2.name);
                    cfgNode.defined_varibles.insert(i->target.name);//optimize needed,O(n^2),slow
                }
            }
    }
}

void CFGActivityTab::AnalyzeBlockVariables(CFG_List_node &listHead) {
    for(auto nowListNode= std::make_shared<CFG_List_node>(listHead);nowListNode;nowListNode=now->next){
        CFG_node &cfgNode=*nowListNode->cfg;

    }
}