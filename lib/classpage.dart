import 'package:flutter/cupertino.dart';

class ListData{
  final String imagepath;
  final String name;
  final String unit;
  final String price;
  ListData({
    required this.imagepath,
    required this.name,
    required this.unit,
    required this.price
  });
}
class Namedicon {
  final IconData iconData;
  final String text;
  final VoidCallback? onTap;
  final int notificationCount;

  Namedicon({
    this.onTap,
    required this.text,
    required this.iconData,
    this.notificationCount = 0,
  });
}
