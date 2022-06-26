cmake_minimum_required(VERSION 3.22)
project(compiler)

set(CMAKE_CXX_STANDARD 17)

set(CMAKE_EXE_LINKER_FLAGS "-static-libgcc -static-libstdc++")

include_directories(

        source/frontend/Shell/include
        source/frontend/Define/include
        source/frontend/Lexical/include
        source/frontend/Parsing/include
        source/frontend/Optimise/include
        source/frontend/IRGen/include

        source/backend/Define/include
        source/backend/CFG/include
        source/backend/ActivityAnalysis/include
        source/backend/AvailableExpression/include
        source/backend/RegisterAllocate/include
        source/backend/InstructionAllocate/include
)

add_executable(compiler

        source/main.cpp

        source/frontend/Define/define.cpp
        source/frontend/Lexical/Lex.cpp
        source/frontend/Parsing/AST.cpp
        source/frontend/Parsing/AST_expr.cpp
        source/frontend/Parsing/AST_keystmt.cpp
        source/frontend/Optimise/FrontOpt.cpp
        source/frontend/IRGen/IRGen.cpp

        source/backend/Define/backend_define.cpp
        source/backend/CFG/CFG.cpp
        source/backend/ActivityAnalysis/ActivityAnalysis.cpp
        source/backend/AvailableExpression/AvailableExpression.cpp
        source/backend/RegisterAllocate/RegisterAllocate.cpp
        source/backend/InstructionAllocate/InstructionAllocate.cpp
)
