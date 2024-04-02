import promptAction from '@ohos.promptAction'

/** 状态共享-状态监听器 */
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