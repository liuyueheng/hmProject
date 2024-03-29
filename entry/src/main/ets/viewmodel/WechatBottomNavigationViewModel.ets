import { BottomNavigationEntity } from '../bean/BottomNavigationEntity';

export class WechatBottomNavigationViewModel {
  getNavigationList(): Array<BottomNavigationEntity> {
    let bottomNavigationEntityList = [];
    bottomNavigationEntityList.push(
      new BottomNavigationEntity(0, $r('app.string.table_home'), $r("app.media.widget_bar_home_over"), $r("app.media.widget_bar_home_nor"))
    )
    bottomNavigationEntityList.push(
      new BottomNavigationEntity(1, $r('app.string.table_contact'), $r("app.media.widget_bar_content_over"), $r("app.media.widget_bar_content_nor"))
    )
    bottomNavigationEntityList.push(
      new BottomNavigationEntity(2, $r('app.string.table_discover'), $r("app.media.widget_bar_fpframe_over"), $r("app.media.widget_bar_fpframe_nor"))
    )
    bottomNavigationEntityList.push(
      new BottomNavigationEntity(3, $r('app.string.table_me'), $r("app.media.widget_bar_tools_over"), $r("app.media.widget_bar_tools_nor"))
    )
    return bottomNavigationEntityList
  }
}

let navigationViewModel = new WechatBottomNavigationViewModel()

export default navigationViewModel as WechatBottomNavigationViewModel;