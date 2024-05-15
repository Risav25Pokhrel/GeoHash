import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textController = Provider.family
    .autoDispose<TextEditingController, String>((ref, String id) {
  final controller = TextEditingController();
  ref.onDispose(() {
    controller.dispose();
    controller.removeListener(() {});
  });
  return controller;
});
