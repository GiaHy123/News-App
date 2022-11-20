// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestore {
  final db = FirebaseFirestore.instance;
  
  Future<void> addData (String collection, String doc, dynamic data) async { 
    db.collection(collection)
    .doc(doc).set(data)
    .then((value) => print('add data success!'));
  }
}