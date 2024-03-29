import BottomNavigation from '../view/widget/bottom_navigation/BottomNavigation';
import ContentFragment from './fragments/ContentFragment';
import HomeFragment from './fragments/HomeFragment';
import MeFragment from './fragments/MeFragment';
import ServerFragment from './fragments/ServerFragment';

/**
 *Main页面，承载fragment的主页面
 */
@Entry
@Component
struct MainFrame {
  @State currentCheckIndex: number = 0;

  build() {
    RelativeContainer() {
      BottomNavigation({ currentItemIndex: $currentCheckIndex })
        .alignRules({
          bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
          left: { anchor: "__container__", align: HorizontalAlign.Start }
        })
        .id("bottomNavigation")

      Stack() {
        HomeFragment().visibility(this.currentCheckIndex == 0 ? Visibility.Visible : Visibility.Hidden)
        ContentFragment().visibility(this.currentCheckIndex == 1 ? Visibility.Visible : Visibility.Hidden)
        ServerFragment().visibility(this.currentCheckIndex == 2 ? Visibility.Visible : Visibility.Hidden)
        MeFragment().visibility(this.currentCheckIndex == 3 ? Visibility.Visible : Visibility.Hidden)
      }
      .width('100%')
      .height('100%')
      .alignRules({
        left: { anchor: "__container__", align: HorizontalAlign.Start },
        right: { anchor: "__container__", align: HorizontalAlign.End },
        bottom: { anchor: "bottomNavigation", align: VerticalAlign.Top },
        top: { anchor: "__container__", align: VerticalAlign.Top }
      })
      .id("contentPanel")
    }
    .width('100%').height('100%')
  }
}