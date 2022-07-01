//
// Created by simon on 22-5-21.
//

#include <cassert>
#include <cstdio>
#include <iostream>
#include <memory>
#include <string>

#include "../include/ast.h"

using namespace std;

extern FILE *yyin;
extern int yyparse(unique_ptr<BaseAST> &ast);

int main(int argc, const char *argv[]) {
    // ./compiler mode input_file -o output_file
    assert(argc == 5);
    std::string mode = argv[1];
    auto input = argv[2];
    auto output = argv[4];

    // get token from src file
    yyin = fopen(input, "r");
    assert(yyin);
	
    // parse input file
    unique_ptr<BaseAST> ast;
    auto ret = yyparse(ast);
    assert(!ret);
	
    if(mode == "AST"){
	    std::cout << "--------print AST--------" << std::endl;
	    ast->Dump();
	    std::cout << std::endl;
	    return 0;
    }
    
    // Ignore Semantic Check
<<<<<<< HEAD

=======
    
    // TODO: IR generation
>>>>>>> fc0aca1661d02371804f72c4a974a0bc159b022d
    if(mode == "IR"){
	    std::cout << "--------print IR--------" << std::endl;
	    std::cout << "TODO: IR generation!!!" << std::endl;
	    std::cout << std::endl;
	    return 0;
    }
	
    return 0;

}
