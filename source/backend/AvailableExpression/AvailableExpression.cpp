//
// Created by Shirone on 2022/6/14.
//
#include <algorithm>
#include <iostream>
#include"AvailableExpression.h"

std::set<BackExpression> BackExpression::AllExpressions;
std::map<int,bool> ExpressionFactory::ExpressionChange;

void ExpressionFactory::CalculateAllValidExpression(std::vector<std::shared_ptr<CFG_node>> &cfglist) {
    for(auto i:cfglist){
        for(auto it:i->content){
            BackExpression::AllExpressions.emplace(BackExpression(*it));
        }
    }
    for(auto i:cfglist){
        i->out_expressions=BackExpression::AllExpressions;
    }
}

void ExpressionFactory::CalculateExpression(CFG_node &cfgNode) {
    ExpressionChange[cfgNode.index]=false;
    for(auto pre:cfgNode.predecessor){
        std::set_intersection(pre->out_expressions.begin(),pre->out_expressions.end(),cfgNode.in_expressions.begin(),cfgNode.in_expressions.end(),
                                                     std::inserter(cfgNode.in_expressions,cfgNode.in_expressions.begin()));
    }
    std::set<BackExpression> diff,newOUT;
    std::set_difference(cfgNode.in_expressions.begin(),cfgNode.in_expressions.end(),cfgNode.killed_expressions.begin(),cfgNode.killed_expressions.end(),
                        std::inserter(diff,diff.begin()));
    std::set_union(cfgNode.generated_expressions.begin(),cfgNode.generated_expressions.end(),diff.begin(),diff.end(),
                   std::inserter(newOUT,newOUT.begin()));
    if(newOUT!=cfgNode.out_expressions){
        cfgNode.out_expressions=newOUT;
        ExpressionChange[cfgNode.index]=true;
    }
}
void ExpressionFactory::CalculateGeneratedAndKilled(CFG_node &cfgNode) {
    //Generated Expressions
    for (auto i: cfgNode.content) {
        BackExpression expression = BackExpression(*i);
        cfgNode.generated_expressions.emplace(expression);
        for (auto it = cfgNode.generated_expressions.begin(); it != cfgNode.generated_expressions.end(); it++) {
            if (i->target.is_name && (i->target.name == expression.org_1 || i->target.name == expression.org_2)) {
                it = cfgNode.generated_expressions.erase(it);
            }
        }
    }
    //Killed Expressions
    for (auto i=cfgNode.content.begin(); i!=cfgNode.content.end();i++) {
        for (auto it = cfgNode.killed_expressions.begin(); it != cfgNode.killed_expressions.end(); it++) {
            if (*it == BackExpression(**i)) {
                it = cfgNode.killed_expressions.erase(it);
            }
            for(auto j=cfgNode.content.begin();j!=i;j++){
                if((*j)->org_2.name==(*i)->target.name){
                    cfgNode.killed_expressions.emplace(BackExpression(**j));
                }
                if((*j)->org_1.name==(*i)->target.name){
                    cfgNode.killed_expressions.emplace(BackExpression(**j));
                }
            }
        }
    }
}

void ExpressionFactory::AnalyzeExpressions(std::vector<std::shared_ptr<CFG_node>> &cfglist) {
    CalculateAllValidExpression(cfglist);
    for(auto node0:cfglist){
        CalculateGeneratedAndKilled(*node0);
    }
    while(DetectChange()){
        for(auto node:cfglist){
            CalculateExpression(*node);
        }
    }
}

void ExpressionFactory::print_all(const std::vector<CFG_PTR > &CFG_blocks_chain) {
    for (auto item: CFG_blocks_chain) {
        item->print();
        std::cout << "DefinedVariables:" << std::endl;
        for (auto i: item->defined_variables)
            std::cout << i << " ";
        std::cout << std::endl;
        std::cout << "UsedVariables:" << std::endl;
        for (auto i: item->used_variables)
            std::cout << i << " ";
        std::cout << std::endl;
        std::cout << "InVariables:" << std::endl;
        for (auto i: item->in_variables)
            std::cout << i << " ";
        std::cout << std::endl;
        std::cout << "OutVariables:" << std::endl;
        for (auto i: item->out_variables)
            std::cout << i << " ";
        std::cout << std::endl;
        std::cout<<"GeneratedExpressions:"<<std::endl;
        for(auto i:item->generated_expressions)
            std::cout<<i<<" ";
        std::cout<<std::endl;
        std::cout<<"KilledExpressions:"<<std::endl;
        for(auto i:item->killed_expressions)
            std::cout<<i<<" ";
        std::cout<<std::endl;
        std::cout<<"InExpressions:"<<std::endl;
        for(auto i:item->in_expressions)
            std::cout<<i<<" ";
        std::cout<<std::endl;
        std::cout<<"OutExpressions:"<<std::endl;
        for(auto i:item->out_expressions)
            std::cout<<i<<" ";
    }
}