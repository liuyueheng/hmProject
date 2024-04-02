import promptAction from '@ohos.promptAction'

/** 状态共享-状态监听器
 * 如果开发者需要关注某个状态变量的值是否改变，可以使用 @Watch 为状态变量设置回调函数。
 Watch("回调函数名")中的回调必须在组件中声明，该函数接收一个参数，参数为修改的属性名
 注意：Watch修饰符要写在 State Prop Link Provide的修饰符下面，否则会有问题
 ● 在第一次初始化的时候，@Watch装饰的方法不会被调用
 * */
@Entry
@Component
struct WatchCase {
  @State
  @Watch("changeData")
  count: number = 0

  changeData() {
    promptAction.showToast({ message: this.count.toString() })
  }

  build() {
    Column() {
      Text(`我有${this.count.toString()}元`).onClick(() => {
        this.count++
      })
      changeComponent({ num: this.count })
    }
  }
}

@Component
struct changeComponent {
  @Prop
  num: number = 0

  build() {
    Text(this.num.toString()).fontColor(Color.Black).fontSize(40).onClick(() => {
      this.num++
    })
  }
}