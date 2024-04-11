/**
 * 你画我猜小游戏
 */
@Entry
@Component
struct GuessCanvas {
  context: CanvasRenderingContext2D = new CanvasRenderingContext2D(new RenderingContextSettings(true))
  guessContext: CanvasRenderingContext2D = new CanvasRenderingContext2D(new RenderingContextSettings(true))
  drawIng: boolean = false
  lastX: number = 0
  lastY: number = 0
  @State
  imageUrl: string = ''
  pointList: PointClass[] = []
  gLastX: number = 0
  gLastY: number = 0
  timer: number = -1

  drawGuess() {
    if (this.pointList.length && this.timer === -1) {
      this.timer = setInterval(() => {
        if (this.pointList.length === 0) {
          clearInterval(this.timer)
          this.timer = -1
          return
        }
        let p: PointClass = this.pointList.shift()
        this.guessLine(p)
      }, 100)
    }
  }

  guessLine(p: PointClass) {
    if (p.reset) {
      this.guessContext.closePath()
      this.guessContext.beginPath()
      this.gLastX = p.x
      this.gLastY = p.y
    } else {
      this.guessContext.moveTo(this.gLastX, this.gLastY) // 先将线移动到上一个点
      this.guessContext.lineTo(p.x, p.y)
      this.gLastX = p.x // 将当前内容的x记录
      this.gLastY = p.y // 将当前的y记录
      this.guessContext.stroke()
    }
  }

  drawLine(x: number, y: number) {
    this.context.moveTo(this.lastX, this.lastY) // 先将线移动到上一个点
    this.context.lineTo(x, y)
    this.lastX = x // 将当前内容的x记录
    this.lastY = y // 将当前的y记录
    this.context.stroke()
  }

  build() {
    Scroll() {
      //两块写字板
      Column({ space: 20 }) {
        Canvas(this.context)
          .width('100%')
          .aspectRatio(1.2)
          .backgroundColor(Color.Grey)
          .onTouch((event: TouchEvent) => {
            if (event.type === TouchType.Down) {
              this.drawIng = true
              this.lastX = event.touches[0].x
              this.lastY = event.touches[0].y
              this.context.beginPath()
              //需要记录开始画的时候的轨迹
              this.pointList.push({
                x: this.lastX,
                y: this.lastY,
                reset: true
              })
            }
            if (event.type === TouchType.Move) {
              if (this.drawIng) {
                //需要记录正在画的时候的轨迹
                this.pointList.push({
                  x: event.touches[0].x,
                  y: event.touches[0].y,
                  reset: false
                })
                this.drawLine(event.touches[0].x, event.touches[0].y)
              }
            }
            if (event.type === TouchType.Up) {
              this.drawIng = false
              this.context.closePath()
              // 开始模仿
              this.drawGuess()
            }
          })
          .onReady(() => {
            this.context.lineWidth = 4
            this.context.strokeStyle = "blue"
          })
        Canvas(this.guessContext)
          .width('100%')
          .aspectRatio(1.2)
          .backgroundColor(Color.Red)
          .onReady(() => {
            this.guessContext.lineWidth = 4
            this.guessContext.strokeStyle = "#fff"
          })

        Row({ space: 20 }) {
          Button("清空").onClick(() => {
            this.context.clearRect(0, 0, 400, 300)
            this.context.clearRect(0, 0, 400, 300)
            this.guessContext.clearRect(0, 0, 400, 300)
            this.pointList = []
            this.imageUrl = ''
          })
          Button("保存图片并显示").onClick(() => {
            this.imageUrl = this.context.toDataURL('image/jpeg') //将canvas转成base64数据传输给后台
          })
        }

        if (this.imageUrl) {
          Image(this.imageUrl).width('100%').aspectRatio(1.2)
        }
      }
    }
  }
}

/**
 * 定义画图轨迹model
 */
class PointClass {
  x: number = 0
  y: number = 0
  reset?: boolean = false
}