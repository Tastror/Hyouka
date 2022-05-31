/*	AST design and print	*/

#pragma once

#include <iostream>
#include <vector>
#include <optional>

class BaseAST {
 public:
  virtual ~BaseAST() = default;

  virtual void Dump() const = 0;
};

class CompUnitAST : public BaseAST {
 public:
  std::unique_ptr<BaseAST> func_def;

  void Dump() const override {
    std::cout << "CompUnitAST { " << std::endl;
    func_def->Dump();
    std::cout << " }";
  }
};

class FuncDefAST : public BaseAST {
 public:
  std::unique_ptr<BaseAST> func_type;
  std::string ident;
  std::unique_ptr<BaseAST> block;

  void Dump() const override {
    std::cout << "FuncDefAST { " << std::endl;
    func_type->Dump();
    std::cout << "IDENT: " << ident << std::endl;
    block->Dump();
    std::cout << " }" << std::endl;
  }
};

class FuncTypeAST : public BaseAST {
 public:
  std::string func_type;

  void Dump() const override {
    std::cout << "FuncTypeAST: " << func_type << std::endl;
  }
};

class BlockAST : public BaseAST {
 public:
  std::unique_ptr<BaseAST> block_item;

  void Dump() const override {
    std::cout << "BlockAST { " << std::endl;
    block_item->Dump();
    std::cout << " }" << std::endl;
  }
};

class BlockItemAST : public BaseAST {
 public:
  std::unique_ptr<BaseAST> decl;
  std::unique_ptr<BaseAST> stmt;

  void Dump() const override {
    std::cout << "BlockAST { " << std::endl;
    if(decl)
    	decl->Dump();
    else
    	stmt->Dump();
    std::cout << " }" << std::endl;
  }
};

class DeclAST : public BaseAST {
 public:
  std::unique_ptr<BaseAST> const_decl;

  void Dump() const override {
    std::cout << "DeclAST { " << std::endl;
    const_decl->Dump();
    std::cout << " }" << std::endl;
  }
};

class ConstDeclAST : public BaseAST {
 public:
  std::string const_type;
  std::string btype;
  std::unique_ptr<BaseAST> const_def;
  std::string comma;
  std::string semi;

  void Dump() const override {
    std::cout << "ConstDeclAST { " << std::endl;
    std::cout << const_type << std::endl;
    std::cout << btype << std::endl;
    const_def->Dump();
    std::cout << comma << std::endl;
    std::cout << semi << std::endl;
    std::cout << " }" << std::endl;
  }
};

//typedef std::string BType;

class ConstDefAST : public BaseAST {
 public:
  std::string ident;
  std::string eq;
  std::unique_ptr<BaseAST> const_initval;

  void Dump() const override {
    std::cout << "ConstDefAST { " << std::endl;
    std::cout << ident << std::endl;
    std::cout << eq << std::endl;
    const_initval->Dump();
    std::cout << " }" << std::endl;
  }
};

struct add_const_def_ast
{
  std::string comma;
  ConstDefAST const_def;
};

class AddConstDefAST : public BaseAST {
 public:
  std::vector<add_const_def_ast> vec;
  

  void Dump() const override {
    std::cout << vec.at << std::endl;
    const_initval->Dump();
  }
};

class ConstInitValAST : public BaseAST {
 public:
  std::unique_ptr<BaseAST> const_exp;

  void Dump() const override {
    std::cout << "ConstInitValAST { " << std::endl;
    const_exp->Dump();
    std::cout << " }" << std::endl;
  }
};

class ConstExp : public BaseAST {
 public:
  std::unique_ptr<BaseAST> exp;

  void Dump() const override {
    std::cout << "ConstExpAST { " << std::endl;
    exp->Dump();
    std::cout << " }" << std::endl;
  }
};

class StmtAST : public BaseAST {
 public:
  std::unique_ptr<BaseAST> exp;
  std::string rtn;

  void Dump() const override {
    std::cout << "StmtAST { " << std::endl;
    std::cout << rtn << " ";
    exp->Dump();
    std::cout << " }" << std::endl;
  }
};

class ExpAST : public BaseAST {
 public:
  std::unique_ptr<BaseAST> lor_exp;

  void Dump() const override {
    std::cout << "ExpAST { " << std::endl;
    lor_exp->Dump();
    std::cout << " }" << std::endl;
  }
};

class LOrExpAST : public BaseAST {
 public:
  std::unique_ptr<BaseAST> land_exp;
  std::unique_ptr<BaseAST> lor_exp;
  std::string op;

  void Dump() const override {
    std::cout << "LOrExpAST { " << std::endl;
    if(lor_exp){
    	lor_exp->Dump();
    	std::cout << op;
    	land_exp->Dump();
    }
    else
    	land_exp->Dump();
    std::cout << " }" << std::endl;
  }
};

class LAndExpAST : public BaseAST {
 public:
  std::unique_ptr<BaseAST> eq_exp;
  std::unique_ptr<BaseAST> land_exp;
  std::string op;

  void Dump() const override {
    std::cout << "LAndExpAST { " << std::endl;
    if(land_exp){
    	land_exp->Dump();
    	std::cout << op;
    	eq_exp->Dump();
    }
    else
    	eq_exp->Dump();
    std::cout << " }" << std::endl;
  }
};

class EqExpAST : public BaseAST {
 public:
  std::unique_ptr<BaseAST> rel_exp;
  std::unique_ptr<BaseAST> eq_exp;
  std::string op;

  void Dump() const override {
    std::cout << "EqExpAST { " << std::endl;
    if(eq_exp){
    	eq_exp->Dump();
    	std::cout << op;
    	rel_exp->Dump();
    }
    else
    	rel_exp->Dump();
    std::cout << " }" << std::endl;
  }
};

class RelExpAST : public BaseAST {
 public:
  std::unique_ptr<BaseAST> add_exp;
  std::unique_ptr<BaseAST> rel_exp;
  std::string op;

  void Dump() const override {
    std::cout << "RelExpAST { " << std::endl;
    if(rel_exp){
    	rel_exp->Dump();
    	std::cout << op;
    	add_exp->Dump();
    }
    else
    	add_exp->Dump();
    std::cout << " }" << std::endl;
  }
};

class AddExpAST : public BaseAST {
 public:
  std::unique_ptr<BaseAST> add_exp;
  std::unique_ptr<BaseAST> mul_exp;
  std::string unary_op;

  void Dump() const override {
    std::cout << "AddExpAST { " << std::endl;
    if(add_exp){
    	add_exp->Dump();
    	std::cout << unary_op;
    	mul_exp->Dump();
    }
    else
    	mul_exp->Dump();
    std::cout << " }" << std::endl;
  }
};

class MulExpAST : public BaseAST {
 public:
  std::unique_ptr<BaseAST> unary_exp;
  std::unique_ptr<BaseAST> mul_exp;
  std::string unary_op;

  void Dump() const override {
    std::cout << "MulExpAST { " << std::endl;
    if(mul_exp){
    	mul_exp->Dump();
    	std::cout << unary_op;
    	unary_exp->Dump();
    }
    else
    	unary_exp->Dump();
    std::cout << " }" << std::endl;
  }
};

class UnaryExpAST : public BaseAST {
 public:
  std::unique_ptr<BaseAST> primary_exp;
  std::string unary_op;
  std::unique_ptr<BaseAST> unary_exp;

  void Dump() const override {
    std::cout << "UnaryExpAST { " << std::endl;
    if (primary_exp)
    	primary_exp->Dump();
    else{
    	std::cout << unary_op;
    	unary_exp->Dump();
    }
    std::cout << " }" << std::endl;
  }
};

//typedef std::string UnaryOpAST

class PrimaryExpAST : public BaseAST {
 public:
  std::unique_ptr<BaseAST> exp;
  std::string lparen;
  std::string rparen;
  std::string lval;
  int number;

  void Dump() const override {
    std::cout << "PrimaryExpAST { " << std::endl;
    if(exp){
    	std::cout << lparen;
    	exp->Dump();
    	std::cout << rparen;
    }
    else if(!lval.empty())
    	std::cout << lval;
    else
    	std::cout << number;
    std::cout << " }" << std::endl;
  }
};

//typedef std::string LValAST;

//typedef int NumberAST;

