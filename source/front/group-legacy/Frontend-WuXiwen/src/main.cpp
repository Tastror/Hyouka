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

// 声明 lexer 的输入, 以及 parser 函数
extern FILE *yyin;
extern int yyparse(unique_ptr<BaseAST> &ast);

int main(int argc, const char *argv[]) {
    /* usage below*/
    // ./compiler 模式 输入文件 -o 输出文件
    assert(argc == 5);
    auto mode = argv[1];
    auto input = argv[2];
    auto output = argv[4];

    // get token from src file
    yyin = fopen(input, "r");
    assert(yyin);
	
	//cout << "lexer ok" << endl;	//debug
    // parse input file
    unique_ptr<BaseAST> ast;
    auto ret = yyparse(ast);
    assert(!ret);
	
	//cout << "parser ok" << endl;	//debug
    // print AST 
    ast->Dump();
    cout << endl;
	
	//cout << "ast ok" << endl;	//debug
	
    return 0;

}
