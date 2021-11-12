import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class StorageRepository {
  FirebaseStorage? storage;

  StorageRepository() {
    this.storage = FirebaseStorage.instance;
  }

  Reference? setRefence({required String path}) {
    return storage?.ref(path);
  }

  Future<String>? getDownloadURL({required String file}) {
    Reference? ref = setRefence(path: file);
    return ref?.getDownloadURL();
  }

  Future<void>? uploadFile({required String path, required String filePath}) {
    Reference? ref = setRefence(path: path);
    File file = File(filePath);
    try {
      ref?.putFile(file);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
