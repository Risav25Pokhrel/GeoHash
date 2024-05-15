import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

class GeoHasing extends ChangeNotifier {
  List<LatLng> geoHases = <LatLng>[];
  int colorHexValue = 0xffAA336A;
  String areaName = 'Area ${Random().nextInt(5000)}';
  bool isUpdated = false;

  updateGeoHash(LatLng points) {
    geoHases.add(points);
    isUpdated = true;
    notifyListeners();
  }

  updateColors(int hexValue) {
    colorHexValue = hexValue;
    isUpdated = true;
    notifyListeners();
  }

  updateAreaName(String name) {
    areaName = name;
    isUpdated = true;
    notifyListeners();
  }

  clearLatestMark() {
    geoHases.removeAt(geoHases.length - 1);
    if (geoHases.isEmpty) {
      isUpdated = false;
    }
    notifyListeners();
  }
}

final geoNotifier = ChangeNotifierProvider((ref) => GeoHasing());
