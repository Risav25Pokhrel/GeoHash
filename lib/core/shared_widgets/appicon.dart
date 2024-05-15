import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../services/get.dart';

class AppIcon extends StatelessWidget {
  const AppIcon(this.icon,
      {super.key,
      this.color,
      this.size = 25,
      this.onTap,
      this.padding,
      this.onLongTap});
  final dynamic icon;
  final Color? color;
  final double size;
  final VoidCallback? onTap;
  final VoidCallback? onLongTap;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    final isSvg = icon is String;
    if (!(isSvg || icon is IconData)) {
      throw AssertionError("Invalid Data Type");
    }
    return Padding(
        key: Get.key(icon),
        padding: padding ?? const EdgeInsets.all(2).r,
        child: GestureDetector(
            onTap: onTap,
            onLongPress: onLongTap,
            child: Icon(icon, color: color, size: size.sp)));
  }
}

// abstract final class AppIcons {
//   static const _basePath = 'assets/icons/';
// }
