@Preview
@Component
export default struct ServerFragment {
  @State user: User = {
    name: "liu",
    age: 50,
    address:
    {
      provide: "湖南",
      city: "衡阳",
      area: "衡东"
    }
  }

  build() {
    Column() {
      Text(JSON.stringify(this.user))
      Row() {
        Text("姓名").padding({ left: 20, right: 20 })
        TextInput({ text: this.user.name }).layoutWeight(1)
          .onChange(value => {
            this.user.name = value
          })
      }.padding(10)

      Row() {
        Text("年龄").padding({ left: 20, right: 20 })
        TextInput({ text: this.user.age.toString() }).layoutWeight(1).onChange((value) => {
          this.user.age = parseInt(value)
        })
      }.padding(10)

      Row() {
        Text("地址").padding({ left: 20, right: 20 })
        TextInput({ text: this.user.address.provide }).layoutWeight(1).margin({ right: 20 }).onChange((value) => {
          // this.user.address.provide = value
          // this.user = { ...this.user }
          this.user.address = { ...this.user.address, provide: value }
        })
        TextInput({ text: this.user.address.city }).layoutWeight(1).margin({ right: 20 }).onChange((value) => {
          this.user.address.city = value
          this.user = { ...this.user }
        })
        TextInput({ text: this.user.address.area }).layoutWeight(1).margin({ right: 20 }).onChange((value) => {
          this.user.address.area = value
          this.user = { ...this.user }
        })
      }.padding(10)
    }.width("100%")
  }
}

class User {
  name: string
  age: number
  address: {
    provide: string
    city: string
    area: string
  }
}