import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lat_firebase/app/controllers/auth_controller.dart';

import '../../profile/views/profile_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final authC = Get.find<AuthController>();

  void _onItemTapped(int index) {
    // TODO: Implement your logic here
    if (index == 1) {
      Get.to(() => ProfileView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFBF2C98), Color(0xFF8332A6)],
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 50),
                child: Container(
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
              ),
            ],
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
          Padding(
            padding: const EdgeInsets.only(
              top: 150,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 170,
                  child: ListView.builder(
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      // height: 50,
                      width: 135,
                      margin: EdgeInsets.only(left: 20),
                      child: Center(
                        child: Text("Box $index"),
                      ),
                      color: Color.fromARGB(255, 195, 194, 194),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement your logic here
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
