# Control Flow Graph(CFG)
Simon updated in 2022.6.11

## Pipeline
4th IR --> CFG List

## CFG List
CFG List is a list composed of several CFGs, where each CFG is corresponded to a certain function in the program.

## CFG
CFG is a Directed Acyclic Graph(DAG) where each node is a basic block.

## Basic Block 
### （一）Definition
`基本块`是指程序中一顺序执行的语句序列，其中只有一个入口语句（第一个语句）和一个出口语句（最后一个语句）

对于一个基本块来说，执行时只能从其入口语句进入，从其出口语句退出

```
语句
出口语句	任何控制转移四元式
入口语句	所转向的目标语句
```

### （二）Implementation
#### 1、求函数中各个基本块的入口语句。
① 函数的第一个语句

② 能由条件或无条件转移语句转移到的语句

③ 紧跟在条件转移语句后面的语句

#### 2、对每一入口语句，构造所属的基本块，该基本块由：
1）该入口语句到下一入口语句（不包括下一入口语句）之间的语句序列组成

2）该入口语句到一转移语句（包括该转移语句）之间的语句序列组成

3）该入口语句到一停语句（包括该停语句）之间的语句序列组成

#### 3、凡是函数中未包含在某一基本块中的语句，都是函数中控制流程不可达的语句，可删除它们。(可达性分析？)
