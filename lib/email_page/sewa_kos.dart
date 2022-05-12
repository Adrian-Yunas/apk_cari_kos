import 'package:aplikasi_cari_kos/controllers/jadwal_controller.dart';
import 'package:aplikasi_cari_kos/models/jadwal.dart';
import 'package:aplikasi_cari_kos/theme.dart';
import 'package:aplikasi_cari_kos/widgets/button.dart';
import 'package:aplikasi_cari_kos/email_page/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SewaKosPage extends StatefulWidget {
  const SewaKosPage({Key key}) : super(key: key);

  @override
  _SewaKosPageState createState() => _SewaKosPageState();
}

class _SewaKosPageState extends State<SewaKosPage> {
  final JadwalController _jadwalController = Get.put(JadwalController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteContoller = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  //String _endTime = "9:30 PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedRemind = 5;
  List<int> remindList = [
    5,
    10,
    15,
    20,
  ];

  String _selectedRepeat = "none";
  List<String> repeatList = [
    "None",
    "Daily",
    "Weekly",
    "Monthly",
  ];
  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Jadwal Temu Ibu Kos",
        ),
        backgroundColor: primaryColor,
      ),
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(
              height: edge,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   "Jadwal Temu Ibu Kos",
                    //   style: headingStyle,
                    //   textAlign: TextAlign.center,
                    // ),
                    MyInputField(
                      title: "Kegiatan",
                      hint: " Masukkan acara anda",
                      controller: _titleController,
                    ),
                    MyInputField(
                      title: "Pesan ",
                      hint: " Masukan pesan anda",
                      controller: _noteContoller,
                    ),
                    MyInputField(
                      title: "Tanggal",
                      hint: DateFormat.yMd().format(_selectedDate),
                      widget: IconButton(
                        icon: Icon(
                          Icons.calendar_today_outlined,
                          color: greyColor,
                        ),
                        onPressed: () {
                          _getDateFromUser();
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: MyInputField(
                            title: "Jam",
                            hint: _startTime,
                            widget: IconButton(
                              onPressed: () {
                                _getTimeFromUser(isStartTime: true);
                              },
                              icon: Icon(
                                Icons.access_time_rounded,
                                color: greyColor,
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   width: 12,
                        // ),
                        // Expanded(
                        //   child: MyInputField(
                        //     title: "End Date",
                        //     hint: _endTime,
                        //     widget: IconButton(
                        //       onPressed: () {
                        //         _getTimeFromUser(isStartTime: false);
                        //       },
                        //       icon: Icon(
                        //         Icons.access_time_rounded,
                        //         color: greyColor,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    MyInputField(
                      title: "Ingat",
                      hint: " $_selectedRemind menit lebih awal",
                      widget: DropdownButton(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: greyColor,
                          ),
                          iconSize: 32,
                          elevation: 4,
                          focusColor: blackColor,
                          underline: Container(
                            height: 0,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              _selectedRemind = int.parse(newValue);
                            });
                          },
                          items: remindList
                              .map<DropdownMenuItem<String>>((int value) {
                            return DropdownMenuItem<String>(
                              value: value.toString(),
                              child: Text(value.toString()),
                            );
                          }).toList()),
                    ),
                    MyInputField(
                      title: "Ulang",
                      hint: " $_selectedRepeat",
                      widget: DropdownButton(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: greyColor,
                          ),
                          iconSize: 32,
                          elevation: 4,
                          focusColor: blackColor,
                          underline: Container(
                            height: 0,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              _selectedRepeat = newValue;
                            });
                          },
                          items: repeatList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  color: blackColor,
                                ),
                              ),
                            );
                          }).toList()),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _collorPallete(),
                        MyButton(
                          label: "Buat Jadwal",
                          onTap: () => _validateDate(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _validateDate() {
    if (_titleController.text.isNotEmpty && _noteContoller.text.isNotEmpty) {
      _addJadwalToDb();
      Get.back();
    } else if (_titleController.text.isEmpty || _noteContoller.text.isEmpty) {
      Get.snackbar(
        "Required",
        "All fields are required !",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: whiteColor,
        colorText: Colors.red[500],
        icon: Icon(
          Icons.warning_amber_rounded,
          color: Colors.red[500],
        ),
      );
    }
  }

  _addJadwalToDb() async {
    int value = await _jadwalController.sewaKos(
      jadwal: Jadwal(
        note: _noteContoller.text,
        title: _titleController.text,
        date: DateFormat.yMd().format(_selectedDate),
        startTime: _startTime,
        //endTime: _endTime,
        remind: _selectedRemind,
        repeat: _selectedRepeat,
        color: _selectedColor,
        isCompleted: 0,
      ),
    );
    print("My id is " + " $value");
  }

  _collorPallete() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Warna Tanda",
          style: titleStyle,
        ),
        SizedBox(
          height: 8.0,
        ),
        Wrap(
          children: List<Widget>.generate(
            3,
            (int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedColor = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: index == 0
                        ? primaryColor
                        : index == 1
                            ? Colors.pink
                            : Colors.green,
                    child: _selectedColor == index
                        ? Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 16,
                          )
                        : Container(),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  _getDateFromUser() async {
    DateTime _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2122),
    );

    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
        print(_selectedDate);
      });
    } else {
      print("it's null or something is wrong");
    }
  }

  _getTimeFromUser({bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String _formatedTime = pickedTime.format(context);
    if (pickedTime == null) {
      print("Time Canceled");
    } else if (isStartTime == true) {
      setState(() {
        _startTime = _formatedTime;
      });
      // } else if (isStartTime == false) {
      //   setState(() {
      //     _endTime = _formatedTime;
      //   });
    }
  }

  _showTimePicker() {
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(
        hour: int.parse(_startTime.split(":")[0]),
        minute: int.parse(
          _startTime.split(":")[1].split(" ")[0],
        ),
      ),
    );
  }
}
