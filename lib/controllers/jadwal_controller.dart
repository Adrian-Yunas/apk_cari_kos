import 'package:aplikasi_cari_kos/db/db_helper.dart';
import 'package:aplikasi_cari_kos/models/jadwal.dart';

import 'package:get/get.dart';

class JadwalController extends GetxController {
  @override
  void onReady() {
    getJadwals();
    super.onReady();
  }

  var listJadwal = <Jadwal>[].obs;

  Future<int> sewaKos({Jadwal jadwal}) async {
    return await DBHelper.insert(jadwal);
  }

  //ambil semua jadwal dari tabel
  void getJadwals() async {
    List<Map<String, dynamic>> jadwals = await DBHelper.query();
    listJadwal
        .assignAll(jadwals.map((data) => new Jadwal.fromJson(data)).toList());
  }

  void delete(Jadwal jadwal) {
    DBHelper.delete(jadwal);
    getJadwals();
  }

  void markJadwalSelesai(int id) async {
    await DBHelper.update(id);
    getJadwals();
  }
}
