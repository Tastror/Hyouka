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


    // shell

    // right input: compiler testcase.sysy -S -o testcase.s -O1
    // now input: hyouka <file_name> [-o] [-S] <out_name> [-O1] [--debug <identify_name>]
    // such as: hyouka ../demo.cpp -o -S ../demo.s -O1 --debug shell

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
    const TOKEN_PTR &token_head = program_file.head;
    if (debug_mode == "lex")
        token_node::print_all(token_head);

    if (Safe::GlobalError) return 0;

    // AST && Symbol_Table
    Symtable symtable;
    ProgramAST program(token_head, symtable);
    program.Parse();
    const AST_PTR &AST_head = program.head;
    if (debug_mode == "parse")
        AST_node::print_all(AST_head);
    if (debug_mode == "sym")
        Symtable::print_all();

    if (Safe::GlobalError) return 0;

    // Semantic Check && Frontend Optimize
    Front::Optimiser::Optimize(AST_head);
    const AST_PTR &optimized_AST_head = AST_head;
    if (debug_mode == "opt")
        AST_node::print_all(optimized_AST_head);
    if (debug_mode == "optsym")
        Symtable::print_all();

    if (Safe::GlobalError) return 0;

    // 4th-IR Generation
    IRGen ir_gen(optimized_AST_head);
    ir_gen.Generate();
    const IR_PTR &IR_head = ir_gen.head;
    if (debug_mode == "ir")
        IR_node::print_all(IR_head);

    if (Safe::GlobalError) return 0;


    /***************  backend  ***************/

    // Control Flow Graph
    CFG_builder cfg_builder(IR_head);
    cfg_builder.Generate();
    const auto& cfg_function_chain = cfg_builder.get_result_function_chain();
    auto cfg_mul_function_chain = cfg_builder.get_result_function_chain();
    if (debug_mode == "cfg")
        CFG_list::print_all(cfg_function_chain);

    if (Safe::GlobalError) return 0;

    // Live Variable Analysis
    CFGActivityTab cfgActivityTab;
    for (auto& [name, mul_block_chain] : cfg_mul_function_chain)
        cfgActivityTab.AnalyzeBlockVariables(mul_block_chain);
    if (debug_mode == "aa")
        CFGActivityTab::print_all(cfg_mul_function_chain);

    if (Safe::GlobalError) return 0;

//    ExpressionFactory expressionFactory;
//    expressionFactory.AnalyzeExpressions(cfg_builder.CFG_blocks_chain);
//    if (debug_mode == "aa"){
//        ExpressionFactory::print_all(cfg_list);
//        std::cout<<std::endl;
//    }
//
//    if (Safe::GlobalError) return 0;


    RegisterAllocator RegAllo(cfg_function_chain);
    RegAllo.Generate();
    if (debug_mode == "ra")
        CFG_pro_list::print_all(RegAllo.CFG_pro_function_chain);

    if (Safe::GlobalError) return 0;

    // Instruction Allocation
    // InstructionAllocator InsAllo(RegAllo.CFG_pro_blocks_chain);
    // InsAllo.Generate();
    // if (debug_mode == "arm")
    //     ARM_code::print_all(InsAllo.ARM_node_chain);

    // if (Safe::GlobalError) return 0;

    // Dump armv7 code to .s file
    //    if (to_assembly)   // FIXME: fixed
    //        ARM_code::dump_all(InsAllo.ARM_node_chain, output_filename);

    //  link .s and .a into exe:
    //        arm-linux-gnueabihf-gcc test.s libsysy.a -o test

    //  executed by qemu:
    //        qemu-arm -L /usr/arm-linux-gnueabihf/ ./test

    return 0;
} 
