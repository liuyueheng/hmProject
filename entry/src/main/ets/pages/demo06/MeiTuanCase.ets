import http from '@ohos.net.http'

@Entry
@Component
struct MeiTuanCase {
  @State isShowCar: boolean = false
  //可以本地写死数据
  // @State list: Category[] = [
  //   {
  //     "tag": "318569657",
  //     "name": "一人套餐",
  //     "foods": [
  //       {
  //         "id": 8078956697,
  //         "name": "烤羊肉串(10串)",
  //         "like_ratio_desc": "好评度100%",
  //         "month_saled": 40,
  //         "food_tag_list": [
  //           "点评网友推荐"
  //         ],
  //         "price": 90,
  //         "picture": "https://zqran.gitee.io/images/waimai/8078956697.jpg",
  //         "description": "",
  //         "tag": "318569657",
  //       },
  //       {
  //         "id": 7384994864,
  //         "name": "腊味煲仔饭",
  //         "like_ratio_desc": "好评度81%",
  //         "month_saled": 100,
  //         "food_tag_list": [],
  //         "price": 39,
  //         "picture": "https://zqran.gitee.io/images/waimai/7384994864.jpg",
  //         "description": "",
  //         "tag": "318569657",
  //       },
  //       {
  //         "id": 2305772036,
  //         "name": "鸡腿胡萝卜焖饭",
  //         "like_ratio_desc": "好评度91%",
  //         "month_saled": 300,
  //         "food_tag_list": [],
  //         "price": 34.32,
  //         "picture": "https://zqran.gitee.io/images/waimai/2305772036.jpg",
  //         "description": "主料：大米、鸡腿、菜心、胡萝卜",
  //         "tag": "318569657"
  //       },
  //       {
  //         "id": 2233861812,
  //         "name": "小份酸汤莜面鱼鱼+肉夹馍套餐",
  //         "like_ratio_desc": "好评度73%",
  //         "month_saled": 600,
  //         "food_tag_list": [
  //           "“口味好,包装很好～点赞”"
  //         ],
  //         "price": 34.32,
  //         "picture": "https://zqran.gitee.io/images/waimai/2233861812.jpg",
  //         "description": "酸汤莜面鱼鱼，主料：酸汤、莜面 肉夹馍，主料：白皮饼、猪肉",
  //         "tag": "318569657"
  //       }
  //     ]
  //   },
  //   {
  //     "tag": "82022594",
  //     "name": "特色烧烤",
  //     "foods": [
  //       {
  //         "id": 3823780596,
  //         "name": "藤椒鸡肉串",
  //         "like_ratio_desc": "",
  //         "month_saled": 200,
  //         "food_tag_list": [
  //           "点评网友推荐"
  //         ],
  //         "price": 6,
  //         "picture": "https://zqran.gitee.io/images/waimai/3823780596.jpg",
  //         "description": "1串。藤椒味，主料：鸡肉",
  //         "tag": "82022594"
  //       },
  //       {
  //         "id": 6592009498,
  //         "name": "烤羊排",
  //         "like_ratio_desc": "",
  //         "month_saled": 50,
  //         "food_tag_list": [],
  //         "price": 169,
  //         "picture": "https://zqran.gitee.io/images/waimai/6592009498.jpg",
  //         "description": "6-8个月草原羔羊肋排，烤到皮脆肉香",
  //         "tag": "82022594"
  //       }
  //     ]
  //   },
  //   {
  //     "tag": "98147100",
  //     "name": "杂粮主食",
  //     "foods": [
  //       {
  //         "id": 4056954171,
  //         "name": "五常稻花香米饭",
  //         "like_ratio_desc": "",
  //         "month_saled": 1000,
  //         "food_tag_list": [],
  //         "price": 5,
  //         "picture": "https://zqran.gitee.io/images/waimai/4056954171.jpg",
  //         "description": "浓浓的稻米清香，软糯Q弹有嚼劲",
  //         "tag": "98147100"
  //       },
  //       {
  //         "id": 740430262,
  //         "name": "小米发糕(3个)",
  //         "like_ratio_desc": "好评度100%",
  //         "month_saled": 100,
  //         "food_tag_list": [],
  //         "price": 13,
  //         "picture": "https://zqran.gitee.io/images/waimai/740430262.jpg",
  //         "description": "柔软蓬松，葡萄干和蔓越莓酸甜适口",
  //         "tag": "98147100"
  //       },
  //       {
  //         "id": 7466390504,
  //         "name": "沙枣玉米窝头(3个)",
  //         "like_ratio_desc": "好评度100%",
  //         "month_saled": 100,
  //         "food_tag_list": [],
  //         "price": 13,
  //         "picture": "https://zqran.gitee.io/images/waimai/7466390504.jpg",
  //         "description": "",
  //         "tag": "98147100"
  //       }
  //     ]
  //   }
  // ] //定义数据

  //获取缓存中的值
  @StorageLink("user_cart")
  @Watch("updateCartJSON") //必须写在其他修饰符下面 首次进入不会监听
  cartJson: string = '[]'
  @Provide
  cardList: FoodItem[] = []

  updateCartJSON() {
    this.cardList = getCarts()
  }

  @State
  list: Category[] = []

  aboutToAppear() {
    this.getMtData()
    this.updateCartJSON()
  }

  /**
   *请求美团食品网络数据
   */
  async getMtData() {

    try {
      const req = http.createHttp()
      const res = await req.request("https://zhoushugang.gitee.io/fe2022/takeaway.json")
      this.list = JSON.parse(res.result.toString()) as Category[]
    } catch (err) {
    }
  }

  build() {
    //后面的元素会盖在前一个元素上面
    Stack({ alignContent: Alignment.Bottom }) {
      CarMain({ categoryList: $list })
      if (this.isShowCar) {
        MtCar()
      }
      MeiTuanAddView({ isShowCar: $isShowCar })
    }.height('100%')
  }
}

/**
 * 主体组件
 */
@Component
struct CarMain {
  // @State
  // list: string[] = ['测试1', '测试2', '测试3']

  @State
  indexSelect: number = 0
  @Link
  categoryList: Category[]

  build() {
    Column() {
      MTNav()
      Row() {
        //左侧选中栏目
        Column() {
          ForEach(this.categoryList, (item: Category, index: number) => {
            Text(item.name)
              .width('100%')
              .height(50)
              .textAlign(TextAlign.Center)
              .backgroundColor(this.indexSelect == index ? Color.White : "#f5f5f5")
              .onClick(() => {
                this.indexSelect = index
              })
          })
        }.backgroundColor("#f5f5f5").height('100%').width('90')

        //右侧内容
        List() {
          ForEach(this.categoryList[this.indexSelect]?.foods || [], (item: FoodItem) => {
            ListItem() {
              MTFoodItem({
                foodItem: item
              })
            }
          })
        }.layoutWeight(1)
      }.alignItems(VerticalAlign.Top)
    }.width('100%').alignItems(HorizontalAlign.Start)
  }
}

/**
 * 顶部组件
 */
@Component
struct MTNav {
  @Builder
  NavItem(active: boolean, title: string, subTitle?: string) {
    Column() {
      Text() {
        Span(title)
        if (subTitle) {
          Span(' ' + subTitle)
            .fontSize(10)
            .fontColor(active ? '#000' : '#666')
        }
      }.layoutWeight(1)
      .fontColor(active ? '#000' : '#666')
      .fontWeight(active ? FontWeight.Bold : FontWeight.Normal)

      Text()
        .height(1)
        .width(20)
        .margin({ left: 6 })
        .backgroundColor(active ? '#fa0' : 'transparent')
    }
    .width(73)
    .alignItems(HorizontalAlign.Start)
    .padding({ top: 3 })
  }

  build() {
    Row() {
      this.NavItem(true, '点菜')
      this.NavItem(false, '评价', '1796')
      this.NavItem(false, '商家')
      Row() {
        Image($r('app.media.ic_public_input_search'))
          .width(14)
          .aspectRatio(1)
          .fillColor('#999')
        Text('请输入菜品名称')
          .fontSize(12)
          .fontColor('#999')
      }
      .backgroundColor('#eee')
      .height(25)
      .borderRadius(13)
      .padding({ left: 5, right: 5 })
      .layoutWeight(1)
    }
    .padding({ left: 15, right: 15 })
    .height(40)
    .border({ width: { bottom: 0.5 }, color: '#e4e4e4' })
  }
}

/**
 * 菜品列表
 */
@Component
struct MTFoodItem {
  foodItem: Partial<FoodItem> = {}

  build() {
    Row() {
      Image(this.foodItem.picture)
        .width(90)
        .aspectRatio(1)
      Column({ space: 5 }) {
        Text(this.foodItem.name)
          .textOverflow({
            overflow: TextOverflow.Ellipsis,
          })
          .maxLines(2)
          .fontWeight(600)
        Text(this.foodItem.description)
          .textOverflow({
            overflow: TextOverflow.Ellipsis,
          })
          .maxLines(1)
          .fontSize(12)
          .fontColor('#333')
        Text(this.foodItem.like_ratio_desc)
          .fontSize(10)
          .backgroundColor('#fff5e2')
          .fontColor('#ff8000')
          .padding({ top: 2, bottom: 2, right: 5, left: 5 })
          .borderRadius(2)
        Text() {
          Span(`月销售${this.foodItem.month_saled}`)
          Span(' ')
          Span(this.foodItem.like_ratio_desc)
        }
        .fontSize(12)
        .fontColor('#999')

        Row() {
          Text() {
            Span('¥ ')
              .fontColor('#ff8000')
              .fontSize(10)
            Span(this.foodItem.price?.toFixed(2))
              .fontColor('#ff8000')
              .fontWeight(FontWeight.Bold)
          }

          //购物车加减视图
          MTAddCut({
            item: this.foodItem
          })
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .padding({ left: 10, right: 10 })
    }
    .padding(10)
    .alignItems(VerticalAlign.Top)
  }
}


/**
 * 选中的物品弹框视图
 */
@Component
struct MtCar {
  @Consume
  cardList: FoodItem[] //接收到上层provide共享的数据

  build() {
    // 购物车弹出层
    Column() {
      Column() {
        Row() {
          Text('购物车')
            .fontSize(12)
            .fontWeight(600)
          Text('清空购物车')
            .fontSize(12)
            .fontColor('#999').onClick(() => {
            clearCats()
          })
        }
        .width('100%')
        .height(40)
        .justifyContent(FlexAlign.SpaceBetween)
        .border({ width: { bottom: 0.5 }, color: '#f5f5f5' })
        .margin({ bottom: 10 })
        .padding({ left: 15, right: 15 })

        List({ space: 30 }) {
          ForEach(this.cardList, (item: FoodItem) => {
            ListItem() {
              MTCartItem({ item: item })
            }
          })
        }
        .divider({
          strokeWidth: 0.5,
          color: '#f5f5f5'
        })
        .padding({ left: 15, right: 15, bottom: 100 })
      }
      .backgroundColor('#fff')
      .borderRadius({
        topLeft: 16,
        topRight: 16
      })
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.End)
    .backgroundColor('rgba(0,0,0,0.5)')
  }
}

/**
 * 购物车弹出层的item
 */
@Component
struct MTCartItem {
  item: Partial<FoodItem> = {}

  build() {
    Row() {
      Image(this.item.picture)
        .width(60)
        .aspectRatio(1)
        .borderRadius(8)
      Column({ space: 5 }) {
        Text(this.item.name)
          .fontSize(14)
          .textOverflow({
            overflow: TextOverflow.Ellipsis
          })
          .maxLines(2)
        Row() {
          Text() {
            Span('¥ ')
              .fontColor('#ff8000')
              .fontSize(10)
            Span(this.item.price?.toFixed(2))
              .fontColor('#ff8000')
              .fontWeight(FontWeight.Bold)
          }

          //购物车加减视图
          MTAddCut({ item: this.item })
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .padding({ left: 10, right: 10 })
    }
    .alignItems(VerticalAlign.Top)
  }
}


/**
 * 底部组件
 */
@Component
struct MeiTuanAddView {
  @Link
  isShowCar: boolean
  @Consume
  cardList: FoodItem[]

  /**
   * 获取总数量
   * @returns
   */
  getAllCount() {
    //箭头函数省略法可以把{}去掉
    return this.cardList.reduce((preValue: number, item: FoodItem) => preValue + item.count, 0)
  }

  /**
   * 获取总价格
   * @returns
   */
  getAllPrice() {
    return this.cardList.reduce((preValue: number, item: FoodItem) => (item.price * item.count + preValue), 0)
  }

  build() {
    Row() {
      Row() {
        //微标控件

        Badge({
          value: this.getAllCount().toString(),
          position: BadgePosition.Right,
          style: {
            badgeSize: 18,
          }
        }) {
          Image($r('app.media.icon_cart'))
            .width(50)
            .height(70)
            .position({
              y: -20
            })
        }.width(50)
        .height(50)
        .margin({
          left: 25,
          right: 10
        })

        Column() {
          Text() {
            Span("￥").fontSize(15).fontColor(Color.White)
            Span(this.getAllPrice().toFixed(2)).fontSize(20).fontColor(Color.White)
          }

          Text("预估配送费￥5").fontSize(12).fontColor(Color.Gray)
        }.alignItems(HorizontalAlign.Start).layoutWeight(1)

        //结算按钮
        Text("去结算").backgroundColor("#f8c741").borderRadius({
          topRight: 20,
          bottomRight: 20
        }).height(50).padding({
          left: 15,
          right: 15
        })
      }
      .height(50)
      .width('100%')
      .backgroundColor(Color.Black)
      .borderRadius(20)
      .onClick(() => {
        this.isShowCar = !this.isShowCar
      })
    }.padding({ left: 20, right: 20, bottom: 20 }).width('100%')
  }
}

/**
 * 加减购物车的视图
 */
@Component
struct MTAddCut {
  item: Partial<FoodItem> = {}
  @Consume
  cardList: FoodItem[]

  getCunt() {
    return this.cardList.find(item => item.id === this.item.id)?.count || 0
  }

  build() {
    Row({ space: 8 }) {
      Row() {
        Image($r('app.media.ic_screenshot_line'))
          .width(10)
          .aspectRatio(1)

      }
      .width(16)
      .aspectRatio(1)
      .justifyContent(FlexAlign.Center)
      .backgroundColor("#fff")
      .borderRadius(4)
      .border({ width: 0.5, color: '#f8c74e' })
      .onClick(() => {
        addCutCart('cut', this.item as FoodItem)
      })
      .visibility(this.getCunt() ? Visibility.Visible : Visibility.Hidden)

      Text(this.getCunt().toString()).fontSize(14).visibility(this.getCunt() ? Visibility.Visible : Visibility.Hidden)
      Row() {
        Image($r('app.media.ic_public_add_filled'))
          .width(10)
          .aspectRatio(1)

      }
      .width(16)
      .aspectRatio(1)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#f8c74e')
      .borderRadius(4)
      .onClick(() => {
        addCutCart('add', this.item as FoodItem)
      })
    }
  }
}

//定义数据模型
export class FoodItem {
  id: number = 0
  name: string = ""
  like_ratio_desc: string = ""
  food_tag_list: string[] = []
  price: number = 0
  picture: string = ""
  description: string = ""
  tag: string = ""
  month_saled: number = 0
  count: number = 1
}


export class Category {
  tag: string = ""
  name: string = ""
  foods: FoodItem[] = []
}


// 初始化持久化购物车
PersistentStorage.PersistProp("user_cart", '[]')

const getCarts = () => {
  return JSON.parse(AppStorage.Get('user_cart') || '[]') as FoodItem[]
}

const addCutCart = (type: 'add' | 'cut', item: FoodItem) => {
  const list = getCarts()
  const f = list.find(f => f.id === item.id)
  if (type === 'add') {
    // +1
    if (f) {
      f.count++
    } else {
      item.count = 1
      list.unshift(item) // 加入
    }

  } else if (type === 'cut') {
    if (f && f.count > 0) {
      f.count--
      if (f.count === 0) {
        // 移除
        const index = list.findIndex(f => f.id === item.id)
        list.splice(index, 1) // 移除该元素
      }
    }
  }
  AppStorage.Set<string>("user_cart", JSON.stringify(list))
}

/**
 * 清空购物车
 */
const clearCats = () => {
  AppStorage.Set<string>("user_cart", '[]')
}











