import 'package:aplikasi_cari_kos/controllers/auth_controller.dart';
import 'package:aplikasi_cari_kos/autentikasi/login_page.dart';
import 'package:aplikasi_cari_kos/Components/navbar_item.dart';
import 'package:aplikasi_cari_kos/pages/splash_page.dart';
import 'package:aplikasi_cari_kos/pages/home_page.dart';
import 'package:aplikasi_cari_kos/providers/space_provider.dart';
import 'package:aplikasi_cari_kos/autentikasi/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aplikasi_cari_kos/main.dart';
import 'package:provider/provider.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'db/db_helper.dart';
import 'theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));

  // Notifikasi One Signal
  // OneSignal.shared
  //     .init("11acb727-a4ca-433e-b4cc-00e74bc3651a", iOSSettings: null);
  // OneSignal.shared
  //     .setInFocusDisplayType(OSNotificationDisplayType.notification);
  runApp(new MaterialApp(debugShowCheckedModeBanner: false, home: Myapp()));
}

//NAVIGASI
// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ListenableProvider<NavigationController>(
//             create: (_) => NavigationController()),
//       ],
//       child: const NavApp(),
//     ),
//   );
// }

// class NavApp extends StatelessWidget {
//   const NavApp({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     NavigationController navigation =
//         Provider.of<NavigationController>(context);

//     return MaterialApp(
//       home: Navigator(
//         pages: [
//           const MaterialPage(child: ListScreen()),
//           if (navigation.screenName == '/settings')
//             const MaterialPage(child: SettingsScreen()),
//           if (navigation.screenName == '/about')
//             const MaterialPage(child: AboutScreen()),
//         ],
//         onPopPage: (route, result) {
//           bool popStatus = route.didPop(result);
//           if (popStatus == true) {
//             Provider.of<NavigationController>(context, listen: false)
//                 .changeScreen('/');
//           }
//           return popStatus;
//         },
//       ),
//     );
//   }
// }

class Myapp extends StatelessWidget {
  final Future<FirebaseApp> initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpaceProvider(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //   primaryColor: Colors.blue,
        //   brightness: Brightness.light,
        // ),
        // themeMode: ThemeMode.dark,
        // darkTheme: ThemeData(
        //   primaryColor: Colors.blue,
        //   brightness: Brightness.dark,
        // ),
        home: LoginPage(),
        //Kalo mo login direct ke LoginPage(),
      ),
    );
  }
}

//ONE SIGNAL NOTIF
// class SplashPage extends StatefulWidget {
//   @override
//   _SplashPageState createState() => _SplashPageState();
// }

// class _SplashPageState extends State<SplashPage> {
//   String title = "title";
//   String content = "content";
//   String url = "";

//   @override
//   void initState() {
//     super.initState();

//     OneSignal.shared
//         .setNotificationReceivedHandler((OSNotification notification) {
//       setState(() {
//         title = notification.payload.title;
//         content = notification.payload.body;
//         url = notification.payload.bigPicture;
//       });
//     });

//   OneSignal.shared
//       .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
//     print("Notifikasi di-tap");
//   });
// }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text("Aplikasi Cari Kos"),
//     ),
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(title),
//           SizedBox(
//             height: 20,
//           ),
//           Text(content),
//           SizedBox(
//             height: 20,
//           ),
//           (url != "")
//               ? Container(
//                   height: 393,
//                   width: 700,
//                   decoration: BoxDecoration(
//                       image: DecorationImage(image: NetworkImage(url))),
//                 )
//               : SizedBox()
//         ],
//       ),
//     ),
//   );
//   }
// }
