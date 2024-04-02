/**
 * Next版本的文档-明确说了 ... 只能限制使用， 只能用在部分数组的更新
 */
@Entry
@Component
struct MulitiStateCase {
  @State
  userInfo: ProvideModel = new ProvideModel({ name: "张三", age: "15", address: new AddressModel({ area: "长沙" }) })

  build() {
    Column() {
      Row() {
        Text(this.userInfo.name).layoutWeight(1)
        Text(this.userInfo.age).layoutWeight(1)
        Text(this.userInfo.address.area).layoutWeight(1)
      }.padding(20)

      Button("更新数据").onClick(() => {
        this.userInfo.name = "李四"
        this.userInfo.age = "22"
        this.userInfo.address.area = "顶顶顶顶"
        this.userInfo.address = new AddressModel(this.userInfo.address)
        // this.user.address = { ...this.user.address, city: '廊坊'   } next版本去除了这种写法 必须利用上面new的方式来进行修改数据
      })
    }
  }
}


interface Provide {
  name: string
  age: string
  address: Address
}

interface Address {
  area: string
}

export class ProvideModel implements Provide {
  name: string = ''
  age: string = ''
  address: Address = new AddressModel({} as Address)

  constructor(model: Provide) {
    this.name = model.name
    this.age = model.age
    this.address = model.address
  }
}

export class AddressModel implements Address {
  area: string = ''

  constructor(model: Address) {
    this.area = model.area
  }
}
