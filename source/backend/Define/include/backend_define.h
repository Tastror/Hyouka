//
// Created by Simon on 2022/6/2.
//

#pragma once

#include "define.h"

#include <string>
#include <vector>
#include <set>
#include <unordered_map>
#include <ostream>

struct BackExpression {
    static std::set<BackExpression> AllExpressions;
    std::string opera;
    std::string org_1, org_2;
    int index{};

    explicit BackExpression(const IR_node &node) {
        opera = node.opera;
        org_1 = node.org_1.name;
        org_2 = node.org_2.name;
        index = node.index;
    }

    BackExpression() = default;

    friend bool operator ==(const BackExpression &first, const BackExpression &second) {
        return (first.opera == second.opera && first.org_1 == second.org_1 && first.org_2 == second.org_2);
    }

    friend bool operator <(const BackExpression &first, const BackExpression &second) {
        if(first.opera+first.org_1+first.org_2<second.opera+second.org_1+second.org_2) return true;
        return false;
    }

    BackExpression& operator =(const BackExpression &target) = default;

    friend std::ostream &operator<<(std::ostream &os, const BackExpression &expression) {
        os << "opera: " << expression.opera << " org_1: " << expression.org_1 << " org_2: " << expression.org_2
           << " index: " << expression.index;
        return os;
    }
};

#define EXP_PTR std::shared_ptr<BackExpression>

struct CFG_node {
    int index = -1;
    std::string name;

    std::vector<IR_PTR> content;

    //For ActivityAnalysis
    std::set<std::string> in_variables;
    std::set<std::string> out_variables;
    std::set<std::string> used_variables;
    std::set<std::string> defined_variables;
    //End ActivityAnalysis

    //For ExpressionAnalysis
    std::set<BackExpression> in_expressions;
    std::set<BackExpression> out_expressions;
    std::set<BackExpression> generated_expressions;
    std::set<BackExpression> killed_expressions;
    //End ExpressionAnalysis

    // save linear index of other basic block in the cfg
    std::vector<std::string> str_predecessor;
    std::vector<std::string> str_successor;
    std::vector<std::shared_ptr<CFG_node>> predecessor;
    std::vector<std::shared_ptr<CFG_node>> successor;

    virtual void print() const;
};

#define CFG_PTR std::shared_ptr<CFG_node>

namespace CFG_list {
    void print_all(const std::vector<CFG_PTR> &CFG_blocks_chain_);
}

namespace CFG_safe {
    void RaiseError(const std::string &error_code);
    void RaiseWarning(const std::string &warning_code);
}

enum register_name {
    a1, a2, a3, a4,
    v1, v2, v3, v4, v5, v6, v7, v8,
    sb, ip, sp, lr, pc,
    R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15,
    no_name
};

const std::string register_name_str[] = {
        "a1", "a2", "a3", "a4",
        "v1", "v2", "v3", "v4", "v5", "v6", "v7", "v8",
        "sb", "ip", "sp", "lr", "pc",
        "R0", "R1", "R2", "R3", "R4", "R5", "R6", "R7",
        "R8","R9", "R10", "R11", "R12", "R13", "R14", "R15",
        "no_name"
};

struct IR_node_pro : public IR_node {
    register_name tar = no_name;
    register_name src1 = no_name;
    register_name src2 = no_name;
    void print() const override;
};

#define IRP_PTR std::shared_ptr<IR_node_pro>

struct CFG_pro_node : public CFG_node {
    std::vector<IRP_PTR> content_pro;
    void print() const override;
};

#define CFGP_PTR std::shared_ptr<CFG_pro_node>

namespace CFGP_list {
    void print_all(const std::vector<CFGP_PTR> &CFG_pro_blocks_chain_);
}

struct ARM_node : public CFG_pro_node {
    void print() const override;
    virtual void dump() const;
};

#define ARM_PTR std::shared_ptr<ARM_node>

namespace ARM_code {
    void print_all(const std::vector<ARM_PTR> &ARM_code_chain_);
}