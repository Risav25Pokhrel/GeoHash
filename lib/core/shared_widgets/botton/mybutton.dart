import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../config/app_colors.dart';
import '../../services/get.dart';
import '../specialwidgets/appprogressindicator.dart';
import 'appicon.dart';

ValueNotifier _notifier = ValueNotifier<bool>(false);

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.bgcolor = AppColors.black,
      this.transparentColor = true,
      this.valueListenable,
      this.radius = 10,
      this.textColor = AppColors.white});
  final VoidCallback? onTap;
  final String text;
  final Color bgcolor;
  final bool transparentColor;
  final ValueListenable? valueListenable;
  final Color textColor;
  final double radius;

  @override
  Widget build(BuildContext context) {
    Color textcolor = textColor;
    Color buttonColor = bgcolor;
    final textstyle = Get.bodyMedium.copyWith(color: AppColors.white);
    if (!transparentColor) {
      buttonColor = Get.primaryColor;
      textcolor = Get.scaffoldBackgroundColor;
    }
    final border = BorderRadius.circular(radius).r;
    return SizedBox(
      height: 40.h,
      width: (Get.width - 60).w,
      child: ValueListenableBuilder(
        valueListenable: valueListenable ?? _notifier,
        builder: (context, loading, child) => AbsorbPointer(
          absorbing: loading,
          child: PlatformElevatedButton(
            onPressed: onTap,
            color: buttonColor,
            material: (context, platform) => MaterialElevatedButtonData(
              statesController: MaterialStatesController(),
              clipBehavior: Clip.hardEdge ,
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    animationDuration: Durations.extralong4,
                    enableFeedback: true,
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(borderRadius: border))),
            cupertino: (context, platform) => CupertinoElevatedButtonData(
                padding: EdgeInsets.zero,
                pressedOpacity: 0.7,
                originalStyle: true,
                borderRadius: border),
            child: loading
                ? ApprogressIndicator(key: key, color: textcolor)
                : AutoSizeText(text,
                    style: textstyle.copyWith(color: textcolor), maxLines: 1),
          ),
        ),
      ),
    );
  }
}

class AppTextButton extends StatelessWidget {
  const AppTextButton(
      {super.key,
      required this.text,
      this.onPressed,
      this.style,
      this.padding});

  final String text;
  final VoidCallback? onPressed;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding ??
            (Get.isIOS
                ? const EdgeInsets.all(8).r
                : const EdgeInsets.all(10).r),
        child: GestureDetector(
            onTap: onPressed,
            child: Text(text, style: style ?? Get.titleLarge.px16.primary)));
  }
}

class AppIconButon extends StatelessWidget {
  const AppIconButon(
      {super.key,
      required this.icon,
      required this.title,
      this.color,
      this.iconColor,
      this.textColor,
      required this.onTap,
      this.padding = 4});

  final dynamic icon;
  final String title;
  final Color? color;
  final Color? iconColor;
  final Color? textColor;
  final VoidCallback onTap;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onTap,
      icon: AppIcon(icon, size: 24.sp, color: iconColor ?? textColor),
      label: Padding(
        padding: EdgeInsets.only(left: padding).r,
        child: AutoSizeText(title,
            style: Get.bodyMedium.px16.copyWith(color: textColor)),
      ),
      style: OutlinedButton.styleFrom(
          backgroundColor: color,
          side: BorderSide(color: color ?? Get.primaryColor, width: 1.5),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(const Radius.circular(10).r))),
    );
  }
}

class Adaicontext extends StatelessWidget {
  const Adaicontext(
      {super.key,
      required this.icon,
      this.color = Colors.amber,
      required this.text,
      this.padding,
      this.onTap});

  final dynamic icon;
  final Color? color;
  final String text;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppIcon(icon, color: color, size: 20.sp, padding: padding),
          Text(text),
        ],
      ),
    );
  }
}
