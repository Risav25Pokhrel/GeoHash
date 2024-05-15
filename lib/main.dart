import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geohash/firebase_options.dart';
import 'core/config/app_colors.dart';
import 'core/config/app_theme.dart';
import 'core/services/get.dart';
import 'geohashing/presentation/screens/homepage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: AppColors.transparent));
  runApp(const ProviderScope(child: Core()));
}

class Core extends ConsumerWidget {
  const Core({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      child: ValueListenableBuilder(
        valueListenable: appPlatform,
        builder: (context, platform, child) => PlatformProvider(
          key: Get.key(platform),
          settings: PlatformSettingsData(
              iosUsesMaterialWidgets: true,
              matchMaterialCaseForPlatformText: false,
              legacyIosUsesMaterialWidgets: true,
              iosUseZeroPaddingForAppbarPlatformIcon: true,
              platformStyle: PlatformStyleData(android: platform)),
          builder: (context) => PlatformTheme(
            themeMode: ThemeMode.system,
            materialLightTheme: AppThemes.lightTheme,
            materialDarkTheme: AppThemes.darkTheme,
            cupertinoLightTheme: AppThemes.ioslightTheme,
            cupertinoDarkTheme: AppThemes.iosdarkTheme,
            builder: (context) => PlatformApp(
                key: const ValueKey("Market Place"),
                debugShowCheckedModeBanner: false,
                navigatorKey: navigatorKey,
                scrollBehavior: Get.scrollBehaviour,
                localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
                  DefaultMaterialLocalizations.delegate,
                  DefaultCupertinoLocalizations.delegate,
                  DefaultWidgetsLocalizations.delegate
                ],
                home: const HomeScreen()),
          ),
        ),
      ),
    );
  }
}
