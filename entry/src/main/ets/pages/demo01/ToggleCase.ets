@Entry
@Component
struct ToggleCase {
  @State message: string = 'Hello World'
  @State isChange: boolean = false
  @State selectIndex: number = -1

  build() {
    Row() {
      Column() {
        Toggle({ type: ToggleType.Switch, isOn: this.isChange }).onChange((isChange) => {
          this.isChange = isChange
        })
        Image("https://img2.baidu.com/it/u=2539872750,2513176690&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500")
          .width(200)
          .height(200)
          .borderRadius(100).visibility(this.isChange ? Visibility.Visible : Visibility.None)
        Select([{ value: "1" }, { value: "2" }, { value: "3" }]).onSelect((index) => {
          this.selectIndex = index
        })
        if (this.selectIndex == 0) {
          Text("张三")
        } else if (this.selectIndex == 1) {
          Text("李四")
        } else if (this.selectIndex == 2) {
          Text("王五")
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}