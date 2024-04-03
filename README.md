鸿蒙项目框架搭建
知乎案例
美团案例
神领物流

鸿蒙小知识总结：
● State组件内状态
● Prop子组件修饰符-4.0 boolean/number/string- 单向数据流
● Link 子组件修饰符-双向数据流，所有类型都支持- 必须通过$前缀-（循环数据就没有办法传入）
● Provide和Consume 双向数据流-所有结构均支持
● Watch 可以监听State Link Prop ObjectLink的数据变化
● Observed和ObjectLink
● Link-双向
● Prop-单向
● Observed 和 ObjectLink- (肯定不能用在entry修饰的组件中)
● LocalStorage(UIAbility)-AppStorage-PersionStorage(写入磁盘-不能每次都直接运行)
PersionStorage来声明一下属性就可以保证该属性会被写入缓存
● StorageProp-StorageLink
● Http(1. await会强制等待后面的promise进行resolve 2. await和await必须配套使用)
● 嵌套更新数据的方式 (1. ...延展运算符 2. 通过new的方式)
