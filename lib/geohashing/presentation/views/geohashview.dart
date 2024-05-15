import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geohash/core/config/app_colors.dart';
import 'package:geohash/core/services/get.dart';
import 'package:geohash/geohashing/domains/firebase.dart/firebaseservices.dart';
import 'package:geohash/geohashing/domains/firebase.dart/getdata.dart';

import '../../../core/shared_widgets/widgets.dart';
import '../../domains/riverpods/mapcontroller.dart';

class GeoHashView extends ConsumerWidget {
  const GeoHashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapcontroller = ref.watch(mapController);
    final hashedData = ref.watch(hashDatas);
    return Positioned.fill(
      top: 10,
      child: Align(
        alignment: Alignment.topLeft,
        child: hashedData.when(
          error: (error, stackTrace) {
            return const SizedBox.shrink();
          },
          loading: () => const SizedBox.shrink(),
          data: (hashName) {
            return Wrap(
              alignment: WrapAlignment.start,
              spacing: 4,
              children: hashName
                  .map((e) => GestureDetector(
                        onTap: () {
                          mapcontroller.move(e.geoHases[0], 17,
                              offset: const Offset(10, 10));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(2.0).r,
                          child: Chip(
                              onDeleted: () {
                                GeoHashFirebase.deleteHash(e);
                              },
                              label: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6).r,
                                  child: Text(e.areaName!.emoji)),
                              deleteIcon: AppIcon(Get.close, size: 13.sp),
                              deleteIconColor: AppColors.red,
                              shape: const StadiumBorder(),
                              labelStyle: Get.headlineMedium.px10),
                        ),
                      ))
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
