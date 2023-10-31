import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lat_firebase/app/controllers/auth_controller.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  // const HomeView({Key? key}) : super(key: key);
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () => authC.logout(), icon: Icon(Icons.logout))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFBF2C98), Color(0xFF8332A6)],
          ),
        ),
        child: Center(
          child: Text(
            'HomeView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
