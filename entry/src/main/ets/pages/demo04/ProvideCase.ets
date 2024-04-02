import promptAction from '@ohos.promptAction'

/**
 * 后代共享组件使用
 * 如果我们的组件层级特别多，ArkTS支持跨组件传递状态数据来实现双向同步@Provide和 @Consume
 * 这特别像Vue中的依赖注入
 * 注意： 在不指定Provide名称的情况下，你需要使用相同的名字来定义和接收数据
 */
@Entry
@Component
struct ProvideCase {
  @Provide('aa')
  // @Watch("updateData")
  money: number = 1000

  // updateData() {
  //   promptAction.showToast({ message: `谁动了我的钱包 ${this.money.toString()}` })
  // }

  build() {
    Column() {
      Text(`爷爷有碎银${this.money.toString()}两`).onClick(() => {
        this.money += 600
      })
      FatherView()
    }.width('100%')
  }
}


@Component
struct FatherView {
  @Consume('aa')
  @Watch("updateData")
  money: number

  updateData() {
    promptAction.showToast({ message: `谁动了我的钱包 ${this.money.toString()}` })
  }

  build() {
    Column() {
      Text("爸爸").onClick(() => {
        this.money += 2
      })
      SonZi()
    }.width('100%')
  }
}

@Component
struct SonZi {
  @Consume('aa')
  money: number

  build() {
    Column() {
      Text("孙子").onClick(() => {
        this.money += 100
      })
    }.width('100%')
  }
}