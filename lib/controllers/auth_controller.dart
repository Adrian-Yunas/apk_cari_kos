import 'package:aplikasi_cari_kos/autentikasi/login_page.dart';
// import 'package:aplikasi_cari_kos/pages/profil_page.dart';
import 'package:aplikasi_cari_kos/pages/splash_page.dart';
import 'package:aplikasi_cari_kos/autentikasi/signup_page.dart';
import 'package:aplikasi_cari_kos/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  //AuthController.instance..
  static AuthController instance = Get.find();
  //username/email, password, name
  Rx<User> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final otpController = TextEditingController();

  @override
  // void _validateDate() {
  //   if (emailController.text.isNotEmpty &&
  //       otpController.text.isNotEmpty &&
  //       passwordController.text.isNotEmpty) {
  //     Get.back();
  //   } else if (emailController.text.isNotEmpty ||
  //       otpController.text.isNotEmpty ||
  //       passwordController.text.isNotEmpty) {
  //     Get.snackbar(
  //       "Required",
  //       "All fields are required !",
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: whiteColor,
  //       colorText: Colors.red[500],
  //       icon: Icon(
  //         Icons.warning_amber_rounded,
  //         color: Colors.red[500],
  //       ),
  //     );
  //   }
  // }

  void onReady() {
    super.onReady();
    _user = Rx<User>(auth.currentUser);
    //our user will be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User user) {
    if (user == null) {
      print("Menu Login");
      Get.offAll(() => LoginPage());
    } else {
      Get.offAll(() => SplashPage());
      //Get.offAll(() => ProfilePage(email: user.email));
    }
  }

  void register(String email, password) async {
    try {
      UserCredential myUser =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await myUser.user.sendEmailVerification();
      Get.defaultDialog(
        title: "Verifikasi Email",
        middleText: "Kamu perlu verifikasi email terlebih dahulu.",
        onConfirm: () {
          Get.to(SignUpPage());
          Get.to(SignUpPage());
        },
        textConfirm: "Jika sudah langsung saja ke login",
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print(
          'The Password provided is too weak.',
        );
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: 'The account already exists for that email.',
        );
      }
    } catch (e) {
      Get.snackbar(
        "About User",
        "User Message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "Akun tidak berhasil dibuat",
          style: TextStyle(
            color: whiteColor,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(
            color: whiteColor,
          ),
        ),
      );
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "About Login",
        "Login Message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "Tidak berhasil login",
          style: TextStyle(
            color: whiteColor,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(
            color: whiteColor,
          ),
        ),
      );
    }
  }

  void logOut() async {
    await auth.signOut();
  }

  void resetPassword(String email) async {
    if (email != "" && GetUtils.isEmail(email)) {
      try {
        await auth.sendPasswordResetEmail(email: email);
        Get.defaultDialog(
            title: "Berhasil",
            middleText: "Reset password terkirim ke email $email.",
            onConfirm: () {
              Get.back(); // close dialog
              Get.back(); // mbalik ke login
            },
            textConfirm: "Ok");
      } catch (e) {
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "Email tidak terdaftar.",
        );
      }
    } else {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Tidak dapat mengirimkan reset password",
      );
    }
  }
}
