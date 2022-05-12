import 'package:aplikasi_cari_kos/models/tips.dart';
import 'package:aplikasi_cari_kos/theme.dart';
import 'package:flutter/material.dart';

class TipsCard extends StatelessWidget {
  static String id = 'TipsCard';
  final Tips tips;
  IconButton iconButton;
  TipsCard(this.tips, this.iconButton);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          tips.imageUrl,
          width: 80,
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tips.title,
              style: blackTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Updated ${tips.updateAt}',
              style: greyTextStyle,
            )
          ],
        ),
        Spacer(),
        iconButton,
      ],
    );
  }
}
