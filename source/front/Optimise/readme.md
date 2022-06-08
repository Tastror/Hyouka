# 语义分析 & 前端优化

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



## 转换规范

### 隐式转换规范

| identify_value_type_tuple a | identify_value_type_tuple b | 结果        |
| ------------- | ------------- | ----------- |
| 相同          | 相同          | 相同        |
| basic_any     | basic_any下方任意 | b    |
| basic_int     | basic_int下方任意 | b |
| basic_float | basic_float下方任意 | 【报错】 |
| basic_any\* | basic_any*下方任意 | b |
| any\* 外其他任意指针 | any\* 外其他任意不同的指针 | 【报错】  |

