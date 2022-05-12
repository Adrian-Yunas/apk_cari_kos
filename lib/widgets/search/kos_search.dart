import 'package:flutter/material.dart';
import 'package:aplikasi_cari_kos/widgets/search/search_api.dart';
import 'package:aplikasi_cari_kos/widgets/search/search_filter_screen.dart';

class ItemKos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        //color: primaryColor,
        //visualDensity: VisualDensity.adaptivePlatformDensity,
        visualDensity: VisualDensity.compact,
      ),
      initialRoute: 'home',
      routes: {
        'home': (context) => SearchScreen(title: 'Cozy'),
        'filters': (context) => SearchFilterScreen(),
      },
    );
  }
}
