//
// Created by 17619 on 2022/6/9.
//
#include"backend_define.h"
#include<string>
#include<set>

class BlockVariableSets{
    std::set<std::string> DefinedVariables;
    std::set<std::string> UsedVariables;
    void CalculateDefined(const BBList_node& bbListNode){

    }
    void CalculateUsed(const BBList_node& bbListNode){

    }
};

class ActivityTab{
    std::set<std::string> ActiveVariables;
    std::set<std::string> DeadVariables;
    void AnalyzeActivity(const CFG_node& cfgNode){

    }
};