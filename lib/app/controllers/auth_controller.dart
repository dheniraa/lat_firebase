import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:lat_firebase/app/routes/app_pages.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  var _isRegis = false.obs;
  bool get isRegis => _isRegis.value;
  set isRegis(value) => _isRegis.value = value;

  void login(String email, String password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then(
            (value) => Get.toNamed(Routes.HOME),
          );
    } on FirebaseAuthException catch (e) {
      Get.snackbar(e.code, e.message ?? '');
    } catch (e) {
      Get.snackbar("error", e.toString());
    }
  }

  void signup() {}
  void logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
