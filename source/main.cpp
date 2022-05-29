#include "shell_input.h"
#include "Lex.h"
#include "AST.h"
#include "FrontOpt.h"

#include <string>
#include <iostream>

int main(int argc, char** argv) {

    std::string input_filename, output_filename, debug_mode, optimizer;
    bool to_assembly;
    shell_input(argc, argv, input_filename, output_filename, debug_mode, optimizer, to_assembly);
    if (debug_mode == "shell")
        std::cout << "input: " << input_filename << "\noutput: " << output_filename << "\ndebug: " << debug_mode
                  << "\nwhether to assembly = " << to_assembly << "\nwhich optimizer = " << optimizer << std::endl;

    Lexical program_file(input_filename);
    program_file.Lexicalize();
    const TNP& token_head = program_file.head;
    if (debug_mode == "lex")
        token_node::print_all(token_head);

    Symtable symtable;
    ProgramAST program(token_head, symtable);
    program.Parse();
    const ANP& AST_head = program.head;
    if (debug_mode == "parse")
        AST_node::print_all(AST_head);
    if (debug_mode == "sym")
        Symtable::print_all();

    Front::Optimiser::Optimize(program.head);
    const ANP& optimized_AST_head = program.head;
    if (debug_mode == "opt")
        AST_node::print_all(AST_head);

    return 0;
} 
