#!/bin/sh

# C++ 模式
flex -o lex.yy.cpp sysy.l #-->lex.yy.cpp
bison -d -o sysy.tab.cpp sysy.y   #-->sysy.tab.cpp,sysy.tab.hpp
g++ main.cpp lex.yy.cpp sysy.tab.cpp -o src2ast  #-->src2ast
