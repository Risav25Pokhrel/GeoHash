import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mapController = Provider((ref) {
  final controller = MapController();
  ref.onDispose(() {
    controller.dispose();
  });
  return controller;
});
