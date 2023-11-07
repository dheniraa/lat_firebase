// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../../integrations/firestore.dart';
// import '../database.dart';

// class ReadModel {
//   String? id;
//   String? bookId;
//   int? prePage;
//   int? newPage;
//   DateTime? time;

//   ReadModel({this.id, this.bookId, this.prePage, this.newPage, this.time});

//   ReadModel fromJson(DocumentSnapshot doc) {
//     var json = doc.data() as Map<String, dynamic>?;
//     return ReadModel(
//         id: doc.id,
//         username: json?['nama'],
//         email: json?['email'],
//         password: json?['pass'],
//         image: json?['image'],
//         birthDate: (json?['tanggal'] as Timestamp?)?.toDate(),
//         time: (json?['waktu'] as Timestamp?)?.toDate());
//   }

//   Map<String, dynamic> get toJson => {
//         'id': id,
//         'nama': username,
//         'email': email,
//         'pass': password,
//         'image': image,
//         'tanggal': birthDate,
//         'waktu': time
//       };

//   Database db = Database(
//       collectionReference: firebaseFirestore.collection(
//         usersCollection,
//       ),
//       storageReference: firebaseStorage.ref(usersCollection));

//   Future<ReadModel> save({File? file}) async {
//     id == null ? id = await db.add(toJson) : await db.edit(toJson);
//     if (file != null && id != null) {
//       avatar = await db.upload(id: id!, file: file);
//       db.edit(toJson);
//     }
//     return this;
//   }

//   Stream<ReadModel> streamList(String id) async* {
//     yield* db.collectionReference.doc(id).snapshots().map((event) {
//       print("event id = ${event.id}");
//       return fromJson(event);
//     });
//   }

//   Stream<List<ReadModel>> allstreamList() async* {
//     yield* db.collectionReference.snapshots().map((query) {
//       List<ReadModel> list = [];
//       for (var doc in query.docs) {
//         list.add(
//           ReadModel().fromJson(
//             doc,
//           ),
//         );
//       }
//       return list;
//     });
//   }
// }
