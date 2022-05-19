//
// Created by Tastror on 2022/5/11.
//

#include "AST.h"
#include "AST_expr.h"
#include "AST_keystmt.h"

bool GlobalError = false;
std::vector<SNP> Symtable::all_symtable_heads;

bool BaseAST::UpdateError() {
    return (error = GlobalError);
}

void RaiseError(const std::string& error_code, const TNP& token_node) {
    std::cout << "ERROR: " << error_code << std::endl;
    if (token_node != nullptr)
        std::cout << "    where: " << token_node->data
                  << " at line " << token_node->line << ", column "
                  << token_node->column << std::endl;
    else
        std::cout << "    where: reach the end of the file" << std::endl;
    GlobalError = true;
}

void connect_child(const ANP& parent, const ANP& child) {
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

void reverse_connect_child(const ANP& parent, const ANP& child) {
    if (parent->child == nullptr) {
        parent->child = child;
        parent->last_child = child;
        child->parent = parent;
    } else {
        child->sister = parent->child;
        parent->child = child;
        child->parent = parent;
    }
}

TNP SingleAssignmentAST::Parse() {
    head->type = SingleAssignment;

    if (type(now_token) != IDENTI) {
        RaiseError("in SingleAssignment, beginning is not a valid name", now_token);
        return now_token;
    }
    ANP var_name = std::make_shared<AST_node>();
    connect_child(head, var_name);
    var_name->type = Identifier;
    var_name->data = now_token->data;
    GoNext();

    if (data(now_token) != "=") {
        RaiseError("in SingleAssignment, lost punctuation [=]", now_token);
        return now_token;
    }
    GoNext();

    ExpressionAST expr(now_token, symtable);
    connect_child(head, expr.head);
    expr.head->data = "value";
    now_token = expr.Parse();
    next_token = next(now_token);

    // meddle check, may cause error, could be removed
    if (data(now_token) != "," && data(now_token) != ";") {
        RaiseError("in SingleAssignment, lost punctuation [;] or [,]", now_token);
        return now_token;
    }

    return now_token;
}


TNP ArrayAssignmentAST::Parse() {
    head->type = ArrayAssignment;

    if (type(now_token) != IDENTI) {
        RaiseError("in ArrayAssignment, beginning is not a valid name", now_token);
        return now_token;
    }
    ANP var_name = std::make_shared<AST_node>();
    connect_child(head, var_name);
    var_name->type = Identifier;
    var_name->data = now_token->data;
    GoNext();

    if (data(now_token) != "[") {
        RaiseError("in ArrayAssignment, lost punctuation [[]", now_token);
        return now_token;
    }
    GoNext();

    ExpressionAST index(now_token, symtable);
    connect_child(head, index.head);
    index.head->data = "index";
    now_token = index.Parse();
    next_token = next(now_token);

    if (data(now_token) != "]") {
        RaiseError("in ArrayAssignment, lost punctuation []]", now_token);
        return now_token;
    }
    GoNext();

    while (data(now_token) == "[") {
        GoNext();

        ExpressionAST index_addi(now_token, symtable);
        connect_child(head, index_addi.head);
        index_addi.head->data = "index";
        now_token = index_addi.Parse();
        next_token = next(now_token);

        if (data(now_token) != "]") {
            RaiseError("in ArrayAssignment, lost punctuation []]", now_token);
            return now_token;
        }
        GoNext();
    }

    if (data(now_token) != "=") {
        RaiseError("in ArrayAssignment, lost punctuation [=]", now_token);
        return now_token;
    }
    GoNext();

    ExpressionAST expr(now_token, symtable);
    connect_child(head, expr.head);
    expr.head->data = "value";
    now_token = expr.Parse();
    next_token = next(now_token);

    // meddle check, may cause error, could be removed
    if (data(now_token) != "," && data(now_token) != ";") {
        RaiseError("in ArrayAssignment, lost punctuation [;] or [,]", now_token);
        return now_token;
    }

    return now_token;
}


TNP SingleDefinitionAST::Parse() {
    head->type = SingleDefinition;

    if (type(now_token) != IDENTI) {
        RaiseError("in SingleDefinition, beginning is not a valid name", now_token);
        return now_token;
    }
    ANP var_name = std::make_shared<AST_node>();
    connect_child(head, var_name);
    var_name->type = Identifier;
    var_name->data = now_token->data;
    GoNext();

    if (data(now_token) == "=") {
        GoNext();

        ExpressionAST expr(now_token, symtable);
        connect_child(head, expr.head);
        expr.head->data = "value";
        now_token = expr.Parse();
        next_token = next(now_token);
    }

    // meddle check, may cause error, could be removed
    if (data(now_token) != "," && data(now_token) != ";") {
        RaiseError("in SingleDefinition, lost punctuation [;] or [,]", now_token);
        return now_token;
    }

    return now_token;
}


TNP ArrayInitialBlockAST::Parse() {
    head->type = ArrayInitialBlock;

    if (data(now_token) != "{") {
        RaiseError("in ArrayInitialBlock, lost punctuation [{]", now_token);
        return now_token;
    }
    GoNext();

    if (data(now_token) == "}") {
        GoNext();
        return now_token;
    }

    else if (data(now_token) == "{") {
        ArrayInitialBlockAST recur_array_init(now_token, symtable);
        connect_child(head, recur_array_init.head);
        now_token = recur_array_init.Parse();
        next_token = next(now_token);
    }

    else {
        ExpressionAST index(now_token, symtable);
        connect_child(head, index.head);
        index.head->data = "value";
        now_token = index.Parse();
        next_token = next(now_token);
    }

    while (true) {

        if (data(now_token) == "}") {
            GoNext();
            break;
        }

        else if (data(now_token) != ",") {
            RaiseError("in ArrayInitialBlock, punctuation should be [{] or [,]", now_token);
            return now_token;
        }
        GoNext();

        if (data(now_token) == "{") {
            ArrayInitialBlockAST recur_array_init(now_token, symtable);
            connect_child(head, recur_array_init.head);
            now_token = recur_array_init.Parse();
            next_token = next(now_token);
        }

        else {
            ExpressionAST index(now_token, symtable);
            connect_child(head, index.head);
            index.head->data = "value";
            now_token = index.Parse();
            next_token = next(now_token);
        }

    }

    return now_token;
}


TNP ArrayDefinitionAST::Parse() {
    head->type = ArrayDefinition;

    if (type(now_token) != IDENTI) {
        RaiseError("in ArrayAssignment, beginning is not a valid name", now_token);
        return now_token;
    }
    ANP var_name = std::make_shared<AST_node>();
    connect_child(head, var_name);
    var_name->type = Identifier;
    var_name->data = now_token->data;
    GoNext();

    if (data(now_token) != "[") {
        RaiseError("in ArrayAssignment, lost punctuation [[]", now_token);
        return now_token;
    }
    GoNext();

    ExpressionAST index(now_token, symtable);
    connect_child(head, index.head);
    index.head->data = "index";
    now_token = index.Parse();
    next_token = next(now_token);

    if (data(now_token) != "]") {
        RaiseError("in ArrayAssignment, lost punctuation []]", now_token);
        return now_token;
    }
    GoNext();

    while (data(now_token) == "[") {
        GoNext();

        ExpressionAST index_addi(now_token, symtable);
        connect_child(head, index_addi.head);
        index_addi.head->data = "index";
        now_token = index_addi.Parse();
        next_token = next(now_token);

        if (data(now_token) != "]") {
            RaiseError("in ArrayAssignment, lost punctuation []]", now_token);
            return now_token;
        }
        GoNext();
    }

    if (data(now_token) == "=") {
        GoNext();

        ArrayInitialBlockAST array_init(now_token, symtable);
        connect_child(head, array_init.head);
        now_token = array_init.Parse();
        next_token = next(now_token);
    }

    // meddle check, may cause error, could be removed
    if (data(now_token) != "," && data(now_token) != ";") {
        RaiseError("in SingleDefinition, lost punctuation [;] or [,]", now_token);
        return now_token;
    }

    return now_token;
}


TNP DeclarationStatementAST::Parse() {
    head->type = DeclarationStatement;

    if (data(now_token) != "const" && data(now_token) != "int" && data(now_token) != "float") {
        RaiseError("in DeclarationStatement, beginning is not [const] [int] or [float]", now_token);
        return now_token;
    }

    head->type = VariableDeclarationStatement;
    if (data(now_token) == "const") {
        head->type = ConstDeclarationStatement;
        GoNext();
    }

    if (data(now_token) != "int" && data(now_token) != "float") {
        RaiseError("in DeclarationStatement, type is not [int] or [float]", now_token);
        return now_token;
    }
    ANP var_type = std::make_shared<AST_node>();
    connect_child(head, var_type);
    var_type->type = BasicType;
    var_type->data = now_token->data;
    GoNext();

    if (type(now_token) == IDENTI) {
        if (data(next_token) == "[") {
            ArrayDefinitionAST array_def(now_token, symtable);
            connect_child(head, array_def.head);
            now_token = array_def.Parse();
            next_token = next(now_token);
        } else {
            SingleDefinitionAST single_def(now_token, symtable);
            connect_child(head, single_def.head);
            now_token = single_def.Parse();
            next_token = next(now_token);
        }
    }

    else {
        RaiseError("in DeclarationStatement, missing identify name", now_token);
        return now_token;
    }

    while (true) {

        if (data(now_token) == ";") {
            GoNext();
            break;
        }

        else if (data(now_token) == ",") {
            GoNext();
        }

        else {
            RaiseError("in DeclarationStatement, separate punctuation should be [,]", now_token);
            return now_token;
        }

        if (type(now_token) == IDENTI) {
            if (data(next_token) == "[") {
                ArrayDefinitionAST array_def(now_token, symtable);
                connect_child(head, array_def.head);
                now_token = array_def.Parse();
                next_token = next(now_token);
            } else {
                SingleDefinitionAST single_def(now_token, symtable);
                connect_child(head, single_def.head);
                now_token = single_def.Parse();
                next_token = next(now_token);
            }
        }

        else {
            RaiseError("in DeclarationStatement, missing identify name", now_token);
            return now_token;
        }

    }
    return now_token;
}


TNP NormalStatementAST::Parse() {
    head->type = NormalStatement;

    if (type(now_token) == IDENTI && search_data(next_token, "=", ";")) {

        if (data(next_token) == "[") {

            ArrayAssignmentAST assi(now_token, symtable);
            connect_child(head, assi.head);
            now_token = assi.Parse();
            next_token = next(now_token);

            if (data(now_token) != ";") {
                RaiseError("in NormalStatement, lost punctuation [;]", now_token);
                return now_token;
            }
            GoNext();
        }

        else {
            SingleAssignmentAST assi(now_token, symtable);
            connect_child(head, assi.head);
            now_token = assi.Parse();
            next_token = next(now_token);

            if (data(now_token) != ";") {
                RaiseError("in NormalStatement, lost punctuation [;]", now_token);
                return now_token;
            }
            GoNext();
        }
    }

    else if (data(now_token) == "{") {
        BlockStatementAST block(now_token, symtable);
        connect_child(head, block.head);
        now_token = block.Parse();
        next_token = next(now_token);
    }

    else if (type(now_token) == KEYWORD) {

        std::string now_data = data(now_token);
        if (now_data == "if" || now_data == "while" || now_data == "break" ||
            now_data == "continue" || now_data == "return") {
            KeywordStatementAST key_stmt(now_token, symtable);
            connect_child(head, key_stmt.head);
            now_token = key_stmt.Parse();
            next_token = next(now_token);
        }

        else {
            RaiseError("in NormalStatement, begin with wrong sign", now_token);
            GoNext();  // !important, to avoid circle in normal statement
            return now_token;
        }

    }

    else if (type(now_token) == NUMBER || type(now_token) == IDENTI) {

        ExpressionAST expr(now_token, symtable);
        connect_child(head, expr.head);
        expr.head->data = "statement";
        now_token = expr.Parse();
        next_token = next(now_token);

        if (data(now_token) != ";") {
            RaiseError("in NormalStatement, lost punctuation [;]", now_token);
            return now_token;
        }
        GoNext();
    }

    else if (data(now_token) == ";") {
        GoNext();
    }

    else {
        RaiseError("in NormalStatement, begin with wrong sign", now_token);
        GoNext();  // !important, to avoid circle in normal statement
        return now_token;
    }

    return now_token;
}


TNP StatementAST::Parse() {
    head->type = Statement;

    if (data(now_token) == "int" || data(now_token) == "float" || data(now_token) == "const") {
        DeclarationStatementAST decl_stmt(now_token, symtable);
        connect_child(head, decl_stmt.head);
        now_token = decl_stmt.Parse();
        next_token = next(now_token);
    }

    else if (data(now_token) != "}" && now_token != nullptr) {
        NormalStatementAST norm_stmt(now_token, symtable);
        connect_child(head, norm_stmt.head);
        now_token = norm_stmt.Parse();
        next_token = next(now_token);
    }

    return now_token;
}


TNP BlockStatementAST::Parse() {
    head->type = BlockStatement;

    if (data(now_token) != "{") {
        RaiseError("in BlockStatement, beginning is not [{]", now_token);
        return now_token;
    }
    GoNext();

    while (true) {

        if (data(now_token) != "}" && now_token != nullptr) {
            StatementAST stmt(now_token, symtable);
            connect_child(head, stmt.head);
            now_token = stmt.Parse();
            next_token = next(now_token);
        }

        else if (data(now_token) == "}") {
            GoNext();
            break;
        }

        else {
            RaiseError("in BlockStatement, ending is not [}]", now_token);
            return now_token;
        }
    }

    return now_token;
}


TNP FunctionFormParamAST::Parse() {  // TBD, lost array[][10], and sym should get down...
    head->type = FunctionFormParam;

    if (data(now_token) != "int" && data(now_token) != "float") {
        RaiseError("in FunctionFormParam, type is not [int] or [float]", now_token);
        return now_token;
    }
    ANP type_name = std::make_shared<AST_node>();
    connect_child(head, type_name);
    type_name->type = BasicType;
    type_name->data = now_token->data;
    GoNext();

    if (type(now_token) != IDENTI) {
        RaiseError("in FunctionFormParam, identify name is not valid", now_token);
        return now_token;
    }
    ANP id_name = std::make_shared<AST_node>();
    connect_child(head, id_name);
    id_name->type = Identifier;
    id_name->data = now_token->data;
    GoNext();

    return now_token;
}


TNP FunctionParamsAST::Parse() {
    head->type = FunctionParams;

    if (data(now_token) == ")") {
        return now_token;
    }

    FunctionFormParamAST func_param(now_token, symtable);
    connect_child(head, func_param.head);
    now_token = func_param.Parse();
    next_token = next(now_token);
    symtable.my_head->arg_num++;

    while (true) {

        if (data(now_token) == ")") {
            break;
        }

        if (data(now_token) != ",") {
            RaiseError("in FunctionParams, punctuation should be [,] or [)]", now_token);
            return now_token;
        }
        GoNext();

        FunctionFormParamAST addi_func_param(now_token, symtable);
        connect_child(head, addi_func_param.head);
        now_token = addi_func_param.Parse();
        next_token = next(now_token);
        symtable.my_head->arg_num++;
    }

    

    return now_token;
}


TNP FunctionDefinitionAST::Parse() {
    head->type = FunctionDefinition;

    // v --- sym --- v //
    symtable_node sym_node;
    sym_node.id_type = _function_;
    // ^ --- sym --- ^ //

    // v --- sym block --- v //
    Symtable func_block_symtable;
    func_block_symtable.extend_from(symtable);
    // ^ --- sym block --- ^ //

    if (data(now_token) != "int" && data(now_token) != "void" && data(now_token) != "float") {
        RaiseError("in FunctionDefinition, type is not [int] or [float] or [void]", now_token);
        return now_token;
    }
    ANP func_type = std::make_shared<AST_node>();
    connect_child(head, func_type);
    func_type->type = FunctionType;
    func_type->data = data(now_token);
    sym_node.return_type =
            data(now_token) == "int" ? _int_ :
            data(now_token) == "float" ? _float_ :
            data(now_token) == "void" ? _void_ : _return_none_;
    GoNext();

    if (type(now_token) != IDENTI) {
        RaiseError("in FunctionDefinition, function name is not a valid name", now_token);
        return now_token;
    }
    ANP func_name = std::make_shared<AST_node>();
    connect_child(head, func_name);
    func_name->type = Identifier;
    func_name->data = data(now_token);
    sym_node.rename(data(now_token));
    func_block_symtable.my_head->only_name = sym_node.only_name;
    GoNext();

    if (data(now_token) != "(") {
        RaiseError("in FunctionDefinition, lost punctuation [(]", now_token);
        return now_token;
    }
    GoNext();

    FunctionParamsAST func_para(now_token, func_block_symtable);
    connect_child(head, func_para.head);
    now_token = func_para.Parse();
    next_token = next(now_token);

    SNP daughter_node_attribute_ptr = func_para.GetBackSymtableAttribute();
    sym_node.arg_num = daughter_node_attribute_ptr->arg_num;

    // v --- sym append --- v //
    symtable.append(sym_node);
    // ^ --- sym append --- ^ //

    if (data(now_token) != ")") {
        RaiseError("in FunctionDefinition, lost punctuation [)]", now_token);
        return now_token;
    }
    GoNext();

    BlockStatementAST func_block(now_token, func_block_symtable);
    connect_child(head, func_block.head);
    func_block.head->data = "FunctionBlock";
    now_token = func_block.Parse();
    next_token = next(now_token);

    return now_token;
}


TNP ProgramAST::Parse() {
    head->type = ProgramBody;

    symtable.my_head->only_name = "this_program";

    while (now_token != nullptr) {
        TNP look_next = next(next_token);

        if (data(now_token) == "void" ||
           ((data(now_token) == "int" || data(now_token) == "float") && data(look_next) == "(") ) {
            FunctionDefinitionAST func_def(now_token, symtable);
            connect_child(head, func_def.head);
            now_token = func_def.Parse();
            next_token = next(now_token);
        }

        else if (data(now_token) == "int" || data(now_token) == "float" ||
                 data(now_token) == "const") {
            DeclarationStatementAST stmt(now_token, symtable);
            connect_child(head, stmt.head);
            stmt.head->data = "static";
            now_token = stmt.Parse();
            next_token = next(now_token);
        }

        else {
            RaiseError("in ProgramAST, beginning must be a keyword [int] [float] [void] or [const]", now_token);
            break;
        }

        if (UpdateError()) { break; }
    }


    return now_token;
};
