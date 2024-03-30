@Entry
@Component
export default struct ContentFragment {
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

  /**
   * 定义父组件的方法
   * @param item
   */
  changeLike(item: ReplyItem) {
    if (item.likeFlag) {
      item.likeNum--
      item.likeFlag = false
    } else {
      item.likeNum++
      item.likeFlag = true
    }
    let index = this.commentList.findIndex(obj => obj.id === item.id)
    this.commentList.splice(index, 1, item)
  }

  addComment(item: ReplyItem) {
    this.commentList.unshift(item)
  }

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Scroll() {
        Column() {
          HmNavBar()
          HmCommentItem({
            item: {
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
            HmCommentItem({ item, changeLike: item => {
              this.changeLike(item)
            } })
          })
        }
      }.padding({
        bottom: 100
      })
      //回复组件
      ReplayInput({
        addComment: item => {
          this.addComment(item)
        }
      })
    }
  }
}

@Component
struct ReplayInput {
  @State commentStr: string = ""
  addComment: (item: ReplyItem) => void = () => {
  }

  build() {
    Row() {
      TextInput({
        placeholder: "回复~", text: this.commentStr
      }).layoutWeight(1).onChange((value) => {
        this.commentStr = value
      })
      Text("发布").margin({ left: 15 }).onClick(() => {
        if (this.commentStr !== "") {
          let obj: ReplyItem = {
            id: Date.now(),
            content: this.commentStr,
            time: `${new Date().getMonth() + 1} - ${new Date().getDate()}`,
            likeNum: 0,
            likeFlag: false,
            author: '老高',
            avatar: $r('app.media.icon'),
            area: "北京"
          }
          this.addComment(obj)
          this.commentStr = ""
        }
      })
    }
    .border({
      color: "#f4f4f4",
      width: {
        top: 1
      }
    })
    .backgroundColor(Color.White)
    .width('100%')
    .height(60)
    .padding({
      left: 10,
      right: 10
    })
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
  item: Partial<ReplyItem> = {} //通过上面把值传下来 父传子
  changeLike: (item: ReplyItem) => void = () => {
  }

  build() {
    Row() {
      // 左侧头像
      Image(this.item.avatar)
        .width(32)
        .aspectRatio(1)
        .borderRadius(16)
      // 评论区
      Column({ space: 10 }) {
        Text(this.item.author)
          .fontWeight(FontWeight.Bold)
        Text(this.item.content)
          .lineHeight(20)
          .fontSize(16)
          .fontColor('#565656')
        // 底部内容
        Row() {
          Text(`${this.item.time} .IP属地${this.item.area}`)
            .fontSize(12)
            .fontColor("#c3c4c5")
          Row() {
            if (this.item.likeFlag == true) {
              Image($r('app.media.widget_bar_tools_over'))
                .width(14)
                .aspectRatio(1)
            } else {
              Image($r('app.media.widget_bar_tools_nor'))
                .width(14)
                .aspectRatio(1)
            }
            Text(this.item.likeNum?.toString())
              .fontSize(12)
              .fontColor("#c3c4c5")
          }.onClick(() => {
            this.changeLike(this.item as ReplyItem)
          })
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


