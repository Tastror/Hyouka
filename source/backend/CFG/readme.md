# Control Flow Graph
Simon updated in 2022.6.9

## Pipeline
BasicBlock List --> Flow Graph

## Explanation
### Definition： 
以基本块为结点，控制程序流向作为有向边，画出的有向图称为流图。

### Feature：

具有唯一首结点的有向图

从首结点开始到流图中任何结点都有通路

如果一个结点的基本块的入口语句是程序的第一条语句，则称此结点为首结点
