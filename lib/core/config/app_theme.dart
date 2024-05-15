import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geohash/core/services/get.dart';
import 'app_colors.dart';
import 'app_text_style.dart';


////////////////////////App Themes////////////////////////////////
final class AppThemes {
  static ThemeData get darkTheme => ThemeData(
      brightness: Brightness.dark,
      disabledColor: AppColors.white,
      unselectedWidgetColor: AppColors.unselcetedlight,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryIconTheme: Icontheme.darkIconTheme,
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          background: AppColors.black),
      scaffoldBackgroundColor: AppColors.black,
      textTheme: TextThemes.darkTextTheme,
      iconTheme: Icontheme.darkIconTheme,
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
              iconColor:
                  MaterialStateColor.resolveWith((states) => AppColors.red))),
      cardColor: AppColors.black,
      useMaterial3: false,
      appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: false,
          backgroundColor: AppColors.black,
          iconTheme: IconThemeData(size: 23.sp, color: AppColors.primary),
          actionsIconTheme:
              IconThemeData(color: AppColors.white, size: 15.sp),
          titleTextStyle: TextThemes.darkTextTheme.bodyMedium?.px20));

  static ThemeData get lightTheme => ThemeData(
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      disabledColor: AppColors.black,
      unselectedWidgetColor: AppColors.unselcetedlight,
      primaryIconTheme: Icontheme.lightIconTheme,
      textTheme: TextThemes.primaryTextTheme,
      primaryColor: AppColors.primary,
      cardColor: AppColors.white,
      useMaterial3: false,
      colorScheme: const ColorScheme.light(
          brightness: Brightness.light,
          primary: AppColors.primary,
          secondary: AppColors.pink,
          background: AppColors.white),
      scaffoldBackgroundColor: AppColors.white,
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
              iconColor: MaterialStateColor.resolveWith(
                  (states) => AppColors.primary))),
      appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: false,
          titleTextStyle: TextThemes.primaryTextTheme.bodyMedium!.px20,
          backgroundColor: AppColors.white,
          actionsIconTheme:
              IconThemeData(color: AppColors.black, size: 15.sp),
          iconTheme: IconThemeData(size: 23.sp, color: AppColors.primary)));

  static CupertinoThemeData get iosdarkTheme => MaterialBasedCupertinoThemeData(
      materialTheme: AppThemes.darkTheme.copyWith(
          cupertinoOverrideTheme: CupertinoThemeData(
              primaryContrastingColor: AppColors.primary,
              scaffoldBackgroundColor: AppColors.iosBlack,
              barBackgroundColor: AppColors.iosBlack,
              applyThemeToAll: true,
              textTheme: CupertinoTextThemeData(
                  primaryColor: AppColors.primary,
                  textStyle: TextThemes.darkTextTheme.bodyMedium?.px20),
              primaryColor: AppColors.primary,
              brightness: Brightness.dark)));

  static CupertinoThemeData get ioslightTheme =>
      MaterialBasedCupertinoThemeData(
          materialTheme: AppThemes.lightTheme.copyWith(
              cupertinoOverrideTheme: CupertinoThemeData(
                  primaryContrastingColor: AppColors.primary,
                  scaffoldBackgroundColor: AppColors.iosWhite,
                  barBackgroundColor: AppColors.iosWhite,
                  primaryColor: AppColors.primary,
                  applyThemeToAll: true,
                  textTheme: CupertinoTextThemeData(
                      primaryColor: AppColors.primary,
                      textStyle: TextThemes.primaryTextTheme.bodyMedium?.px20),
                  brightness: Brightness.light)));
}

////////////////////////Text Theme////////////////////////////////
final class TextThemes {
  static TextTheme get textTheme {
    return TextTheme(
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        titleMedium: AppTextStyles.titleMedium,
        titleSmall: AppTextStyles.titleSmall,
        displayLarge: AppTextStyles.displayLarge,
        displayMedium: AppTextStyles.displayMedium,
        displaySmall: AppTextStyles.displaySmall,
        headlineMedium: AppTextStyles.headlineMedium,
        headlineLarge: AppTextStyles.headlineLarge);
  }

  static TextTheme get darkTextTheme {
    Color textColor = AppColors.white;
    return TextTheme(
        bodyLarge: AppTextStyles.bodyLarge.copyWith(color: textColor),
        bodyMedium: AppTextStyles.bodyMedium.copyWith(color: textColor),
        titleMedium: AppTextStyles.titleMedium.copyWith(color: textColor),
        titleSmall: AppTextStyles.titleSmall.copyWith(color: textColor),
        displayLarge: AppTextStyles.displayLarge.copyWith(color: textColor),
        displayMedium: AppTextStyles.displayMedium.copyWith(color: textColor),
        displaySmall: AppTextStyles.displaySmall.copyWith(color: textColor),
        headlineMedium: AppTextStyles.headlineMedium.copyWith(color: textColor),
        headlineLarge: AppTextStyles.headlineLarge.copyWith(color: textColor));
  }

  static TextTheme get primaryTextTheme {
    Color textColor = AppColors.black;
    return TextTheme(
        bodyLarge: AppTextStyles.bodyLarge.copyWith(color: textColor),
        bodyMedium: AppTextStyles.bodyMedium.copyWith(color: textColor),
        titleMedium: AppTextStyles.titleMedium.copyWith(color: textColor),
        titleSmall: AppTextStyles.titleSmall.copyWith(color: textColor),
        displayLarge: AppTextStyles.displayLarge.copyWith(color: textColor),
        displayMedium: AppTextStyles.displayMedium.copyWith(color: textColor),
        displaySmall: AppTextStyles.displaySmall.copyWith(color: textColor),
        headlineMedium: AppTextStyles.headlineMedium.copyWith(color: textColor),
        headlineLarge: AppTextStyles.headlineLarge.copyWith(color: textColor));
  }
}

////////////////////////Icon Theme////////////////////////////////
final class Icontheme {
  static IconThemeData get lightIconTheme =>
      IconThemeData(size: 23.sp, color: AppColors.black);
  static IconThemeData get darkIconTheme =>
      IconThemeData(size: 23.sp, color: AppColors.white);
}
