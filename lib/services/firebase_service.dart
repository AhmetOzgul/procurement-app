import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Stream<User?> authStateChanges() {
    return _auth.authStateChanges();
  }

  User getCurrentUser() {
    return _auth.currentUser!;
  }

  Stream<QuerySnapshot> getUserProducts(String userEmail) {
    return _firestore
        .collection('shared_product')
        .where('userEmail', isEqualTo: userEmail)
        .snapshots();
  }

  Stream<QuerySnapshot> searchProducts(String searchKey) {
    return _firestore
        .collection('shared_product')
        .where('name', isGreaterThanOrEqualTo: searchKey)
        .snapshots();
  }

  Future<String> uploadImage(File file, String uniqueFileName) async {
    Reference referenceRoot = _storage.ref();
    Reference referenceDirImages = referenceRoot.child('images');
    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);
    await referenceImageToUpload.putFile(file);
    return await referenceImageToUpload.getDownloadURL();
  }

  Future<void> addProduct(Map<String, String> data) {
    return _firestore.collection('shared_product').add(data);
  }
}
