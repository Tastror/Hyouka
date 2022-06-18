//
// Created by Tastror on 2022/5/18.
//

#pragma once

#include "define.h"

#include "cmdline.h"
#include <string>
#include <iostream>

void shell_input(int argc, char** argv, std::string& input_filename, std::string& output_filename, std::string& debug_mode, std::string& optimizer, bool& to_assembly) {
    cmdline::parser cmd_parser;
    cmd_parser.footer(
            "filename\n"
            "       filename can be put right after exe path, such as \"hyouka demo.cpp\"\n"
            "examples: hyouka demo.cpp -S -o demo.s  # -o default is output.s\n"
            "          hyouka demo.cpp --debug lex  # --debug default is none,\n"
            "          hyouka demo.cpp -S -o demo.s -O 1  # optimizer can use -O 0 or -O 1");
    cmd_parser.add<std::string>("out", 'o', "output file name, for example demo.s",
                                false, "output.s");
    cmd_parser.add<std::string>("debug", 'd', "use to cut down at: shell, lex, parse, sym, opt, optsym, ir, cfg",
                                false, "none",
                                cmdline::oneof<std::string>("shell", "lex", "parse", "sym", "opt", "optsym", "ir", "cfg","aa","exp", "none"));
    cmd_parser.add("only-to-assembly", 'S', "only compile to assembly");
    cmd_parser.add<std::string>("optimizer", 'O', "optimizer, use 0 or 1",
                                false, "0",
                                cmdline::oneof<std::string>("0", "1"));
    cmd_parser.parse_check(argc, argv);
    if (cmd_parser.rest().size() != 1) {
        if (cmd_parser.rest().empty())
            std::cout << "missing filename" << std::endl;
        else
            std::cout << "have too much arguments" << std::endl;
        std::cout << cmd_parser.usage();
    } else
        input_filename = cmd_parser.rest()[0];
    output_filename = cmd_parser.get<std::string>("out");
    debug_mode = cmd_parser.get<std::string>("debug");
    to_assembly = cmd_parser.exist("only-to-assembly");
    optimizer = cmd_parser.get<std::string>("optimizer");
    if (input_filename.empty()) Safe::GlobalError = true;
}
