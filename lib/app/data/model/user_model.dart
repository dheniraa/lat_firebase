import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lat_firebase/app/data/database.dart';
import 'package:lat_firebase/app/integrations/firestore.dart';

class UserModel {
  String? id;
  String? username;
  String? email;
  String? password;
  String? image;
  DateTime? birthDate;
  DateTime? time;

  UserModel(
      {this.id,
      this.username,
      this.email,
      this.password,
      this.image,
      this.birthDate,
      this.time});

  UserModel fromJson(DocumentSnapshot doc) {
    var json = doc.data() as Map<String, dynamic>?;
    return UserModel(
        id: doc.id,
        username: json?['nama'],
        email: json?['email'],
        password: json?['pass'],
        image: json?['image'],
        birthDate: (json?['tanggal'] as Timestamp?)?.toDate(),
        time: (json?['waktu'] as Timestamp?)?.toDate());
  }

  Map<String, dynamic> get toJson => {
        'id': id,
        'nama': username,
        'email': email,
        'pass': password,
        'image': image,
        'tanggal': birthDate,
        'waktu': time
      };

  Database db = Database(
      collectionReference: firebaseFirestore.collection(
        usersCollection,
      ),
      storageReference: firebaseStorage.ref(usersCollection));

  Future<UserModel> save({File? file}) async {
    id == null ? id = await db.add(toJson) : await db.edit(toJson);
    if (file != null && id != null) {
      image = await db.upload(id: id!, file: file);
      db.edit(toJson);
    }
    return this;
  }

  Stream<UserModel> streamList(String id) async* {
    yield* db.collectionReference.doc(id).snapshots().map((event) {
      print("event id = ${event.id}");
      return fromJson(event);
    });
  }

  Stream<List<UserModel>> allstreamList() async* {
    yield* db.collectionReference.snapshots().map((query) {
      List<UserModel> list = [];
      for (var doc in query.docs) {
        list.add(
          UserModel().fromJson(
            doc,
          ),
        );
      }
      return list;
    });
  }
}
