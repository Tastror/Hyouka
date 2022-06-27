//
// Created by Simon on 2022/6/2.
//

#include "backend_define.h"
#include <iostream>





void CFG_node::print() const {

    std::cout << "str predecessor:";
    for (const auto& mem : str_predecessor) {
        std::cout << " " << mem;
    }
    std::cout << std::endl;

    std::cout << "predecessor:";
    for (const auto& mem : predecessor) {
        std::cout << " " << mem;
    }
    std::cout << std::endl;

    std::cout << "No." << index << ", " << name << ", " << this << std::endl;

    for (const auto& mem : content) {
        mem->print();
    }

    std::cout << "str successor:";
    for (const auto& mem : str_successor) {
        std::cout << " " << mem;
    }
    std::cout << std::endl;

    std::cout << "successor:";
    for (const auto& mem : successor) {
        std::cout << " " << mem;
    }
    std::cout << std::endl;
}

void CFG_list::print_all(const std::vector<CFG_PTR>& CFG_blocks_chain) {
    for (const auto& mem : CFG_blocks_chain) {
        mem->print();
        std::cout << std::endl;
    }
}

void CFG_list::print_all(const std::vector<std::vector<CFG_PTR>>& static_chain) {
    for (const auto& mem : static_chain) {
        std::cout << "## STATIC ## " << std::endl << std::endl;
        print_all(mem);
        std::cout << std::endl << std::endl;
    }
}

void CFG_list::print_all(const std::map<std::string, std::vector<CFG_PTR>>& function_chain) {
    for (const auto& [name, blocks_chain] : function_chain) {
        std::cout << "## FUNCTION ## " << name << std::endl << std::endl;
        print_all(blocks_chain);
        std::cout << std::endl << std::endl;
    }
}

void CFG_safe::RaiseError(const std::string &error_code) {
    std::cout << "CFG Error: " << error_code << std::endl;
    Safe::GlobalError = true;
}

void CFG_safe::RaiseWarning(const std::string& warning_code) {
    std::cout << "CFG Warning: " << warning_code << std::endl;
}





void IR_node_pro::print() const {
    std::cout << index << "\t";
    if (ir_type == ir_forth) {
        std::cout << "    ";
        if (opera == "jump" || opera == "call")
            std::cout << opera << " -> "
                      << target.to_string(false);
        else if (opera == "jumpe")
            std::cout << opera << " -> "
                      << target.to_string(false) << " if "
                      << org_1.to_string() << " *" << register_name_str[src1] << "* == zero";
        else if (opera == "jumpn")
            std::cout << opera << " -> "
                      << target.to_string(false) << " if "
                      << org_1.to_string() << " *" << register_name_str[src1] << "* != zero";
        else if (opera == "jumpr")
            std::cout << opera << " -> "
                      << target.to_string(false) << " *" << register_name_str[tar] << "*";
        else if (opera == "assign" || opera == "sw" || opera == "lw" ||
                 opera == "cast-int" || opera == "cast-float" ||
                 opera == "not" ||
                 opera == "alloc-static" || opera == "alloc-stack")
            std::cout << target.to_string() << " *" << register_name_str[tar] << "*" << " = "
                      << opera << ", "
                      << org_1.to_string() << " *" << register_name_str[src1] << "*";
        else
            std::cout << target.to_string() << " *" << register_name_str[tar] << "*" << " = "
                      << opera << ", "
                      << org_1.to_string() << " *" << register_name_str[src1] << "*" << ", "
                      << org_2.to_string() << " *" << register_name_str[src2] << "*";
    }
    else if (ir_type == ir_label) {
        std::cout << target.to_string(false) << ":";
    }
    std::cout << (comment.empty() ? "" : "\t# " + comment)  << std::endl;
}

void CFG_pro_node::print() const {

    std::cout << "str predecessor:";
    for (const auto& mem : str_predecessor) {
        std::cout << " " << mem;
    }
    std::cout << std::endl;

    std::cout << "predecessor:";
    for (const auto& mem : predecessor) {
        std::cout << " " << mem;
    }
    std::cout << std::endl;

    std::cout << "No." << index << ", " << name << ", " << this << std::endl;

    for (const auto& mem : content_pro) {
        mem->print();
    }

    std::cout << "str successor:";
    for (const auto& mem : str_successor) {
        std::cout << " " << mem;
    }
    std::cout << std::endl;

    std::cout << "successor:";
    for (const auto& mem : successor) {
        std::cout << " " << mem;
    }
    std::cout << std::endl;
}

void CFG_pro_list::print_all(const std::vector<CFG_pro_PTR>& CFG_pro_blocks_chain) {
    for (const auto& mem : CFG_pro_blocks_chain) {
        mem->print();
        std::cout << std::endl;
    }
}
void CFG_pro_list::print_all(const std::vector<std::vector<CFG_pro_PTR>>& static_chain) {
    for (const auto& mem : static_chain) {
        std::cout << "## STATIC ## " << std::endl << std::endl;
        print_all(mem);
        std::cout << std::endl << std::endl;
    }
}

void CFG_pro_list::print_all(const std::map<std::string, std::vector<CFG_pro_PTR>>& function_pro_chain) {
    for (const auto& [name, blocks_pro_chain] : function_pro_chain) {
        std::cout << "## FUNCTION ## " << name << std::endl << std::endl;
        print_all(blocks_pro_chain);
        std::cout << std::endl << std::endl;
    }
}





void ARM::print_all(const ARM_code_vec& ARM_code){
    std::cout << "TODO: print arm code" << std::endl;
}

void ARM::dump_all(const ARM_code_vec& ARM_code, const std::string& output_filename){
    std::cout << "TODO: dump arm code" << std::endl;
}