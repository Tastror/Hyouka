//
// Created by Shirone on 2022/6/9.
//
#pragma once
#include"backend_define.h"
#include<string>
#include<set>
#include<algorithm>

class BlockVariableFactory {

    static bool OperatorFilter(const std::string &op) {
        /*This filters instruction: jump, jumpe, jumpn, call*/
        const std::vector<std::string> operats = {"jump","jumpn","jumpe","call"};
        return std::none_of(operats.begin(), operats.end(), [&op](const std::string &str) {
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
    void AnalyzeBlockVariables(std::vector<CFG_PTR > &cfglist);

    static void print_all(const std::vector<std::shared_ptr<CFG_node>> &vector);
};

