import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/get.dart';
import '../../../domains/firebase.dart/getdata.dart';

class PolygonServerView extends ConsumerWidget {
  const PolygonServerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hashed = ref.watch(hashDatas);
    return hashed.when(
      error: (error, stackTrace) {
        return const SizedBox.shrink();
      },
      loading: () => const SizedBox.shrink(),
      data: (geoHash) {
        List<Polygon> poly = [];
        for (var geo in geoHash) {
          final polygon = Polygon(
              points: geo.geoHases,
              isFilled: true,
              isDotted: true,
              labelStyle: Get.bodyMedium.px15,
              labelPlacement: PolygonLabelPlacement.polylabel,
              rotateLabel: true,
              color: Color(geo.colorHexValue).o2,
              label: geo.areaName);
          poly.add(polygon);
        }
        return PolygonLayer(polygons: poly);
      },
    );
  }
}
