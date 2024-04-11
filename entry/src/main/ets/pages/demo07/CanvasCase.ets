@Entry
@Component
struct CanvasCase {
  context: CanvasRenderingContext2D = new CanvasRenderingContext2D(new RenderingContextSettings(true))

  build() {
    Column({ space: 20 }) {
      Canvas(this.context)
        .width('100%')
        .aspectRatio(1.2)
        .backgroundColor(Color.Gray)
        .onReady(() => {
          //准备好了，进行绘制
        })
        .onAreaChange((old: Area, newArea: Area) => {
          AlertDialog.show({ message: JSON.stringify(newArea) })
        })
      Row({ space: 20 }) {
        Button("画线").onClick(() => {
          //开始
          this.context.beginPath()
          this.context.lineWidth = 4 // 线的宽度
          this.context.strokeStyle = 'blue'
          this.context.moveTo(50, 50) //x和y坐标
          this.context.lineTo(250, 200)
          this.context.stroke() //
          this.context.closePath() // 结束绘制
          this.context.beginPath()
          // 绘制红线
          this.context.strokeStyle = "red"
          this.context.moveTo(50, 240)
          this.context.lineTo(250, 240)
          this.context.stroke()
          //结束
          this.context.closePath()
        })

        Button("画圆").onClick(() => {
          this.context.beginPath()
          this.context.lineWidth = 4
          this.context.strokeStyle = "#fff"
          this.context.arc(200, 150, 140, 0, 360) //前面两个值是圆心 第三个值是半径
          this.context.stroke()
          this.context.closePath()
        })

        Button("画矩形")
          .onClick(() => {
            this.context.beginPath()
            this.context.lineWidth = 4
            this.context.strokeStyle = "#fff"
            this.context.rect(100, 75, 150, 150) //起始点进行绘制
            this.context.stroke()
            // this.context.fill()
            this.context.closePath()
          })

        Button("清空")
          .onClick(() => {
            this.context.clearRect(0, 0, 360, 300)
          })
      }
    }.width('100%')
  }
}