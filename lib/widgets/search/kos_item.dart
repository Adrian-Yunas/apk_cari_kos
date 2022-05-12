import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:aplikasi_cari_kos/models/space.dart';
import 'package:aplikasi_cari_kos/theme.dart';
import 'package:provider/provider.dart';

import '../../pages/detail_page.dart';
import '../../providers/space_provider.dart';

class KosItem extends StatelessWidget {
  final Space kos;

  KosItem(this.kos);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(kos),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6),
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                kos.thumbnail != null && kos.thumbnail.isNotEmpty
                    ? Ink(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(kos.thumbnail),
                          ),
                        ),
                      )
                    : Container(
                        height: 100,
                        width: 100,
                        color: Colors.blueGrey,
                        child: Icon(
                          Icons.home,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          kos.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 7),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: primaryColor,
                              size: 15,
                            ),
                            SizedBox(width: 5),
                            Text(kos.city),
                          ],
                        ),
                        SizedBox(height: 5),
                        // RatingBarIndicator(
                        //   rating: double.parse(kos.rating),
                        //   itemBuilder: (_, __) {
                        //     return Icon(
                        //       Icons.star,
                        //       color: orangeColor,
                        //     );
                        //   },
                        //   itemSize: 20,
                        // ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Kosan {
  final int id;
  final String name;
  final String imageUrl;
  final int price;
  final String city;
  final String country;
  final String rating;
  final String address;
  final String phone;
  final String mapUrl;
  final List photos;
  final int numberOfKitchens;
  final int numberOfBedrooms;
  final int numberOfCupboards;
  final String thumbnail;

  Kosan({
    this.city,
    this.country,
    this.id,
    this.imageUrl,
    this.name,
    this.price,
    this.rating,
    this.address,
    this.mapUrl,
    this.numberOfBedrooms,
    this.numberOfCupboards,
    this.numberOfKitchens,
    this.phone,
    this.photos,
    this.thumbnail,
  });

  factory Kosan.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }
    return Kosan(
      id: json['id'],
      name: json['name'],
      city: json['city'],
      country: json['country'],
      imageUrl: json['image_url'],
      price: json['price'],
      rating: json['rating'],
      address: json['address'],
      phone: json['phone'],
      mapUrl: json['map_url'],
      photos: json['photos'],
      numberOfBedrooms: json['number_of_bedrooms'],
      numberOfCupboards: json['number_of_cupboards'],
      numberOfKitchens: json['number_of_kitchens'],
      thumbnail: json['image_url'] ?? json['image_url'],
    );
  }
}
