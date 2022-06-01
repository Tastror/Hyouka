# 语法分析模块

Tastror updated in 2022.5.30

## 一、语法树

语法分析采用 FIRST 标记符号的自顶向下分析法。因为 SysY 的语言大多一个 FIRST 符就够了，所以非常舒服。

### 1）语法树节点

语法树节点请查看 `define.h` 中 AST 部分。

```c++
    // normal
    AST_type type = None;
    std::string data;  // normally raw data; ExpressionAST use it for operator
    std::string comment;
    std::shared_ptr<AST_node> sister = nullptr;
    std::shared_ptr<AST_node> child = nullptr;
    // std::shared_ptr<AST_node> parent = nullptr; // don't use parent, or the pointer will form a loop
    std::shared_ptr<AST_node> last_child = nullptr;

    // symtable
    std::shared_ptr<Symtable> symtable_ptr = nullptr;

    // attribution (same as symtable node)
    bool using_attribute = false;
    std::string name;
    std::string only_name;
    int basic_type = basic_any;
    bool is_const = false;
    bool is_static = false;
    bool is_array_pointer = false;
    bool is_function_pointer = false;
    int array_nest_num = 0;
    int arg_num = 0;
    int function_type = function_none;

    // use for Expr optimise
    bool count_expr_ending = false;

    // field, use for Number (same as token node)
    int_double_storage value_and_type;

    // declaration bound sym node
    std::shared_ptr<symtable_node> declaration_bound_sym_node = nullptr;

    // methods
    static void connect_child(const std::shared_ptr<AST_node>& parent, const std::shared_ptr<AST_node>& child);
    static void reverse_connect_child(const std::shared_ptr<AST_node>& parent, const std::shared_ptr<AST_node>& child);
    void absorb_sym_attribution(const std::shared_ptr<symtable_node>& symtable_resource_node);
    std::shared_ptr<symtable_node> search_id_name(const std::string& search_name, const std::shared_ptr<symtable_node>& sym_head);
    std::shared_ptr<symtable_node> search_id_name(const std::string& search_name);
```

其中
- `normal` 是基础信息，注意 parent 被去掉了，防止使用 shared_ptr 的时候循环引用导致无法正常释放空间，所以这里只有引用平辈和引用子辈。
- `symtable` 绑定了每个 AST 节点对应的符号表（符号表里又保存了可见域链来实现外部变量的引用，后面再提）
- `attribution` 是关键点，保存了 AST 的属性。这里的属性一般很简单，但是在引用变量的时候是需要查符号表的，查询方式是使用 method 里的 search_id_name，最后使用 `AST_node.absorb_sym_attribution()` 来同步符号表的信息。
- `field` 是当前 AST 的值，仅限 Number 使用。AST 的 Expression 的 Number 会独立同步 token_node 的 value_and_type。而 AST 的 Expression 部分的其他 value_and_type 的计算则不归语法分析管了（一部分归优化管，一部分直接写为 IR 的运算）。
- `declaration_bound_sym_node` 是当前 AST 绑定的符号节点，仅限「变量的定义和使用」使用。

### 2）语法树工厂

构建语法树的工厂查看 `AST.h`。它们是 BaseAST 和派生出的各种 AST 类，是用来生成 AST 树的工厂。每个 AST 工厂类负责生成一种类型的 AST 节点，通过互相调用把 AST 节点串联成树。

```c++
    AST_PTR head;
    TOKEN_PTR now_token;
    TOKEN_PTR next_token;
    std::shared_ptr<Symtable> symtable_ptr;
    void GoNext();
    explicit BaseAST(const TOKEN_PTR& token_head, const Symtable& symtable);
    explicit BaseAST(const TOKEN_PTR& token_head, const std::shared_ptr<Symtable>& symtable_ptr);
    void PassDownSymtableAttribute(const SYM_PTR& symtable_node_ptr) const;
    [[nodiscard]] SYM_PTR GetBackSymtableAttribute() const;
    virtual ~BaseAST() = default;
```

- `head` 是这个工厂生成的**主要节点**，当然它可以生成很多子节点，但是 head 是这个工厂最鲜明的自身节点（工厂生成的其他节点都会是 head 的子节点，而非其姊妹或母亲）。
- `now_token` 和 `next_token` 是当前词法节点的进度。由于这个进度非常重要，在衔接两个 AST 工厂时必须确保传递准确，所以这里没有写为 static，而是直接在构造函数手动传递。整个词法 token 在 AST 工厂中只增不减，并且用且仅用 `GoNext()` 向后推进一格。
- `symtable_ptr` 是当前工厂所采用的符号表（注意，AST 节点本身绑定的符号表需要工厂给它赋，这些绑定工作在工厂中进行：如果需要不需要生成子符号表，则直接在构造函数中传递 symtable_ptr，否则需要新建一个符号表并用 `Symtable.extend_from()` 连接两个符号表，并在构造函数中传递。构造函数会将这个传递的符号表赋给新工厂的 head 节点的 symtable_ptr）。

### 3）提示信息

> :warning: **时间复杂度 WARNING**
>
> 在赋值语句中使用了 `token_node::search_data()`。它向后搜索了是否存在 `=`。
>
> 在一个有大量表达式的数组赋值中，也许会影响性能。

## 二、符号表

符号表在 AST 生成的同时生成。

### 1）符号表

符号表由符号节点组成的链表构成，同时，符号表保存了可见域的符号链 `heads_chain`（比如 if 的条件内的符号表，符号链包括了外侧 main 函数和外侧静态区）。

符号表的头 `my_head`（一个无具体数据的符号节点）除了用来表示符号表的开始，也用来向上或者向下传递属性。

如果需要一个符号表存在子符号表，则需要在新建一个符号表后，使用 `Symtable.extend_from()` 继承母符号表。

如果需要插入一个符号节点，使用 `Symtable.append()` 会自动插入，并更新这个符号节点的 `table_id` 和 `only_name`。

```c++
    static std::vector<SYM_PTR> all_symtable_heads;
    std::vector<SYM_PTR> heads_chain;
    static int table_counts;
    int table_id;
    SYM_PTR sym_head = nullptr;
    SYM_PTR sym_tail = nullptr;
    SYM_PTR my_head = nullptr;
    SYM_PTR my_tail = nullptr;

    Symtable();
    virtual ~Symtable() = default;

    void extend_from(const std::shared_ptr<Symtable>& last_symtable_ptr);
    void append(const symtable_node& append_sym_node);
```

### 2）符号节点

符号表的符号节点 `symtable_node` 包含了如下内容

```c++
    // basic
    int table_id = -1;
    bool is_head = false;
    std::string identifier_name;
    std::shared_ptr<symtable_node> next = nullptr;

    // attribute
    std::string only_name;
    int basic_type = basic_any;
    bool is_const = false;
    bool is_static = false;
    bool is_array_pointer = false;
    bool is_function_pointer = false;
    int array_nest_num = 0;
    int arg_num = 0;
    int function_type = function_none;

    // field, use for const
    int_double_storage value_and_type;
    bool treat_as_constexpr = false;

    // methods
    void rename();
    void rename(const std::string& name);
```

其中
- `basic` 部分保存了每一个符号节点的基础信息
- `attribute` 保存了额外属性信息（自己留着自己用，或者交给 AST 同步）
- `field` 只留给 constexpr 使用（这一部分在后面的优化里，用来把 constexpr 消解为常量）。
- 在符号表被 `Symtable.append()` 或者自己手动 `symtable_node.rename()` 的时候，都会更新 `only_name`。不过除了 `Symtable.head` 自动生成没法被 `Symtable.append()` 只能 `symtable_node.rename()` 以外，其他符号节点都是用 `Symtable.append()` 的。

### 3）提示信息

> **`symtable_node.value_and_type` 和 `symtable_node.treat_as_constexpr` 何时使用**
> 
> 在 `front/Optimise` 的优化时，如果存在可以理解为 constexpr 表达式，会置 treat_as_constexpr 为真，并同步 AST_node 和 symtable_node 的 value_and_type。



















