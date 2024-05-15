import 'package:geohash/geohashing/domains/firebase.dart/baseservice.dart';
import 'package:geohash/geohashing/domains/models/geohash_models.dart';

class GeoHashFirebase extends AppFirebaseServices {
  static addNewHash(AppGeoHash geoHash) async {
    final docsRef = AppFirebaseServices.firebaseRef.doc(geoHash.id);
    await docsRef.set(geoHash.toJson());
  }

  static deleteHash(AppGeoHash geoHash) async {
    final docsRef = AppFirebaseServices.firebaseRef;
    docsRef.doc(geoHash.id).delete();
  }
}
