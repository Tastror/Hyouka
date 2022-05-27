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
    std::cout << "CompUnitAST { " << std::endl << "    ";
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
    std::cout << "FuncDefAST { " << std::endl << "        ";
    func_type->Dump();
    std::cout << ", " << ident << ", ";
    block->Dump();
    std::cout << " }";
  }
};

class FuncTypeAST : public BaseAST {
 //public:

  void Dump() const override {
    std::cout << "FuncTypeAST { " << std::endl << "            ";
    std::cout << "int ";
    std::cout << " }";
  }
};

class BlockAST : public BaseAST {
 public:
  std::unique_ptr<BaseAST> stmt;

  void Dump() const override {
    std::cout << "BlockAST { " << std::endl << "                ";
    stmt->Dump();
    std::cout << " }";
  }
};

class StmtAST : public BaseAST {
 public:
  std::unique_ptr<BaseAST> number;
  int num;
  std::string rtn;

  void Dump() const override {
    std::cout << "StmtAST { " << std::endl << "                      ";
    //std::cout << rtn;
    //number->Dump();
    std::cout << " }";
  }
};

class NumberAST : public BaseAST {
 public:
  int int_const;

  void Dump() const override {
    std::cout << "NumberAST { " << std::endl << "                                ";
    //std::cout << int_const;
    std::cout << "0";
    std::cout << " }";
  }
};

