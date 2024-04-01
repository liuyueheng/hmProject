@Entry
@Component
struct BuilderParamCard {
  @Builder
  HmCardItemBuild(value: CardTwoClass) {
    Row() {
      Text(value.time)
      Text(value.location)
    }.justifyContent(FlexAlign.SpaceBetween)
    .padding(15)
    .width('100%')
    .border({
      width: {
        bottom: value.isShow ? 0.5 : 0
      }
    })
  }

  build() {
    Column() {
      HmCard2() {
        //两种方法 1.Builder的方式   2.新建组件的方式
        this.HmCardItemBuild({ time: '111', location: '22222', isShow: true })
        this.HmCardItemBuild({ time: '2222', location: '3333', isShow: true })
        this.HmCardItemBuild({ time: '444', location: '3333', isShow: false })
        // HmCardItem({ leftValue: "11", rightValue: "22" })
        // HmCardItem({ leftValue: "11", rightValue: "22" })
        // HmCardItem({ leftValue: "11", rightValue: "22" })
      }
    }.height('100%')
    .backgroundColor(Color.Black)
  }
}


@Component
struct HmCard2 {
  @BuilderParam
  cardFn: () => void = () => {
  }

  build() {
    Column() {
      Column() {
        this.cardFn()
      }.width('100%').backgroundColor(Color.White).borderRadius(10)
    }.width('100%')
    .padding(15)
    .backgroundColor(Color.Red)
  }
}

@Component
struct HmCardItem {
  leftValue: string = ""
  rightValue: string = ""

  build() {
    Row() {
      Text(this.leftValue)
      Text(this.rightValue)
    }.justifyContent(FlexAlign.SpaceBetween)
    .padding(15)
    .width('100%')
    .border({
      width: {
        bottom: 0.5
      }
    })
  }
}


class CardTwoClass {
  time: string = ""
  location: string = ""
  isShow: boolean = false
}







