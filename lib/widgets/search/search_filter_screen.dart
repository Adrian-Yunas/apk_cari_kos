import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:aplikasi_cari_kos/theme.dart';

class SearchFilterScreen extends StatefulWidget {
  @override
  _SearchFilterScreenState createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen> {
  double _value = 1;
  bool selected = false;
  int _all = 0;
  RangeLabels labels = RangeLabels('1', '1000');

  RangeValues _values = RangeValues(1, 1000);

  final listChoices = <ItemChoice>[
    ItemChoice(1, 'kitchen 1'),
    ItemChoice(2, 'kitchen 2'),
    ItemChoice(3, 'kitchen 3'),
    ItemChoice(4, 'No Kitchen'),
  ];

  final listBd = <ItemBd>[
    ItemBd(1, 'Bedroom 1'),
    ItemBd(2, 'Bedroom 2'),
    ItemBd(3, 'Bedroom 3'),
  ];
  final listLM = <ItemLM>[
    ItemLM(1, 'Lemari 1'),
    ItemLM(2, 'Lemari 2'),
    ItemLM(3, 'Lemari 3'),
    ItemLM(4, 'No Lemari'),
  ];
  var idSelected = 0;
  var bdSelected = 0;
  var LompatLemari = 0;
  // onChanged: (value) {
  // _search = value;
  // }
  final _formKey = GlobalKey<FormState>();

  bool _autoValidate = false;
  var _search;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter your search'),
        backgroundColor: primaryColor,
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.delete),
        //     color: whiteColor,
        //     onPressed: () {
        //       //ChoiceChip.remove();
        //     },
        //   ),
        // add more IconButton
        //],
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Categories:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Kitchen:',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Wrap(
                    spacing: 10,
                    children: listChoices
                        .map((e) => ChoiceChip(
                              selectedColor: Colors.tealAccent,
                              backgroundColor: Colors.black12,
                              label: Text(e.label),
                              selected: idSelected == e.id,
                              onSelected: (_) =>
                                  setState(() => idSelected = e.id),
                            ))
                        .toList(),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Bedroom:',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Wrap(
                    spacing: 10,
                    children: listBd
                        .map((e) => ChoiceChip(
                              selectedColor: Colors.lightGreenAccent,
                              backgroundColor: Colors.black12,
                              label: Text(e.label),
                              selected: bdSelected == e.id,
                              onSelected: (_) =>
                                  setState(() => bdSelected = e.id),
                            ))
                        .toList(),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Lemari:',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Wrap(
                    spacing: 10,
                    children: listLM
                        .map((e) => ChoiceChip(
                              selectedColor: Colors.greenAccent,
                              backgroundColor: Colors.black12,
                              label: Text(e.label),
                              selected: LompatLemari == e.id,
                              onSelected: (_) =>
                                  setState(() => LompatLemari = e.id),
                            ))
                        .toList(),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Rating:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: orangeColor,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Price:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  SliderTheme(
                    data: SliderThemeData(
                        thumbSelector: _customRangeThumbSelector),
                    child: RangeSlider(
                        activeColor: primaryColor,
                        inactiveColor: greyColor,
                        values: _values,
                        min: 1,
                        max: 1000,
                        divisions: 1000,
                        labels: labels,
                        //labels: RangeLabels("START: ${_values.start.round()}, End: ${_values.end.round()}"),
                        // labels: RangeLabels(_values.toString(), _values.toString()),
                        //onChanged: (RangeValues values) {
                        onChanged: (value) {
                          print("START: ${value.start}, End: ${value.end}");
                          setState(() {
                            //print("START: ${_values.start.round()}, End: ${_values.end.round()}");
                            _values = value;
                            //labels = RangeLabels(value.start.toString(),value.end.toString());
                            labels = RangeLabels(
                                "\$${_values.start.toString()}",
                                "\$${_values.end.toString()}");
                            //labels = RangeLabels("${_values.end.toInt().toString()}\$", "${_values.end.toInt().toString()}\$");
                            // if (values.end - values.start >= 20) {
                            //   _values = values;
                            // } else {
                            //   if (_values.start == values.start) {
                            //     _values = RangeValues(_values.start, _values.start + 20);
                            //   } else {
                            //     _values = RangeValues(_values.end - 20, _values.end);
                            //   }
                            // }
                          });
                        }),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: RawMaterialButton(
                      onPressed: () {
                        final isValid = _formKey.currentState.validate();
                        if (isValid) {
                          //widget.onSearch(_search);
                          // Collapses keypad
                          FocusManager.instance.primaryFocus.unfocus();
                        } else {
                          setState(() {
                            _autoValidate = true;
                          });
                        }
                      },
                      fillColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Search',
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemChoice {
  final int id;
  final String label;

  ItemChoice(this.id, this.label);
}

class ItemBd {
  final int id;
  final String label;

  ItemBd(this.id, this.label);
}

class ItemLM {
  final int id;
  final String label;

  ItemLM(this.id, this.label);
}

final RangeThumbSelector _customRangeThumbSelector = (
  TextDirection textDirection,
  RangeValues values,
  double tapValue,
  Size thumbSize,
  Size trackSize,
  double dx,
) {
  final double start = (tapValue - values.start).abs();
  final double end = (tapValue - values.end).abs();
  return start < end ? Thumb.start : Thumb.end;
};
// class ItemFilter {
//   final int id;
//   final String name;
//   bool isFilterActive;
//
//   ItemFilter(this.id, this.name, this.isFilterActive);
// }
//
// class ItemLM {
//   final int id;
//   final String name;
//   bool isFilterActive;
//  // final List<ItemProductFilter> listProductFilter;
//
//   ItemLM(this.id, this.name, this.isFilterActive);
//   @override
//   String toString() {
//     return 'ItemProduct{name: $name}';
//   }
// }
// class ItemBd {
//   final int id;
//   final String name;
//   bool isFilterActive;
//
//   ItemBd(this.id, this.name, this.isFilterActive);
// }
// class ItemProductFilter {
//   final int id;
//   final bool isFilterActive;
//
//   ItemProductFilter(this.id, this.isFilterActive);
// }
