/*
父子单向：父组件变化 子组件变化
* 子组件变化 父不变化
* 目前9版本支持 number string boolean类型 (next版本将都支持)
*
* 父子双向:父组件变化 子组件变化
* 子组件变化 父组件也变化变化
* 使用Link装饰器
* this.num改成$num
*
 */

@Entry
@Component
struct PropCase {
  @State num: number = 0

  build() {
    Column() {
      Text(this.num.toString()).fontColor(Color.Red).fontSize(50).onClick(() => {
        this.num++
      })
      Child({ num: this.num })
    }
  }
}

@Component
struct Child {
  @Prop
  num: number = 0

  build() {
    Text(this.num.toString()).fontColor(Color.Black).fontSize(40).onClick(() => {
      this.num++
    })
  }
}