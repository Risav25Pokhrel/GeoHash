import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geohash/geohashing/domains/models/geohash_models.dart';

final hashDatas = StreamProvider((ref) {
  final doc = FirebaseFirestore.instance.collection("HASHES").snapshots().map(
      (snapshot) =>
          snapshot.docs.map((e) => AppGeoHash.fromJson(e.data())).toList());
  return doc;
});
