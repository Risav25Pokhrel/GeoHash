import 'package:dart_geohash/dart_geohash.dart';
import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';

class AppGeoHash {
  List<LatLng> geoHases;
  int colorHexValue;
  String? areaName;
  String id;

  AppGeoHash(
      {required this.id,
      required this.geoHases,
      this.colorHexValue = 0xffFFA500,
      this.areaName});

  @override
  bool operator ==(covariant AppGeoHash other) {
    if (identical(this, other)) return true;

    return listEquals(other.geoHases, geoHases) &&
        other.colorHexValue == colorHexValue &&
        other.areaName == areaName;
  }

  @override
  int get hashCode =>
      geoHases.hashCode ^ colorHexValue.hashCode ^ areaName.hashCode;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'geoHases': geoHases.map((x) => getGeoHash(x)).toList(),
      'colorHexValue': colorHexValue,
      'areaName': areaName,
    };
  }

  factory AppGeoHash.fromJson(Map<String, dynamic> json) {
    return AppGeoHash(
      id: json['id'],
      geoHases: getLatLang(json['geoHases'].cast<String>()),
      colorHexValue: json['colorHexValue'] as int,
      areaName: json['areaName'] as String?,
    );
  }

  static getLatLang(List<String> geohases) {
    List<LatLng> points = [];
    for (var i in geohases) {
      final geo = GeoHash(i);
      final point = LatLng(geo.latitude(), geo.longitude());
      points.add(point);
    }
    return points;
  }

  static getGeoHash(LatLng point) {
    final hasher = GeoHasher();
    final hashValue = hasher.encode(point.longitude, point.latitude);
    return hashValue;
  }

  AppGeoHash copyWith({
    List<LatLng>? geoHases,
    int? colorHexValue,
    String? areaName,
  }) {
    return AppGeoHash(
      id: id,
      geoHases: geoHases ?? this.geoHases,
      colorHexValue: colorHexValue ?? this.colorHexValue,
      areaName: areaName ?? this.areaName,
    );
  }
}
