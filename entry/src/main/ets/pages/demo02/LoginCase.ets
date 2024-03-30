import promptAction from '@ohos.promptAction'

@Entry
@Component
struct LoginCase {
  @State account: string = ""
  @State password: string = ""
  @State count: number = 5
  timer: number = -1

  login() {
    if (this.account == "admin" && this.password == "123") {
      promptAction.showToast({ message: "登录成功" })
    } else {
      promptAction.showToast({ message: "登录失败" })
    }
  }

  build() {
    Column({ space: 15 }) {
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
      // }
    }.width('100%')
  }
}