
# More Control Flow Tools



## 函数定义详解
### 默认值参数
- 默认值在 *定义* 作用域里的函数定义中求值，默认值只计算一次
- 默认值为列表、字典或类实例等可变对象时，会产生与该规则不同的结果。不想在后续调用之间共享默认值时，应将默认值设置为 `None`

### 关键字参数
- 函数调用时，关键字参数必须跟在位置参数后面。
- 关键字参数的顺序并不重要。
- 最后一个形参为 `**name` 形式时，接收一个字典，该字典包含与函数中已定义形参对应之外的所有关键字参数。
- `**name` 形参可以与 `*name` 形参组合使用（`*name` 必须在 `**name` 前面）， `*name` 形参接收一个元组，该元组包含形参列表之外的位置参数。

## Unpacking Argument Lists
- 作为函数参数。

with the *-operator to unpack the arguments out of a list or tuple: