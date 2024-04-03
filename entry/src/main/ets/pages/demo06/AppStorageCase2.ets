/*
link是双向的，可以更改数据通知到最上层
* Prop是单向的
 */

@Entry
@Component
struct AppStorageCase2 {
  @StorageProp("token")
  token: string = ""
  // @StorageLink("token")
  // token2: string = ""

  aboutToAppear() {
    AlertDialog.show({ message: AppStorage.Get<string>("token") })
  }

  build() {
    Column({ space: 20 }) {
      Text(this.token)
      Button("修改数据").onClick(() => {
        // this.token2 = "66666666"  //使用StorageLink来进行修改
        let appStorage = AppStorage.Link("token") as SubscribedAbstractProperty<string> //使用自带的api修改
        appStorage.set("999999999")
      })
    }
  }
}