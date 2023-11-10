// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lat_firebase/app/routes/app_pages.dart';
// import 'package:nb_utils/nb_utils.dart';

// import '../data/model/user_model.dart';
// import '../integrations/firestore.dart';

// class AuthController extends GetxController {
//   FirebaseAuth auth = FirebaseAuth.instance;

//   Stream<User?> get streamAuthStatus => auth.authStateChanges();

//   var _isRegis = false.obs;
//   bool get isRegis => _isRegis.value;
//   set isRegis(value) => _isRegis.value = value;

//   var _isSaving = false.obs;
//   bool get isSaving => _isSaving.value;
//   set isSaving(value) => _isSaving.value = value;

//   late Rx<User?> firebaseUser;

//   TextEditingController nameC = TextEditingController();
//   TextEditingController emailC = TextEditingController();
//   TextEditingController passC = TextEditingController();
//   TextEditingController passC2 = TextEditingController();
//   TextEditingController birthDateC = TextEditingController();
//   TextEditingController genderC = TextEditingController();

//   void login() async {
//     try {
//       final myuser = await auth.signInWithEmailAndPassword(
//           email: emailC.text, password: passC.text);
//       if (myuser.user!.emailVerified) {
//         Get.offAndToNamed(Routes.HOME);
//       } else {
//         Get.defaultDialog(
//             title: "Gagal Login",
//             middleText:
//                 "Verifikasi email terlebih dahulu. Apakah verifikasi perlu dikirim ulang",
//             onConfirm: () async {
//               await myuser.user!.sendEmailVerification();
//               Get.back();
//             },
//             textConfirm: "Iya",
//             textCancel: "Tidak",
//             buttonColor: Colors.purple,
//             cancelTextColor: Colors.purple,
//             confirmTextColor: Colors.white,
//             titleStyle: TextStyle(color: Colors.purple),
//             middleTextStyle: TextStyle(color: Colors.purple));
//       }
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         toast('Tidak ada user untuk email ini');
//       } else if (e.code == 'wrong-password') {
//         toast('Password salah untuk email ini');
//       } else {
//         toast(e.toString());
//       }
//     } catch (e) {
//       toast(e.toString());
//     }
//     // try {
//     //   await auth
//     //       .signInWithEmailAndPassword(email: emailC.text, password: passC.text)
//     //       .then(
//     //         (value) => Get.toNamed(Routes.HOME),
//     //       );
//     //   // Get.offAllNamed(Routes.HOME);
//     // } on FirebaseAuthException catch (e) {
//     //   if (e.code == 'user-not-found') {
//     //     toast('Tidak ada user untuk email ini');
//     //   } else if (e.code == 'wrong-password') {
//     //     toast('Password salah untuk email ini');
//     //   } else {
//     //     toast(e.toString());
//     //   }
//     // } catch (e) {
//     //   toast(e.toString());
//     // }
//     // on FirebaseAuthException catch (e) {
//     //   Get.snackbar(e.code, e.message ?? '');
//     // } catch (e) {
//     //   Get.snackbar("error", e.toString());
//     // }
//   }

//   void register() async {
//     try {
//       isSaving = true;
//       UserModel user = UserModel(
//         username: nameC.text,
//         email: emailC.text,
//         password: passC.text,
//         birthDate: DateTime.now(),
//       );
//       UserCredential myUser = await auth.createUserWithEmailAndPassword(
//         email: emailC.text,
//         password: passC.text,
//       );
//       Get.offAndToNamed(Routes.HOME);
//       await myUser.user!.sendEmailVerification();
//       user.id = myUser.user!.uid;
//       if (user.id != null) {
//         firebaseFirestore
//             .collection(usersCollection)
//             .doc(user.id)
//             .set(user.toJson)
//             .then((value) {
//           Get.defaultDialog(
//               title: "Verifikasi Email",
//               middleText: "Kami telah mengirimkan verifikasi ke Email anda",
//               textConfirm: "Oke",
//               onConfirm: () {
//                 nameC.clear();
//                 passC.clear();
//                 emailC.clear();
//                 passC2.clear();
//                 Get.back();
//                 isRegis = false;
//               },
//               buttonColor: Colors.purple,
//               cancelTextColor: Colors.purple,
//               confirmTextColor: Colors.white,
//               titleStyle: TextStyle(color: Colors.purple),
//               middleTextStyle: TextStyle(color: Colors.purple));
//         });
//       }
//       isSaving = false;
//     } on FirebaseAuthException catch (e) {
//       isSaving = false;
//       if (e.code == 'weak-password') {
//         toast('Password terlalu lemah');
//       } else if (e.code == 'email-already-in-use') {
//         toast('Akun sudah ada untuk email ini');
//       } else {
//         toast(e.toString());
//       }
//     }
//   }

//   void logout() async {
//     Get.defaultDialog(
//         title: "Logout",
//         middleText: "Anda yakin ingin keluar?",
//         onConfirm: () async {
//           await FirebaseAuth.instance.signOut();
//           Get.back();
//           isSaving = false;
//           emailC.clear();
//           passC.clear();
//           Get.offAndToNamed(Routes.LOGIN);
//         },
//         textConfirm: "Iya",
//         textCancel: "Tidak",
//         buttonColor: Colors.purple,
//         cancelTextColor: Colors.purple,
//         confirmTextColor: Colors.white,
//         titleStyle: TextStyle(color: Colors.purple),
//         middleTextStyle: TextStyle(color: Colors.purple));
//     // await FirebaseAuth.instance.signOut();
//     Get.offAllNamed(Routes.LOGIN);
//   }

//   @override
//   void onClose() {
//     emailC.clear();
//     passC.clear();
//     passC2.clear();
//     nameC.clear();
//   }
// }
