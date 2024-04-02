import promptAction from '@ohos.promptAction'

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