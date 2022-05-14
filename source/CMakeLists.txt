cmake_minimum_required(VERSION 3.22)
project(Hyouka)

set(CMAKE_CXX_STANDARD 14)

include_directories(
        front
        front/include
)

add_executable(source
        front/define.cpp
        front/AST.cpp
        front/AST_expr.cpp
        front/AST_keystmt.cpp
        main.cpp
)
