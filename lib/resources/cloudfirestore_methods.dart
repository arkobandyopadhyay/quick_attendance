import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quick_attendance/models/user_details_models.dart';

class CloudFirestoreClass {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // ignore: non_constant_identifier_names
  Future UserInfo({required UserDetailsModel user}) async {
    await firebaseFirestore
        .collection(firebaseAuth.currentUser!.uid)
        .doc("student")
        .set(user.getJson());
  }
}
