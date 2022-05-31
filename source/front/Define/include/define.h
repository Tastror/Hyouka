//
// Created by Tastror on 2022/5/13.
//

#pragma once
#include <string>
#include <memory>
#include <vector>





// all will use

enum basic_type {
    basic_none = 0, basic_int, basic_float, basic_pointer
};

enum function_type {
    function_none = 0, function_int, function_float, function_void
};

const std::string basic_type_string_name[] = {
        "basic_none", "basic_int", "basic_float", "basic_pointer"
};

const std::string function_type_string_name[] = {
        "function_none", "function_int", "function_float", "function_void"
};

union int_double_storage {
    int int_value;
    double double_value = 0.0;
    int ptr_address_value;
};

struct value_tuple {
    basic_type type = basic_none;
    int_double_storage value;
    std::string to_string();
};

namespace Safe {
    extern bool GlobalError;
}





// Lexical: token_node

enum token_type {
    NONE, PUNCT, OPERAT, KEYWORD, NUMBER, IDENTI
};

const std::string token_type_string_name[] = {
    "NONE", "PUNCT", "OPERAT", "KEYWORD", "NUMBER", "IDENTI"
};

struct token_node {

    // basic
    int line = 0, column = 0;
    token_type type = NONE;
    std::string data;
    std::shared_ptr<token_node> next = nullptr;

    // attribute
    basic_type basic_type = basic_none;
    int_double_storage value;

    // print
    static void print_all(const std::shared_ptr<token_node>& head);
};

namespace token_safe {
    std::shared_ptr<token_node> next(const std::shared_ptr<token_node> &now);
    std::string data(const std::shared_ptr<token_node> &node);
    token_type type(const std::shared_ptr<token_node> &now);
    bool search_data(std::shared_ptr<token_node> now, const std::string& target, const std::string& end);
}

#define TOKEN_PTR std::shared_ptr<token_node>





// Parsing: symtable_node

struct symtable_node {

    // basic
    int table_id = -1;
    bool is_head = false;
    std::string identifier_name;
    std::shared_ptr<symtable_node> next = nullptr;

    // attribute
    std::string only_name;
    basic_type basic_type = basic_none;
    bool is_const = false;
    bool is_static = false;
    bool is_array_pointer = false;
    bool is_function_pointer = false;
    int array_nest_num = 0;
    int arg_num = 0;
    int function_type = function_none;

    // field, use for const
    int_double_storage value;
    bool treat_as_constexpr = false;

    // methods
    void rename();
    void rename(const std::string& name);

    // print
    static void print(const std::shared_ptr<symtable_node>& symtable_node_head);
};

#define SYM_PTR std::shared_ptr<symtable_node>





// Parsing: Symtable

class Symtable {
public:
    static std::vector<SYM_PTR> all_symtable_heads;
    std::vector<SYM_PTR> heads_chain;
    static int table_counts;
    int table_id;
    SYM_PTR sym_head = nullptr;
    SYM_PTR sym_tail = nullptr;
    SYM_PTR my_head = nullptr;
    SYM_PTR my_tail = nullptr;

    Symtable();
    virtual ~Symtable() = default;

    void extend_from(const std::shared_ptr<Symtable>& last_symtable_ptr);
    void append(const symtable_node& append_sym_node);

    void print() const;
    void print_chain() const;
    static void print_all();
};

#define SYMTABLE_PTR std::shared_ptr<Symtable>





// Parsing: AST_node

enum AST_type {
    None, ProgramBody,
    Number, Identifier, BasicType, FunctionType,
    Expression, FunctionUsage, ArrayUsage,
    BlockStatement, Statement, KeywordStatement,
    NormalStatement, DeclarationStatement,
    SingleAssignment, ArrayAssignment, ArrayInitialBlock,
    SingleDefinition, ArrayDefinition,
    FunctionDefinition,
    FunctionParams, FunctionFormParam,
};

const std::string AST_type_string_name[] = {
    "None", "ProgramBody",
    "Number", "Identifier", "BasicType", "FunctionType",
    "Expression", "FunctionUsage", "ArrayUsage",
    "BlockStatement", "Statement", "KeywordStatement",
    "NormalStatement", "DeclarationStatement",
    "SingleAssignment", "ArrayAssignment", "ArrayInitialBlock",
    "SingleDefinition", "ArrayDefinition",
    "FunctionDefinition",
    "FunctionParams", "FunctionFormParam",
};

struct AST_node {

    // normal
    AST_type type = None;
    std::string data;  // normally raw data; ExpressionAST use it for operator
    std::string comment;
    std::shared_ptr<AST_node> sister = nullptr;
    std::shared_ptr<AST_node> child = nullptr;
    // std::shared_ptr<AST_node> parent = nullptr; // don't use parent, or the pointer will form a loop
    std::shared_ptr<AST_node> last_child = nullptr;

    // symtable
    std::shared_ptr<Symtable> symtable_ptr = nullptr;

    // attribution (same as symtable node)
    bool using_attribute = false;
    std::string name;
    std::string only_name;
    basic_type basic_type = basic_none;
    bool is_const = false;
    bool is_static = false;
    bool is_array_pointer = false;
    bool is_function_pointer = false;
    int array_nest_num = 0;
    int arg_num = 0;
    int function_type = function_none;

    // use for Expr optimise
    bool count_expr_ending = false;

    // field, use for Number (same as token node)
    int_double_storage value;

    // declaration bound sym node
    std::shared_ptr<symtable_node> declaration_bound_sym_node = nullptr;

    // methods
    static void connect_child(const std::shared_ptr<AST_node>& parent, const std::shared_ptr<AST_node>& child);
    static void reverse_connect_child(const std::shared_ptr<AST_node>& parent, const std::shared_ptr<AST_node>& child);
    void absorb_sym_attribution(const std::shared_ptr<symtable_node>& symtable_resource_node);
    void copy(const std::shared_ptr<AST_node>& AST_resource_node);

    // print
    static void print_all(const std::shared_ptr<AST_node>& now, int stage);
    static void print_all(const std::shared_ptr<AST_node>& AST_head);
};

struct AST_tuple {
    int count;
    bool judge;
};

namespace AST_safe {
    void RaiseError(const std::string& error_code, const std::shared_ptr<token_node>& token_node);
    std::shared_ptr<symtable_node> search_id_name(const std::string& search_name, const std::shared_ptr<symtable_node>& sym_head);
    std::shared_ptr<symtable_node> search_id_name(const std::string& search_name, const std::shared_ptr<Symtable>& symtable_ptr, bool without_chain = false);
    std::shared_ptr<symtable_node> search_only_name(const std::string& only_name);
    AST_tuple count_child_number(const std::shared_ptr<AST_node>& now_node);
}

#define AST_PTR std::shared_ptr<AST_node>





// Optimise

namespace AST_optimize_safe {
    void RaiseError(const std::string& error_code);
}





// IRGen

enum IR_type {
    ir_forth, ir_label
};

struct IR_tuple {

    bool is_str;
    basic_type str_type;
    std::string str;
    value_tuple value;

    std::string to_string();

    IR_tuple();
    IR_tuple(const std::string& str);
    IR_tuple(int int_num);
    IR_tuple(double double_num);

};

struct IR_node {

    // basic
    int index = -1;
    IR_type ir_type = ir_label;
    std::shared_ptr<IR_node> next = nullptr;

    // normal
    std::string type_tar;
    IR_tuple target;

    // single: "jump"
    // double: "alloca", "cast-float", "cast-int", "assign", "jumpe", "jumpn"
    // triple: "add", "addf", "sub", "subf", "mul", "mulf", "div", "divf", "mod", "sll", "srl", "sra"
    std::string opera;

    std::string type_1;  // "void" "i32" "i32*" "float" "float*"
    IR_tuple org_1;

    std::string type_2;  // "void" "i32" "i32*" "float" "float*"
    IR_tuple org_2;

    // comment
    std::string comment;

    static void print_all(const std::shared_ptr<IR_node>& IR_head);
};

#define IR_PTR std::shared_ptr<IR_node>