//
// Created by Tastror on 2022/5/13.
//

#pragma once
#include <string>
#include <memory>
#include <vector>



// Lexical: token_node

enum token_type {
    NONE, PUNCT, OPERAT, KEYWORD, NUMBER, IDENTI
};

struct token_node {
    int line = 0, column = 0;
    token_type type = NONE;
    std::string data;
    int int_or_double = 0; // 1 is int, 2 is double, 0 is not use
    union int_double {
        int int_value;
        double double_value = 0.0;
    } value;
    std::shared_ptr<token_node> next = nullptr;
};

#define TNP std::shared_ptr<token_node>

std::shared_ptr<token_node> next(const std::shared_ptr<token_node>& now);
std::string data(const std::shared_ptr<token_node>& node);
token_type type(const std::shared_ptr<token_node>& now);

void print_all_tokens(const std::shared_ptr<token_node>& head);
bool search_data(std::shared_ptr<token_node> now, const std::string& target, const std::string& end);



// Parsing: symtable_node

enum sym_id_type { _id_none_, _single_value_, _array_, _function_ };
const std::string sym_id_show_type[] = { "id_none", "single_value", "array", "function" };
enum sym_return_type { _value_none_, _int_, _float_, _void_ };
const std::string sym_return_show_type[] = { "value_none", "int", "float", "void" };

struct symtable_node {
    std::string identifier_name;
    std::string only_name;
    bool is_head = false;
    sym_id_type id_type = _id_none_;
    sym_return_type value_type = _value_none_;
    int arg_num = 0;
    std::shared_ptr<symtable_node> arg_symtable_node_head = nullptr;
    bool is_const = false;
    bool is_static = false;
    int table_id = -1;
    std::shared_ptr<symtable_node> next = nullptr;
    void rename();
    void rename(const std::string& name);
};

#define SNP std::shared_ptr<symtable_node>

void print_symtable(const SNP& symtable_node_head);



// Parsing: Symtable

class Symtable {
public:
    static std::vector<SNP> all_symtable_heads;
    static int table_counts;
    int table_id;
    SNP sym_head = nullptr;
    SNP sym_tail = nullptr;
    SNP my_head = nullptr;
    SNP my_tail = nullptr;
    std::vector<SNP> heads_chain;

    Symtable() {
        table_id = table_counts;
        table_counts++;
        my_head = std::make_shared<symtable_node>();
        my_head->table_id = table_id;
        my_head->is_head = true;
        my_tail = my_head;
        heads_chain.push_back(my_head);
        all_symtable_heads.push_back(my_head);
    };

    void extend_from(const std::shared_ptr<Symtable>& last_symtable_ptr) {
        heads_chain = last_symtable_ptr->heads_chain;
        heads_chain.push_back(my_head);
        sym_tail = last_symtable_ptr->sym_tail;
        sym_head = last_symtable_ptr->sym_head;
    }

    void append(const symtable_node& append_sym_node) {
        SNP sym_ptr = std::make_shared<symtable_node>();
        *sym_ptr = append_sym_node;
        sym_ptr->table_id = table_id;
        sym_ptr->rename();
        my_tail->next = sym_ptr;
        my_tail = sym_ptr;
        my_tail->next = nullptr;
        sym_tail = my_tail;
    }

    void print_me() const {
        print_symtable(my_head);
    }

    void print_chain() const {
        for (auto& i : heads_chain) {
            print_symtable(i);
        }
    }

    static void print_all();

    virtual ~Symtable() = default;
};



// Parsing: AST_node

enum AST_type {
    None, ProgramBody,
    Number, Identifier, BasicType, FunctionType,
    Expression, FunctionUsage, ArrayUsage,
    BlockStatement, Statement, KeywordStatement,
    NormalStatement, DeclarationStatement,
    ConstDeclarationStatement, VariableDeclarationStatement,
    SingleAssignment, ArrayAssignment, ArrayInitialBlock,
    SingleDefinition, ArrayDefinition,
    FunctionDefinition,
    FunctionParams, FunctionFormParam,
};

const std::string AST_show_type[] = {
    "None", "ProgramBody",
    "Number", "Identifier", "BasicType", "FunctionType",
    "Expression", "FunctionUsage", "ArrayUsage",
    "BlockStatement", "Statement", "KeywordStatement",
    "NormalStatement", "DeclarationStatement",
    "ConstDeclarationStatement", "VariableDeclarationStatement",
    "SingleAssignment", "ArrayAssignment", "ArrayInitialBlock",
    "SingleDefinition", "ArrayDefinition",
    "FunctionDefinition",
    "FunctionParams", "FunctionFormParam",
};

struct AST_node {
    AST_type type = None;
    std::string data;
    int int_or_double = 0; // 1 is int, 2 is double, 0 is not use
    union int_double {
        int int_value;
        double double_value = 0.0;
    } value;
    std::shared_ptr<AST_node> sister = nullptr;
    std::shared_ptr<AST_node> child = nullptr;
    std::shared_ptr<AST_node> parent = nullptr;
    std::shared_ptr<AST_node> last_child = nullptr;
    std::shared_ptr<Symtable> symtable_ptr = nullptr;
};

#define ANP std::shared_ptr<AST_node>

void print_all_ASTs(const ANP& now, int stage);
void print_all_ASTs(const ANP& AST_head);


