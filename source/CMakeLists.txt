cmake_minimum_required(VERSION 3.22)
project(Hyouka)

set(CMAKE_CXX_STANDARD 17)

set(CMAKE_EXE_LINKER_FLAGS "-static-libgcc -static-libstdc++")

include_directories(

        frontend/Shell/include
        frontend/Define/include
        frontend/Lexical/include
        frontend/Parsing/include
        frontend/Optimise/include
        frontend/IRGen/include

        backend/Define/include
        backend/CFG/include
        backend/ActivityAnalysis/include
        backend/AvailableExpression/include
        backend/RegisterAllocate/include
        backend/InstructionAllocate/include
)

add_executable(hyouka

        main.cpp

        frontend/Define/define.cpp
        frontend/Lexical/Lex.cpp
        frontend/Parsing/AST.cpp
        frontend/Parsing/AST_expr.cpp
        frontend/Parsing/AST_keystmt.cpp
        frontend/Optimise/FrontOpt.cpp
        frontend/IRGen/IRGen.cpp

        backend/Define/backend_define.cpp
        backend/CFG/CFG.cpp
        backend/ActivityAnalysis/ActivityAnalysis.cpp
        backend/AvailableExpression/AvailableExpression.cpp
        backend/RegisterAllocate/RegisterAllocate.cpp
        backend/InstructionAllocate/InstructionAllocate.cpp
)
