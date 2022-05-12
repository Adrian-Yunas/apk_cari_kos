import 'package:aplikasi_cari_kos/pages/item_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_search/easy_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WishlistPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController likeController = TextEditingController();
  bool validate = false;

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference wishlist = firestore.collection('wishlist');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: StreamBuilder<DocumentSnapshot>(
              stream: wishlist.doc('ZulUkeWK7s1msPqC5alm').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData)
                  return Text("Wishtlist");
                else
                  return Text('Loading');
              }),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            ListView(
              children: [
                //// VIEW DATA HERE
                // FutureBuilder<QuerySnapshot>(
                //   future: wishlist.get(),
                //   builder: (_, snapshot) {
                //     if (snapshot.hasData) {
                //       return Column(
                //         children: snapshot.data.docs
                //             .map((e) =>
                //                 ItemCard(e.data()['name'], e.data()['like']))
                //             .toList(),
                //       );
                //     } else {
                //       return Text('Loading');
                //     }
                //   },
                // ),
                StreamBuilder<QuerySnapshot>(
                  stream: wishlist.where('like').snapshots(),
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: snapshot.data.docs
                            .map((e) => ItemCard(
                                  e.data()['name'],
                                  e.data()['like'],
                                  onUpdate: () {
                                    wishlist
                                        .doc(e.id)
                                        .update({'like': e.data()['like'] + 1});
                                  },
                                  onDelete: () {
                                    wishlist.doc(e.id).delete();
                                  },
                                ))
                            .toList(),
                      );
                    } else {
                      return Text('Loading');
                    }
                  },
                ),
                SizedBox(
                  height: 150,
                )
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(-5, 0),
                        blurRadius: 15,
                        spreadRadius: 3)
                  ]),
                  width: double.infinity,
                  height: 130,
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 160,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              style: GoogleFonts.poppins(),
                              controller: nameController,
                              decoration: InputDecoration(
                                hintText: "Nama Kos",
                                errorText:
                                    validate ? 'Nama kos harus diisi' : null,
                              ),
                            ),
                            TextField(
                              style: GoogleFonts.poppins(),
                              controller: likeController,
                              decoration: InputDecoration(
                                hintText: "Like",
                              ),
                              enabled: false,
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 130,
                        width: 130,
                        padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: Colors.blue[900],
                            child: Text(
                              'Add Data',
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              //// ADD DATA HERE
                              wishlist.add({
                                'name': nameController.text,
                                'like': int.tryParse(likeController.text) ?? 0
                              });
                              nameController.text = '';
                              likeController.text = '';
                            }),
                      )
                    ],
                  ),
                )),
          ],
        ));
  }
}
