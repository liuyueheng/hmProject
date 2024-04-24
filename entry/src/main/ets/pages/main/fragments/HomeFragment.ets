import promptAction from '@ohos.promptAction'
import router from '@ohos.router'
import Want from '@ohos.app.ability.Want'
import common from '@ohos.app.ability.common'

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
  id: number = 0
  goods_name: string = ''
  goods_img: string = ''
  goods_price: number = 0
  goods_count: number = 0
}

/**
 * 一个商品列表
 */
@Component
struct GoodListView {
  @State listItem: GoodItem[] = [{
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
      "goods_name": "BuilderParamCard使用",
      "goods_img": "assets/5.webp",
      "goods_price": 156,
      "goods_count": 1,
    },
    {
      "id": 6,
      "goods_name": "PropCase使用",
      "goods_img": "assets/6.webp",
      "goods_price": 142.8,
      "goods_count": 1,
    },
    {
      "id": 7,
      "goods_name": "LinkCase使用",
      "goods_img": "assets/7.webp",
      "goods_price": 219,
      "goods_count": 2,
    },
    {
      "id": 8,
      "goods_name": "ProvideCase使用",
      "goods_img": "assets/8.webp",
      "goods_price": 178,
      "goods_count": 1,
    },
    {
      "id": 9,
      "goods_name": "WatchCase的使用",
      "goods_img": "assets/9.webp",
      "goods_price": 128,
      "goods_count": 1,
    },
    {
      "id": 10,
      "goods_name": "ObservedLinkCase的使用",
      "goods_img": "assets/10.webp",
      "goods_price": 153,
      "goods_count": 1,
    }, {
      "id": 10,
      "goods_name": "知乎Observed更新数据Case的使用",
      "goods_img": "assets/6.webp",
      "goods_price": 153,
      "goods_count": 1,
    }, {
      "id": 10,
      "goods_name": "多层数据机构通过new一个对象进行更改数据",
      "goods_img": "assets/4.webp",
      "goods_price": 153,
      "goods_count": 1,
    }, {
      "id": 10,
      "goods_name": "LocalStorage双向绑定的使用",
      "goods_img": "assets/3.webp",
      "goods_price": 153,
      "goods_count": 1,
    }, {
      "id": 10,
      "goods_name": "APPStorage的使用",
      "goods_img": "assets/2.webp",
      "goods_price": 153,
      "goods_count": 1,
    }, {
      "id": 10,
      "goods_name": "HTTP的使用",
      "goods_img": "assets/5.webp",
      "goods_price": 153,
      "goods_count": 1,
    }, {
      "id": 10,
      "goods_name": "美团外卖案例",
      "goods_img": "assets/1.webp",
      "goods_price": 153,
      "goods_count": 1,
    }, {
      "id": 10,
      "goods_name": "ability多任务",
      "goods_img": "assets/6.webp",
      "goods_price": 153,
      "goods_count": 1,
    }, {
      "id": 10,
      "goods_name": "视频播放器的使用",
      "goods_img": "assets/7.webp",
      "goods_price": 153,
      "goods_count": 1,
    }, {
      "id": 10,
      "goods_name": "抖音小案例",
      "goods_img": "assets/3.webp",
      "goods_price": 153,
      "goods_count": 1,
    }, {
      "id": 10,
      "goods_name": "Canvas的使用",
      "goods_img": "assets/1.webp",
      "goods_price": 153,
      "goods_count": 1,
    }, {
      "id": 10,
      "goods_name": "你画我猜小游戏",
      "goods_img": "assets/2.webp",
      "goods_price": 153,
      "goods_count": 1,
    }, {
      "id": 10,
      "goods_name": "微信聊天机器人",
      "goods_img": "assets/2.webp",
      "goods_price": 153,
      "goods_count": 1,
    }, {
      "id": 10,
      "goods_name": "闹钟demo",
      "goods_img": "assets/2.webp",
      "goods_price": 153,
      "goods_count": 1,
    }]

  build() {
    Column() {
      Grid() {
        ForEach(this.listItem, (good: GoodItem, index: number) => {
          GridItem() {
            Row() {
              Image(good.goods_img)
                .width(50)
                .height(80)
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
              .height(80)
              .justifyContent(FlexAlign.SpaceBetween)
              .alignItems(HorizontalAlign.Start)
              .margin({ left: 10 })
            }
          }.onClick(async () => {
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
            } else if (index == 4) {
              router.pushUrl({ url: "pages/demo03/BuilderParamCard" })
            } else if (index == 5) {
              router.pushUrl({ url: "pages/demo04/PropCase" })
            } else if (index == 6) {
              router.pushUrl({ url: "pages/demo04/LinkCase" })
            } else if (index == 7) {
              router.pushUrl({ url: "pages/demo04/ProvideCase" })
            } else if (index == 8) {
              router.pushUrl({ url: "pages/demo05/WatchCase" })
            } else if (index == 9) {
              router.pushUrl({ url: "pages/demo05/ObservedLinkCase" })
            } else if (index == 10) {
              router.pushUrl({ url: "pages/demo05/ObservedLinkZhiHu" })
            } else if (index == 11) {
              router.pushUrl({ url: "pages/demo05/MulitiStateCase" })
            } else if (index == 12) {
              router.pushUrl({ url: "pages/demo05/LocalStorageCase" })
            } else if (index == 13) {
              router.pushUrl({ url: "pages/demo06/AppStorageCase" })
            } else if (index == 14) {
              router.pushUrl({ url: "pages/demo06/HttpCase" })
            } else if (index == 15) {
              router.pushUrl({ url: "pages/demo06/MeiTuanCase" })
            } else if (index == 16) {
              //定义返回参数的类型
              type ResultParams = Record<string, boolean>

              //拉起新的ability
              try {
                let want: Want = {
                  bundleName: 'com.betawm.baw', //应用包名
                  abilityName: 'PayAbility', //要跳转的abilityName
                  //传值到下一个ability
                  parameters: {
                    order_id: Date.now()
                  }
                };
                const result = await (getContext(this) as common.UIAbilityContext).startAbilityForResult(want)

                const params = result.want?.parameters as ResultParams

                if (params.paySuccess) {
                  promptAction.showToast({ message: '支付成功' + params.payOrderId })
                } else {
                  promptAction.showToast({ message: '支付失败' + params.payOrderId })
                }
              } catch (error) {
              }
            } else if (index == 17) {
              router.pushUrl({ url: "pages/demo07/VideoCase" })
            } else if (index == 18) {
              router.pushUrl({ url: "pages/demo07/DouYinCase" })
            } else if (index == 19) {
              router.pushUrl({ url: "pages/demo07/CanvasCase" })
            } else if (index == 20) {
              router.pushUrl({ url: "pages/demo07/GuessCanvas" })
            } else if (index == 21) {
              router.pushUrl({ url: "pages/demo08/WechatCase" })
            } else if (index == 22) {
              router.pushUrl({ url: "pages/demo08/ClockCase" })
            }
          })
        })
      }
      .columnsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(15)
      .cachedCount(3)
    }.padding(20)
  }
}