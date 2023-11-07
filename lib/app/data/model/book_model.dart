// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../../integrations/firestore.dart';
// import '../database.dart';

// class BookModel {
//   String? id;
//   String? title;
//   String? category;
//   int? page;
//   int? readPage;
//   String? image;
//   DateTime? time;

//   BookModel(
//       {this.id, this.title, this.category, this.page, this.image, this.time});

//   BookModel fromJson(DocumentSnapshot doc) {
//     var json = doc.data() as Map<String, dynamic>?;
//     return BookModel(
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

//   Future<BookModel> save({File? file}) async {
//     id == null ? id = await db.add(toJson) : await db.edit(toJson);
//     if (file != null && id != null) {
//       avatar = await db.upload(id: id!, file: file);
//       db.edit(toJson);
//     }
//     return this;
//   }

//   Stream<BookModel> streamList(String id) async* {
//     yield* db.collectionReference.doc(id).snapshots().map((event) {
//       print("event id = ${event.id}");
//       return fromJson(event);
//     });
//   }

//   Stream<List<BookModel>> allstreamList() async* {
//     yield* db.collectionReference.snapshots().map((query) {
//       List<BookModel> list = [];
//       for (var doc in query.docs) {
//         list.add(
//           BookModel().fromJson(
//             doc,
//           ),
//         );
//       }
//       return list;
//     });
//   }
// }
