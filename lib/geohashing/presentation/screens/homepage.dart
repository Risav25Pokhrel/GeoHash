import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geohash/core/config/app_colors.dart';
import 'package:geohash/core/services/get.dart';
import 'package:geohash/core/services/metamessanger.dart';
import 'package:geohash/core/shared_widgets/appicon.dart';
import 'package:geohash/geohashing/domains/riverpods/mapcontroller.dart';
import 'package:geohash/geohashing/presentation/views/floatingactionbotton.dart';
import 'package:geohash/geohashing/presentation/views/geohashview.dart';
import 'package:geohash/geohashing/presentation/views/markerview.dart';
import 'package:geohash/geohashing/presentation/views/polygon_notifierview.dart';
import 'package:geohash/geohashing/presentation/views/serverview/markerserverview.dart';
import 'package:geohash/geohashing/presentation/views/serverview/polygonserverview.dart';

import '../../domains/riverpods/geohasingnotifier.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapcontroller = ref.watch(mapController);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Geo Hashing"),
        actions: [
          AppIcon(
            Icons.graphic_eq,
            onTap: () {
              if (Get.isIOS) {
                appPlatform.value = PlatformStyle.Material;
                Meta.showToast("Android View");
                return;
              }
              appPlatform.value = PlatformStyle.Cupertino;
              Meta.showToast("Ios View");
            },
          )
        ],
      ),
      floatingActionButton: const AppFloatingButton(),
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapcontroller,
            options: MapOptions(
                initialZoom: 17,
                keepAlive: true,
                onTap: (tapPosition, point) {
                  final geo = ref.watch(geoNotifier);
                  geo.updateGeoHash(point);
                },
                onMapReady: () =>
                    Meta.showToast("Map Loaded", color: AppColors.badge),
                interactionOptions:
                    const InteractionOptions(enableScrollWheel: true)),
            children: [
              TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app'),
              CurrentLocationLayer(
                  alignPositionOnUpdate: AlignOnUpdate.once,
                  alignDirectionOnUpdate: AlignOnUpdate.once,
                  style: LocationMarkerStyle(
                      markerSize: Size(20.sp, 20.sp),
                      markerDirection: MarkerDirection.heading)),
              const MarkerNotifierView(),
              const PolygonNotifierView(),
              const PolygonServerView(),
              const MarkerServerView()
            ],
          ),
          const GeoHashView()
        ],
      ),
    );
  }
}
