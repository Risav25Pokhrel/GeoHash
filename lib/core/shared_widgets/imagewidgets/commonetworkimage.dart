import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/app_colors.dart';
import '../../services/get.dart';

class CircularNetworkImage extends StatelessWidget {
  const CircularNetworkImage(
      {super.key, required this.imageUrl, required this.radius});
  final String imageUrl;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: imageUrl,
      child: SizedBox.square(
          dimension: radius,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              clipBehavior: Clip.hardEdge,
              child: CachedNetworkImage(
                  key: Get.key(imageUrl),
                  cacheKey: imageUrl.toString(),
                  imageUrl: imageUrl.toString(),
                  fit: BoxFit.cover))),
    );
  }
}

class CommonRectangularImage extends StatelessWidget {
  const CommonRectangularImage(
      {super.key, required this.url, this.fit = BoxFit.contain, this.tag});
  final String url;
  final BoxFit fit;
  final String? tag;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag ?? url,
      child: Container(
          decoration: BoxDecoration(
              color: AppColors.transparent,
              borderRadius: BorderRadius.circular(12).r),
          child: CachedNetworkImage(imageUrl: url, fit: fit)),
    );
  }
}
