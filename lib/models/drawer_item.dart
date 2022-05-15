import 'package:flutter/material.dart';

class DrawerItem {
  int code;
  String title;
  IconData icon;
  bool isAdmin;
  DrawerItem(this.code, this.title, this.icon, this.isAdmin);
}

class DrawerMenu {
  int code;
  String title;
  List<DrawerItem> drawerItem;
  DrawerMenu(this.code, this.title, this.drawerItem);
}
