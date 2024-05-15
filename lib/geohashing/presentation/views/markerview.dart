import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geohash/core/services/get.dart';
import 'package:geohash/core/shared_widgets/widgets.dart';
import 'package:geohash/geohashing/domains/riverpods/geohasingnotifier.dart';
import 'package:latlong2/latlong.dart';

class MarkerNotifierView extends ConsumerWidget {
  const MarkerNotifierView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final geo = ref.watch(geoNotifier);
    List<Marker> markers = [];
    for (LatLng i in geo.geoHases) {
      final marker = Marker(
          point: i,
          rotate: true,
          child: AppIcon(
            Get.location,
            color: Color(geo.colorHexValue),
          ));
      markers.add(marker);
    }
    return MarkerLayer(markers: markers);
  }
}
