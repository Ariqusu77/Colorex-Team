import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/foundation.dart';

Future<void> addNewPost(Map<String, dynamic> data, String document) async {

  CollectionReference users = FirebaseFirestore.instance.collection('Post');
  await users.doc(document).set(data);
}