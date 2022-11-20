// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestore {
  final db = FirebaseFirestore.instance;

  Future<void> addData(String collection, String doc, data) async {
    db
        .collection(collection)
        .doc(doc)
        .set(data)
        .then((value) => print('Add data success!'));
  }

  Future<Map<String, dynamic>?> getData(String collection, String doc) async {
    final data = await db.collection(collection).doc(doc).get();
    if (data.exists) {
      print('Get data success!');
      return data.data();
    } else {
      print('Data not exists');
      return null;
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> checkDataExists (String collection, String doc) async {
    final data = await db.collection(collection).doc(doc).get();
    return data;
  }

  Future<void> updateData(String collection, String doc, data) async {
    final res = db.collection(collection).doc(doc);
    res.update(data).then(
        (value) => print("DocumentSnapshot successfully updated!"),
        onError: (e) => print("Error updating document $e"));
  }
}
