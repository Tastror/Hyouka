//
// Created by Shirone on 2022/6/14.
//
#include <map>
#include"backend_define.h"

struct ExpressionFactory {
    static std::map<int,bool> ExpressionChange;
    void CalculateGeneratedAndKilled(CFG_node &cfgNode);
    void CalculateExpression(CFG_node &cfgNode);
    void CalculateAllValidExpression(std::vector<CFG_PTR > &cfglist);
    void AnalyzeExpressions(std::vector<CFG_PTR> &cfglist);
    static bool DetectChange(){
        if(ExpressionChange.empty()) return true;
        else return std::any_of(ExpressionChange.begin(),ExpressionChange.end(),[](const std::pair<int,bool> &p) -> auto {
            return p.second;
        });
    }
    static void print_all(const std::vector<CFG_PTR > &CFG_blocks_chain);
};
