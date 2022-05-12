import 'package:aplikasi_cari_kos/pages/search_page.dart';
import 'package:easy_search/easy_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_cari_kos/models/space.dart';
import 'package:aplikasi_cari_kos/pages/detail_page.dart';
import 'package:aplikasi_cari_kos/theme.dart';
import 'package:aplikasi_cari_kos/widgets/search/kos_item.dart';
import 'package:aplikasi_cari_kos/widgets/search/search_form.dart';
import 'package:provider/provider.dart';

import '../../providers/space_provider.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query;

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);
    //final api = Provider.of<SpaceProvider>(context);
    //final state = Provider.of<AppState>(context);

    //var state;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'filters');
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Icon(
                Icons.tune,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SearchPage(
              onSearch: (q) {
                setState(() {
                  query = q;
                });
              },
            ),
            query == null
                ? Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black54,
                          size: 40,
                        ),
                        Text(
                          'No results to display',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 7,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  )
                : FutureBuilder(
                    //future: api.getData(name: state.searchOptions),
                    future: SpaceProvider.getData(query),
                    // builder: (context, snapshot) {
                    //future: spaceProvider.getRecommendedSpaces(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      // if (snapshot.hasData) {
                      //   return Expanded(
                      //     child: ListView(
                      //       children: snapshot.data
                      //           .map(
                      //               (json) => KosItem((json)))
                      //           .toList(),
                      //     ),
                      //   );
                      // }
                      if (snapshot.hasData) {
                        List<Space> data = snapshot.data;
                        int index = 0;
                        return Expanded(
                          child: ListView(
                            //crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: data.map((item) {
                              index++;
                              return Container(
                                margin: EdgeInsets.only(
                                  top: index == 1 ? 0 : 30,
                                ),
                                child: KosItem(item),
                              );
                            }).toList(),
                          ),
                        );
                      }
                      //}
                      //);
                      return Text(
                          'Error retrieving results: ${snapshot.error}');
                    },
                  )
          ],
        ),
      ),
    );
  }
}
