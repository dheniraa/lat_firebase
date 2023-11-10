import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/form_controller.dart';

class FormView extends GetView<FormController> {
  const FormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book's Form"),
        titleTextStyle: const TextStyle(color: Colors.purple, fontSize: 18),
        centerTitle: true,
        backgroundColor: const Color(0xFFFBF2FF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
          color: Colors.purple,
        ),
      ),
      backgroundColor: const Color(0xFFFBF2FF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              margin: const EdgeInsets.all(20),
              child: Container(
                width: 410,
                height: 275,
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.book,
                            color: Colors.purple,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              // controller: emailC,
                              decoration: InputDecoration(
                                labelText: "Title",
                                labelStyle: TextStyle(color: Colors.purple),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.category,
                            color: Colors.purple,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              // controller: emailC,
                              decoration: InputDecoration(
                                labelText: "Category",
                                labelStyle: TextStyle(color: Colors.purple),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.label_important,
                            color: Colors.purple,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              // controller: emailC,
                              decoration: InputDecoration(
                                labelText: "Page Count",
                                labelStyle: TextStyle(color: Colors.purple),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple),
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
            Container(
              width: 350,
              height: 250,
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(blurRadius: 2, color: Colors.grey),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Image.asset(
                      'images/upload-image.png',
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 18),
                    ElevatedButton(
                      onPressed: () async {
                        // await controller.selectImage();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                            color: Colors.purple,
                            width: 1,
                          ),
                        ),
                        minimumSize: Size(100, 40),
                      ),
                      child: Text('Upload'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Colors.purple,
          onPrimary: Colors.white,
          minimumSize: Size(380, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: const Text('Submit'),
      ),
    );
  }
}
