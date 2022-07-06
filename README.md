# Hyouka
A repository for Huawei Bisheng Cup by team Hyouka from NWPU



## 队名来源
Hyouka 冰菓（氷菓・ひょうか）



## 基本内容


**编译器规范相关**

编译器所用代码：C++17

编译编译器所用编译器：Clang-10.0.0 - x86_64

编译编译器所用优化：-O2 -lm

编译器最终运行平台：x84_64 Ubuntu 18.04


**编译器语言相关**

实现语言：SysY2022

所转汇编：Armv7 32bit

交叉编译平台：x84_64 Ubuntu 18.04

运行平台：Raspbery 4B, Raspberry Pi OS (Raspbian GNU/Linux 10), 32位 - ARMv7 Cortex-A72


**编译器运行相关**

当前实现为
```shell
功能测试: compiler testcase.sy -S -o testcase.s [--debug <debug_mode>]
性能测试: compiler testcase.sy -S -o testcase.s -O1 [--debug <debug_mode>]
```

汇编命令：

```shell
compiler testcase.sy -S -o testcase.s [-O1]
```

链接命令：

```shell
arm-linux-gnueabihf-gcc -static libsysy.a testcase.s -o testcase
```


执行命令：

```shell
qemu-arm testcase [< testcase.in]
```


**编译器测试相关**

功能测试
```shell
./test_functional.sh
```

性能测试
```shell
./test_performance.sh
```


**编译器实现相关**

想了解Hyouka编译器实现，请打开 `source` 文件夹查看 `readme`。
