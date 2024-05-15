import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AppFirebaseServices {
  static CollectionReference get firebaseRef =>
      FirebaseFirestore.instance.collection("HASHES");
}
