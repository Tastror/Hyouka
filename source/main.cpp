#include "test.hpp"
#include "AST.hpp"

int main() {

    TNP token_head = get_token();
    print_all_tokens(token_head);

    ProgramAST program(token_head);
    program.Parse();
    ANP AST_head = program.head;
    print_all_ASTs(AST_head);

    return 0;
} 
