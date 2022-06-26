# Hyouka 四元式规范

Tastror updated in 2022.6.1

## 类型注解

### 字面数据类型 literal_value_storage

```
[literal_none]  // 非字面数字
[literal_int]  // i32类型字面数据
[literal_float]  // float类型字面数据
```



### 基本数据类型 identify_value_type_tuple

```
[basic_any]  // 任意类型数据，本身的literal_int或literal_float将会被无视，直接传输literal_value
             // 你可能担心转换问题，但是这的 any 只会作为同类型传递的中间变量使用；凡是左右有可能是不同变量的，必须显式变为int或float
[basic_int]  // i32类型数据，本身为literal_int
[basic_float]  // float类型数据，本身为literal_float

[basic_any*]  // 任意类型指针，本身为literal_int
[basic_int*]  // i32类型指针，本身为literal_int
[basic_float*]  // float类型指针，本身为literal_int
[basic_function*]  // function类型指针，本身为literal_int

以上任何时候都可以是 literal_none，代表暂时没有数据存入
```



```
IR_tuple

is_name true: name, IVTT, IVTT.literal_value
               √         √                      ×

is_name false: name, IVTT, IVTT.literal_value
                ×         √                     √
```





## 规范

### 基本类型

```
ir_forth
    [index]  target : operator : org_1 : org2  #  comment

ir_label
    [index]  target  #  comment
```





## Parse 优化后的接口要求

只能有如下内容出现在外层，并且其内层格式必须形如描述。

[] 表示必须在该位置但可选，{} 表示任意位置且可选，无框表示必须在该位置且必须出现

### 1, ProgramBody（✓）

also use basic_generate

```
ProgramBody
    {FunctionDefinition}
    {SingleDefinition}
    {ArrayDefinition}
```



### 2, FunctionDefinition（✓）

function_generate

```
FunctionDefinition
    FunctionType
    Identifier
    FunctionParams
    BlockStatement
```



### 3, SingleDefinition（✓）

single_define_generate

```
SingleDefinition
    Identifier
    [Expression]
```



### 4, ArrayDefinition

array_define_generate

```
ArrayDefinition
    Identifier
    Index
    [ArrayInitialBlock]
```



### 5, BlockStatement（✓）

also use basic_generate

```
BlockStatement

    {BlockStatement}
    
    {SingleDefinition}
    {ArrayDefinition}
    
    {SingleAssignment}
    {ArrayAssignment}
    
    {KeywordStatement}
    {NormalStatement}
```



### 6, SingleAssignment

```
SingleAssignment
```



### 7, ArrayAssignment

```
ArrayAssignment
```



### 8, NormalStatement

```
NormalStatement
    Expression
```



### 9, Expression

```
Expression
    Expression/Number/ArrayUsage/FunctionUsage
    [Expression/Number/ArrayUsage/FunctionUsage]
```



### 10, ArrayUsage

```
ArrayUsage
```



### 11, FunctionUsage

```
FunctionUsage
