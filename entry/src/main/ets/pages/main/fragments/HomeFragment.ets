import promptAction from '@ohos.promptAction'
import router from '@ohos.router'

@Entry
@Component
export default struct HomeFragment {
  build() {
    Column() {
      // Header()
      // Main()
      // Footer()
      GoodListView()
    }
  }
}

@Component
struct Header {
  build() {
    Scroll() {
      Column() {
        Text() {
          Span("4").fontSize(12)
          Span("6").fontSize(15)
          Span("8").fontSize(16)
        }

        Text() {
          Span("1").fontSize(12)
          Span("2").fontSize(15)
          Span("3").fontSize(16)
        }

        Row({ space: 30 }) {
          Column().width(100).height(200).backgroundColor(Color.Blue)
          Column().width(100).height(200).backgroundColor(Color.Red)
          Column().width(100).height(200).backgroundColor(Color.Pink)
        }.width("100%").justifyContent(FlexAlign.Center).margin({ top: 100 })

        Column({ space: 40 }) {
          Column().width(200).height(50).backgroundColor(Color.Blue)
          Column().width(200).height(50).backgroundColor(Color.Red)
          Column().width(200).height(50).backgroundColor(Color.Pink)
        }.margin({ top: 20 })

        Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceAround }) {
          Column().width(100).height(200).backgroundColor(Color.Blue)
          Column().width(100).height(200).backgroundColor(Color.Red)
          Column().width(100).height(200).backgroundColor(Color.Pink)
        }.margin({ top: 200, bottom: 100 })
      }
      .width('100%')
    }
  }
}

@Component
struct Main {
  build() {
    Row() {
      Text("Main")
        .fontColor(Color.White)
    }
    .width('100%')
    .height(200)
    .backgroundColor(Color.Blue)
    .justifyContent(FlexAlign.Center)
  }
}

@Component
struct Footer {
  build() {
    Row() {
      Text("Footer")
        .fontColor(Color.White)
    }
    .width('100%')
    .height(50)
    .backgroundColor(Color.Pink)
    .justifyContent(FlexAlign.Center)
  }
}

class GoodItem {
  id: number
  goods_name: string
  goods_img: string
  goods_price: number
  goods_count: number
}

/**
 * 一个商品列表
 */
@Component
struct GoodListView {
  @State listItem: Array<GoodItem> = [{
    "id": 1,
    "goods_name": "Build的使用",
    "goods_img": "assets/1.webp",
    "goods_price": 108,
    "goods_count": 1,
  },
    {
      "id": 2,
      "goods_name": "登陆的使用",
      "goods_img": "assets/2.webp",
      "goods_price": 129,
      "goods_count": 1,
    },
    {
      "id": 3,
      "goods_name": "Toggle和控件隐藏显示的使用",
      "goods_img": "assets/3.webp",
      "goods_price": 198,
      "goods_count": 1,
    },
    {
      "id": 4,
      "goods_name": "BuildCaseParamCase实例",
      "goods_img": "assets/4.webp",
      "goods_price": 99,
      "goods_count": 1,
    },
    {
      "id": 5,
      "goods_name": "幂凝早秋季卫衣女春秋装韩版宽松中长款假两件上衣薄款ins盐系外套潮",
      "goods_img": "assets/5.webp",
      "goods_price": 156,
      "goods_count": 1,
    },
    {
      "id": 6,
      "goods_name": "ME&CITY女装冬季新款针织抽绳休闲连帽卫衣女",
      "goods_img": "assets/6.webp",
      "goods_price": 142.8,
      "goods_count": 1,
    },
    {
      "id": 7,
      "goods_name": "幂凝假两件女士卫衣秋冬女装2020年新款韩版宽松春秋季薄款ins潮外套",
      "goods_img": "assets/7.webp",
      "goods_price": 219,
      "goods_count": 2,
    },
    {
      "id": 8,
      "goods_name": "依魅人2020休闲运动衣套装女秋季新款秋季韩版宽松卫衣 时尚两件套",
      "goods_img": "assets/8.webp",
      "goods_price": 178,
      "goods_count": 1,
    },
    {
      "id": 9,
      "goods_name": "芷臻(zhizhen)加厚卫衣2020春秋季女长袖韩版宽松短款加绒春秋装连帽开衫外套冬",
      "goods_img": "assets/9.webp",
      "goods_price": 128,
      "goods_count": 1,
    },
    {
      "id": 10,
      "goods_name": "Semir森马卫衣女冬装2019新款可爱甜美大撞色小清新连帽薄绒女士套头衫",
      "goods_img": "assets/10.webp",
      "goods_price": 153,
      "goods_count": 1,
    }]

  build() {
    List({ space: 20 }) {
      ForEach(this.listItem, (good: GoodItem, index: number) => {
        ListItem() {
          Row() {
            Image(good.goods_img)
              .width(100)
              .height(160)
              .borderRadius(8)
            Column() {
              Text(good.goods_name).fontSize(16).lineHeight(20).lineHeight(20)
              // Text(`￥${good.goods_price.toString()}`).fontSize(20).fontColor(Color.Red)
              Text() {
                Span('￥').fontSize(14).fontColor(Color.Red).fontWeight(FontWeight.Bold)
                Span(good.goods_price.toString()).fontSize(20).fontColor(Color.Red).fontWeight(FontWeight.Bold)
              }
            }
            .layoutWeight(1)
            .height(160)
            .justifyContent(FlexAlign.SpaceBetween)
            .alignItems(HorizontalAlign.Start)
            .margin({ left: 10 })
          }
        }.onClick(() => {
          // AlertDialog.show({ message: good.goods_name })
          // promptAction.showToast({ message: good.goods_name })
          if (index == 0) {
            router.pushUrl({ url: "pages/demo03/BuildCase" })
          } else if (index == 1) {
            router.pushUrl({ url: "pages/demo02/LoginCase" })
          } else if (index == 2) {
            router.pushUrl({ url: "pages/demo01/ToggleCase" })
          } else if (index == 3) {
            router.pushUrl({ url: "pages/demo03/BuilderParamCase" })
          }
        })
      })
    }.padding(15)
  }
}