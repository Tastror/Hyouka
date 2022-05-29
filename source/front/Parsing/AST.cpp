//
// Created by Tastror on 2022/5/11.
//

#include "AST.h"
#include "AST_expr.h"
#include "AST_keystmt.h"

std::vector<SNP> Symtable::all_symtable_heads;
int Symtable::table_counts = 0;

TNP SingleAssignmentAST::Parse() {
    head->type = SingleAssignment;

    if (token_safe::type(now_token) != IDENTI) {
        AST_safe::RaiseError("in SingleAssignment, beginning is not a valid name", now_token);
        return now_token;
    }

    // v --- sym search & attribution --- v //
    SNP temp_sym_node = head->search_id_name(token_safe::data(now_token));
    if (temp_sym_node == nullptr) {
        AST_safe::RaiseError("Usage without definition", now_token);
        return now_token;
    }
    head->absorb_sym_attribution(temp_sym_node);
    // ^ --- sym search & attribution--- ^ //

    ANP var_name = std::make_shared<AST_node>();
    AST_node::connect_child(head, var_name);
    var_name->type = Identifier;
    var_name->data = now_token->data;
    GoNext();

    if (token_safe::data(now_token) != "=") {
        AST_safe::RaiseError("in SingleAssignment, lost punctuation [=]", now_token);
        return now_token;
    }
    GoNext();

    ExpressionAST expr(now_token, symtable_ptr);
    AST_node::connect_child(head, expr.head);
    expr.head->data = "value";
    now_token = expr.Parse();
    next_token = token_safe::next(now_token);

    // meddle check, may cause error, could be removed
    if (token_safe::data(now_token) != "," && token_safe::data(now_token) != ";") {
        AST_safe::RaiseError("in SingleAssignment, lost punctuation [;] or [,]", now_token);
        return now_token;
    }

    return now_token;
}


TNP ArrayAssignmentAST::Parse() {
    head->type = ArrayAssignment;

    if (token_safe::type(now_token) != IDENTI) {
        AST_safe::RaiseError("in ArrayAssignment, beginning is not a valid name", now_token);
        return now_token;
    }

    // v --- sym search & attribution --- v //
    SNP temp_sym_node = head->search_id_name(token_safe::data(now_token));
    if (temp_sym_node == nullptr) {
        AST_safe::RaiseError("Usage without definition", now_token);
        return now_token;
    }
    head->absorb_sym_attribution(temp_sym_node);
    // ^ --- sym search & attribution--- ^ //

    ANP var_name = std::make_shared<AST_node>();
    AST_node::connect_child(head, var_name);
    var_name->type = Identifier;
    var_name->data = now_token->data;
    GoNext();

    if (token_safe::data(now_token) != "[") {
        AST_safe::RaiseError("in ArrayAssignment, lost punctuation [[]", now_token);
        return now_token;
    }
    GoNext();

    ExpressionAST index(now_token, symtable_ptr);
    AST_node::connect_child(head, index.head);
    index.head->data = "value";
    index.head->comment = "index";
    now_token = index.Parse();
    next_token = token_safe::next(now_token);

    if (token_safe::data(now_token) != "]") {
        AST_safe::RaiseError("in ArrayAssignment, lost punctuation []]", now_token);
        return now_token;
    }
    GoNext();

    while (token_safe::data(now_token) == "[") {
        GoNext();

        ExpressionAST index_addi(now_token, symtable_ptr);
        AST_node::connect_child(head, index_addi.head);
        index_addi.head->data = "value";
        index_addi.head->comment = "index";
        now_token = index_addi.Parse();
        next_token = token_safe::next(now_token);

        if (token_safe::data(now_token) != "]") {
            AST_safe::RaiseError("in ArrayAssignment, lost punctuation []]", now_token);
            return now_token;
        }
        GoNext();
    }

    if (token_safe::data(now_token) != "=") {
        AST_safe::RaiseError("in ArrayAssignment, lost punctuation [=]", now_token);
        return now_token;
    }
    GoNext();

    ExpressionAST expr(now_token, symtable_ptr);
    AST_node::connect_child(head, expr.head);
    expr.head->data = "value";
    now_token = expr.Parse();
    next_token = token_safe::next(now_token);

    // meddle check, may cause error, could be removed
    if (token_safe::data(now_token) != "," && token_safe::data(now_token) != ";") {
        AST_safe::RaiseError("in ArrayAssignment, lost punctuation [;] or [,]", now_token);
        return now_token;
    }

    return now_token;
}


TNP SingleDefinitionAST::Parse() {
    head->type = SingleDefinition;

    if (token_safe::type(now_token) != IDENTI) {
        AST_safe::RaiseError("in SingleDefinition, beginning is not a valid name", now_token);
        return now_token;
    }
    ANP var_name = std::make_shared<AST_node>();
    AST_node::connect_child(head, var_name);
    var_name->type = Identifier;
    var_name->data = now_token->data;
    GoNext();

    if (token_safe::data(now_token) == "=") {
        GoNext();

        ExpressionAST expr(now_token, symtable_ptr);
        AST_node::connect_child(head, expr.head);
        expr.head->data = "value";
        now_token = expr.Parse();
        next_token = token_safe::next(now_token);
    }

    // meddle check, may cause error, could be removed
    if (token_safe::data(now_token) != "," && token_safe::data(now_token) != ";") {
        AST_safe::RaiseError("in SingleDefinition, lost punctuation [;] or [,]", now_token);
        return now_token;
    }

    return now_token;
}


TNP ArrayInitialBlockAST::Parse() {
    head->type = ArrayInitialBlock;

    if (token_safe::data(now_token) != "{") {
        AST_safe::RaiseError("in ArrayInitialBlock, lost punctuation [{]", now_token);
        return now_token;
    }
    GoNext();

    if (token_safe::data(now_token) == "}") {
        GoNext();
        return now_token;
    }

    else if (token_safe::data(now_token) == "{") {
        ArrayInitialBlockAST recur_array_init(now_token, symtable_ptr);
        AST_node::connect_child(head, recur_array_init.head);
        now_token = recur_array_init.Parse();
        next_token = token_safe::next(now_token);
    }

    else {
        ExpressionAST index(now_token, symtable_ptr);
        AST_node::connect_child(head, index.head);
        index.head->data = "value";
        now_token = index.Parse();
        next_token = token_safe::next(now_token);
    }

    while (true) {

        if (token_safe::data(now_token) == "}") {
            GoNext();
            break;
        }

        else if (token_safe::data(now_token) != ",") {
            AST_safe::RaiseError("in ArrayInitialBlock, punctuation should be [{] or [,]", now_token);
            return now_token;
        }
        GoNext();

        if (token_safe::data(now_token) == "{") {
            ArrayInitialBlockAST recur_array_init(now_token, symtable_ptr);
            AST_node::connect_child(head, recur_array_init.head);
            now_token = recur_array_init.Parse();
            next_token = token_safe::next(now_token);
        }

        else {
            ExpressionAST index(now_token, symtable_ptr);
            AST_node::connect_child(head, index.head);
            index.head->data = "value";
            now_token = index.Parse();
            next_token = token_safe::next(now_token);
        }

    }

    return now_token;
}


TNP ArrayDefinitionAST::Parse() {
    head->type = ArrayDefinition;

    if (token_safe::type(now_token) != IDENTI) {
        AST_safe::RaiseError("in ArrayAssignment, beginning is not a valid name", now_token);
        return now_token;
    }
    ANP var_name = std::make_shared<AST_node>();
    AST_node::connect_child(head, var_name);
    var_name->type = Identifier;
    var_name->data = now_token->data;
    GoNext();

    if (token_safe::data(now_token) != "[") {
        AST_safe::RaiseError("in ArrayAssignment, lost punctuation [[]", now_token);
        return now_token;
    }

    // v --- sym change --- v //
    symtable_ptr->my_tail->array_nest_num++;
    // ^ --- sym change --- ^//

    GoNext();

    ExpressionAST index(now_token, symtable_ptr);
    AST_node::connect_child(head, index.head);
    index.head->data = "value";
    index.head->comment = "index";
    now_token = index.Parse();
    next_token = token_safe::next(now_token);

    if (token_safe::data(now_token) != "]") {
        AST_safe::RaiseError("in ArrayAssignment, lost punctuation []]", now_token);
        return now_token;
    }
    GoNext();

    while (token_safe::data(now_token) == "[") {

        // v --- sym change --- v //
        symtable_ptr->my_tail->array_nest_num++;
        // ^ --- sym change --- ^//

        GoNext();

        ExpressionAST index_addi(now_token, symtable_ptr);
        AST_node::connect_child(head, index_addi.head);
        index_addi.head->data = "value";
        index_addi.head->comment = "index";
        now_token = index_addi.Parse();
        next_token = token_safe::next(now_token);

        if (token_safe::data(now_token) != "]") {
            AST_safe::RaiseError("in ArrayAssignment, lost punctuation []]", now_token);
            return now_token;
        }
        GoNext();
    }

    if (token_safe::data(now_token) == "=") {
        GoNext();

        ArrayInitialBlockAST array_init(now_token, symtable_ptr);
        AST_node::connect_child(head, array_init.head);
        now_token = array_init.Parse();
        next_token = token_safe::next(now_token);
    }

    // meddle check, may cause error, could be removed
    if (token_safe::data(now_token) != "," && token_safe::data(now_token) != ";") {
        AST_safe::RaiseError("in SingleDefinition, lost punctuation [;] or [,]", now_token);
        return now_token;
    }

    return now_token;
}


TNP DeclarationStatementAST::Parse() {
    head->type = DeclarationStatement;

    // v --- sym --- v //
    symtable_node placeholder_sym_node;
    placeholder_sym_node.is_static = head->is_static;
    // ^ --- sym --- ^ //

    if (token_safe::data(now_token) != "const" && token_safe::data(now_token) != "int" && token_safe::data(now_token) != "float") {
        AST_safe::RaiseError("in DeclarationStatement, beginning is not [const] [int] or [float]", now_token);
        return now_token;
    }

    head->type = VariableDeclarationStatement;
    if (token_safe::data(now_token) == "const") {
        head->type = ConstDeclarationStatement;

        // v --- sym change --- v //
        placeholder_sym_node.is_const = true;
        // ^ --- sym change --- ^ //

        GoNext();
    }

    if (token_safe::data(now_token) != "int" && token_safe::data(now_token) != "float") {
        AST_safe::RaiseError("in DeclarationStatement, type is not [int] or [float]", now_token);
        return now_token;
    }
    ANP var_type = std::make_shared<AST_node>();
    AST_node::connect_child(head, var_type);
    var_type->type = BasicType;
    var_type->data = now_token->data;

    // v --- sym change --- v //
    placeholder_sym_node.basic_type =
            token_safe::data(now_token) == "int" ? basic_int :
            token_safe::data(now_token) == "float" ? basic_float : basic_none;
    // ^ --- sym change --- ^ //

    GoNext();

    if (token_safe::type(now_token) == IDENTI) {

        // v --- sym search --- v //
        SNP temp_sym_node = head->search_id_name(token_safe::data(now_token), symtable_ptr->my_head);
        if (temp_sym_node != nullptr) {
            AST_safe::RaiseError("Redefinition", now_token);
            return now_token;
        }
        // ^ --- sym search --- ^ //

        // v --- sym --- v //
        symtable_node sym_node;
        sym_node.identifier_name = token_safe::data(now_token);
        sym_node.is_static = placeholder_sym_node.is_static;
        sym_node.is_const = placeholder_sym_node.is_const;
        sym_node.basic_type = placeholder_sym_node.basic_type;
        // ^ --- sym --- ^ //

        if (token_safe::data(next_token) == "[") {

            // v --- sym change --- v //
            sym_node.is_array_pointer = true;
            // ^ --- sym change --- ^ //

            // v --- sym append --- v //
            symtable_ptr->append(sym_node);
            // ^ --- sym append --- ^ //

            ArrayDefinitionAST array_def(now_token, symtable_ptr);
            AST_node::connect_child(head, array_def.head);
            now_token = array_def.Parse();
            next_token = token_safe::next(now_token);

            // v --- sym attribute --- v //
            array_def.head->absorb_sym_attribution(symtable_ptr->my_tail);
            // ^ --- sym attribute --- ^ //
        }

        else {

            SingleDefinitionAST single_def(now_token, symtable_ptr);
            AST_node::connect_child(head, single_def.head);
            now_token = single_def.Parse();
            next_token = token_safe::next(now_token);

            // v --- sym append & attribute --- v //
            symtable_ptr->append(sym_node);
            single_def.head->absorb_sym_attribution(symtable_ptr->my_tail);
            // ^ --- sym append & attribute --- ^ //
        }
    }

    else {
        AST_safe::RaiseError("in DeclarationStatement, missing identify name", now_token);
        return now_token;
    }

    while (true) {

        if (token_safe::data(now_token) == ";") {
            GoNext();
            break;
        }

        else if (token_safe::data(now_token) == ",") {
            GoNext();
        }

        else {
            AST_safe::RaiseError("in DeclarationStatement, separate punctuation should be [,]", now_token);
            return now_token;
        }

        if (token_safe::type(now_token) == IDENTI) {

            // v --- sym search --- v //
            SNP temp_sym_node = head->search_id_name(token_safe::data(now_token), symtable_ptr->my_head);
            if (temp_sym_node != nullptr) {
                AST_safe::RaiseError("Redefinition", now_token);
                return now_token;
            }
            // ^ --- sym search --- ^ //

            // v --- sym --- v //
            symtable_node sym_node;
            sym_node.identifier_name = token_safe::data(now_token);
            sym_node.is_static = placeholder_sym_node.is_static;
            sym_node.is_const = placeholder_sym_node.is_const;
            sym_node.basic_type = placeholder_sym_node.basic_type;
            // ^ --- sym --- ^ //

            if (token_safe::data(next_token) == "[") {

                // v --- sym change --- v //
                sym_node.is_array_pointer = true;
                // ^ --- sym change --- ^ //

                // v --- sym append --- v //
                symtable_ptr->append(sym_node);
                // ^ --- sym append --- ^ //

                ArrayDefinitionAST array_def(now_token, symtable_ptr);
                AST_node::connect_child(head, array_def.head);
                now_token = array_def.Parse();
                next_token = token_safe::next(now_token);

                // v --- sym attribute --- v //
                array_def.head->absorb_sym_attribution(symtable_ptr->my_tail);
                // ^ --- sym attribute --- ^ //
            }

            else {

                SingleDefinitionAST single_def(now_token, symtable_ptr);
                AST_node::connect_child(head, single_def.head);
                now_token = single_def.Parse();
                next_token = token_safe::next(now_token);

                // v --- sym append & attribute --- v //
                symtable_ptr->append(sym_node);
                single_def.head->absorb_sym_attribution(symtable_ptr->my_tail);
                // ^ --- sym append & attribute --- ^ //
            }
        }

        else {
            AST_safe::RaiseError("in DeclarationStatement, missing identify name", now_token);
            return now_token;
        }

    }
    return now_token;
}


TNP NormalStatementAST::Parse() {
    head->type = NormalStatement;

    if (token_safe::type(now_token) == IDENTI && token_safe::search_data(next_token, "=", ";")) {

        if (token_safe::data(next_token) == "[") {
            ArrayAssignmentAST assi(now_token, symtable_ptr);
            AST_node::connect_child(head, assi.head);
            now_token = assi.Parse();
            next_token = token_safe::next(now_token);

            if (token_safe::data(now_token) != ";") {
                AST_safe::RaiseError("in NormalStatement, lost punctuation [;]", now_token);
                return now_token;
            }
            GoNext();
        }

        else {
            SingleAssignmentAST assi(now_token, symtable_ptr);
            AST_node::connect_child(head, assi.head);
            now_token = assi.Parse();
            next_token = token_safe::next(now_token);

            if (token_safe::data(now_token) != ";") {
                AST_safe::RaiseError("in NormalStatement, lost punctuation [;]", now_token);
                return now_token;
            }
            GoNext();
        }
    }

    else if (token_safe::data(now_token) == "{") {

        // v --- sym block --- v //
        Symtable block_symtable;
        block_symtable.extend_from(symtable_ptr);
        block_symtable.my_head->rename("block");
        // ^ --- sym block --- ^ //

        BlockStatementAST block(now_token, block_symtable);
        AST_node::connect_child(head, block.head);
        now_token = block.Parse();
        next_token = token_safe::next(now_token);
    }

    else if (token_safe::type(now_token) == KEYWORD) {

        std::string now_data = token_safe::data(now_token);
        if (now_data == "if" || now_data == "while" || now_data == "break" ||
            now_data == "continue" || now_data == "return") {
            KeywordStatementAST key_stmt(now_token, symtable_ptr);
            AST_node::connect_child(head, key_stmt.head);
            now_token = key_stmt.Parse();
            next_token = token_safe::next(now_token);
        }

        else {
            AST_safe::RaiseError("in NormalStatement, begin with wrong sign", now_token);
            GoNext();  // !important, to avoid circle in normal statement
            return now_token;
        }

    }

    else if (token_safe::type(now_token) == NUMBER || token_safe::type(now_token) == IDENTI) {

        ExpressionAST expr(now_token, symtable_ptr);
        AST_node::connect_child(head, expr.head);
        expr.head->data = "value";
        expr.head->comment = "statement";
        now_token = expr.Parse();
        next_token = token_safe::next(now_token);

        if (token_safe::data(now_token) != ";") {
            AST_safe::RaiseError("in NormalStatement, lost punctuation [;]", now_token);
            return now_token;
        }
        GoNext();
    }

    else if (token_safe::data(now_token) == ";") {
        GoNext();
    }

    else {
        AST_safe::RaiseError("in NormalStatement, begin with wrong sign", now_token);
        GoNext();  // !important, to avoid circle in normal statement
        return now_token;
    }

    return now_token;
}


TNP StatementAST::Parse() {
    head->type = Statement;

    if (token_safe::data(now_token) == "int" || token_safe::data(now_token) == "float" || token_safe::data(now_token) == "const") {
        DeclarationStatementAST decl_stmt(now_token, symtable_ptr);
        AST_node::connect_child(head, decl_stmt.head);
        now_token = decl_stmt.Parse();
        next_token = token_safe::next(now_token);
    }

    else if (token_safe::data(now_token) != "}" && now_token != nullptr) {
        NormalStatementAST norm_stmt(now_token, symtable_ptr);
        AST_node::connect_child(head, norm_stmt.head);
        now_token = norm_stmt.Parse();
        next_token = token_safe::next(now_token);
    }

    return now_token;
}


TNP BlockStatementAST::Parse() {
    head->type = BlockStatement;

    if (token_safe::data(now_token) != "{") {
        AST_safe::RaiseError("in BlockStatement, beginning is not [{]", now_token);
        return now_token;
    }
    GoNext();

    while (true) {

        if (token_safe::data(now_token) != "}" && now_token != nullptr) {
            StatementAST stmt(now_token, symtable_ptr);
            AST_node::connect_child(head, stmt.head);
            now_token = stmt.Parse();
            next_token = token_safe::next(now_token);
        }

        else if (token_safe::data(now_token) == "}") {
            GoNext();
            break;
        }

        else {
            AST_safe::RaiseError("in BlockStatement, ending is not [}]", now_token);
            return now_token;
        }
    }

    return now_token;
}


TNP FunctionFormParamAST::Parse() {
    head->type = FunctionFormParam;

    // v --- sym --- v //
    symtable_node sym_node;
    // ^ --- sym --- ^ //

    if (token_safe::data(now_token) != "int" && token_safe::data(now_token) != "float") {
        AST_safe::RaiseError("in FunctionFormParam, type is not [int] or [float]", now_token);
        return now_token;
    }

    // v --- sym --- v //
    sym_node.basic_type = token_safe::data(now_token) == "int" ? basic_int :
                          token_safe::data(now_token) == "float" ? basic_float : basic_none;
    // ^ --- sym --- ^ //

    ANP type_name = std::make_shared<AST_node>();
    AST_node::connect_child(head, type_name);
    type_name->type = BasicType;
    type_name->data = now_token->data;
    GoNext();

    if (token_safe::type(now_token) != IDENTI) {
        AST_safe::RaiseError("in FunctionFormParam, identify name is not valid", now_token);
        return now_token;
    }

    // v --- sym search --- v //
    SNP temp_sym_node = head->search_id_name(token_safe::data(now_token), symtable_ptr->my_head);
    if (temp_sym_node != nullptr) {
        AST_safe::RaiseError("Redefinition", now_token);
        return now_token;
    }
    // ^ --- sym search --- ^ //

    // v --- sym change --- v //
    sym_node.identifier_name = token_safe::data(now_token);
    // ^ --- sym change --- ^ //

    ANP id_name = std::make_shared<AST_node>();
    AST_node::connect_child(head, id_name);
    id_name->type = Identifier;
    id_name->data = now_token->data;
    GoNext();

    // v --- sym append --- v //
    symtable_ptr->append(sym_node);
    // ^ --- sym append --- ^ //

    if (token_safe::data(now_token) == "[") {

        // v --- sym change --- v //
        symtable_ptr->my_tail->is_array_pointer = true;
        symtable_ptr->my_tail->array_nest_num++;
        // ^ --- sym change --- ^ //

        GoNext();

        if (token_safe::data(now_token) == "]") {
            GoNext();
        }
        else {
            ExpressionAST index(now_token, symtable_ptr);
            AST_node::connect_child(head, index.head);
            index.head->data = "value";
            index.head->comment = "index";
            now_token = index.Parse();
            next_token = token_safe::next(now_token);

            if (token_safe::data(now_token) != "]") {
                AST_safe::RaiseError("in FunctionFormParam, lost punctuation []]", now_token);
                return now_token;
            }
            GoNext();
        }

        while (token_safe::data(now_token) == "[") {

            // v --- sym change --- v //
            symtable_ptr->my_tail->array_nest_num++;
            // ^ --- sym change --- ^ //

            GoNext();

            ExpressionAST index_addi(now_token, symtable_ptr);
            AST_node::connect_child(head, index_addi.head);
            index_addi.head->data = "value";
            index_addi.head->comment = "index";
            now_token = index_addi.Parse();
            next_token = token_safe::next(now_token);

            if (token_safe::data(now_token) != "]") {
                AST_safe::RaiseError("in FunctionFormParam, lost punctuation []]", now_token);
                return now_token;
            }
            GoNext();
        }
    }

    // v --- sym append & attribute --- v //
    head->absorb_sym_attribution(symtable_ptr->my_tail);
    // ^ --- sym append & attribute --- ^ //

    return now_token;
}


TNP FunctionParamsAST::Parse() {
    head->type = FunctionParams;

    if (token_safe::data(now_token) == ")") {
        return now_token;
    }

    FunctionFormParamAST func_param(now_token, symtable_ptr);
    AST_node::connect_child(head, func_param.head);
    now_token = func_param.Parse();
    next_token = token_safe::next(now_token);

    // v --- sym change --- v //
    symtable_ptr->my_head->arg_num++;
    // ^ --- sym change --- ^ //

    while (true) {

        if (token_safe::data(now_token) == ")") {
            break;
        }

        if (token_safe::data(now_token) != ",") {
            AST_safe::RaiseError("in FunctionParams, punctuation should be [,] or [)]", now_token);
            return now_token;
        }
        GoNext();

        FunctionFormParamAST addi_func_param(now_token, symtable_ptr);
        AST_node::connect_child(head, addi_func_param.head);
        now_token = addi_func_param.Parse();
        next_token = token_safe::next(now_token);

        // v --- sym change --- v //
        symtable_ptr->my_head->arg_num++;
        // ^ --- sym change --- ^ //
    }

    return now_token;
}


TNP FunctionDefinitionAST::Parse() {
    head->type = FunctionDefinition;

    // v --- sym --- v //
    symtable_node sym_node;
    sym_node.is_function_pointer = true;
    // ^ --- sym --- ^ //

    // v --- sym block --- v //
    Symtable func_block_symtable;
    func_block_symtable.extend_from(symtable_ptr);
    // ^ --- sym block --- ^ //

    if (token_safe::data(now_token) != "int" && token_safe::data(now_token) != "void" && token_safe::data(now_token) != "float") {
        AST_safe::RaiseError("in FunctionDefinition, type is not [int] or [float] or [void]", now_token);
        return now_token;
    }
    ANP func_type = std::make_shared<AST_node>();
    AST_node::connect_child(head, func_type);
    func_type->type = FunctionType;
    func_type->data = token_safe::data(now_token);

    // v --- sym change --- v //
    sym_node.function_type =
            token_safe::data(now_token) == "int" ? function_int :
            token_safe::data(now_token) == "float" ? function_float :
            token_safe::data(now_token) == "void" ? function_void : function_none;
    // ^ --- sym change --- ^ //

    GoNext();

    if (token_safe::type(now_token) != IDENTI) {
        AST_safe::RaiseError("in FunctionDefinition, function name is not a valid name", now_token);
        return now_token;
    }

    // v --- sym search --- v //
    SNP temp_sym_node = head->search_id_name(token_safe::data(now_token), symtable_ptr->my_head);
    if (temp_sym_node != nullptr) {
        AST_safe::RaiseError("Redefinition", now_token);
        return now_token;
    }
    // ^ --- sym search --- ^ //

    ANP func_name = std::make_shared<AST_node>();
    AST_node::connect_child(head, func_name);
    func_name->type = Identifier;
    func_name->data = token_safe::data(now_token);

    // v --- sym change --- v //
    sym_node.identifier_name = token_safe::data(now_token);
    func_block_symtable.my_head->rename("function_block");
    // ^ --- sym change --- ^ //

    GoNext();

    if (token_safe::data(now_token) != "(") {
        AST_safe::RaiseError("in FunctionDefinition, lost punctuation [(]", now_token);
        return now_token;
    }
    GoNext();

    FunctionParamsAST func_para(now_token, func_block_symtable);
    AST_node::connect_child(head, func_para.head);
    now_token = func_para.Parse();
    next_token = token_safe::next(now_token);

    // v --- sym change --- v //
    sym_node.arg_num = func_para.GetBackSymtableAttribute()->arg_num;
    // ^ --- sym change --- ^ //

    // v --- sym append & attribute --- v //
    symtable_ptr->append(sym_node);
    head->absorb_sym_attribution(symtable_ptr->my_tail);
    // ^ --- sym append & attribute --- ^ //

    if (token_safe::data(now_token) != ")") {
        AST_safe::RaiseError("in FunctionDefinition, lost punctuation [)]", now_token);
        return now_token;
    }
    GoNext();

    BlockStatementAST func_block(now_token, func_block_symtable);
    AST_node::connect_child(head, func_block.head);
    func_block.head->data = "FunctionBlock";
    now_token = func_block.Parse();
    next_token = token_safe::next(now_token);

    return now_token;
}


TNP ProgramAST::Parse() {
    head->type = ProgramBody;

    symtable_ptr->my_head->rename("this_program");

    while (now_token != nullptr) {

        // in all ASTs, GlobalError only use here
        if (Safe::GlobalError) { break; }

        TNP look_next = token_safe::next(next_token);

        if (token_safe::data(now_token) == "void" ||
           ((token_safe::data(now_token) == "int" || token_safe::data(now_token) == "float") && token_safe::data(look_next) == "(") ) {
            FunctionDefinitionAST func_def(now_token, symtable_ptr);
            AST_node::connect_child(head, func_def.head);
            now_token = func_def.Parse();
            next_token = token_safe::next(now_token);
        }

        else if (token_safe::data(now_token) == "int" || token_safe::data(now_token) == "float" ||
                 token_safe::data(now_token) == "const") {
            DeclarationStatementAST stmt(now_token, symtable_ptr);
            AST_node::connect_child(head, stmt.head);
            stmt.head->is_static = true;
            now_token = stmt.Parse();
            next_token = token_safe::next(now_token);
        }

        else {
            AST_safe::RaiseError("in ProgramAST, beginning must be a keyword [int] [float] [void] or [const]", now_token);
            break;
        }
    }

    return now_token;
}