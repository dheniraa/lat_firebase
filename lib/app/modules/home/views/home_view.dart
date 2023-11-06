import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lat_firebase/app/controllers/auth_controller.dart';
import 'package:lat_firebase/app/modules/form/views/form_view.dart';

import '../../profile/views/profile_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final authC = Get.find<AuthController>();

  final TextEditingController emailC = TextEditingController();

  void _onItemTapped(int index) {
    // TODO: Implement your logic here
    if (index == 1) {
      Get.to(() => ProfileView());
    }
  }

  void _showFormDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Reading Form',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 20,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.purple,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          content: Container(
            width: 300,
            height: 280,
            child: Form(
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.book,
                            color: Colors.purple,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              // controller: emailC, // Use appropriate controller
                              decoration: InputDecoration(
                                labelText: "Select Book",
                                labelStyle: TextStyle(color: Colors.purple),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple),
                                ),
                                focusedBorder: UnderlineInputBorder(
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
                            Icons.label,
                            color: Colors.purple,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              // controller: emailC,
                              decoration: InputDecoration(
                                labelText: "Previuods Read Page",
                                labelStyle: TextStyle(color: Colors.purple),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple),
                                ),
                              ),
                              obscureText: true,
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
                                labelText: "Newest Read Page",
                                labelStyle: TextStyle(color: Colors.purple),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple),
                                ),
                              ),
                              obscureText: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        onPrimary: Colors.white,
                        minimumSize: Size(350, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFBF2C98), Color(0xFF8332A6)],
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 50),
                child: Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Image.asset(
                        'images/profile.png',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 57,
              left: 85,
              child: Text(
                'Hai...',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
            Positioned(
              top: 77,
              left: 85,
              child: Text(
                'Username',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            Positioned(
              top: 62,
              right: 20,
              child: Icon(
                Icons.notifications,
                color: Colors.white,
                size: 30,
              ),
            ),
            Positioned(
              top: 53,
              right: 44,
              child: IconButton(
                onPressed: () => authC.logout(),
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 120,
              left: 20,
              child: Text(
                'Book List',
                style: TextStyle(color: Colors.white, fontSize: 16.5),
              ),
            ),
            Positioned(
              top: 110,
              right: 8,
              child: InkWell(
                onTap: () {
                  Get.to(() => FormView());
                },
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 20,
                      child: Icon(Icons.add, color: Colors.white, size: 18),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1.5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150, bottom: 20),
              child: SizedBox(
                height: 183,
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    width: 140,
                    margin: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.purple),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Image.asset(
                                'images/book-list.png',
                                height: 70,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            "Book Name",
                            style:
                                TextStyle(color: Colors.purple, fontSize: 13),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            "Category",
                            style:
                                TextStyle(color: Colors.purple, fontSize: 11),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            "125/257 page",
                            style:
                                TextStyle(color: Colors.purple, fontSize: 11),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            "50%",
                            style:
                                TextStyle(color: Colors.purple, fontSize: 13),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 8, top: 3, right: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: LinearProgressIndicator(
                              value: 0.5,
                              minHeight: 9,
                              backgroundColor: Colors.grey,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.purple),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 305,
              ),
              child: SizedBox(
                height: 670,
                width: 395,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 9,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => Container(
                    height: 70,
                    width: 135,
                    margin: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: index == 0
                          ? BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            )
                          : index == 8
                              ? BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                )
                              : null,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        index == 0
                            ? Container(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  "Recent Activity",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                  textAlign: TextAlign.start,
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormDialog(context);
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: CustomPaint(
          size: Size(MediaQuery.of(context).size.width, 50),
          painter: BNBCustomPainter(),
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.home, size: 30),
                  color: Colors.purple,
                  onPressed: () => _onItemTapped(0),
                ),
                IconButton(
                  icon: Icon(Icons.person, size: 30),
                  color: Color.fromARGB(255, 106, 104, 104),
                  onPressed: () => _onItemTapped(1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white;
    canvas.drawCircle(Offset((size.width / 2), size.height), 25, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeView(),
  ));
}
