import router from '@ohos.router'

PersistentStorage.PersistProp<string>("token", "") //此行代码是将数据存到磁盘

@Entry
@Component
struct AppStorageCase {
  @StorageProp("token")
  // @Watch("updateChange")
  str: string = ""
  //
  // updateChange() {
  //   AlertDialog.show({ message: "数据发生变化了" })
  // }

  // @State
  // str: string = ""
  //
  // onPageShow() {
  //   this.str = AppStorage.Get<string>("token") //更新数据
  // }

  build() {
    Column({ space: 20 }) {
      Text(this.str)
      Button("登录").width('100%').width(50)
        .onClick(() => {
          AppStorage.SetOrCreate<string>("token", "111111")
          router.pushUrl({
            url: 'pages/demo06/AppStorageCase2'
          })
        })
    }
  }
}