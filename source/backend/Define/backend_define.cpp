//
// Created by Simon on 2022/6/2.
//

#include "backend_define.h"
#include <iostream>

void CFG_node::print_all(std::vector<CFG_node> cfg){

    if(cfg.size() == 0) {
        std::cout << "ERROR: CFG is empty!!!" << std::endl;
        return;
    }

    for (int i = 0; i<cfg.size(); i++){
        for (int j = 0; j<cfg[i].basic_block.size(); j++){
            std::cout << "TODO print" << std::endl;
        }
    }
}

void CFG_List_node::print_all(std::unordered_map<std::string, CFG_PTR> cfg_list){

    if(cfg_list.empty()){
        std::cout << "ERROR: CFG LIST is empty!!!";
        return;
    }

    for(auto it=cfg_list.begin();it!=cfg_list.end();it++){
        std::cout << it->first << ":" << std::endl;
        CFG_node::print_all(*it->second);
    }

}