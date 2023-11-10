import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
// import 'package:lat_firebase/app/controllers/auth_controller.dart';
// import 'package:lat_firebase/app/routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final emailC = TextEditingController();
  final passC = TextEditingController();
  final authC = Get.find<LoginController>();
  final birthDateC = TextEditingController();
  RxString genderValue = ''.obs;

  final GlobalKey<FormState> formKey = GlobalKey();

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
                    child: Obx(
                      () => Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (controller.isRegis)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: Colors.purple,
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: TextFormField(
                                        controller: controller.nameC,
                                        decoration: InputDecoration(
                                          labelText: "Name",
                                          labelStyle:
                                              TextStyle(color: Colors.purple),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.purple),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.purple),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Harap isi nama Anda';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.email,
                                    color: Colors.purple,
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: TextFormField(
                                      controller: controller.emailC,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        labelText: "Email",
                                        labelStyle:
                                            TextStyle(color: Colors.purple),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.purple),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.purple),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Harap isi email Anda';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.lock,
                                    color: Colors.purple,
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: TextFormField(
                                      controller: controller.passC,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        labelText: "Password",
                                        labelStyle:
                                            TextStyle(color: Colors.purple),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.purple),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.purple),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Harap isi password Anda';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (controller.isRegis)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.lock,
                                      color: Colors.purple,
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: TextFormField(
                                        controller: controller.passC2,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          labelText: "Confirm Password",
                                          labelStyle:
                                              TextStyle(color: Colors.purple),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.purple),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.purple),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Harap konfirmasi password Anda';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (controller.isRegis)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.date_range,
                                      color: Colors.purple,
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: TextFormField(
                                        readOnly: true,
                                        controller: controller.birthDateC,
                                        style: TextStyle(color: Colors.grey),
                                        decoration: InputDecoration(
                                          labelText: "Birth Date",
                                          labelStyle:
                                              TextStyle(color: Colors.purple),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.purple),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.purple),
                                          ),
                                        ),
                                        onTap: () async {
                                          controller.birthDateC.clear();
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime.now(),
                                          );
                                          if (pickedDate != null) {
                                            String formattedDate =
                                                DateFormat('EEE, d MMM yyyy')
                                                    .format(pickedDate);
                                            controller.birthDateC.text =
                                                formattedDate;
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (controller.isRegis)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.person_outline,
                                      color: Colors.purple,
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Gender",
                                            style:
                                                TextStyle(color: Colors.purple),
                                          ),
                                          Row(
                                            children: [
                                              Obx(() => Radio<String>(
                                                    value: 'Male',
                                                    groupValue:
                                                        genderValue.value,
                                                    onChanged: (String? value) {
                                                      genderValue.value =
                                                          value ?? '';
                                                    },
                                                  )),
                                              Text('Male'),
                                              Obx(() => Radio<String>(
                                                    value: 'Female',
                                                    groupValue:
                                                        genderValue.value,
                                                    onChanged: (String? value) {
                                                      genderValue.value =
                                                          value ?? '';
                                                    },
                                                  )),
                                              Text('Female'),
                                            ],
                                          ),
                                        ],
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
                ),
              ),
              SizedBox(height: 20),
              Obx(
                () => ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (controller.isRegis) {
                        controller.register();
                      } else {
                        controller.login();
                      }
                    }
                    ;
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    onPrimary: Colors.white,
                    minimumSize: Size(350, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text(controller.isRegis ? 'Sign Up' : 'Sign In'),
                ),
              ),
              SizedBox(height: 20),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      controller.isRegis
                          ? "Have an Account? "
                          : "Doesn't Have an Account? ",
                      style: TextStyle(color: Colors.purple),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.isRegis = !controller.isRegis;
                      },
                      child: Text(
                        controller.isRegis ? 'Login Here' : 'Register Here',
                        style: TextStyle(
                          color: Colors.purple,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
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
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
