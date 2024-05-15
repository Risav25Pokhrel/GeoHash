import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../services/get.dart';

appBottomSheet(Widget content) async {
  await showModalBottomSheet(
      showDragHandle: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.r))),
      context: Get.context,
      builder: (context) => content);
}
