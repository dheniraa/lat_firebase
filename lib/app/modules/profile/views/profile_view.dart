import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lat_firebase/app/modules/home/views/home_view.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  void _onEditPressed() {
    // Add navigation logic here
    // For example:
    // Get.to(YourEditPage());
  }

  void _onItemTapped(int index) {
    // TODO: Implement your logic here
    if (index == 0) {
      Get.to(() => HomeView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF2FF),
      body: Stack(
        children: [
          Container(
            height: 290,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'images/profile-background.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 60,
            left: 30,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Image.asset(
                'images/profile.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 85,
            left: 123,
            child: Text(
              'Full Name',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          Positioned(
            top: 105,
            left: 123,
            child: Text(
              'name@gmail.com',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          Positioned(
            top: 80,
            right: 40,
            child: GestureDetector(
              onTap: _onEditPressed,
              child: Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 20,
                    child: Icon(Icons.edit, color: Colors.white, size: 22),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 40,
                        height: 40,
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
          Positioned(
            top: 170,
            left: 35,
            child: Container(
              width: 120,
              height: 68,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total Book',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    SizedBox(height: 2),
                    Text(
                      '7',
                      style: TextStyle(color: Colors.black, fontSize: 32),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 170,
            right: 35,
            child: Container(
              width: 120,
              height: 68,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total Progress',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    SizedBox(height: 2),
                    Text(
                      '77%',
                      style: TextStyle(color: Colors.black, fontSize: 32),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(), // Menambahkan shape
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
                  color: Color.fromARGB(255, 106, 104, 104),
                  onPressed: () => _onItemTapped(0),
                ),
                IconButton(
                  icon: Icon(Icons.person, size: 30),
                  color: Colors.purple,
                  onPressed: () =>
                      _onItemTapped(1), // Mengganti dengan _onItemTapped
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
