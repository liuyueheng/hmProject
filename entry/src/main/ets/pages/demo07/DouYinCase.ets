/**
 * 抖音小案例
 */
@Entry
@Component
struct DouYin {
  controller: SwiperController = new SwiperController()
  @State
  videoList: VideoItem[] = allData
  @State
  currentIndex: number = 0

  build() {
    //滑轮控件
    Swiper(this.controller) {
      ForEach(this.videoList, (item: VideoItem, index: number) => {
        PlayVideo({ item, index, currentIndex: this.currentIndex })
      })
    }
    .height('100%')
    .width('100%')
    .vertical(true)
    .indicator(false)
    .cachedCount(3)
    .loop(false)
    .duration(200)
    .curve(Curve.EaseOut)
    .onChange((index: number) => {
      this.currentIndex = index
    })

  }
}

@Component
struct PlayVideo {
  item: Partial<VideoItem> = {}
  index: number = -1
  @Prop
  currentIndex: number
  @State
  playIng: boolean = false
  controller: VideoController = new VideoController()

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Stack() {
        if (this.index === this.currentIndex) {
          Video({
            src: this.item.videoUrl,
            controller: this.controller
          })
            .width('100%')
            .aspectRatio(1.4)
            .controls(false)
            .onPrepared(() => {
              this.playIng = true
              this.controller.start()
            })
            .objectFit(ImageFit.Contain)
            .onClick(() => {
              this.playIng = false
              this.controller.pause()
            })
        }
        Image(this.item.imgUrl)
          .width(this.index === this.currentIndex ? 0 : '100%')
          .aspectRatio(1.4)
          .animation({
            duration: 300
          })

        if (!this.playIng) {
          Row() {
            Image($r('app.media.action_back'))
              .width(100)
              .height(100)
              .fillColor("#9d9393")
          }.width('100%')
          .justifyContent(FlexAlign.Center)
          .onClick(() => {
            this.controller.start()
            this.playIng = true
          })

        }
      }
      .backgroundColor(Color.Black)
      .height('100%')
      .width('100%')

      Text(this.item.title)
        .fontColor(Color.White)
        .width('100%')
        .padding(20)
        .fontSize(20)
        .height(150)
        .lineHeight(28)
        .fontWeight(FontWeight.Bold)
        .textOverflow({
          overflow: TextOverflow.Ellipsis
        })
    }
    .height('100%')
  }
}

class VideoItem {
  videoUrl: string = ''
  imgUrl: ResourceStr = ''
  title: string = ""
}

const allData: VideoItem[] = [
  {
    imgUrl: $r('app.media.icon_cart'),
    videoUrl: 'https://vd4.bdstatic.com/mda-pmia5y0htmibjej2/576p/h264/1702970058650094297/mda-pmia5y0htmibjej2.mp4?auth_key=1703155514-0-0-a92de0b6c32239b242d0e51b151ee2d6&bcevod_channel=searchbox_feed&cr=1&cd=0&pd=1&pt=4&logid=2714832517&vid=9811936085320099438&abtest=all',
    title: '我们只是拿某站的数据进行一下测试'
  },
  {
    imgUrl: $r('app.media.icon_cart'),
    title: '请大家自行准备在线素材',
    videoUrl: 'https://vd4.bdstatic.com/mda-pmjxx4ccc8x719t3/hd/h264/1703111503445924222/mda-pmjxx4ccc8x719t3.mp4?auth_key=1703155561-0-0-e7c32efbedae026e0e17c900bbd0cf55&bcevod_channel=searchbox_feed&pd=1&cr=1&cd=0&pt=4&logid=2761194416&vid=7476642150019887968&abtest=all'
  },
  {
    imgUrl: $r('app.media.icon_cart'),
    title: '你知道冬天的雪是什么颜色吗, 我猜你不知道',
    videoUrl: 'https://vd4.bdstatic.com/mda-pku9q3zt0rzybip0/hd/cae_h264/1701381974031001593/mda-pku9q3zt0rzybip0.mp4?v_from_s=hkapp-haokan-hbf&auth_key=1703155589-0-0-133df5be4b625ce34e1a75fe3a4baabf&bcevod_channel=searchbox_feed&pd=1&cr=1&cd=0&pt=4&logid=2789259407&vid=4775310688475056528&abtest=all'
  },
  {
    imgUrl: $r('app.media.icon_cart'),
    title: '宝子们，我当众社死了，我竟然在众目睽睽之下完成了自己人生中的第一段程序',
    videoUrl: 'https://vd2.bdstatic.com/mda-pkkf9qb7zksdaqs9/576p/h264/1700564765354260319/mda-pkkf9qb7zksdaqs9.mp4?v_from_s=hkapp-haokan-hbf&auth_key=1703155630-0-0-9a47a2910e8d5d90b47ba709fa530b5e&bcevod_channel=searchbox_feed&pd=1&cr=1&cd=0&pt=4&logid=2830328412&vid=8335346471874826776&abtest=all'
  },
  {
    imgUrl: $r('app.media.icon_cart'),
    title: '其实老高最爱的是文学，可以在寂静的夜用曼妙的文字勾勒出关于人生，职场，感情的诸多情绪，无奈此生当为程序员',
    videoUrl: 'https://vd2.bdstatic.com/mda-pj8qa65bc9r1v1cf/576p/h264/1696871444324088416/mda-pj8qa65bc9r1v1cf.mp4?auth_key=1703155654-0-0-fdc0ca9c37ec26be3da9809b89e6151c&bcevod_channel=searchbox_feed&pd=1&cr=1&cd=0&pt=4&logid=2854467125&vid=5483608480722064830&abtest=all'
  },
  {
    imgUrl: $r('app.media.icon_cart'),
    title: '当你阅读到这段文字的时候，我早已入睡，当我在睡梦中惊醒，你却早已安然睡去',
    videoUrl: 'https://vd2.bdstatic.com/mda-pmexhyfui3e6rbmd/hd/cae_h264/1702705379314308540/mda-pmexhyfui3e6rbmd.mp4?auth_key=1703155684-0-0-5b0145fb4c2ec2f0d1bbd525ddb3d592&bcevod_channel=searchbox_feed&pd=1&cr=1&cd=0&pt=4&logid=2884962294&vid=3059586091403538183&abtest=all'
  },
  {
    imgUrl: $r('app.media.icon_cart'),
    title: '每个人的内心都有一段独处的幽闭，不可诉说的窒息感孤独感在每当我们沉静下来的时候变愈发强烈',
    videoUrl: 'https://vd3.bdstatic.com/mda-pmbgjjpkihkf7tjd/576p/h264/1702381478247675613/mda-pmbgjjpkihkf7tjd.mp4?v_from_s=hkapp-haokan-hbf&auth_key=1703155722-0-0-ea3c2453fbbb2cca66b12e9afe3d419f&bcevod_channel=searchbox_feed&pd=1&cr=1&cd=0&pt=4&logid=2922207105&vid=9050628586030215591&abtest=all'
  },
  {
    imgUrl: $r('app.media.icon_cart'),
    title: '如果在未来的某一天，某一个早晨 晚上 瞬间，你会偶然想起多年前的一段往事，其实并不是我们有多怀旧，只是因为我们走过了太多的路',
    videoUrl: 'https://vd2.bdstatic.com/mda-pj7ktq9euqchetdc/cae_h264/1696824500894354779/mda-pj7ktq9euqchetdc.mp4?v_from_s=hkapp-haokan-hbf&auth_key=1703155751-0-0-fccb0f110a3b447af67eb0feeabf06ad&bcevod_channel=searchbox_feed&pd=1&cr=0&cd=0&pt=4&logid=2951492012&vid=12162674818438199896'
  },
  {
    imgUrl: $r('app.media.icon_cart'),
    title: '什么是知己，有个网红说，当你理解所有人的时候，你一定不能被所有人理解，每个人都或多或少的自私，只是或多或少而已',
    videoUrl: 'https://vd3.bdstatic.com/mda-pmh5hr95fg6u8u0k/hd/cae_h264/1702877143957184120/mda-pmh5hr95fg6u8u0k.mp4?v_from_s=hkapp-haokan-hbf&auth_key=1703155785-0-0-5cfc2be95d00306082c7875a747dd998&bcevod_channel=searchbox_feed&pd=1&cr=1&cd=0&pt=4&logid=2985314718&vid=2720370579167170031&abtest=all'
  }
]

