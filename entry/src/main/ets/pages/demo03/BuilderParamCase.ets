@Entry
@Component
struct BuilderParamCase {
  @Builder
  renderButton() {
    Button("111").backgroundColor(Color.Pink)
  }

  @Builder
  renderImage() {
  }

  build() {
    Row() {
      Column() {
        hmComponent({ addComment: this.renderButton })
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct hmComponent {
  @BuilderParam
  addComment: () => void

  build() {
    Column() {
      this.addComment()
      Text("卡片组件")
      Divider().backgroundColor(Color.Pink)
      Text("内容")
    }
  }
}