import 'package:aplikasi_cari_kos/controllers/auth_controller.dart';
import 'package:aplikasi_cari_kos/autentikasi/login_page.dart';
import 'package:aplikasi_cari_kos/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:email_auth/email_auth.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isHiddenPassword = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final otpController = TextEditingController();
  String get _errorText {
    // at any time, we can get the text from _controller.value.text
    final text = otpController.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'OTP Can\'t be empty';
    }
    if (text.length < 4) {
      return 'Too short';
    }
    // return null if the text is valid
    return null;
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  void sendOTP() async {
    EmailAuth.sessionName = "Test Session";
    var res = await EmailAuth.sendOtp(receiverMail: emailController.text);
    if (res) {
      print("OTP Sent to this $emailController");
    } else {
      print("We could not sent the OTP");
    }
  }

  void verifyOTP() {
    var res = EmailAuth.validate(
        receiverMail: emailController.text, userOTP: otpController.text);
    if (res) {
      print("OTP Verified");
    } else {
      print("Invalid OTP");
    }
  }

  // void _togglePasswordView() {
  //   // if (isHiddenPassword = true) {
  //   //   isHiddenPassword = false;
  //   // } else {
  //   //   isHiddenPassword = true;
  //   // }
  //   setState(
  //     () {
  //       isHiddenPassword = !isHiddenPassword;
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    var key;
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
                    "assets/images/signup.jpeg",
                  ),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.16,
                  ),
                  CircleAvatar(
                    backgroundColor: whiteColor,
                    radius: 50,
                    backgroundImage: AssetImage(
                      "assets/images/profile1.png",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 7,
                    offset: Offset(1, 1),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ],
              ),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: " Email",
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.blueAccent,
                  ),
                  suffixIcon: TextButton(
                    child: Text("Send OTP"),
                    onPressed: () => sendOTP(),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 7,
                    offset: Offset(1, 1),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ],
              ),
              child: TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                obscureText: isHiddenPassword,
                decoration: InputDecoration(
                  errorText: _errorText,
                  hintText: "Cek OTP sebelum mendaftar",
                  prefixIcon: Icon(
                    Icons.verified,
                    color: Colors.blueAccent,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 7,
                    offset: Offset(1, 1),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ],
              ),
              child: Center(
                child: TextField(
                  controller: passwordController,
                  obscureText: isHiddenPassword,
                  decoration: InputDecoration(
                    hintText: " Password",
                    //   suffixIcon: GestureDetector(
                    //     onTap: _togglePasswordView,
                    //     child: Icon(
                    //       isHiddenPassword
                    //           ? Icons.visibility_off
                    //           : Icons.visibility,
                    //       color: isHiddenPassword ? Colors.grey : Colors.blueAccent,
                    //     ),
                    //   ),
                    prefixIcon: Icon(
                      Icons.vpn_key,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),
            Center(
              child: RaisedButton(
                color: Colors.orangeAccent[100],
                textColor: whiteColor,
                padding: const EdgeInsets.all(0.0),
                onPressed: verifyOTP,
                child: Text('Verify OTP'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                AuthController.instance.register(emailController.text.trim(),
                    passwordController.text.trim());
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
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Daftar",
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
              height: 15,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Get.to(() => LoginPage()),
                text: "Sudah punya akun?",
                style: TextStyle(fontSize: 15, color: greyColor),
              ),
            ),
            SizedBox(
              height: w * 0.08,
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

            // Wrap(
            //   alignment: WrapAlignment.center,
            //   children: List<Widget>.generate(
            //     3,
            //     (index) {
            //       return Padding(
            //         padding: EdgeInsets.all(10.0),
            //         child: CircleAvatar(
            //           radius: 30,
            //           backgroundColor: greyColor,
            //           child: CircleAvatar(
            //             radius: 25,
            //             backgroundImage: AssetImage(
            //               "assets/images/" + images[index],
            //             ),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
