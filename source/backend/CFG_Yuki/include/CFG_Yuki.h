//
// Created by Shirone on 2022/6/13.
//


#include "define.h"
#include <vector>
#include <map>

struct CFGBlock {
    IR_node entry;
    IR_node exit;
    std::vector<IR_node> irs;
    std::vector<int> successor;
    std::vector<int> predecessor;
    int index = -1;
};
#define CFGBlock_PTR std::shared_ptr<CFGBlock>

struct CFG {
    std::vector<CFGBlock> CFG;
    std::map<IR_node,int> lables;
    int size=0;
    void GenerateCFG(IR_PTR irptr);
};

