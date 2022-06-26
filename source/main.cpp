#include "shell_input.h"
#include "Lex.h"
#include "AST.h"
#include "FrontOpt.h"
#include "IRGen.h"
#include "CFG.h"
#include "ActivityAnalysis.h"
#include "AvailableExpression.h"
#include "RegisterAllocate.h"
#include "InstructionAllocate.h"

#include <string>
#include <iostream>


int main(int argc, char **argv) {



    /***************  shell  ***************/


    // right input:
    //     compiler <file_name> [-S] [-o] <out_name> [-O1]
    // now input:
    //     compiler <file_name> [-S] [-o] <out_name> [-O1] [--debug <debug_mode>]
    // such as:
    //     compiler ../test/demo.cpp -S -o ../test/demo.s -O1 --debug shell

    std::string input_filename, output_filename, debug_mode;
    bool to_assembly, optimize;
    shell_input(argc, argv, input_filename, output_filename, debug_mode, optimize, to_assembly);
    if (debug_mode == "shell")
        std::cout << "input: " << input_filename << "\noutput: " << output_filename << "\ndebug: " << debug_mode
                  << "\nwhether to assembly = " << to_assembly << "\nwhether to optimize = " << optimize << std::endl;
    if (input_filename.empty()) return 0;
    if (Safe::GlobalError) return 0;



    /***************  frontend  ***************/


    // Lexical Analyze
    Lexical program_file(input_filename);
    program_file.Lexicalize();
    const TOKEN_PTR& token_head = program_file.head;
    if (debug_mode == "lex")
        token_node::print_all(token_head);

    if (Safe::GlobalError) return 0;


    // AST && Symbol_Table
    Symtable symtable;
    ProgramAST program(token_head, symtable);
    program.Parse();
    const AST_PTR& AST_head = program.head;
    if (debug_mode == "parse")
        AST_node::print_all(AST_head);
    if (debug_mode == "sym")
        Symtable::print_all();

    if (Safe::GlobalError) return 0;


    // Semantic Check && Frontend Optimize
    Front::Optimiser::Optimize(AST_head);
    const AST_PTR& optimized_AST_head = AST_head;
    if (debug_mode == "opt")
        AST_node::print_all(optimized_AST_head);
    if (debug_mode == "optsym")
        Symtable::print_all();

    if (Safe::GlobalError) return 0;


    // 4th-IR Generation
    IRGen ir_gen(optimized_AST_head);
    ir_gen.Generate();
    const IR_PTR& IR_head = ir_gen.head;
    if (debug_mode == "ir")
        IR_node::print_all(IR_head);

    if (Safe::GlobalError) return 0;



    /***************  backend  ***************/


    // Control Flow Graph
    CFG_builder cfg_builder(IR_head);
    cfg_builder.Generate();
    auto cfg_mul_function_chain = cfg_builder.get_result_function_chain();
    if (debug_mode == "cfg")
        CFG_list::print_all(cfg_mul_function_chain);

    if (Safe::GlobalError) return 0;


    // Live Variable Analysis
    CFGActivityTab cfgActivityTab;
    for (auto& [name, mul_block_chain] : cfg_mul_function_chain)
        cfgActivityTab.AnalyzeBlockVariables(mul_block_chain);
    if (debug_mode == "aa")
        CFGActivityTab::print_all(cfg_mul_function_chain);

    if (Safe::GlobalError) return 0;


    // Register Allocation
    RegisterAllocator RegAllo(cfg_mul_function_chain);
    RegAllo.Generate();
    const auto& reg_pro_function_chain = RegAllo.get_result_pro_function_chain();
    if (debug_mode == "reg")
        CFG_pro_list::print_all(RegAllo.get_result_pro_function_chain());

    if (Safe::GlobalError) return 0;


    // Instruction Allocation
    InstructionAllocator InsAllo(reg_pro_function_chain);
    InsAllo.Generate();
    if (debug_mode == "arm")
         ARM_node::print_all(InsAllo.ARM_node_chain);

    if (Safe::GlobalError) return 0;


    // Dump armv7 code to .s file
    if (to_assembly)
        ARM_node::dump_all(InsAllo.ARM_node_chain, output_filename);


    //  link .s and .a into exe:
    //        arm-linux-gnueabihf-gcc test.s libsysy.a -o test

    //  executed by qemu:
    //        qemu-arm -L /usr/arm-linux-gnueabihf/ ./test


    return 0;
} 
