cmake_minimum_required(VERSION 3.22)
project(Hyouka)

set(CMAKE_CXX_STANDARD 17)

set(CMAKE_EXE_LINKER_FLAGS "-static-libgcc -static-libstdc++")

include_directories(
        front/Shell/include
        front/Define/include
        front/Lexical/include
        front/Parsing/include
        front/Optimise/include
        front/IRGen/include
        backend/Define/include
)

include_directories(
        3rd-party/cmdline
)

add_executable(hyouka
        front/Define/define.cpp
        front/Lexical/Lex.cpp
        front/Parsing/AST.cpp
        front/Parsing/AST_expr.cpp
        front/Parsing/AST_keystmt.cpp
        front/Optimise/FrontOpt.cpp
        front/IRGen/IRGen.cpp
        backend/Define/define.cpp
        backend/ControlFlow/ControlFlow.cpp
        main.cpp
        )
