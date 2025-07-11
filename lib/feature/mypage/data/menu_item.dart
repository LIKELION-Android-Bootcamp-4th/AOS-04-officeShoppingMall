import 'dart:ui';

class MenuItem {
  String icon;
  String title;
  VoidCallback? onTap;

  MenuItem(this.icon, this.title, {this.onTap});
}
