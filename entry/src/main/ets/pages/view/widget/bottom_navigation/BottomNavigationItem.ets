import { BottomNavigationEntity } from '../../../../bean/BottomNavigationEntity';

@Preview
@Component
export default struct BottomNavigationItem {
  private navigationItem: BottomNavigationEntity = new BottomNavigationEntity({
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
  });
  @Link currentIndex: number;

  build() {
    Column({ space: 5 }) {
      Image(this.currentIndex === this.navigationItem.tag ? this.navigationItem.image : this.navigationItem.unCheckImage)
        .width(24)
        .height(24)
      Text(this.navigationItem.title)
        .fontSize(14)
        .fontColor(this.currentIndex === this.navigationItem.tag ? Color.Red : 0x333333)
    }
  }
}