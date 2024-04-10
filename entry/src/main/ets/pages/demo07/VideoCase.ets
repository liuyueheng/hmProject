@Entry
@Component
struct VideoCase {
  controller: VideoController = new VideoController()
  @State
  speed: number = 1

  build() {
    Column() {
      Video({
        controller: this.controller,
        currentProgressRate: this.speed,
        src: 'https://highlight-video.cdn.bcebos.com/video/6s/887de388-e8fa-11ee-94b4-6c92bf5b40f4.mp4'
      }).width('100%').aspectRatio(1.2)
      Slider({
        value: this.speed,
        min: 0.75,
        step: 0.25,
        max: 2,
        style: SliderStyle.InSet
      })
        .showSteps(true)
        .onChange(value => {
          this.speed = value
        })
      Text(this.speed + "倍速").fontSize(14).textAlign(TextAlign.Center).width('100%')
      Row({ space: 20 }) {
        Button("播放")
          .onClick(() => {
            this.controller.start()
          })
        Button("暂停")
          .onClick(() => {
            this.controller.pause()
          })
        Button("移动进度")
          .onClick(() => {
            this.controller.setCurrentTime(30) // 单位为秒
          })
        Button("结束")
          .onClick(() => {
            this.controller.stop()
          })
      }
    }
    .width('100%')
  }
}