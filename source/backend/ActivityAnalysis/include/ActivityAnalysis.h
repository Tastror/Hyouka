//
// Created by Shirone on 2022/6/9.
//
#pragma once
#include "backend_define.h"
#include <string>
#include <set>
#include <map>
#include <algorithm>

class BlockVariableFactory {

    static bool OperatorFilter1(const std::string &op) {
        /*This filters instruction: "alloca", "cast-float", "cast-int", "assign", "lw"*/
        const std::vector<std::string> operats = {"alloca", "cast-float", "cast-int", "assign", "lw"};
        return std::any_of(operats.begin(), operats.end(), [&op](const std::string &str) {
            return str == op;
        });
    }

    static bool OperatorFilter2(const std::string &op) {
        /*This filters instruction: "add", "addf", "sub", "subf", "mul", "mulf", "div", "divf", "mod"*/
        const std::vector<std::string> operats = {"add", "addf", "sub", "subf", "mul", "mulf", "div", "divf", "mod", "gr", "le", "not", "eq", "neq", "gre", "lee"};
        return std::any_of(operats.begin(), operats.end(), [&op](const std::string &str) {
            return str == op;
        });
    }

public:
    static std::map<int, bool> CFGChange;

    static void CalculateDefinedAndUsed(CFG_node &cfgNode);

    static void CalculateActivity(CFG_node &cfgNode);

    static bool change;

    static bool DetectChange() {
        if (CFGChange.empty()) {
            return true;
        } else {
            return std::any_of(CFGChange.begin(), CFGChange.end(), [](const std::pair<int, bool> &item) -> auto {
                return item.second;
            });
        }

    }
};

class CFGActivityTab {
public:
    void AnalyzeBlockVariables(std::vector<CFG_PTR>& cfg_block_chain);
    static void print_all(const std::map<std::string, std::vector<CFG_PTR>>& function_chain);
    static void print_all(const std::vector<std::shared_ptr<CFG_node>>& CFG_blocks_chain);
};

