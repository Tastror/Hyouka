//
// Created by Tastror on 2022/5/18.
//

#pragma once

#include "define.h"
#include "test.hpp"

#include <string>
#include <fstream>
#include <iostream>

class Lexical {
protected:
    std::ifstream ifs;
    bool fail;

public:
    TNP head;

    explicit Lexical(const std::string& input_filename) {
        head = nullptr;
        fail = false;
        ifs.open(input_filename, std::ios::in);
        if (!ifs.is_open()) {
            std::cout << "read fail." << std::endl;
            fail = true;
        }
    }

    void get_token() {
        if (fail) return;
        head = next(test_get_token());
    }

};
