# Hyouka
A repository for Huawei Bisheng Cup by team Hyouka from NWPU

## 队名来源
Hyouka 冰果（氷菓・ひょうか）

## 基本内容

**编译器相关**

编译器所用代码：C++17

编译编译器所用编译器：Clang-10.0.0 - x86_64

编译编译器所用优化：-O2 -lm

编译器最终运行平台：x84_64 Ubuntu 18.04

**语言相关**

实现语言：SysY

所转汇编：Armv7

交叉编译平台：x84_64 Ubuntu 18.04

运行平台：Raspbery 4B, Raspberry Pi OS (Raspbian GNU/Linux 10), 32位 - ARMv7 Cortex-A72

汇编命令：

```shell
功能测试: compiler testcase.sysy -S -o testcase.s
性能测试: compiler testcase.sysy -S -o testcase.s -O1
```

当前实现为
```shell
hyouka testcase.sysy -S -o testcase.s
hyouka testcase.sysy -S -o testcase.s -O 1    # 解析器有问题(见3rd-party)，之后会更换
```



## 详细内容

### 编译前端

词法分析

- `source/front/Lexical`，词法 token
- 手写；*负责者：tly, ss*
- 错误类型
  - 词法错误：非法符号或名称

语法分析

- `source/front/Parsing`，AST 与符号表
- 手写；*负责者：ss*
- 错误类型
  - 语法错误：符号名称不符合语法规范
  - 符号错误：未定义的引用、重复定义

语义分析

- `source/front/Semantic`，AttrAST
- 手写；*负责者：*
- 错误类型
  - 语义错误：强制转换不合规范、未找到重载或引用、const 赋值等

中间代码生成

- `source/front/IR`, IR
- 仿照 LLVM 的子集（修改版）手写；*负责者：*
- 无错误类型

### 编译后端

指令选择

指令调度

寄存器优化

### 静态库链接

...

### 转机器码

...
