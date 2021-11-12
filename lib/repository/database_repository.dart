import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseRepository {
  FirebaseFirestore? database;

  DataBaseRepository() {
    this.database = FirebaseFirestore.instance;
  }

  CollectionReference? getReference({required String collection}) {
    return database?.collection(collection);
  }

  Future<DocumentReference>? add(
      {required String collection, required dynamic data}) {
    CollectionReference? ref = getReference(collection: collection);
    return ref?.add(data);
  }

  Future<DocumentSnapshot>? readDocument(
      {required String collection, required String document}) {
    CollectionReference? ref = getReference(collection: collection);
    return ref?.doc(document).get();
  }

  Future<QuerySnapshot>? readCollection({required String collection}) {
    CollectionReference? ref = getReference(collection: collection);
    return ref?.get();
  }

  Future<void>? update(
      {required String collection, required String document, dynamic data}) {
    DocumentReference? ref =
        getReference(collection: collection)?.doc(document);
    return ref?.update(data);
  }

  Future<void>? delete({required String collection, required String document}) {
    DocumentReference? ref =
        getReference(collection: collection)?.doc(document);
    return ref?.delete();
  }
}
