//
// Created by Tastror on 2022/5/29.
//

#pragma once

#include "define.h"

namespace Front::Optimiser {
    void Optimize(const AST_PTR& source_AST_head);
}

namespace Optimize_Useful {
    value_and_type_tuple implicit_conversion(const value_and_type_tuple& a, const value_and_type_tuple& b);
}