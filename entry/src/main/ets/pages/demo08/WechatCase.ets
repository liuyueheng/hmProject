import preferences from '@ohos.data.preferences'
import http from '@ohos.net.http'
import util from '@ohos.util'
import promptAction from '@ohos.promptAction'
import router from '@ohos.router'
import notificationManager from '@ohos.notificationManager'
import wantAgent from '@ohos.wantAgent'

/**
 * 微信聊天机器人
 */
@Entry
@Component
struct WechatCase {
  @State
  @Watch("dataChange")
  messageList: MessageItem[] = []
  messageStore: MessageStore = new MessageStore()
  @State contentStr: string = '' //输入内容
  @State topY: number = 0
  scroller: Scroller = new Scroller()
  @State
  sendIng: boolean = false
  myHttp: http.HttpRequest = http.createHttp()

  aboutToAppear() {
    this.getMessage()
  }

  async dataChange() {
    await this.messageStore.setMessageList(JSON.stringify(this.messageList))
  }

  async getMessage() {
    this.messageList = await this.messageStore.getMessageList()
  }

  async sendMessage() {
    if (!this.contentStr) return
    this.sendIng = true
    let selfMessage: MessageItem = new MessageItem({
      id: util.generateRandomUUID(),
      timestamp: Date.now(),
      content: this.contentStr,
      avatar: $r('app.media.ic_app_launcher'),
      username: '老高',
      self: true
    })
    this.messageList.push(selfMessage)
    this.scroller.scrollToIndex(this.messageList.length - 1)
    const url = `http://api.qingyunke.com/api.php?key=free&appid=0&msg=${encodeURI(this.contentStr)}`
    this.contentStr = "" // 清空内容
    console.log("my_log", url)
    const res = await this.myHttp.request(url)
    const result = JSON.parse(res.result as string) as ResultClass
    this.sendIng = false
    if (result.result === 0) {
      // 获取 wantAgent
      const want = await wantAgent.getWantAgent({
        wants: [
          {
            bundleName: 'com.betawm.baw',
            abilityName: 'EntryAbility'
          }
        ],
        operationType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0
      })
      //发送一个通知
      const request: notificationManager.NotificationRequest = {
        id: Date.now(),
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "你老婆给你来信了",
            text: result.content,
            additionalText: "小花的信息"
          }
        },
        //跳转到应用
        wantAgent: want
      }
      notificationManager.publish(request)
      // 回复成功
      let message: MessageItem = new MessageItem({
        id: util.generateRandomUUID(),
        timestamp: Date.now(),
        content: result.content,
        avatar: $r("app.media.icon_cart"),
        username: '老婆大人',
        self: false
      })
      this.messageList.push(message)
      this.scroller.scrollToIndex(this.messageList.length - 1)

    } else {
      promptAction.showToast({
        message: result.content
      })
    }
  }

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        Row() {
          Row() {
            Image($r("app.media.action_back"))
              .width(16)
              .height(16)
              .fillColor('#848484').onClick(() => {
              router.back()
            })
          }
          .justifyContent(FlexAlign.Center)
          .width(24)
          .aspectRatio(1)
          .backgroundColor("#f5f5f5")
          .borderRadius(12)
          .margin({
            left: 15
          })

          Text("🙉 老婆大人")
            .layoutWeight(1)
            .textAlign(TextAlign.Center)
            .fontSize(18)
            .padding({
              right: 39
            })
        }
        .height(50)

        List({ space: 20, scroller: this.scroller }) {
          ForEach(this.messageList, (item: MessageItem) => {
            ListItem() {
              // 一左一右
              MessageCom({ item, messageList: $messageList })
              //用方法传参的方式
              // MessageCom({ item, delMessage: (id: string) => {
              //   // 删除消息
              //   const index = this.messList.findIndex(item => item.id === id)
              //   this.messList.splice(index, 1)
              // } })
            }
          })
        }
        .padding({
          bottom: 80
        })
        .layoutWeight(1)
      }.height('100%').position({
        y: this.topY
      })

      // 消息列表
      Row({ space: 20 }) {
        TextInput({ text: this.contentStr })
          .layoutWeight(1)
          .backgroundColor(Color.White)
          .borderRadius(2)
          .height(40)
          .onChange((value) => {
            this.contentStr = value
          })
          .onSubmit(() => {
            if (this.contentStr) {
              this.sendMessage()
            }
          })
        Button() {
          Row() {
            if (this.sendIng) {
              LoadingProgress()
                .width(20)
                .height(20)
                .color('#fff')
                .margin({
                  right: 4
                })
            } else {
              Text("发送")
                .fontColor("#fff")
            }
          }
        }
        .onClick(async () => {
          if (!this.sendIng) {
            await this.sendMessage()
          }
        })
        .enabled(!!this.contentStr)
        .height(30)
        .width(60)
      }
      .width('100%')
      .backgroundColor('#f6f6f6')
      .height(70)
      .padding({
        left: 10,
        right: 10
      })
    }
    .backgroundColor('#ededed')
    .height('100%')
    .onAreaChange((oldValue: Area, newValue: Area) => {
      if (newValue.globalPosition && newValue.globalPosition.y !== undefined) {
        this.topY = Math.abs(parseFloat(newValue.globalPosition.y.toString()));
      } else {
        // 在这里处理 globalPosition.y 未定义的情况
      }
    })
  }
}

@Component
struct MessageCom {
  // item: Partial<MessageItem> = {}  //不能这么写
  item: MessageItem = new MessageItem({
    content: '',
    avatar: '',
    username: '',
    self: false,
    timestamp: 0,
    id: '',
  })
  @State
  showMenu: boolean = false
  //用方法传参的形式给父控件
  // delMessage: (id: string) => void = () => {
  // }
  //用link的方式
  @Link
  messageList: MessageItem[]

  @Builder
  getDelContent() {
    Button("删除")
      .backgroundColor(Color.White)
      .fontColor("#0c2803")
      .height(30)
      .onClick(() => {
        // this.delMessage(this.item.id)  //用方法的方式进行传参
        // 删除消息
        const index = this.messageList.findIndex(item => item.id === this.item.id)
        this.messageList.splice(index, 1)
      })
  }

  build() {
    Row() {
      Image(this.item.avatar)
        .height(40)
        .width(40)
        .borderRadius(6)
      Row() {
        Text(this.item.content)
          .backgroundColor(this.item.self ? "#8bec73" : Color.White)
          .fontColor("#0c2803")
          .padding(10)
          .lineHeight(24)
          .margin({
            left: 10,
            right: 10
          })
          .borderRadius(5)
          .gesture(
            LongPressGesture()
              .onAction(() => {
                this.showMenu = true // 显示菜单
              })
          )
          .bindPopup(this.showMenu, {
            builder: this.getDelContent,
            placement: Placement.Top,
            onStateChange: (event) => {
              this.showMenu = event.isVisible
            }
          })
      }.layoutWeight(5)
      .justifyContent(this.item.self ? FlexAlign.End : FlexAlign.Start)

      Text().layoutWeight(1)
    }
    .width('100%')
    .padding({
      left: 20,
      right: 20
    })
    .alignItems(VerticalAlign.Top)
    .direction(this.item.self ? Direction.Rtl : Direction.Ltr)
  }
}

/** 消息实体 */
interface IMessageItem {
  content: string // 消息内容
  avatar: ResourceStr // 用户头像
  username: string // 用户名称
  self: boolean // 是不是用户自己
  timestamp: number // 消息收到时的时间戳
  id: string // 唯一的id
}

@Observed
export class MessageItem implements IMessageItem {
  content: string = ''
  avatar: ResourceStr = ''
  username: string = ''
  self: boolean = false
  timestamp: number = 0
  id: string = ''

  constructor(model: IMessageItem) {
    this.content = model.content
    this.avatar = model.avatar
    this.username = model.username
    this.self = model.self
    this.timestamp = model.timestamp
    this.id = model.id
  }
}

/** 首选项工具类 */
class MessageStore {
  //首选项实例
  async getStore() {
    return await preferences.getPreferences(getContext(this), "my_message_store")
  }

  //获取消息
  async getMessageList() {
    const store = await this.getStore()
    const data = await store.get('message_list', '[]') as string
    return JSON.parse(data) as MessageItem[]
  }

  //设置消息
  async setMessageList(json: string) {
    const store = await this.getStore()
    await store.put('message_list', json)
    await store.flush()
  }
}

class ResultClass {
  result: number = 0
  content: string = ""
}


