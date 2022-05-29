/*	AST design and print	*/

#pragma once

#include <iostream>

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
  std::unique_ptr<BaseAST> stmt;

  void Dump() const override {
    std::cout << "BlockAST { " << std::endl;
    stmt->Dump();
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
  int number;

  void Dump() const override {
    std::cout << "PrimaryExpAST { " << std::endl;
    if(exp)
    	exp->Dump();
    else
    	std::cout << number;
    std::cout << " }" << std::endl;
  }
};

//typedef int NumberAST

