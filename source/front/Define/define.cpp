//
// Created by Tastror on 2022/5/13.
//

#include "define.h"
#include <iostream>





// all will use

bool Safe::GlobalError = false;

std::string literal_value_storage::to_string() const {
    if (literal_type == literal_int)
        return std::to_string(literal_value.int_value);
    else if (literal_type == literal_float)
        return std::to_string(literal_value.double_value);
    else
        return "NaN";
}

std::string value_and_type_tuple::to_string(bool attribute) const{
    if (attribute)
        return "[" + basic_type_string_name[represent_type] + (is_pointer ? "*" : "") + "]" + literal_value.to_string();
    else
        return literal_value.to_string();
}

std::string value_and_type_tuple::type_to_string() const{
    return basic_type_string_name[represent_type] + (is_pointer ? "*" : "");
}

void value_and_type_tuple::assign_as(int x) {
    is_pointer = false;
    represent_type = basic_int;
    literal_value.literal_type = literal_int;
    literal_value.literal_value.int_value = x;
}

void value_and_type_tuple::assign_as(double x) {
    is_pointer = false;
    represent_type = basic_float;
    literal_value.literal_type = literal_float;
    literal_value.literal_value.double_value = x;
}

void value_and_type_tuple::stovt(const std::string& str) {
    if (str == "int") {
        is_pointer = false;
        represent_type = basic_int;
        literal_value.literal_type = literal_int;
    } else if (str == "float" || str == "double") {
        is_pointer = false;
        represent_type = basic_float;
        literal_value.literal_type = literal_float;
    } else if (str == "int*") {
        is_pointer = true;
        represent_type = basic_int;
        literal_value.literal_type = literal_int;
    } else if (str == "float*" || str == "double*") {
        is_pointer = true;
        represent_type = basic_float;
        literal_value.literal_type = literal_int;
    } else if (str == "function" || str == "function*") {
        is_pointer = true;
        represent_type = basic_function;
        literal_value.literal_type = literal_int;
    } else {
        // do nothing
    }
    // is pointer can be modified later
}

void value_and_type_tuple::self_float_to_int() {
    if (is_pointer || represent_type == basic_int)
        return;
    // represent_type == basic_float or basic_any
    represent_type = basic_int;
    if (literal_value.literal_type == literal_float) {
        literal_value.literal_type = literal_int;
        literal_value.literal_value.int_value = (int) literal_value.literal_value.double_value;
    }
}

void value_and_type_tuple::self_int_to_float() {
    if (is_pointer || represent_type == basic_float)
        return;
    // represent_type == basic_int or basic_any
    represent_type = basic_float;
    if (literal_value.literal_type == literal_int) {
        literal_value.literal_type = literal_float;
        literal_value.literal_value.double_value = (double) literal_value.literal_value.int_value;
    }
}

bool value_and_type_tuple::self_check() const {
    if (is_pointer && (literal_value.literal_type == literal_none || literal_value.literal_type == literal_int))
        return true;
    if (!is_pointer && represent_type == basic_any)
        return true;
    if (!is_pointer && represent_type == basic_int && (literal_value.literal_type == literal_none || literal_value.literal_type == literal_int))
        return true;
    if (!is_pointer && represent_type == basic_float && (literal_value.literal_type == literal_none || literal_value.literal_type == literal_float))
        return true;
    return false;
}




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
            std::cout << ", " << now->value_and_type.to_string();
        }
        std::cout << "\n";
        now = now->next;
    }
}





// Parsing: symtable_node

void symtable_node::rename() {
    std::string name_pre = std::to_string(table_id);
    if (is_head) only_name = "_[head]_" + name_pre + "_" + identifier_name;
    else only_name = "@" + name_pre + "_" + identifier_name;
}

void symtable_node::rename(const std::string& name) {
    identifier_name = name;
    std::string name_pre = std::to_string(table_id);
    if (is_head) only_name = "_[head]_" + name_pre + "_" + identifier_name;
    else only_name = "@" + name_pre + "_" + identifier_name;
}

void symtable_node::print(const std::shared_ptr<symtable_node>& symtable_node_head) {
    SYM_PTR now = symtable_node_head;
    while (now != nullptr) {
        if (now->is_head) std::cout << "[head] ";
        std::cout << "name: " << now->identifier_name;
        std::cout << ", only_name: " << now->only_name;
        std::cout << ", basic_type: " << now->value_and_type.type_to_string();
        if (now->value_and_type.is_pointer && now->value_and_type.represent_type == basic_function) {
            std::cout << ", function_pointer";
            std::cout << ", function_type: " << function_type_string_name[now->function_type];
            std::cout << ", arg_num: " << now->arg_num;
            if (now->arg_num > 0) {
                for (auto i : now->function_para_type)
                    std::cout << ", " << i.type_to_string();
            }
        } else if (now->value_and_type.is_pointer) {
            std::cout << ", array_pointer";
            std::cout << ", array_nest_num: " << now->array_nest_num;
        }
        if (now->is_const) std::cout << ", is_const";
        if (now->is_static) std::cout << ", is_static";
        if (now->treat_as_constexpr) std::cout << ", treat_as_constexpr, value_and_type = " << now->value_and_type.to_string();
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
    SYM_PTR sym_ptr = std::make_shared<symtable_node>();
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
            std::cout << ", basic_type: " << now->value_and_type.type_to_string();
        if (now->value_and_type.is_pointer && now->value_and_type.represent_type == basic_function) {
            std::cout << ", function_pointer";
            std::cout << ", function_type: " << function_type_string_name[now->function_type];
            std::cout << ", arg_num: " << now->arg_num;
        } else if (now->value_and_type.is_pointer) {
            std::cout << ", array_pointer";
            std::cout << ", array_nest_num: " << now->array_nest_num;
        }
        if (now->is_const) std::cout << ", is_const";
        if (now->is_static) std::cout << ", is_static";
    }
    if (now->type == Number || now->count_expr_ending) {
        if (now->count_expr_ending) std::cout << ", count_expr_ending";
        std::cout << ", " << now->value_and_type.to_string();
    }
    std::cout << (now->data.empty() ? "" : ", " + now->data);
    std::cout << (now->comment.empty() ? "" : " (" + now->comment + ")");
    // std::cout << "\t" << now << ", " << now->child << ", " << now->sister << ", " << now->last_child;
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
    value_and_type = symtable_resource_node->value_and_type;
    is_const = symtable_resource_node->is_const;
    is_static = symtable_resource_node->is_static;
    array_nest_num = symtable_resource_node->array_nest_num;
    arg_num = symtable_resource_node->arg_num;
    function_type = symtable_resource_node->function_type;
}

void  AST_node::copy(const std::shared_ptr<AST_node>& AST_resource_node) {
    type = AST_resource_node->type;
    data = AST_resource_node->data;
    comment = AST_resource_node->comment;
    symtable_ptr = AST_resource_node->symtable_ptr;

    using_attribute = AST_resource_node->using_attribute;
    name = AST_resource_node->name;
    only_name = AST_resource_node->only_name;
    value_and_type = AST_resource_node->value_and_type;
    is_const = AST_resource_node->is_const;
    is_static = AST_resource_node->is_static;
    array_nest_num = AST_resource_node->array_nest_num;
    arg_num = AST_resource_node->arg_num;
    function_type = AST_resource_node->function_type;

    count_expr_ending = AST_resource_node->count_expr_ending;

    declaration_bound_sym_node = AST_resource_node->declaration_bound_sym_node;
}

std::shared_ptr<symtable_node> AST_safe::search_id_name(const std::string& search_name, const std::shared_ptr<symtable_node>& sym_head) {
    if (sym_head == nullptr) return nullptr;
    std::shared_ptr<symtable_node> compare_now = sym_head->next;
    while (compare_now != nullptr) {
        if (compare_now->identifier_name == search_name)
            return compare_now;
        compare_now = compare_now->next;
    }
    return nullptr;
}

std::shared_ptr<symtable_node> AST_safe::search_id_name(const std::string& search_name, const std::shared_ptr<Symtable>& symtable_ptr, bool without_chain) {
    std::shared_ptr<symtable_node> res = nullptr;
    if (without_chain)
        res = search_id_name(search_name, symtable_ptr->my_head);
    else
        for (int i = (int)(symtable_ptr->heads_chain.size()) - 1; i >= 0; --i) {
            res = search_id_name(search_name, symtable_ptr->heads_chain[i]);
            if (res != nullptr) return res;
        }
    return res;
}

void AST_safe::RaiseError(const std::string& error_code, const std::shared_ptr<token_node>& token_node) {
    std::cout << "ERROR: " << error_code << std::endl;
    if (token_node != nullptr)
        std::cout << "    where: " << token_node->data
                  << " at line " << token_node->line << ", column "
                  << token_node->column << std::endl;
    else
        std::cout << "    where: reach the end of the file" << std::endl;
    Safe::GlobalError = true;
}

AST_tuple AST_safe::count_child_number(const std::shared_ptr<AST_node>& now_node) {
    if (now_node == nullptr) return (AST_tuple){0, false};
    AST_tuple res = {0, true};
    AST_PTR temp = now_node->child;
    while (temp != nullptr) {
        res.count++;
        if (!temp->count_expr_ending)
            res.judge = false;
        if (temp->declaration_bound_sym_node != nullptr) {
            if (temp->declaration_bound_sym_node->treat_as_constexpr) {
                res.judge = true;
                temp->value_and_type = temp->declaration_bound_sym_node->value_and_type;
            }
        }
        temp = temp->sister;
    }
    return res;
}

std::shared_ptr<symtable_node> AST_safe::search_only_name(const std::string& only_name) {
    for (int i = (int)(Symtable::all_symtable_heads.size()) - 1; i >= 0; --i) {
        std::shared_ptr<symtable_node> sym_head = Symtable::all_symtable_heads[i];
        if (sym_head == nullptr) continue;
        std::shared_ptr<symtable_node> compare_now = sym_head->next;
        while (compare_now != nullptr) {
            if (compare_now->only_name == only_name)
                return compare_now;
            compare_now = compare_now->next;
        }
    }
    return nullptr;
}





// Optimise

void AST_optimize_safe::RaiseError(const std::string& error_code) {
    std::cout << "AST Optimize ERROR: " << error_code << std::endl;
    Safe::GlobalError = true;
}





// IRGen

std::string IR_tuple::to_string(bool attribute) const {
    if (attribute)
        if (is_name)
            return "{name}[" + value_and_type.type_to_string() + "]" + name;
        else
            return value_and_type.to_string();
    else
        if (is_name)
            return name;
        else
            return value_and_type.to_string(false);
}

IR_tuple::IR_tuple() {
    is_name = true;
}

IR_tuple::IR_tuple(const std::string& str, basic_type type) {
    is_name = true;
    this->name = str;
    value_and_type.represent_type = type;
}

IR_tuple::IR_tuple(int int_num) {
    is_name = false;
    value_and_type.represent_type = basic_int;
    value_and_type.literal_value.literal_type = literal_int;
    value_and_type.literal_value.literal_value.int_value = int_num;
}

IR_tuple::IR_tuple(double double_num) {
    is_name = false;
    value_and_type.represent_type = basic_float;
    value_and_type.literal_value.literal_type = literal_float;
    value_and_type.literal_value.literal_value.double_value = double_num;
}

IR_tuple::IR_tuple(basic_type pointer_represent_type) {
    is_name = false;
    value_and_type.represent_type = pointer_represent_type;
    value_and_type.is_pointer = true;
    value_and_type.literal_value.literal_type = literal_int;
}

void IR_node::print_all(const std::shared_ptr<IR_node>& IR_head) {
    std::shared_ptr<IR_node> now = IR_head;
    if (now == nullptr) return;
    now = now->next;
    while (now != nullptr) {
        std::cout << now->index << "\t";
        if (now->ir_type == ir_forth) {
            std::cout << "    ";
            if (now->opera == "jump")
                std::cout << now->opera << " -> "
                          << now->target.to_string(false);
            else if (now->opera == "jumpe")
                std::cout << now->opera << " -> "
                          << now->target.to_string(false) << " if "
                          << now->org_1.to_string() << " == zero";
            else if (now->opera == "jumpn")
                std::cout << now->opera << " -> "
                          << now->target.to_string(false) << " if "
                          << now->org_1.to_string() << " != zero";
            else if (now->opera == "assign" || now->opera == "cast-int" || now->opera == "cast-float" || now->opera == "reverse")
                std::cout << now->target.to_string() << " = "
                          << now->opera << ", "
                          << now->org_1.to_string();
            else
                std::cout << now->target.to_string() << " = "
                          << now->opera << ", "
                          << now->org_1.to_string() << ", "
                          << now->org_2.to_string();
        }
        else if (now->ir_type == ir_label) {
            std::cout << now->target.to_string(false) << ":";
        }
        std::cout << (now->comment.empty() ? "" : "\t# " + now->comment)  << std::endl;
        now = now->next;
    }
}