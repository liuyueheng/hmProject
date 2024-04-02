/**
 * build的使用
 * 如果你不想在直接抽象组件，
 * ArkUI还提供了一种更轻量的UI元素复用机制 @Builder，
 * 可以将重复使用的UI元素抽象成一个方法，
 * 在 build 方法里调用。称之为自定义构建函数
 */
@Entry
@Component
struct BuildCase {
  @State formData: CardClass = {
    time: "",
    location: '',
    type: ''
  }
  @State isShow: boolean = false

  aboutToAppear() {
    setTimeout(() => {
      this.formData = {
        time: "2022-09-02",
        location: "长沙",
        type: "漏油"
      }
      this.isShow = true
    }, 3000)
  }

  build() {
    Column() {
      if (this.isShow == true) {
        Text(JSON.stringify(this.formData))
        getCollection({ leftValue: "异常类型", rightValue: this.formData.type })
        getCollection({ leftValue: "异常地点", rightValue: this.formData.location })
        getCollection({ leftValue: "异常时间", rightValue: this.formData.time })
        Button("修改数据").onClick(() => {
          this.formData.location = "湖南"
        })
      }
    }.height('100%').backgroundColor("#ccc")
  }
}

/**
 * 需要传递对象，切记不能传递单值（比如string number...）！！！
 * 不然不能响应式
 * @param value
 */
@Builder
function getCollection(value: cellPrams) {
  Row() {
    Row() {
      Text(value.leftValue)
      Text(value.rightValue)
    }
    .borderRadius(8)
    .justifyContent(FlexAlign.SpaceBetween)
    .height(40)
    .width('100%')
    .padding({ left: 30, right: 30 })
    .backgroundColor(Color.White)
  }.padding(10)

}

class CardClass {
  time: string = ""
  location: string = ""
  type: string = ""
}

class cellPrams {
  leftValue: string = ""
  rightValue: string = ""
}