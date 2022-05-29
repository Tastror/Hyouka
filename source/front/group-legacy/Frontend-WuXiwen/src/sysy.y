%code requires {
  #include <memory>
  #include <string>
  #include "../include/ast.h"	// AST define
}

%{

#include <iostream>
#include <memory>
#include <string>
#include "../include/ast.h"	// AST define

// 声明 lexer 函数和错误处理函数
int yylex();
void yyerror(std::unique_ptr<BaseAST> &ast, const char *s);

using namespace std;

%}

// 定义 parser 函数和错误处理函数的附加参数
// 我们需要返回AST, 所以我们把附加参数定义成BaseAST的智能指针
// 解析完成后, 我们要手动修改这个参数, 把它设置成解析得到的字符串
%parse-param { std::unique_ptr<BaseAST> &ast }

// yylval 的定义, 我们把它定义成了一个联合体 (union)
// 因为 token 的值有的是字符串指针, 有的是整数
// lexer 中用到的 str_val 和 int_val 就是在这里被定义的
%union {
  std::string *str_val;
  int int_val;
  BaseAST *ast_val;	//AST node
}

// lexer 返回的所有 token 种类的声明
%token <str_val> IDENT INT CONST RETURN ADD SUB MUL DIV MOD NOT AND OR LT GT LEQ GEQ EQ NEQ COMMA SEMI ASSIGN LBRACE RBRACE LPAREN RPAREN
%token <int_val> INT_CONST

// 非终结符的类型定义
%type <ast_val> FuncDef FuncType Block BlockItem Decl ConstDecl ConstDef ConstInitVal Stmt ConstExp Exp LOrExp LAndExp EqExp RelExp AddExp MulExp PrimaryExp UnaryExp
%type <str_val> UnaryOp BType LVal 
%type <int_val> Number

%%

// 开始符, CompUnit ::= FuncDef, 大括号后声明了解析完成后 parser 要做的事情
// $1 指代规则里第一个符号的返回值, 也就是 FuncDef 的返回值
CompUnit
  : FuncDef {
    auto comp_unit = make_unique<CompUnitAST>();
    comp_unit->func_def = unique_ptr<BaseAST>($1);
    ast = move(comp_unit);
  }
  ;

// 我们这里可以直接写 '(' 和 ')', 因为之前在 lexer 里已经处理了单个字符的情况
// 解析完成后, 把这些符号的结果收集起来, 然后拼成一个新的字符串, 作为结果返回
// $$ 表示非终结符的返回值, 我们可以通过给这个符号赋值的方法来返回结果
FuncDef
  : FuncType IDENT '(' ')' Block {
    auto ast = new FuncDefAST();
    ast->func_type = unique_ptr<BaseAST>($1);
    ast->ident = *unique_ptr<string>($2);
    ast->block = unique_ptr<BaseAST>($5);
    $$ = ast;
  }
  ;

FuncType
  : INT {
    auto ast = new FuncTypeAST();
    ast->func_type = *unique_ptr<string>($1);
    $$ = ast;
  }
  ;

Block
  : LBRACE BlockItem RBRACE {
    auto ast = new BlockAST();
    ast->lbrace = *unique_ptr<string>($1);
    ast->block_item = unique_ptr<BaseAST>($2);
    ast->rbrace = *unique_ptr<string>($3);
    $$ = ast;
  }
  ;

BlockItem
  : Decl {
    auto ast = new BlockItemAST();
    ast->decl = unique_ptr<BaseAST>($1);
    $$ = ast;
  }
  | Stmt {
    auto ast = new BlockItemAST();
    ast->stmt = unique_ptr<BaseAST>($1);
    $$ = ast;
  }
  ;
  
Decl
  : ConstDecl {
    auto ast = new DeclAST();
    ast->const_decl = unique_ptr<BaseAST>($1);
    $$ = ast;
  }
  ;

ConstDecl
  : CONST BType ConstDef {COMMA ConstDef} SEMI {
    auto ast = new ConstDeclAST();
    ast->const_type = *unique_ptr<string>($1);
    ast->btype = unique_ptr<BaseAST>($2);
    ast->const_def = unique_ptr<BaseAST>($3);
    
    ast->comma = *unique_ptr<string>($4);
    ast->const_def = unique_ptr<BaseAST>($5);
    
    ast->semi = *unique_ptr<string>($5);
    $$ = ast;
  }
  ;

BType
  : INT {
    $$ = ($1);
  }
  ;

ConstDef
  : IDENT EQ ConstInitVal {
    auto ast = new ConstDefAST();
    ast->ident = *unique_ptr<string>($1);
    ast->eq = *unique_ptr<string>($2);
    ast->const_initval = unique_ptr<BaseAST>($3);
    $$ = ast;
  }
  ;

ConstInitVal
  : ConstExp {
    auto ast = new ConstInitValAST();
    ast->const_exp = unique_ptr<BaseAST>($1);
    $$ = ast;
  }
  ;

ConstExp
  : Exp {
    auto ast = new ConstExp();
    ast->exp = unique_ptr<BaseAST>($1);
    $$ = ast;
  }
  ;
            
Stmt
  : RETURN Exp ';' {
    auto ast = new StmtAST();
    ast->rtn = *unique_ptr<string>($1);
    ast->exp = unique_ptr<BaseAST>($2);
    $$ = ast;
  }
  ;

Exp
  : LOrExp {
    auto ast = new ExpAST();
    ast->lor_exp = unique_ptr<BaseAST>($1);
    $$ = ast;
  }
  ;

LOrExp
  : LAndExp {
    auto ast = new LOrExpAST();
    ast->land_exp = unique_ptr<BaseAST>($1);
    $$ = ast;
  }
  | LOrExp OR LAndExp {
    auto ast = new LOrExpAST();
    ast->lor_exp = unique_ptr<BaseAST>($1);
    ast->op = *unique_ptr<string>($2);
    ast->land_exp = unique_ptr<BaseAST>($3);
    $$ = ast;
  }
  ;

LAndExp
  : EqExp {
    auto ast = new LAndExpAST();
    ast->eq_exp = unique_ptr<BaseAST>($1);
    $$ = ast;
  }
  | LAndExp AND EqExp {
    auto ast = new LAndExpAST();
    ast->land_exp = unique_ptr<BaseAST>($1);
    ast->op = *unique_ptr<string>($2);
    ast->eq_exp = unique_ptr<BaseAST>($3);
    $$ = ast;
  }
  ;

EqExp
  : RelExp {
    auto ast = new EqExpAST();
    ast->rel_exp = unique_ptr<BaseAST>($1);
    $$ = ast;
  }
  | EqExp EQ RelExp {
    auto ast = new EqExpAST();
    ast->eq_exp = unique_ptr<BaseAST>($1);
    ast->op = *unique_ptr<string>($2);
    ast->rel_exp = unique_ptr<BaseAST>($3);
    $$ = ast;
  }
  | EqExp NEQ RelExp {
    auto ast = new EqExpAST();
    ast->eq_exp = unique_ptr<BaseAST>($1);
    ast->op = *unique_ptr<string>($2);
    ast->rel_exp = unique_ptr<BaseAST>($3);
    $$ = ast;
  }
  ;

RelExp
  : AddExp {
    auto ast = new RelExpAST();
    ast->add_exp = unique_ptr<BaseAST>($1);
    $$ = ast;
  }
  | RelExp LT AddExp {
    auto ast = new RelExpAST();
    ast->rel_exp = unique_ptr<BaseAST>($1);
    ast->op = *unique_ptr<string>($2);
    ast->add_exp = unique_ptr<BaseAST>($3);
    $$ = ast;
  }
  | RelExp GT AddExp {
    auto ast = new RelExpAST();
    ast->rel_exp = unique_ptr<BaseAST>($1);
    ast->op = *unique_ptr<string>($2);
    ast->add_exp = unique_ptr<BaseAST>($3);
    $$ = ast;
  }
  | RelExp LEQ AddExp {
    auto ast = new RelExpAST();
    ast->rel_exp = unique_ptr<BaseAST>($1);
    ast->op = *unique_ptr<string>($2);
    ast->add_exp = unique_ptr<BaseAST>($3);
    $$ = ast;
  }
  | RelExp GEQ AddExp {
    auto ast = new RelExpAST();
    ast->rel_exp = unique_ptr<BaseAST>($1);
    ast->op = *unique_ptr<string>($2);
    ast->add_exp = unique_ptr<BaseAST>($3);
    $$ = ast;
  }
  ;
        
AddExp
  : MulExp {
    auto ast = new AddExpAST();
    ast->mul_exp = unique_ptr<BaseAST>($1);
    $$ = ast;
  }
  | AddExp ADD MulExp {
    auto ast = new AddExpAST();
    ast->add_exp = unique_ptr<BaseAST>($1);
    ast->unary_op = *unique_ptr<string>($2);
    ast->mul_exp = unique_ptr<BaseAST>($3);
    $$ = ast;
  }
  | AddExp SUB MulExp {
    auto ast = new AddExpAST();
    ast->add_exp = unique_ptr<BaseAST>($1);
    ast->unary_op = *unique_ptr<string>($2);
    ast->mul_exp = unique_ptr<BaseAST>($3);
    $$ = ast;
  }
  ;

MulExp
  : UnaryExp {
    auto ast = new MulExpAST();
    ast->unary_exp = unique_ptr<BaseAST>($1);
    $$ = ast;
  }
  | MulExp MUL UnaryExp {
    auto ast = new MulExpAST();
    ast->mul_exp = unique_ptr<BaseAST>($1);
    ast->unary_op = *unique_ptr<string>($2);
    ast->unary_exp = unique_ptr<BaseAST>($3);
    $$ = ast;
  }
  | MulExp DIV UnaryExp {
    auto ast = new MulExpAST();
    ast->mul_exp = unique_ptr<BaseAST>($1);
    ast->unary_op = *unique_ptr<string>($2);
    ast->unary_exp = unique_ptr<BaseAST>($3);
    $$ = ast;
  }
  | MulExp MOD UnaryExp {
    auto ast = new MulExpAST();
    ast->mul_exp = unique_ptr<BaseAST>($1);
    ast->unary_op = *unique_ptr<string>($2);
    ast->unary_exp = unique_ptr<BaseAST>($3);
    $$ = ast;
  }
  ;
    
UnaryExp
  : PrimaryExp {
    auto ast = new UnaryExpAST();
    ast->primary_exp = unique_ptr<BaseAST>($1);
    $$ = ast;
  }
  | UnaryOp UnaryExp {
    auto ast = new UnaryExpAST();
    ast->unary_op = *unique_ptr<string>($1);
    ast->unary_exp = unique_ptr<BaseAST>($2);
    $$ = ast;
  }
  ;

UnaryOp
  : ADD {
    $$ = ($1);
  }
  | SUB {
    $$ = ($1);
  }
  | NOT {
    $$ = ($1);
  }
  ;

PrimaryExp
  : LPAREN Exp RPAREN {
    auto ast = new PrimaryExpAST();
    ast->lparen = *unique_ptr<string>($1);
    ast->exp = unique_ptr<BaseAST>($2);
    ast->rparen = *unique_ptr<string>($3);
    $$ = ast;
  }
  | LVal {
    auto ast = new PrimaryExpAST();
    ast->ident = ($1);
    $$ = ast;
  }
  | Number {
    auto ast = new PrimaryExpAST();
    ast->number = ($1);
    $$ = ast;
  }
  ;

LVal
  : INDENT {
    $$ = ($1);
  }
  ;
          
Number
  : INT_CONST {
    $$ = ($1);
  }
  ;

%%

// 定义错误处理函数, 其中第二个参数是错误信息
// parser 如果发生错误 (例如输入的程序出现了语法错误), 就会调用这个函数
void yyerror(unique_ptr<BaseAST> &ast, const char *s) {
  cerr << "error: " << s << endl;
}
