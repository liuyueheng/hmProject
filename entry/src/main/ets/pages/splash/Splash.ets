import router from '@ohos.router'

/**
 * 欢迎页面
 */
@Entry
@Component
export default struct SplashPage {
  async aboutToAppear() {
    setTimeout(() => {
      router.replaceUrl({ url: "pages/main/MainFrame" })
    }, 3000)
  }

  build() {
    Row() {
      Image($r('app.media.welcome'))
        .width("100%")
        .height("100%")
    }.width("100%").height("100%")
  }

  pageTransition() {
    PageTransitionEnter({ type: RouteType.Push, duration: 300, curve: Curve.Linear })
      .opacity(0)
    PageTransitionEnter({ type: RouteType.Pop, duration: 300, curve: Curve.Linear })
      .opacity(1)
    PageTransitionExit({ type: RouteType.Push, duration: 300, curve: Curve.Linear })
      .opacity(1)
    PageTransitionExit({ type: RouteType.Pop, duration: 300, curve: Curve.Linear })
      .opacity(0)
  }
}

