import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/get.dart';
import '../../../../core/shared_widgets/widgets.dart';
import '../../../domains/firebase.dart/getdata.dart';

class MarkerServerView extends ConsumerWidget {
  const MarkerServerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hashed = ref.watch(hashDatas);
    return hashed.when(
        error: (error, stackTrace) {
          return const SizedBox.shrink();
        },
        loading: () => const SizedBox.shrink(),
        data: (geoHash) {
          List<Marker> markers = [];
          for (var geo in geoHash) {
            for (var i in geo.geoHases) {
              final marker = Marker(
                  point: i,
                  rotate: true,
                  child: AppIcon(
                    Get.location,
                    color: Color(geo.colorHexValue),
                  ));
              markers.add(marker);
            }
          }
          return MarkerLayer(markers: markers);
        });
  }
}
