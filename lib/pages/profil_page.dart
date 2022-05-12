import 'package:aplikasi_cari_kos/controllers/auth_controller.dart';
import 'package:aplikasi_cari_kos/autentikasi/edit_profile.dart';
import 'package:aplikasi_cari_kos/autentikasi/settings.dart';
import 'package:flutter/material.dart';
import '../theme.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            Container(
              width: w,
              height: h * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/bsd.jpg",
                  ),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.14,
                  ),
                  CircleAvatar(
                    backgroundColor: whiteColor,
                    radius: 40,
                    backgroundImage: AssetImage(
                      "assets/images/ssat.jpg",
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        color: Colors.green,
                      ),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Selamat Datang",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "How are you today :)",
                    style: TextStyle(fontSize: 18, color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfilePage(),
                  ),
                );
              },
              child: Center(
                child: Container(
                  width: w * 0.5,
                  height: h * 0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/loginbtn.png",
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ),
                );
              },
              child: Center(
                child: Container(
                  width: w * 0.5,
                  height: h * 0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/loginbtn.png",
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Setting",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: w * 0.30,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "© Copyright by Tim Project Flutter Seven Inc",
                style: TextStyle(
                  color: blackColor,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//   floatingActionButton: Container(
//     height: 65,
//     width: MediaQuery.of(context).size.width - (2 * edge),
//     margin: EdgeInsets.symmetric(
//       horizontal: edge,
//     ),
//     decoration: BoxDecoration(
//       color: Color(0xffF6F7F8),
//       borderRadius: BorderRadius.circular(23),
//     ),
//     child: RaisedButton(
//       onPressed: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => HomePage(),
//           ),
//         );
//       },
//       color: purpleColor,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(17),
//       ),
//       child: Text(
//         'Home',
//         style: whiteTextStyle.copyWith(
//           fontSize: 14,
//         ),
//       ),
//     ),
//   ),
// );
// child: Row(
//   mainAxisAlignment: MainAxisAlignment.spaceAround,
//   children: [
//     BottomNavbarItem(
//       imageUrl: 'assets/images/icon_home.png',
//       isActive: false,
//     ),
//     BottomNavbarItem(
//       imageUrl: 'assets/images/icon_email.png',
//       isActive: false,
//     ),
//     BottomNavbarItem(
//       imageUrl: 'assets/images/icon_card.png',
//       isActive: true,
//     ),
//     BottomNavbarItem(
//       imageUrl: 'assets/images/icon_love.png',
//       isActive: false,
//     ),
//     BottomNavbarItem(
//       imageUrl: 'assets/images/icon_search.png',
//       isActive: false,
//     ),
//     NavbarItem(),
//   ],
// ),
//   floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
// );
