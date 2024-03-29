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
  @State commentList: ReplyItem[] = [
    {
      id: 1,
      avatar: 'https://picx.zhimg.com/027729d02bdf060e24973c3726fea9da_l.jpg?source=06d4cd63',
      author: '偏执狂-妄想家',
      content: '更何况还分到一个摩洛哥[惊喜]',
      time: '11-30',
      area: '海南',
      likeNum: 34
    },
    {
      id: 2,
      avatar: 'https://pic1.zhimg.com/v2-5a3f5190369ae59c12bee33abfe0c5cc_xl.jpg?source=32738c0c',
      author: 'William',
      content: '当年希腊可是把1：0发挥到极致了',
      time: '11-29',
      area: '北京',
      likeNum: 58
    },
    {
      id: 3,
      avatar: 'https://picx.zhimg.com/v2-e6f4605c16e4378572a96dad7eaaf2b0_l.jpg?source=06d4cd63',
      author: 'Andy Garcia',
      content: '欧洲杯其实16队球队打正赛已经差不多，24队打正赛意味着正赛阶段在小组赛一样有弱队。',
      time: '11-28',
      area: '上海',
      likeNum: 10
    },
    {
      id: 4,
      avatar: 'https://picx.zhimg.com/v2-53e7cf84228e26f419d924c2bf8d5d70_l.jpg?source=06d4cd63',
      author: '正宗好鱼头',
      content: '确实眼红啊，亚洲就没这种球队，让中国队刷',
      time: '11-27',
      area: '香港',
      likeNum: 139
    },
    {
      id: 5,
      avatar: 'https://pic1.zhimg.com/v2-eeddfaae049df2a407ff37540894c8ce_l.jpg?source=06d4cd63',
      author: '柱子哥',
      content: '我是支持扩大的，亚洲杯欧洲杯扩到32队，世界杯扩到64队才是好的，世界上有超过200支队伍，欧洲区55支队伍，亚洲区47支队伍，即使如此也就六成出现率',
      time: '11-27',
      area: '旧金山',
      likeNum: 29
    },
    {
      id: 6,
      avatar: 'https://picx.zhimg.com/v2-fab3da929232ae911e92bf8137d11f3a_l.jpg?source=06d4cd63',
      author: '飞轩逸',
      content: '禁止欧洲杯扩军之前，应该先禁止世界杯扩军，或者至少把亚洲名额一半给欧洲。',
      time: '11-26',
      area: '里约',
      likeNum: 100
    }
  ]

  login() {
    if (this.account == "admin" && this.password == "123") {
      promptAction.showToast({ message: "登录成功" })
    } else {
      promptAction.showToast({ message: "登录失败" })
    }
  }

  build() {
    Scroll() {
      Column() {
        // TextInput({ placeholder: "请输入用户名" }).width('80%').margin({ top: 20 }).onChange((value) => {
        //   this.account = value
        // })
        // TextInput({ placeholder: "请输入密码" })
        //   .width('80%')
        //   .type(InputType.Password)
        //   .onChange((value) => {
        //     this.password = value
        //   })
        // Button("登录").width('80%').onClick(() => {
        //   this.login()
        // }).enabled(this.account !== "" && this.password !== "")
        // //验证码
        // Button(this.count < 5 ? `还剩${this.count}秒` : "发送验证码")
        //   .onClick(() => {
        //     if (this.count === 5) {
        //       // 计时器
        //       this.timer = setInterval(() => {
        //         if (this.count === 0) {
        //           clearInterval(this.timer)
        //           this.count = 5 // 回到初始值
        //           return
        //         }
        //         this.count--
        //       }, 1000)
        //     }
        //   })
        // if (this.isChange) {
        //   Image("https://img2.baidu.com/it/u=2539872750,2513176690&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500")
        //     .width(200)
        //     .height(200)
        //     .borderRadius(100)
        HmNavBar()
        HmCommentItem({
          listItem: {
            id: 1,
            avatar: $r('app.media.ic_app_launcher'),
            author: '周杰伦',
            content: '意大利拌面应该使用42号钢筋混凝土再加上量子力学缠绕最后通过不畏浮云遮望眼',
            time: '11-30',
            area: '海南',
            likeNum: 100
          }
        })
        Divider().strokeWidth(6).color("#f4f4f4")
        Row() {
          Text("回复7").width("100%").fontWeight(FontWeight.Bold)
        }.height(40).padding({ left: 20 })

        ForEach(this.commentList, (item: ReplyItem) => {
          HmCommentItem({ listItem: item })
        })

        // }
        // Toggle({ type: ToggleType.Switch, isOn: this.isChange }).onChange((isChange) => {
        //   this.isChange = isChange
        // })
        // Select([{ value: "1" }, { value: "2" }, { value: "3" }]).onSelect((index) => {
        //   this.selectIndex = index
        // })
        // if (this.selectIndex == 0) {
        //   Text("张三")
        // } else if (this.selectIndex == 1) {
        //   Text("李四")
        // } else if (this.selectIndex == 2) {
        //   Text("王五")
        // }
        // Image("https://img2.baidu.com/it/u=2539872750,2513176690&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500")
        //   .width(200)
        //   .height(200)
        //   .borderRadius(100).visibility(this.isChange ? Visibility.Visible : Visibility.Hidden)
      }
      .height('100%')
      .width('100%')
      .margin({ bottom: 300 })
    }
  }
}

@Component
struct HmNavBar {
  build() {
    Row() {
      Row() {
        Image($r("app.media.action_back"))
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
  listItem: Partial<ReplyItem> = {} //通过上面把值传下来 父传子

  build() {
    Row() {
      // 左侧头像
      Image(this.listItem.avatar)
        .width(32)
        .aspectRatio(1)
        .borderRadius(16)
      // 评论区
      Column({ space: 10 }) {
        Text(this.listItem.author)
          .fontWeight(FontWeight.Bold)
        Text(this.listItem.content)
          .lineHeight(20)
          .fontSize(16)
          .fontColor('#565656')
        // 底部内容
        Row() {
          Text(`${this.listItem.time} .IP属地${this.listItem.area}`)
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
            Text(this.listItem.likeNum.toString())
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

/**
 * 下一代要求使用Class必须给定初始值哦
 */
export class ReplyItem {
  id: number = 0
  avatar: string | Resource = ""
  author: string = ""
  content: string = ""
  time: string = ""
  area: string = ""
  likeNum: number = 0
  likeFlag?: boolean = false
}


