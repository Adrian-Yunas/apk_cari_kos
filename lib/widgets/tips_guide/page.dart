import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_cari_kos/models/tips.dart';
import 'package:aplikasi_cari_kos/pages/error_page.dart';
import 'package:aplikasi_cari_kos/pages/home_page.dart';
import 'package:aplikasi_cari_kos/components/navbar_item.dart';
import 'package:aplikasi_cari_kos/widgets/search/search_api.dart';
import 'package:aplikasi_cari_kos/widgets/search/search_filter_screen.dart';
import 'package:aplikasi_cari_kos/widgets/tips_card.dart';
import 'package:aplikasi_cari_kos/widgets/tips_guide/guide_card.dart';
import 'package:aplikasi_cari_kos/widgets/tips_guide/page_item.dart';
import 'package:aplikasi_cari_kos/widgets/tips_guide/tips_card.dart';
import 'package:get/get.dart';

// class TGItem extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.purple,
//         //color: primaryColor,
//         //visualDensity: VisualDensity.adaptivePlatformDensity,
//         visualDensity: VisualDensity.compact,
//       ),
//       initialRoute: 'Tips',
//       routes: {
//         'Tips': (context) => TipsItem(),
//         'Guide': (context) => GuideItem(),
//       },
//     );
//   }
// }
class TGItem extends StatelessWidget {
  //Tips tips;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // initialRoute: TipsCard.id,
        //
        // ///key value pair
        // routes: {
        //   'TipsItem': (context) => TipsItem(),
        //   'GuideItem': (context) => GuideItem(),
        // },
        // home: Navbar(),

        );
    // return GetMaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(primarySwatch: Colors.purple),
    //   home: TipsItem(),
    //   getPages: [
    //     GetPage(name: '/tips',  page: ()=> TipsItem()),
    //   ],
    // );
    // return MaterialApp(
    //   onGenerateRoute: (settings) {
    //     // Handle '/'
    //     if (settings.name == '/') {
    //       return MaterialPageRoute(builder: (context) => TipsItem());
    //     }
    //
    //     // Handle '/details/:id'
    //     var uri = Uri.parse(settings.name);
    //     if (uri.pathSegments.length == 2 &&
    //         uri.pathSegments.first == 'details') {
    //       var id = uri.pathSegments[1];
    //       return MaterialPageRoute(builder: (context) => DetailScreen(id: id));
    //     }
    //
    //     return MaterialPageRoute(builder: (context) => UnknownScreen());
    //   },
    // );
  }
}
// final Map<String, WidgetBuilder> routes = {
//   GuideItem.routeName:(context) => GuideItem(),
//   TipsItem.routeName:(context) => TipsItem(),
//
// };
// class TGItem extends  StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.purple,
//         //color: primaryColor,
//         //visualDensity: VisualDensity.adaptivePlatformDensity,
//         visualDensity: VisualDensity.compact,
//       ),
//       onGenerateRoute: RouteGenerator.generateRoute);
//   }
//
// }
//
// class RouteGenerator{
//   static Route<dynamic> generateRoute(RouteSettings settings){
//     switch (settings.name){
//       case '/tips':
//         return MaterialPageRoute(builder: (context) => TipsItem());
//       case '/guide':
//         return MaterialPageRoute(builder: (context) => GuideItem());
//       default:
//         return _errorRoute();
//     }
//   }
//   static Route<dynamic> _errorRoute() {
//     return MaterialPageRoute(builder: (context) {
//       return Scaffold(
//         appBar: AppBar(title: Text("Error")),
//         body: Navbar(),
//       );
//     });
//   }
// }
