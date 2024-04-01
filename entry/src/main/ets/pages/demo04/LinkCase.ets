/**
 * Link修饰符使用
 */
@Entry
@Component
struct LinkCase {
  @State foodList: FoodClass[] = [{
    order_id: 1,
    food_name: '鱼香肉丝',
    food_price: 18.8,
    food_count: 1
  }, {
    order_id: 2,
    food_name: '粗溜丸子',
    food_price: 26,
    food_count: 2
  }, {
    order_id: 3,
    food_name: '杂粮煎饼',
    food_price: 12,
    food_count: 1
  }]

  build() {
    Column() {
      ForEach(this.foodList, (item: FoodClass) => {
        Row() {
          Text(item.food_name).layoutWeight(1).textAlign(TextAlign.Center)
          Text(item.food_price.toFixed()).layoutWeight(1).textAlign(TextAlign.Center)
          Text(item.food_count.toString()).layoutWeight(1).textAlign(TextAlign.Center)
        }.height(60).width('100%').justifyContent(FlexAlign.SpaceBetween)
      })
      BottomAddFood({ foodList: $foodList })
    }
  }
}

@Component
struct BottomAddFood {
  @Link
  foodList: FoodClass[]

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


class FoodClass {
  order_id: number = 0
  food_name: string = ""
  food_price: number = 0
  food_count: number = 0
}
