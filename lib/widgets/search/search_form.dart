import 'package:auto_validate/auto_validate.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_cari_kos/theme.dart';

class SearchForm extends StatefulWidget {
  SearchForm({this.onSearch});

  final void Function(String search) onSearch;

  @override
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final _formKey = GlobalKey<FormState>();

  bool _autoValidate = false;
  var _search;

  @override
  Widget build(context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        //autovalidate: _autoValidate,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextFormField(
              //autovalidate: _autoValidate,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Enter search',
                border: OutlineInputBorder(),
                filled: true,
                errorStyle: TextStyle(fontSize: 15),
              ),
              onChanged: (value) {
                _search = value;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a search term';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: RawMaterialButton(
                onPressed: () {
                  final isValid = _formKey.currentState.validate();
                  if (isValid) {
                    widget.onSearch(_search);
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
    );
  }
}
