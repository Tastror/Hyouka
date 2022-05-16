cmake_minimum_required(VERSION 3.22)
project(Hyouka)

set(CMAKE_CXX_STANDARD 14)

include_directories(
        front/Lexical
        front/Define/include
        front/Parsing/include
)

add_executable(source
        front/Define/define.cpp
        front/Lexical/test.hpp
        front/Parsing/AST.cpp
        front/Parsing/AST_expr.cpp
        front/Parsing/AST_keystmt.cpp
        main.cpp
)
