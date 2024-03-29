@Entry
@Component
struct Login {
  build() {
    Column() {
      Head()
      Main()
      Foot()
    }
  }
}

@Component
struct Head {
  build() {
    Row() {
      Text("head")
    }
    .width("100").width(50).backgroundColor(Color.Pink)
  }
}

@Component
struct Main {
  build() {
    Row() {
      Text("main")
    }
    .width("100").width(50).backgroundColor(Color.Red)
  }
}


@Component
struct Foot {
  build() {
    Row() {
      Text("foot")
    }
    .width("100").width(50).backgroundColor(Color.Blue)
  }
}

