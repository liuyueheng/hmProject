import { BottomNavigationEntity } from '../../../../bean/BottomNavigationEntity';
import navigationViewModel from '../../../../viewmodel/WechatBottomNavigationViewModel';
import BottomNavigationItem from './BottomNavigationItem'

@Preview
@Component
export default struct BottomNavigation {
  @Link currentItemIndex: number;

  build() {
    Row({ space: 5 }) {
      ForEach(navigationViewModel.getNavigationList(), (item: BottomNavigationEntity, index: number) => {
        BottomNavigationItem({ navigationItem: item, currentIndex: $currentItemIndex })
          .onClick(() => {
            this.currentItemIndex = index
          })
      })
    }
    .width('100%')
    .height(65)
    .padding({
      top: 5,
      bottom: 5
    })
    .justifyContent(FlexAlign.SpaceAround)
    .backgroundColor(0xF7F7F7)
  }
}