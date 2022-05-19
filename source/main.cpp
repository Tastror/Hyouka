#include "shell_input.h"
#include "Lex.h"
#include "AST.h"

#include <string>
#include <iostream>

int main(int argc, char** argv) {

    std::string input_filename, output_filename, debug_mode, optimizer;
    bool to_assembly;
    shell_input(argc, argv, input_filename, output_filename, debug_mode, optimizer, to_assembly);
    if (input_filename.empty()) return 0;
    if (debug_mode == "shell")
        std::cout << "input: " << input_filename << "\noutput: " << output_filename << "\ndebug: " << debug_mode
                  << "\nwhether to assembly = " << to_assembly << "\nwhich optimizer = " << optimizer << std::endl;

    Lexical program_file(input_filename);
    program_file.get_token();
    const TNP& token_head = program_file.head;
    if (debug_mode == "lex")
        print_all_tokens(token_head);

    Symtable symtable;
    ProgramAST program(token_head, symtable);
    program.Parse();
    const ANP& AST_head = program.head;
    if (debug_mode == "parse")
        print_all_ASTs(AST_head);
    if (debug_mode == "sym")
        Symtable::print_all();

    return 0;
} 
