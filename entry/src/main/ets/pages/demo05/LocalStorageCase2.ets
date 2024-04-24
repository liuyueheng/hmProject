import { storage, UserInfo } from './LocalStorageCase'

@Entry(storage)
@Component
struct LocalStorageCase2 {
  @LocalStorageProp("user")
  mUser: Partial<UserInfo> = {}

  build() {
    Column({ space: 20 }) {
      Text("姓名" + this.mUser.name)
      Text("年龄" + this.mUser.age)
      Text("地址" + this.mUser.address?.name)
      Text("国家" + this.mUser.address?.remove.name)
    }
  }
}