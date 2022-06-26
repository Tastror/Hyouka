//
// Created by Tastror on 2022/5/18.
//

#pragma once

#include "define.h"

#include <string>
#include <iostream>

void shell_input(int argc, char** argv, std::string& input_filename, std::string& output_filename, std::string& debug_mode, bool& optimize, bool& to_assembly) {
    int normal_index = 0;
    optimize = false; to_assembly = false;

    if (argc <= 1) {
        std::cout << std::endl
                  << std::endl
                  << "Welcome to use Hyouka Compiler!" << std::endl
                  << std::endl
                  << "Use" << std::endl
                  << "    compiler <file_name> [-o] [-S] <out_name> [-O1] [--debug <debug_mode>]" << std::endl
                  << "        where debug_mode can be shell, lex, parse, sym, opt, optsym, ir, cfg, aa, reg, arm" << std::endl
                  << std::endl
                  << std::endl;
    }

    for (int i = 1; i < argc; ++i) {
        std::string name(argv[i]);

        if (name.at(0) == '-') {

            // --xxx
            if (name.size() >= 2 && name.at(1) == '-') {
                std::string slash_name = name.substr(2);
                if (slash_name == "debug") {
                    i++;
                    if (i >= argc) return;
                    std::string debug_name(argv[i]);
                    debug_mode = debug_name;
                }
            }

            // -xxx
            else {
                std::string slash_name = name.substr(1);
                if (slash_name == "S") {
                    to_assembly = true;
                }
                else if (slash_name == "O1") {
                    optimize = true;
                }
                else if (slash_name == "o") {
                    // pass
                }
            }
        }

        else {
            switch (normal_index) {
                case 0:
                    input_filename = name; break;
                case 1:
                    output_filename = name; break;
                default: break;
            }
            normal_index++;
        }
    }
}
