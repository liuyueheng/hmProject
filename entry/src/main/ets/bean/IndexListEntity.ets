export class IndexListEntity {

  /**
   * 标题
   */
  title: Resource;

  /**
   * 路由跳转地址
   */
  router?: string;

  /**
   * 判断是都是group标题
   */
  isGroupTitle: boolean;

  constructor(title: Resource, isGroupTitle: boolean, router?: string) {
    this.title = title;
    this.router = router;
    this.isGroupTitle = isGroupTitle
  }
}