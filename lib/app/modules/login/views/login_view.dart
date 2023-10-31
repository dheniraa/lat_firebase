import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lat_firebase/app/controllers/auth_controller.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final emailC = TextEditingController();
  final passC = TextEditingController();
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBF2FF),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  'images/image-login.png',
                  width: 225,
                  height: 225,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Card(
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: Colors.purple,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: TextFormField(
                                  controller: emailC,
                                  decoration: InputDecoration(
                                    labelText: "Email",
                                    labelStyle: TextStyle(color: Colors.purple),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.purple),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.purple),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.lock,
                                color: Colors.purple,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: TextFormField(
                                  controller: passC,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    labelStyle: TextStyle(color: Colors.purple),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.purple),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.purple),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => authC.login(emailC.text, passC.text),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  onPrimary: Colors.white,
                  minimumSize: Size(350, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Text('Sign In'),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Doesn't Have an Account? ",
                    style: TextStyle(color: Colors.purple),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Register Here',
                      style: TextStyle(
                        color: Colors.purple,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 7),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Colors.purple,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              SizedBox(height: 50), // Adding additional space at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
