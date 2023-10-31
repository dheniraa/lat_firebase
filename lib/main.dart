import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lat_firebase/app/controllers/auth_controller.dart';
import 'package:lat_firebase/app/modules/home/views/home_view.dart';
import 'package:lat_firebase/app/modules/login/views/login_view.dart';
import 'package:lat_firebase/app/utils/loading.dart';

import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyA7stfTCULSQ2Hy7q1tKDEI4fvuwkW5Uvg',
          // authDomain: "dhe-firebase.firebaseapp.com",
          appId: '1:864031344005:android:56e680ac189785a9a1b0ec',
          messagingSenderId: '864031344005',
          projectId: 'dhe-firebase'));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authC.streamAuthStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          print(snapshot.data);

          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Application",
            // initialRoute: snapshot.data != null
            //     ? Routes.HOME
            //     : Routes.LOGIN, //AppPages.INITIAL
            getPages: AppPages.routes,
            home: snapshot.data != null ? HomeView() : LoginView(),
          );
        }
        return LoadingView();
      },
    );
  }
}
