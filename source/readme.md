# source

## 一、架构

```shell
- readme.md  # readme

- main.cpp  # 编译器主函数

- frontend  # 前端
  - Define  # 前端一切定义
  - Shell  # 命令行输入
  - Lexical  # 词法分析
  - Parsing  # 语法分析
  - Optimise  # 语义分析 & 优化
  - IRGen  # IR 生成
  
- backend  # 后端
  - Define  # 后端一切定义
  - CFG  # 控制流图
  - ActivityAnalysis  # 活跃变量分析
  - RegisterAllocate  # 寄存器分配
  - InstructionAllocate  # 指令分配

- group-legacy  # 已废弃或待完善的代码
```

## 二、使用方式

自己利用 cmakelists 编译完毕后，在 build 文件夹中输入类似
```shell
compiler <file_name> [-S] [-o] <out_name> [-O1] [--debug <debug_mode>]
```
的代码即可运行，例如可以使用
```shell
compiler ../test/demo.cpp -S -o ../test/demo.s -O1 --debug ir
```


## 三、详细架构

详细内容请进入对应文件夹，查看 readme 或者源代码。

### （一）编译前端

#### 1，词法分析

- `source/frontend/Lexical`，词法 token
- `debug_mode: lex`
- 负责者：tly, ss
- 错误类型
    - 词法错误：非法符号或名称
- 备注
    - 词法比较简单，没有什么值得备注的。不过本次采用了分割而非报错来处理一些连在一起的字符（比如1a会自动加空格分解为1和a；但是int2会理解会一个变量名毕竟这确实是合法的变量名），这和字符串的八进制转义的分割（遇到十进制数字分割而非报错）是异曲同工的。

#### 2，语法分析

- `source/frontend/Parsing`，AST 与符号表
- `debug_mode: parse, sym`
- 负责者：ss
- 错误类型
    - 语法错误：符号名称不符合语法规范
    - 符号错误：未定义的引用、重复定义
- 备注
    - 语法的整体框架非常清晰，但是在加了符号表以后显得很杂。
    - 尤其是符号表的上下传输，以及与 token、AST 属性这两者的同步，非常繁琐。
    - 不打算重构了，用注释标注了所有符号表出现的地方，可以便捷的 debug（仅仅是繁琐，不会出错）。个人打算找到一个非常优秀的架构方案再重构。

#### 3，语义分析 & 前端优化

- `source/frontend/Semantic`，AST 与符号表（更新版）
- `debug_mode: opt, optsym`
- 负责者：ss
- 错误类型
    - 语义错误：隐式强制转换不合规范、% 使用浮点、（优化时）除0等。
- 优化内容
    - 常量计算
    - constexpr 计算（constexpr 指在编译阶段就能确定值的 const）
- 备注
    - 数组的优化还没写，防止炸。

#### 4，中间代码生成

- `source/frontend/IR`，IR
- `debug_mode: ir`
- 负责者：ss
- 无错误类型

### （二）编译后端

#### 5，控制流图

- `source/backend/CFG`，控制流块
- `debug_mode: cfg`
- 负责者：wxw, ss
- 无错误类型
- 备注
  - 将 ir 分为静态区和代码区，代码区按照函数继续分区，函数按照 jump 块和标签块继续分区。注意，call 没有进行分区。

#### 6，变量活跃度分析

- `source/backend/ActivityAnalysis`，控制流块与活跃变量 vector
- `debug_mode: aa`
- 负责者：tly
- 无错误类型

#### 7，寄存器优化

- `source/backend/RegisterAllocate`，含已分配寄存器编号的控制流块
- `debug_mode: reg`
- 负责者：ss
- 无错误类型

#### 8，指令选择与调度

- `source/backend/InstructionAllocate`，armv7 汇编序列
- `debug_mode: arm`
- 负责者：wxw
- 无错误类型

### （三）静态库链接

暂不需要

### （四）转机器码

暂不需要