export interface IBottomNavigationEntity {

  /** tab类型标志位 */
  tag: number;

  /** 底部导航tab标题 */
  title: ResourceStr;

  /** 底部导航tab图片 */
  image: ResourceStr;

  /** 底部导航tab图片，未选中 */
  unCheckImage: ResourceStr;
}

export class BottomNavigationEntity implements IBottomNavigationEntity {
  title: ResourceStr = ''
  image: ResourceStr = ''
  unCheckImage: ResourceStr = ''
  tag: number = 0

  constructor(model: IBottomNavigationEntity) {
    this.tag = model.tag
    this.image = model.image
    this.title = model.title
    this.unCheckImage = model.unCheckImage
  }
}
