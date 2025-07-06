import 'package:flutter/material.dart';

class MenuItem {
  String icon;
  String title;
  VoidCallback? onTap;

  MenuItem(this.icon, this.title, {this.onTap});
}
