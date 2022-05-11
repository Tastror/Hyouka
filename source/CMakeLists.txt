cmake_minimum_required(VERSION 3.22)
project(source)

set(CMAKE_CXX_STANDARD 17)

include_directories(front)

add_executable(source
        front/AST.hpp
        main.cpp)
