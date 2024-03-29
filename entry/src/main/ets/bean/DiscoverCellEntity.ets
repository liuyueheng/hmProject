export class DiscoverCellEntity {
  icon: Resource;
  title: string;
  hasNew: boolean;
  hasAvatar: boolean;

  constructor(icon: Resource, title: string, hasNew: boolean, hasAvatar: boolean) {
    this.icon = icon;
    this.title = title;
    this.hasNew = hasNew;
    this.hasAvatar = hasAvatar;
  }
}
