@Entry
@Component
struct MeiTuanCase {
  @State isShowCar: boolean = false

  build() {
    //后面的元素会盖在前一个元素上面
    Stack({ alignContent: Alignment.Bottom }) {
      CarMain()
      if (this.isShowCar) {
        MtCar()
      }
      MeiTuanAddView({ isShowCar: $isShowCar })
    }.height('100%')
  }
}

/**
 * 主体组件
 */
@Component
struct CarMain {
  build() {
    Column() {

    }.backgroundColor(Color.Pink).width('100%').height('100%')

  }
}

@Component
struct MtCar {
  build() {
    Column() {

    }.height('50%').width('100%').backgroundColor(Color.Red)
  }
}


/**
 * 底部组件
 */
@Component
struct MeiTuanAddView {
  @Link
  isShowCar: boolean

  build() {
    Row() {
      Button()
        .height(50)
        .width('100%')
        .backgroundColor(Color.Black)
        .borderRadius(20)
        .onClick(() => {
          this.isShowCar = !this.isShowCar
        })
    }.padding({ left: 20, right: 20, bottom: 20 }).width('100%')
  }
}












