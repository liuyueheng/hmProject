import promptAction from '@ohos.promptAction'

@Preview
@Component
export default struct ContentFragment {
  @State account: string = ""
  @State password: string = ""
  @State count: number = 5
  timer: number = -1
  @State isChange: boolean = true
  @State selectIndex: number = -1

  login() {
    if (this.account == "admin" && this.password == "123") {
      promptAction.showToast({ message: "登录成功" })
    } else {
      promptAction.showToast({ message: "登录失败" })
    }
  }

  build() {
    Scroll() {
      Column({ space: 20 }) {
        TextInput({ placeholder: "请输入用户名" }).width('80%').margin({ top: 20 }).onChange((value) => {
          this.account = value
        })
        TextInput({ placeholder: "请输入密码" })
          .width('80%')
          .type(InputType.Password)
          .onChange((value) => {
            this.password = value
          })
        Button("登录").width('80%').onClick(() => {
          this.login()
        }).enabled(this.account !== "" && this.password !== "")
        //验证码
        Button(this.count < 5 ? `还剩${this.count}秒` : "发送验证码")
          .onClick(() => {
            if (this.count === 5) {
              // 计时器
              this.timer = setInterval(() => {
                if (this.count === 0) {
                  clearInterval(this.timer)
                  this.count = 5 // 回到初始值
                  return
                }
                this.count--
              }, 1000)
            }
          })
        // if (this.isChange) {
        //   Image("https://img2.baidu.com/it/u=2539872750,2513176690&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500")
        //     .width(200)
        //     .height(200)
        //     .borderRadius(100)
        //   HmNavBar()
        //   HmCommentItem()
        // }
        Toggle({ type: ToggleType.Switch, isOn: this.isChange }).onChange((isChange) => {
          this.isChange = isChange
        })
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
        Image("https://img2.baidu.com/it/u=2539872750,2513176690&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500")
          .width(200)
          .height(200)
          .borderRadius(100).visibility(this.isChange ? Visibility.Visible : Visibility.Hidden)
      }
      .height('100%')
      .width('100%')
      .margin({ bottom: 100 })
    }
  }
}

@Component
struct HmNavBar {
  build() {
    Row() {
      Row() {
        Image($r("app.media.icon"))
          .width(16)
          .height(16)
          .fillColor('#848484')
      }
      .justifyContent(FlexAlign.Center)
      .width(24)
      .aspectRatio(1)
      .backgroundColor("#f5f5f5")
      .borderRadius(12)
      .margin({
        left: 15
      })

      Text("评论回复")
        .layoutWeight(1)
        .textAlign(TextAlign.Center)
        .fontSize(18)
        .padding({
          right: 39
        })
    }
    .height(40)
    .border({
      color: '#f4f4f4',
      width: {
        bottom: 0.5
      }
    })
  }
}

@Component
struct HmCommentItem {
  build() {
    Row() {
      // 左侧头像
      Image('/assets/test.jpeg')
        .width(32)
        .aspectRatio(1)
        .borderRadius(16)
      // 评论区
      Column({ space: 10 }) {
        Text("周杰伦")
          .fontWeight(FontWeight.Bold)
        Text("意大利拌面应该使用42号钢筋混凝土再加上量子力学缠绕最后通过不畏浮云遮望眼")
          .lineHeight(20)
          .fontSize(16)
          .fontColor('#565656')
        // 底部内容
        Row() {
          Text("10-12 .ip属地北京")
            .fontSize(12)
            .fontColor("#c3c4c5")
          Row() {
            Image($r("app.media.widget_bar_tools_nor"))
              .width(12)
              .aspectRatio(1)
              .fillColor('#c3c4c5') // 填充颜色
              .margin({
                right: 5
              })
            Text("100")
              .fontSize(12)
              .fontColor("#c3c4c5")
          }
        }.justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
      .margin({
        left: 10
      })
    }.padding(15)
    .alignItems(VerticalAlign.Top)
  }
}


