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
    std::cout << "CompUnitAST { ";
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
    std::cout << "FuncDefAST { ";
    func_type->Dump();
    std::cout << ", " << ident << ", ";
    block->Dump();
    std::cout << " }";
  }
};

class FuncTypeAST : public BaseAST {
 //public:

  void Dump() const override {
    std::cout << "FuncTypeAST { ";
    std::cout << "int";
    std::cout << " }";
  }
};

class BlockAST : public BaseAST {
 public:
  std::unique_ptr<BaseAST> stmt;

  void Dump() const override {
    std::cout << "BlockAST { ";
    stmt->Dump();
    std::cout << " }";
  }
};

//change below
class StmtAST : public BaseAST {
 public:
  std::unique_ptr<BaseAST> exp;

  void Dump() const override {
    std::cout << "StmtAST { ";
    exp->Dump();
    std::cout << " }";
  }
};

class ExpAST : public BaseAST {
 public:
  std::unique_ptr<BaseAST> unary_exp;

  void Dump() const override {
    std::cout << "ExpAST { ";
    unary_exp->Dump();
    std::cout << " }";
  }
};

class UnaryExpAST : public BaseAST {
 public:
  std::unique_ptr<BaseAST> primary_exp;
  std::unique_ptr<BaseAST> unary_op;
  std::unique_ptr<BaseAST> unary_exp;

  void Dump() const override {
    std::cout << "UnaryExpAST { ";
    primary_exp->Dump();
    unary_op->Dump();
    unary_exp->Dump();
    std::cout << " }";
  }
};

class UnaryOpAST : public BaseAST {
 public:
  std::string unary_op;

  void Dump() const override {
    std::cout << "UnaryExpAST { ";
    std::cout << unary_op;
    std::cout << " }";
  }
};

class PrimaryExpAST : public BaseAST {
 public:
  std::unique_ptr<BaseAST> exp;
  int number;

  void Dump() const override {
    std::cout << "UnaryExpAST { ";
    exp->Dump();
    std::cout << number;
    std::cout << " }";
  }
};

class NumberAST : public BaseAST {
 public:
  int int_const;

  void Dump() const override {
    std::cout << "NumberExpAST { ";
    std::cout << int_const;
    std::cout << " }";
  }
};


