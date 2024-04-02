/**
 * 使用步骤：
 ● 类 class 数据需要定义通过构造函数，使用 @Observed 修饰这个类
 ● 初始化数据：需要通过初始化构造函数的方式添加
 ● 通过 @ObjectLink 关联对象，可以直接修改被关联对象来更新UI
 需求：改造下之前的购物车案例
 1）定义构造函数和使用@Observed 修饰符，以及初始化数据
 */
@Entry
@Component
struct ObservedLinkCase {
  @State foodList: FoodObjectClass[] = [new FoodObjectClass({
    order_id: 1,
    food_name: '鱼香肉丝',
    food_price: 18.8,
    food_count: 1
  }), new FoodObjectClass({
    order_id: 2,
    food_name: '粗溜丸子',
    food_price: 26,
    food_count: 2
  }), new FoodObjectClass({
    order_id: 3,
    food_name: '杂粮煎饼',
    food_price: 12,
    food_count: 1
  })]

  build() {
    Column() {
      ForEach(this.foodList, (item: FoodObjectClass) => {
        FoodView({ item: item })
      })
      BottomObserveAddFood({ foodList: $foodList })
    }
  }
}

@Extend(Text) function TextStyle() {
  .layoutWeight(1).textAlign(TextAlign.Center).fontSize(20)
}

@Extend(Text) function AddCutStyle() {
  .width(40)
  .height(40)
  .borderRadius(20)
  .backgroundColor(Color.Grey)
  .textAlign(TextAlign.Center)
  .fontSize(20)
}

@Component
struct FoodView {
  @ObjectLink
  item: FoodObjectClass

  build() {
    Row() {
      Text(this.item.food_name).TextStyle()
      Text(this.item.food_price.toFixed()).TextStyle()
      Row() {
        Text("-").AddCutStyle().onClick(() => {
          this.item.food_count--
        }).visibility(this.item.food_count > 0 ? Visibility.Visible : Visibility.Hidden)
        Text(this.item.food_count.toString()).layoutWeight(1).textAlign(TextAlign.Center)
        Text("+").AddCutStyle().onClick(() => {
          this.item.food_count++
        })
      }.layoutWeight(1)
    }.height(60).width('100%').justifyContent(FlexAlign.SpaceBetween)
  }
}

@Component
struct BottomObserveAddFood {
  @Link
  foodList: FoodObjectClass[]

  build() {
    Column() {
      Button("加菜").onClick(() => {
        this.foodList = this.foodList.map(item => {
          item.food_count++
          return item
        })
      })
    }
  }
}

@Observed
class FoodObjectClass implements FoodItem {
  order_id: number = 0
  food_name: string = ""
  food_price: number = 0
  food_count: number = 0

  constructor(foodItem: FoodItem) {
    this.order_id = foodItem.order_id
    this.food_name = foodItem.food_name
    this.food_price = foodItem.food_price
    this.food_count = foodItem.food_count
  }
}

interface FoodItem {
  order_id: number
  food_name: string
  food_price: number
  food_count: number
}
