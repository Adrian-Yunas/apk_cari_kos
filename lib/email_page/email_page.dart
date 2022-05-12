import 'package:aplikasi_cari_kos/controllers/jadwal_controller.dart';
import 'package:aplikasi_cari_kos/models/jadwal.dart';
import 'package:aplikasi_cari_kos/email_page/sewa_kos.dart';
import 'package:aplikasi_cari_kos/theme.dart';
import 'package:aplikasi_cari_kos/widgets/button.dart';
import 'package:aplikasi_cari_kos/email_page/jadwal_tile.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EmailPage extends StatefulWidget {
  @override
  _EmailPageState createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  final _jadwalController = Get.put(JadwalController());

  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          color: whiteColor,
          child: Center(
            child: Column(
              children: [
                _sewaKos(),
                _addDateBar(),
                SizedBox(
                  height: 30,
                ),
                _lihatJadwals(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _lihatJadwals() {
    return Expanded(
      child: Obx(() {
        return ListView.builder(
            itemCount: _jadwalController.listJadwal.length,
            itemBuilder: (_, index) {
              Jadwal jadwal = _jadwalController.listJadwal[index];
              if (jadwal.repeat == 'Daily') {
                DateTime date =
                    DateFormat.jm().parse(jadwal.startTime.toString());
                var myTime = DateFormat("HH:mm").format(date);
                //notifyHelper.scheduledNotification();
                return AnimationConfiguration.staggeredList(
                  position: index,
                  child: SlideAnimation(
                    child: FadeInAnimation(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _showBottomSheet(context, jadwal);
                            },
                            child: JadwalTile(jadwal),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
              if (jadwal.date == DateFormat.yMd().format(_selectedDate)) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  child: SlideAnimation(
                    child: FadeInAnimation(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _showBottomSheet(context, jadwal);
                            },
                            child: JadwalTile(jadwal),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Container();
              }
            });
      }),
    );
  }

  _showBottomSheet(BuildContext context, Jadwal jadwal) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.only(top: 4),
        height: jadwal.isCompleted == 1
            ? MediaQuery.of(context).size.height * 0.24
            : MediaQuery.of(context).size.height * 0.32,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 6,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
            ),
            Spacer(),
            jadwal.isCompleted == 1
                ? Container()
                : _bottomSheetButton(
                    label: "Jadwal Selesai",
                    onTap: () {
                      _jadwalController.markJadwalSelesai(jadwal.id);
                      Get.back();
                    },
                    clr: primaryColor,
                    context: context,
                  ),
            _bottomSheetButton(
              label: "Hapus Jadwal",
              onTap: () {
                _jadwalController.delete(jadwal);
                _jadwalController.getJadwals();
                Get.back();
              },
              clr: Colors.red[300],
              context: context,
            ),
            SizedBox(
              height: 20,
            ),
            _bottomSheetButton(
              label: "Tutup",
              onTap: () {
                Get.back();
              },
              clr: Colors.white,
              isClose: true,
              context: context,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  _bottomSheetButton({
    String label,
    Function onTap,
    Color clr,
    bool isClose = false,
    BuildContext context,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 55,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isClose == true ? Colors.grey[300] : clr,
          ),
          borderRadius: BorderRadius.circular(
            20,
          ),
          color: isClose == true ? Colors.transparent : clr,
        ),
        child: Center(
          child: Text(
            label,
            style:
                isClose ? titleStyle : titleStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }

  _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: primaryColor,
        selectedTextColor: whiteColor,
        dateTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        dayTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        onDateChange: (date) {
          setState(() {
            _selectedDate = date;
          });
        },
      ),
    );
  }

  _sewaKos() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMMd().format(DateTime.now()),
                  style: subHeadingStyle,
                ),
                Text(
                  "Today",
                  style: headingStyle,
                ),
              ],
            ),
          ),
          MyButton(
              label: "+ Temu Ibu Kos",
              onTap: () async {
                await Get.to(() => SewaKosPage());
                _jadwalController.getJadwals();
              }),
        ],
      ),
    );
  }
}
