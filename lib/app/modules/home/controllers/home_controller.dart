import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class HomeController extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Stream<QuerySnapshot> getFirestoreData() {
    return _firestore.collection('barang').snapshots();
  }

  Future<List<String>> getStorageData() async {
    List<String> downloadURLs = [];

    try {
      ListResult result = await _storage.ref().child('fotobarang').listAll();
      for (Reference ref in result.items) {
        String url = await ref.getDownloadURL();
        downloadURLs.add(url);
      }
    } catch (e) {
      print('Error fetching data from Firebase Storage: $e');
    }

    return downloadURLs;
  }

  void logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed('/login');
    } catch (e) {
      print('Error logging out: $e');
    }
  }
}
