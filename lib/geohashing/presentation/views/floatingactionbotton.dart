import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geohash/core/config/app_colors.dart';
import 'package:geohash/core/shared_widgets/appicon.dart';
import 'package:geohash/core/shared_widgets/botton/mybutton.dart';
import 'package:geohash/geohashing/domains/firebase.dart/firebaseservices.dart';
import 'package:geohash/geohashing/domains/models/geohash_models.dart';
import 'package:geohash/geohashing/domains/riverpods/geohasingnotifier.dart';
import 'package:geohash/geohashing/presentation/views/pickcolorview.dart';

class AppFloatingButton extends ConsumerWidget {
  const AppFloatingButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final geo = ref.watch(geoNotifier);
    final isLoading = ValueNotifier(false);
    if (geo.isUpdated) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          35.horizontalSpace,
          Expanded(
              child: AppButton(
                  onTap: () => pickColor(), text: "Update", radius: 100)),
          15.horizontalSpace,
          Expanded(
              child: AppButton(
                  onTap: () async {
                    isLoading.value = true;
                    final geoHash = AppGeoHash(
                        id: faker.guid.guid(),
                        geoHases: geo.geoHases,
                        colorHexValue: geo.colorHexValue,
                        areaName: geo.areaName);
                    await GeoHashFirebase.addNewHash(geoHash);
                    isLoading.value = false;
                    ref.invalidate(geoNotifier);
                  },
                  valueListenable: isLoading,
                  text: "Save",
                  radius: 100,
                  bgcolor: AppColors.green)),
          15.horizontalSpace,
          Expanded(
              child: AppButton(
                  onTap: () => ref.invalidate(geoNotifier),
                  text: "Clear",
                  radius: 100,
                  bgcolor: AppColors.red)),
          15.horizontalSpace,
          AppIcon(Icons.undo, onTap: () => geo.clearLatestMark())
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
