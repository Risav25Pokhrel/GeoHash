import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geohash/core/services/get.dart';
import 'package:geohash/geohashing/domains/riverpods/geohasingnotifier.dart';

class PolygonNotifierView extends ConsumerWidget {
  const PolygonNotifierView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final geo = ref.watch(geoNotifier);
    return PolygonLayer(polygons: [
      Polygon(
          points: geo.geoHases,
          isFilled: true,
          isDotted: true,
          labelStyle: Get.bodyMedium.px15,
          rotateLabel: true,
          color: Color(geo.colorHexValue).o1,
          label: geo.areaName),
    ]);
  }
}
