//
// Created by Shirone on 2022/6/13.
//


#include "define.h"
#include <vector>
#include <map>
#include <iostream>

struct CFGBlock {
    IR_node entry;
    IR_node exit;
    std::vector<IR_node> irs;
    std::vector<int> successor;
    std::vector<int> predecessor;
    static int index;
    CFGBlock(){
        index++;
    }
    void print_all(){
        std::cout<<"Block#"<<index<<std::endl;
        std::cout<<entry.opera<< std::endl;
        for(auto i : irs){
            std::cout<<i.opera<<std::endl;
        }
        std::cout<<exit.opera<<std::endl;
    }
};
#define CFGBlock_PTR std::shared_ptr<CFGBlock>

struct CFGListNode {
    std::vector<CFGBlock> CFGBlocks;
    std::string name;
    static int index;
    CFGListNode(){
        index++;
    }
    IR_PTR GenerateCFGBlock(IR_PTR irptr);
    void print_all();
};
#define CFGListNode_PTR std::shared_ptr<CFGListNode>

struct CFGList{
    std::vector<CFGListNode> CFGNodes;
    void GenerateCFGBlockList(IR_PTR irptr);
    void print_all();
};
