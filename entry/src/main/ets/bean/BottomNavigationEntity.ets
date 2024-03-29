export class BottomNavigationEntity {
  /**
   * 底部导航tab标题
   */
  title: Resource;

  /**
   * 底部导航tab图片
   */
  image: Resource;

  /**
   * 底部导航tab图片，未选中
   */
  unCheckImage: Resource;

  /**
   * tab类型标志位
   */
  tag: number;

  constructor(tag: number, title: Resource, image: Resource, unCheckImage: Resource) {
    this.tag = tag;
    this.title = title;
    this.image = image;
    this.unCheckImage = unCheckImage;
  }
}
