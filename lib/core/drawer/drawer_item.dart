import 'package:flutter/material.dart';

class DrawerItem {
  final IconData icon;
  final String title;
  final String route;
  final bool? isLoggOutAction;

  DrawerItem({required this.icon, required this.title, required this.route, this.isLoggOutAction = false});
}