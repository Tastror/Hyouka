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

前端

词法分析：Lexical

语法分析：AST，其中包含了符号表的生成

> 符号表贯穿于语法分析中，不知道是这样写好还是单独拿出来好，但符号是伴随 AST 树的，不如一起写。就是上下传属性（比如多变量定义的 int 要下传到独立定义；函数参数个数要从形参独立定义结束后上传到函数名本身），需要让每个 AST 除了传入上级的 symtable 以外，还要传入一个“继承 sym_node”，并在 Parse 结束后返回一个“回调 sym_node”，非常烦。

语义分析：
