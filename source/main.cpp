#include "shell_input.h"
#include "Lex.h"
#include "AST.h"
#include "FrontOpt.h"
#include "IRGen.h"
#include "CFG.h"
#include "ActivityAnalysis.h"

#include <string>
#include <iostream>


int main(int argc, char **argv) {


    // shell

    std::string input_filename, output_filename, debug_mode, optimizer;
    bool to_assembly;
    shell_input(argc, argv, input_filename, output_filename, debug_mode, optimizer, to_assembly);
    if (debug_mode == "shell")
        std::cout << "input: " << input_filename << "\noutput: " << output_filename << "\ndebug: " << debug_mode
                  << "\nwhether to assembly = " << to_assembly << "\nwhich optimizer = " << optimizer << std::endl;

    if (Safe::GlobalError) return 1;


    /***************  frontend  ***************/


    // Lexical Analyze
    Lexical program_file(input_filename);
    program_file.Lexicalize();
    const TOKEN_PTR &token_head = program_file.head;
    if (debug_mode == "lex")
        token_node::print_all(token_head);

    if (Safe::GlobalError) return 1;

    // AST && Symbol_Table
    Symtable symtable;
    ProgramAST program(token_head, symtable);
    program.Parse();
    const AST_PTR &AST_head = program.head;
    if (debug_mode == "parse")
        AST_node::print_all(AST_head);
    if (debug_mode == "sym")
        Symtable::print_all();

    if (Safe::GlobalError) return 1;

    // Semantic Check && Frontend Optimize
    Front::Optimiser::Optimize(AST_head);
    const AST_PTR &optimized_AST_head = AST_head;
    if (debug_mode == "opt")
        AST_node::print_all(optimized_AST_head);
    if (debug_mode == "optsym")
        Symtable::print_all();

    if (Safe::GlobalError) return 1;

    // 4th-IR Generation
    IRGen ir_gen(optimized_AST_head);
    ir_gen.Generate();
    const IR_PTR &IR_head = ir_gen.head;
    if (debug_mode == "ir")
        IR_node::print_all(IR_head);

    if (Safe::GlobalError) return 1;


    /***************  backend  ***************/

    // Control Flow Graph
    CFG_builder cfg_builder(IR_head);
    cfg_builder.Generate();
    const std::vector<CFG_PTR > &cfg_list = cfg_builder.CFG_blocks_chain;
    if (debug_mode == "cfg")
        CFG_List::print_all(cfg_list);

    if (Safe::GlobalError) return 1;

    CFGActivityTab cfgActivityTab;
    cfgActivityTab.AnalyzeBlockVariables(cfg_builder.CFG_blocks_chain);
    if (debug_mode == "aa")
        CFGActivityTab::print_all(cfg_list);
    if (Safe::GlobalError) return 1;

    return 0;
} 
