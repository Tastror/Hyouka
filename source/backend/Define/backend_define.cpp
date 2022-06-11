//
// Created by Simon on 2022/6/2.
//

#include "backend_define.h"
#include <iostream>

void CFG_node::print_all(const std::shared_ptr<CFG_node>& CFG_head){
    std::shared_ptr<CFG_node> now = CFG_head;

    if(!now->successor.empty()){
        std::cout << "----CFG exist, print as follows:----" << std::endl;
        for(int i=0; i<now->successor.size(); i++) {
            now = now->successor[i];
            std::cout << "Basic_Block " << now->index << ":" << std::endl;
            for (int j = 0; j < now->basic_block.size(); j++) {

                if(now->basic_block[j].ir_type == ir_label) {
                    std::cout << j << "    ";
                    std::cout << now->basic_block[j].target.name << std::endl;
                }
                else {
                    std::cout << j << "\t";
                    std::cout << now->basic_block[j].opera << " ";
                    std::cout << now->basic_block[j].target.name << " ";
                    std::cout << now->basic_block[j].org_1.name << " ";
                    if(now->basic_block[j].org_2.is_name)
                        std::cout << now->basic_block[j].org_2.name;
                    else
                        std::cout << now->basic_block[j].org_2.to_string();
                    std::cout << std::endl;
                }
            }
        }
    } else{
        std::cout << "ERROR: CFG don't exist!!!" << std::endl;
    }
    return;
}

void CFG_List_node::print_all(const std::shared_ptr<CFG_List_node>& CFG_List_head){
    std::shared_ptr<CFG_List_node> now = CFG_List_head;

    if(now->next != nullptr){
        std::cout << "----CFG List exist, print as follows:----" << std::endl;
        while (now != nullptr){
            now = now->next;
            //CFG_node::print_all(*now->cfg); //FIXME
        }
    }
    else{
        std::cout << "ERROR: CFG List don't exist!!!" << std::endl;
    }
    return;
}