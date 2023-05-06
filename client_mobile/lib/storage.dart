import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<String> downloadURL(String name) async {
    debugPrint("Downloading");
    String downloadURL = await storage.ref(name).getDownloadURL();
    debugPrint(downloadURL);
    return downloadURL;
  }
}
