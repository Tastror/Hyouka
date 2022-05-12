cmake_minimum_required(VERSION 3.22)
project(Hyouka)

set(CMAKE_CXX_STANDARD 14)

include_directories(
        front
        front/include
)

add_executable(
        front/test.hpp
        front/AST.hpp
        main.cpp
)
