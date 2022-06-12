//
// Created by Shirone on 2022/6/9.
//
#include <map>
#include "ActivityAnalysis.h"

namespace Shirone{
    std::map<int,bool> CFGChange;
    bool DetectChange(){
        for(auto i : CFGChange){
            if(i.second==true){
                return true;
            }
        }
        return false;
    }
    void GenerateDefinedAndUsed(CFG_node &cfgNode){
        BlockVariableFactory::CalculateDefinedAndUsed(cfgNode);
        for(auto suc:cfgNode.successor){
            GenerateDefinedAndUsed(*suc);
        }
    }
    void CalculateActivity(CFG_node &cfgNode){
        if(DetectChange()){
            for(auto suc:cfgNode.successor){
                cfgNode.out_variables.insert(suc->in_variables.begin(),suc->in_variables.end());
                std::set<std::string> difference;
                std::set_difference(cfgNode.out_variables.begin(),cfgNode.out_variables.end(),cfgNode.defined_varibles.begin(),cfgNode.defined_varibles.end(),
                                    std::inserter(difference,difference.begin()));
                CFGChange[cfgNode.index]=false;
                for(auto i : cfgNode.used_variables){
                    if(cfgNode.in_variables.emplace(i).second){
                        CFGChange[cfgNode.index]=true;
                    };
                }
                for(auto i : difference){
                    if(cfgNode.in_variables.emplace(i).second){
                        CFGChange[cfgNode.index]=true;
                    };
                }
                CalculateActivity(*suc);
            }
        }
    }
}

void BlockVariableFactory::CalculateDefinedAndUsed(CFG_node &cfgNode) {
    for (auto i = cfgNode.basic_block.begin(); i != cfgNode.basic_block.end(); i++) {
        if (judgeOperator(i->opera))
            if (!((i->org_1.name == "") || (i->org_2.name == ""))) { //target cannot be empty
                if (cfgNode.used_variables.find(i->target.name) != cfgNode.used_variables.end() &&
                    cfgNode.defined_variables.find(i->org_1.name) != cfgNode.defined_variables.end() &&
                        cfgNode.defined_variables.find(i->org_1.name) != cfgNode.defined_variables.end()) {
                    cfgNode.used_variables.insert(i->org_1.name);
                    cfgNode.used_variables.insert(i->org_2.name);
                    cfgNode.defined_variables.insert(i->target.name);//optimize needed,O(n^2),slow
                }
            }
    }
}

void CFGActivityTab::AnalyzeBlockVariables(CFG_List_node &listHead) {
    for(auto nowListNode= std::make_shared<CFG_List_node>(listHead);nowListNode;nowListNode=nowListNode->next){
        CFG_node &cfgNode=*nowListNode->cfg;
        Shirone::GenerateDefinedAndUsed(cfgNode);
        Shirone::CalculateActivity(cfgNode);
    }
}