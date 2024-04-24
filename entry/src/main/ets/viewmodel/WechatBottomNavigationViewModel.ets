import { BottomNavigationEntity } from '../bean/BottomNavigationEntity';

export class WechatBottomNavigationViewModel {
  getNavigationList(): Array<BottomNavigationEntity> {
    let bottomNavigationEntityList = [new BottomNavigationEntity({
      tag: 0,
      title: $r(
        'app.string.table_home'
      ),
      image: $r
      (
        "app.media.widget_bar_home_over"
      ),
      unCheckImage: $r
      (
        "app.media.widget_bar_home_nor"
      )
    }), new BottomNavigationEntity({
      tag: 1,
      title: $r(
        'app.string.table_contact'
      ),
      image: $r
      (
        "app.media.widget_bar_content_over"
      ),
      unCheckImage: $r
      (
        "app.media.widget_bar_content_nor"
      )
    }), new BottomNavigationEntity({
      tag: 2,
      title: $r(
        'app.string.table_discover'
      ),
      image: $r
      (
        "app.media.widget_bar_fpframe_over"
      ),
      unCheckImage: $r
      (
        "app.media.widget_bar_fpframe_nor"
      )
    }), new BottomNavigationEntity({
      tag: 3,
      title: $r(
        'app.string.table_me'
      ),
      image: $r
      (
        "app.media.widget_bar_tools_over"
      ),
      unCheckImage: $r
      (
        "app.media.widget_bar_tools_nor"
      )
    })]
    return bottomNavigationEntityList
  }
}

let navigationViewModel = new WechatBottomNavigationViewModel()

export default navigationViewModel as WechatBottomNavigationViewModel;