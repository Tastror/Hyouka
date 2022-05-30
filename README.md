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

**词法分析**

- `source/front/Lexical`，词法 token
- 手写；*负责者：tly, ss*
- 错误类型
  - 词法错误：非法符号或名称
- 备注
  - 词法比较简单，没有什么值得备注的。不过本次采用了分割而非报错来处理一些连在一起的字符（比如1a会自动加空格分解为1和a；但是int2会理解会一个变量名毕竟这确实是合法的变量名），这和字符串的八进制转义的分割（遇到十进制数字分割而非报错）是异曲同工的。

**语法分析**

- `source/front/Parsing`，AST 与符号表
- 手写；*负责者：ss*
- 错误类型
  - 语法错误：符号名称不符合语法规范
  - 符号错误：未定义的引用、重复定义
- 备注
  - 语法的整体框架非常清晰，但是在加了符号表以后显得很杂。
  - 尤其是符号表的上下传输，以及与 token、AST 属性这两者的同步，非常繁琐。
  - 不打算重构了，用注释标注了所有符号表出现的地方，可以便捷的 debug（仅仅是繁琐，不会出错）。个人打算找到一个非常优秀的架构方案再重构。

**语义分析 & 前端优化**

- `source/front/Semantic`，AST 与符号表（更新版）
- 手写；*负责者：*ss
- 错误类型
  - 语义错误：隐式强制转换不合规范、% 使用浮点、（优化时）除0等。
- 优化内容
  - 常量计算
  - constexpr 计算（constexpr 指在编译阶段就能确定值的 const）
- 备注
  - 数组的优化还没写，防止炸。

**中间代码生成**

- `source/front/IR`, IR
- 仿照 LLVM 的子集（修改版）手写；*负责者：*ss
- 无错误类型

### 编译后端

指令选择

指令调度

寄存器优化

### 静态库链接

...

### 转机器码

...
