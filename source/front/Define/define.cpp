//
// Created by Tastror on 2022/5/13.
//

#include "define.h"
#include <iostream>





// all will use

bool Safe::GlobalError = false;





// Lexical: token_node

std::shared_ptr<token_node> token_safe::next(const std::shared_ptr<token_node>& now) {
    if (now != nullptr)
        return now->next;
    return nullptr;
}

std::string token_safe::data(const std::shared_ptr<token_node>& node) {
    if (node != nullptr)
        return node->data;
    return "";
}

token_type token_safe::type(const std::shared_ptr<token_node>& now) {
    if (now != nullptr)
        return now->type;
    return NONE;
}

// only use in assign
bool token_safe::search_data(std::shared_ptr<token_node> now, const std::string& target, const std::string& end) {
    while (now != nullptr) {
        if (token_safe::data(now) == target)
            return true;
        if (token_safe::data(now) == end)
            return false;
        now = token_safe::next(now);
    }
    return false;
}

void token_node::print_all(const std::shared_ptr<token_node>& head) {
    std::shared_ptr<token_node> now(head);
    while (now != nullptr) {
        std::cout << token_type_string_name[now->type] << ", " << now->line << ", " << now->column << ", " << now->data;
        if (now->type == NUMBER) {
            std::cout << ", ";
            if (now->basic_type == 1) {
                std::cout  << "int: " << now->value.int_value;
            } else if (now->basic_type == 2) {
                std::cout  << "float: " << now->value.double_value;
            }
        }
        std::cout << "\n";
        now = now->next;
    }
}





// Parsing: symtable_node

void symtable_node::rename() {
    std::string name_pre = std::to_string(table_id);
    if (is_head) only_name = "__[head]_" + name_pre + "_" + identifier_name;
    else only_name = "__" + name_pre + "_" + identifier_name;
}

void symtable_node::rename(const std::string& name) {
    identifier_name = name;
    std::string name_pre = std::to_string(table_id);
    if (is_head) only_name = "__[head]_" + name_pre + "_" + identifier_name;
    else only_name = "__" + name_pre + "_" + identifier_name;
}

void symtable_node::print(const std::shared_ptr<symtable_node>& symtable_node_head) {
    SNP now = symtable_node_head;
    while (now != nullptr) {
        if (now->is_head) std::cout << "[head] ";
        std::cout << "name: " << now->identifier_name;
        std::cout << ", only_name: " << now->only_name;
        if (now->is_function_pointer) {
            std::cout << ", is_function_pointer";
            std::cout << ", function_type: " << function_type_string_name[now->function_type];
            std::cout << ", arg_num: " << now->arg_num;
        } else if (now->is_array_pointer) {
            std::cout << ", is_array_pointer";
            std::cout << ", basic_type: " << basic_type_string_name[now->basic_type];
            std::cout << ", array_nest_num: " << now->array_nest_num;
        } else {
            std::cout << ", is_basic_type";
            std::cout << ", basic_type: " << basic_type_string_name[now->basic_type];
        }
        if (now->is_const) std::cout << ", is_const";
        if (now->is_static) std::cout << ", is_static";
        std::cout << std::endl;
        now = now->next;
    }
}





// Parsing: Symtable

Symtable::Symtable() {
    table_id = table_counts;
    table_counts++;
    my_head = std::make_shared<symtable_node>();
    my_head->table_id = table_id;
    my_head->is_head = true;
    my_tail = my_head;
    heads_chain.push_back(my_head);
    all_symtable_heads.push_back(my_head);
}

void Symtable::extend_from(const std::shared_ptr<Symtable>& last_symtable_ptr) {
    heads_chain = last_symtable_ptr->heads_chain;
    heads_chain.push_back(my_head);
    sym_tail = last_symtable_ptr->sym_tail;
    sym_head = last_symtable_ptr->sym_head;
}

void Symtable::append(const symtable_node& append_sym_node) {
    SNP sym_ptr = std::make_shared<symtable_node>();
    *sym_ptr = append_sym_node;
    sym_ptr->table_id = table_id;
    sym_ptr->rename();
    my_tail->next = sym_ptr;
    my_tail = sym_ptr;
    my_tail->next = nullptr;
    sym_tail = my_tail;
}

void Symtable::print() const {
    symtable_node::print(my_head);
}

void Symtable::print_chain() const {
    for (auto& i : heads_chain) {
        symtable_node::print(i);
    }
}

void Symtable::print_all() {
    for (auto& i : Symtable::all_symtable_heads) {
        symtable_node::print(i);
        std::cout << std::endl;
    }
}





// Parsing: AST_node

void AST_node::print_all(const std::shared_ptr<AST_node>& now, int stage) {
    if (now == nullptr) return;
    for (int i = 0; i < stage; ++i)
        std::cout << "    ";
    std::cout << AST_type_string_name[now->type];
    if (now->using_attribute) {
        if (!now->only_name.empty())
            std::cout << ", only_name: " << now->only_name;
        if (now->is_function_pointer) {
            std::cout << ", is_function_pointer";
            std::cout << ", function_type: " << function_type_string_name[now->function_type];
            std::cout << ", arg_num: " << now->arg_num;
        } else if (now->is_array_pointer) {
            std::cout << ", is_array_pointer";
            std::cout << ", basic_type: " << basic_type_string_name[now->basic_type];
            std::cout << ", array_nest_num: " << now->array_nest_num;
        } else {
            std::cout << ", is_basic_type";
            std::cout << ", basic_type: " << basic_type_string_name[now->basic_type];
        }
        if (now->is_const) std::cout << ", is_const";
        if (now->is_static) std::cout << ", is_static";
    }
    if (now->type == Number || now->count_expr_ending) {
        if (now->count_expr_ending) std::cout << ", count_expr_ending";
        if (now->basic_type == 1) {
            std::cout  << ", int: " << now->value.int_value;
        } else if (now->basic_type == 2) {
            std::cout  << ", float: " << now->value.double_value;
        } else {
            std::cout << ", data: " << now->data;
        }
    }
    std::cout << (now->data.empty() ? "" : ", " + now->data);
    std::cout << (now->comment.empty() ? "" : " (" + now->comment + ")");
    std::cout << std::endl;
    print_all(now->child, stage + 1);
    print_all(now->sister, stage);
}

void AST_node::print_all(const std::shared_ptr<AST_node>& AST_head) {
    print_all(AST_head, 0);
}

void AST_node::connect_child(const std::shared_ptr<AST_node>& parent, const std::shared_ptr<AST_node>& child) {
    if (parent->child == nullptr) {
        parent->child = child;
        parent->last_child = child;
        // child->parent = parent;
    } else {
        parent->last_child->sister = child;
        parent->last_child = child;
        // child->parent = parent;
    }
}

void AST_node::reverse_connect_child(const std::shared_ptr<AST_node>& parent, const std::shared_ptr<AST_node>& child) {
    if (parent->child == nullptr) {
        parent->child = child;
        parent->last_child = child;
        // child->parent = parent;
    } else {
        child->sister = parent->child;
        parent->child = child;
        // child->parent = parent;
    }
}

void AST_node::absorb_sym_attribution(const std::shared_ptr<symtable_node>& symtable_resource_node) {
    using_attribute = true;
    name = symtable_resource_node->identifier_name;
    only_name = symtable_resource_node->only_name;
    basic_type = symtable_resource_node->basic_type;
    is_const = symtable_resource_node->is_const;
    is_static = symtable_resource_node->is_static;
    is_array_pointer = symtable_resource_node->is_array_pointer;
    is_function_pointer = symtable_resource_node->is_function_pointer;
    array_nest_num = symtable_resource_node->array_nest_num;
    arg_num = symtable_resource_node->arg_num;
    function_type = symtable_resource_node->function_type;
}

std::shared_ptr<symtable_node> AST_node::search_id_name(const std::string& search_name, const std::shared_ptr<symtable_node>& sym_head) {
    if (sym_head == nullptr) return nullptr;
    std::shared_ptr<symtable_node> compare_now = sym_head->next;
    while (compare_now != nullptr) {
        if (compare_now->identifier_name == search_name)
            return compare_now;
        compare_now = compare_now->next;
    }
    return nullptr;
}

std::shared_ptr<symtable_node> AST_node::search_id_name(const std::string& search_name) {
    std::shared_ptr<symtable_node> res = nullptr;
    for (int i = (int)(symtable_ptr->heads_chain.size()) - 1; i >= 0; --i) {
        res = search_id_name(search_name, symtable_ptr->heads_chain[i]);
        if (res != nullptr) return res;
    }
    return res;
}

void AST_safe::RaiseError(const std::string& error_code, const TNP& token_node) {
    std::cout << "ERROR: " << error_code << std::endl;
    if (token_node != nullptr)
        std::cout << "    where: " << token_node->data
                  << " at line " << token_node->line << ", column "
                  << token_node->column << std::endl;
    else
        std::cout << "    where: reach the end of the file" << std::endl;
    Safe::GlobalError = true;
}





void AST_optimize_safe::RaiseError(const std::string& error_code) {
    std::cout << "AST Optimize ERROR: " << error_code << std::endl;
    Safe::GlobalError = true;
}