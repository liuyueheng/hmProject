import router from '@ohos.router'
import { AddressModel } from './MulitiStateCase'

let user: Record<string, UserInfo> = {
  "user": {
    name: "ddd",
    age: "22",
    address: {
      name: "长沙",
      remove: {
        name: "中国"
      }
    }
  }
}
let storage: LocalStorage = new LocalStorage(user)

export { storage }

/**
 *LocalStorage可以直接更新第二层数据，或者更深层数据
 */
@Entry(storage)
@Component
export struct LocalStorageCase {
  @LocalStorageProp("user")
  mUser: Partial<UserInfo> = {}
  @LocalStorageLink("user")
  mUser2: Partial<UserInfo> = {}

  aboutToAppear() {
    AlertDialog.show({ message: this.mUser.name + "=====" + this.mUser2.name })
  }

  build() {
    Column({ space: 15 }) {
      Text("姓名" + this.mUser.name)
      Text("年龄" + this.mUser.age)
      Text("地址" + this.mUser.address.name)
      Text("国家" + this.mUser.address.remove.name)
      Button("修改数据").onClick(() => {
        this.mUser2.name = "张三"
        this.mUser2.address.name = "深圳"
        this.mUser2.age = "111" + Math.random().toFixed(2)
        this.mUser2.address.remove.name = "美国"
      })
      Button("跳转").onClick(() => {
        router.pushUrl({ url: "pages/demo05/LocalStorageCase2" })
      })
    }
  }
}

export class UserInfo {
  name: string
  age: string
  address: AddModel
}

export class AddModel {
  name: string
  remove: RemoveModel
}

export class RemoveModel {
  name: string
}