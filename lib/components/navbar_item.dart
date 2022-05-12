import 'package:aplikasi_cari_kos/widgets/search/kos_search.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_cari_kos/pages/home_page.dart';
import 'package:aplikasi_cari_kos/pages/wishlist_page.dart';
import 'package:aplikasi_cari_kos/email_page/email_page.dart';
import 'package:aplikasi_cari_kos/pages/profil_page.dart';

class Navbar extends StatefulWidget {
  static String id = 'TipsItem';

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  List pages = [
    HomePage(),
    EmailPage(),
    ProfilePage(),
    ItemKos(),
    WishlistPage(),
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Colors.transparent,
          selectedItemBackgroundColor: Colors.purple,
          selectedItemIconColor: Colors.white,
          unselectedItemIconColor: Colors.grey,
          showSelectedItemShadow: false,
          //showSelectedItemShadow: false,
        ),
        selectedIndex: currentIndex,
        onSelectTab: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.home,
            label: ("Home"),
          ),
          FFNavigationBarItem(
            iconData: Icons.mail,
            label: ("Mail"),
          ),
          FFNavigationBarItem(
            iconData: Icons.person_rounded,
            label: ("Profile"),
          ),
          FFNavigationBarItem(
            iconData: Icons.search,
            label: ("Search"),
          ),
          FFNavigationBarItem(
            iconData: Icons.favorite,
            label: ("Favorite"),
          ),
        ],
      ),
    );
  }
}

// import 'package:aplikasi_cari_kos/pages/search_page.dart';
// import 'package:aplikasi_cari_kos/pages/email_page.dart';
// import 'package:aplikasi_cari_kos/pages/home_page.dart';
// import 'package:aplikasi_cari_kos/pages/profil_page.dart';
// import 'package:aplikasi_cari_kos/pages/wishlist_page.dart';
// import 'package:aplikasi_cari_kos/widgets/search/kos_search.dart';
// import 'package:flutter/material.dart';
// //import 'placeholder_widget.dart';

// class NavbarItem extends StatefulWidget {
//   @override
//   _NavbarItemState createState() => _NavbarItemState();
// }

// class _NavbarItemState extends State {
//   int currentIndex = 0;
//   final List pages = [
//     HomePage(),
//     EmailPage(),
//     ProfilePage(),
//     ItemKos(),
//     WishlistPage(),
//   ];

//   void onTabTapped(int index) {
//     setState(() {
//       currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages[currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: onTabTapped,
//         currentIndex: currentIndex,
//         selectedItemColor: Colors.purple,
//         unselectedItemColor: Colors.grey,
//         showUnselectedLabels: false,
//         showSelectedLabels: false,
//         elevation: 0,
//         items: [
//           new BottomNavigationBarItem(icon: Icon(Icons.home), label: ('Home')),
//           new BottomNavigationBarItem(icon: Icon(Icons.mail), label: ('Mail')),
//           new BottomNavigationBarItem(
//               icon: Icon(Icons.person), label: ('Profile')),
//           new BottomNavigationBarItem(
//               icon: Icon(Icons.search), label: ('Search')),
//           new BottomNavigationBarItem(
//               icon: Icon(Icons.favorite), label: ('Favorit')),
//         ],
//       ),
//     );
//   }
// }
