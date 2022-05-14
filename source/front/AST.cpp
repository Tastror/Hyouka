//
// Created by Tastror on 2022/5/11.
//

#include "include/AST.h"


void RaiseError(const std::string& error_code, const std::string& token_data) {
    std::cout << "ERROR: " << error_code << std::endl;
    std::cout << "    where: " << token_data << std::endl;
}

void connect_child(ANP parent, ANP child) {
    if (parent->child == nullptr) {
        parent->child = child;
        parent->last_child = child;
        child->parent = parent;
    } else {
        parent->last_child->sister = child;
        parent->last_child = child;
        child->parent = parent;
    }
}

void _print_all_ASTs(ANP now, int stage) {
    if (now == nullptr) return;
    for (int i = 0; i < stage; ++i)
        std::cout << "\t";
    std::cout << AST_show_type[now->type];
    if (now->type == Number)
        std::cout  << ", " <<
        ((now->int_or_double == 1) ? now->value.int_value : ((now->int_or_double == 2) ? now->value.double_value : 0));
    else
        std::cout << (now->data.empty() ? "" : ", " + now->data);
    std::cout << std::endl;
    _print_all_ASTs(now->child, stage + 1);
    _print_all_ASTs(now->sister, stage);
}

void print_all_ASTs(ANP AST_head) {
    _print_all_ASTs(AST_head, 0);
}


TNP ExpressionAST::Parse() {  // TBD
    head->type = Expression;

    GoNext();
    GoNext();
    GoNext();

    if (data(now_token) != "," && data(now_token) != ";" && data(now_token) != ")") {
        RaiseError("in Expression, lost punctuation [;] [,] or [)]", data(now_token));
        return now_token;
    }

    return now_token;
}


TNP SingleAssignmentAST::Parse() {
    head->type = SingleAssign;
    if (type(now_token) != RNAME) {
        RaiseError("in SingleAssignmentAST, beginning is not a valid name", data(now_token));
        return now_token;
    }
    GoNext();
    return now_token;
}


TNP ArrayAssignmentAST::Parse() {  // TBD
    head->type = SingleAssign;

    if (type(now_token) != RNAME) {
        RaiseError("in ArrayAssignmentAST, beginning is not a valid name", data(now_token));
        return now_token;
    }
    GoNext();

    return now_token;
}


TNP SingleDefinitionAST::Parse() {
    head->type = SingleDefinition;

    if (type(now_token) != RNAME) {
        RaiseError("in SingleDefinition, beginning is not a valid name", data(now_token));
        return now_token;
    }
    ANP var_name = new AST_node;
    connect_child(head, var_name);
    var_name->type = Identifier;
    var_name->data = now_token->data;
    GoNext();

    if (data(now_token) != "=") {
        RaiseError("in SingleDefinition, lost punctuation [=]", data(now_token));
        return now_token;
    }
    GoNext();

    ExpressionAST value_count(now_token);
    connect_child(head, value_count.head);
    now_token = value_count.Parse();
    look_ahead = next(now_token);

    if (data(now_token) != "," && data(now_token) != ";") {
        RaiseError("in SingleDefinition, lost punctuation [;] or [,]", data(now_token));
        return now_token;
    }

    return now_token;
}



TNP ArrayDefinitionAST::Parse() {  // TBD
    head->type = ArrayDefinition;
    if (type(now_token) != RNAME) {
        RaiseError("in ArrayDefinition, beginning is not a valid name", data(now_token));
        return now_token;
    }
    GoNext();
    return now_token;
}



TNP DeclarationStatementAST::Parse() {
    head->type = DeclarationStatement;

    if (data(now_token) != "const" && data(now_token) != "int" && data(now_token) != "float") {
        RaiseError("in DeclarationStatement, beginning is not [const] [int] or [float]", data(now_token));
        return now_token;
    }

    head->type = VariableDeclarationStatement;
    if (data(now_token) == "const") {
        head->type = ConstDeclarationStatement;
        GoNext();
    }

    if (data(now_token) != "int" && data(now_token) != "float") {
        RaiseError("in DeclarationStatement, type is not [int] or [float]", data(now_token));
        return now_token;
    }
    ANP var_type = new AST_node;
    connect_child(head, var_type);
    var_type->type = BasicType;
    var_type->data = now_token->data;
    GoNext();

    while (true) {

        if (type(now_token) == RNAME) {
            if (data(look_ahead) == "[") {
                ArrayDefinitionAST array_def(now_token);
                connect_child(head, array_def.head);
                now_token = array_def.Parse();
                look_ahead = next(now_token);
            } else {
                SingleDefinitionAST single_def(now_token);
                connect_child(head, single_def.head);
                now_token = single_def.Parse();
                look_ahead = next(now_token);
            }
        }

        else if (data(now_token) == ",") {
            GoNext();
            continue;
        }

        else if (data(now_token) == ";") {
            GoNext();
            break;
        }

        else {
            RaiseError("in DeclarationStatement, separate punctuation is not [,] or [;]", data(now_token));
            return now_token;
        }
    }
    return now_token;
}



TNP NormalStatementAST::Parse() {
    head->type = NormalStatement;

    if (type(now_token) == RNAME && data(look_ahead) == "=") {
        SingleAssignmentAST assi(now_token);
        connect_child(head, assi.head);
        now_token = assi.Parse();
        look_ahead = next(now_token);
    }

    else if (type(now_token) == RNAME && data(look_ahead) == "[") {
        ArrayAssignmentAST assi(now_token);
        connect_child(head, assi.head);
        now_token = assi.Parse();
        look_ahead = next(now_token);
    }

    else if (data(now_token) == "{") {
        BlockStatementAST block(now_token);
        connect_child(head, block.head);
        now_token = block.Parse();
        look_ahead = next(now_token);
    }

    else if (type(now_token) == KEYWORD) {  // TBD
        GoNext();
        GoNext();
        GoNext();
    }

    else if (type(now_token) == NUMBER || type(now_token) == RNAME) {
        ExpressionAST expr(now_token);
        connect_child(head, expr.head);
        now_token = expr.Parse();
        look_ahead = next(now_token);
        if (data(now_token) != ";") {
            RaiseError("in NormalStatement, lost punctuation [;]", data(now_token));
            return now_token;
        }
        GoNext();
    }

    else {
        RaiseError("in NormalStatement, begin with wrong sign", data(now_token));
        return now_token;
    }

    return now_token;
}



TNP BlockStatementAST::Parse() {
    head->type = BlockStatement;

    if (data(now_token) != "{") {
        RaiseError("in BlockStatement, beginning is not [{]", data(now_token));
        return now_token;
    }
    GoNext();

    while (true) {

        if (data(now_token) == "int" || data(now_token) == "float" ||
            data(now_token) == "const") {
            DeclarationStatementAST decl_stmt(now_token);
            connect_child(head, decl_stmt.head);
            now_token = decl_stmt.Parse();
            look_ahead = next(now_token);
        }

        else if (data(now_token) != "}" && now_token != nullptr) {
            NormalStatementAST norm_stmt(now_token);
            connect_child(head, norm_stmt.head);
            now_token = norm_stmt.Parse();
            look_ahead = next(now_token);
        }

        else if (data(now_token) == "}") {
            GoNext();
            break;
        }

        else {
            RaiseError("in BlockStatement, ending is not [}]", data(now_token));
            return now_token;
        }
    }

    return now_token;
}



TNP FunctionParamsAST::Parse() {  // TBD
    head->type = FunctionParams;
    if (data(now_token) == ")") {
        return now_token;
    }
    return now_token;
}



TNP FunctionDefinitionAST::Parse() {
    head->type = FunctionDefinition;

    if (data(now_token) != "int" && data(now_token) != "void" && data(now_token) != "float") {
        RaiseError("in FunctionDefinition, type is not [int] or [float] or [void]", data(now_token));
        return now_token;
    }
    ANP func_type = new AST_node;
    connect_child(head, func_type);
    func_type->type = FunctionType;
    func_type->data = data(now_token);
    GoNext();

    if (type(now_token) != RNAME) {
        RaiseError("in FunctionDefinition, function name is not a valid name", data(now_token));
        return now_token;
    }
    ANP func_name = new AST_node;
    connect_child(head, func_name);
    func_name->type = Identifier;
    func_name->data = data(now_token);
    GoNext();

    if (data(now_token) != "(") {
        RaiseError("in FunctionDefinition, lost punctuation [(]", data(now_token));
        return now_token;
    }
    GoNext();

    FunctionParamsAST func_para(now_token);
    connect_child(head, func_para.head);
    now_token = func_para.Parse();
    look_ahead = next(now_token);

    if (data(now_token) != ")") {
        RaiseError("in FunctionDefinition, lost punctuation [)]", data(now_token));
        return now_token;
    }
    GoNext();

    BlockStatementAST func_block(now_token);
    connect_child(head, func_block.head);
    func_block.head->data = "FunctionBlock";
    now_token = func_block.Parse();
    look_ahead = next(now_token);

    return now_token;
}



TNP ProgramAST::Parse() {
    head->type = ProgramBody;

    while (now_token != nullptr) {
        TNP look_next = next(look_ahead);

        if (data(now_token) == "void" ||
           ((data(now_token) == "int" || data(now_token) == "float")
            && data(look_next) == "(") ) {
            FunctionDefinitionAST func_def(now_token);
            connect_child(head, func_def.head);
            now_token = func_def.Parse();
            look_ahead = next(now_token);
        }

        else if (data(now_token) == "int" || data(now_token) == "float" ||
                 data(now_token) == "const") {
            DeclarationStatementAST stmt(now_token);
            connect_child(head, stmt.head);
            stmt.head->data = "static";
            now_token = stmt.Parse();
            look_ahead = next(now_token);
        }

        else {
            RaiseError("in ProgramAST, beginning must be a keyword [int] [float] [void] or [const]",
                       data(now_token));
            break;
        }
    }
    return now_token;
};
