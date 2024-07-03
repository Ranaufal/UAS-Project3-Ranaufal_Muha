// ignore_for_file: camel_case_types, avoid_print, non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:plotem/models/cuti.dart';
import 'package:plotem/utils/const.dart';
import 'package:plotem/utils/service.dart';

class CutiRepository {
// Variable
  String cutiUrl = firstlink + "api/cuti/";
  String mycutiUrl = firstlink + "api/mycuti/" + myPegawaiId.toString();
  String cutiManagerUrl =
      firstlink + "api/cutimanager/" + myPegawaiId.toString();

// GET =========================================================

  Future<List<Cuti>> getEmployeesCuti() async {
    final response = await http.get(Uri.parse(cutiManagerUrl));

    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      List<Cuti> cuti =
          jsonResponse.map((model) => Cuti.fromJson(model)).toList();
      return cuti;
    } else {
      throw Exception('Failed to load Posts from API');
    }
  }

  Future<List<Cuti>> getMyCuti() async {
    final response = await http.get(Uri.parse(mycutiUrl));

    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      List<Cuti> cuti =
          jsonResponse.map((model) => Cuti.fromJson(model)).toList();
      return cuti;
    } else {
      throw Exception('Failed to load Posts from API');
    }
  }

  // Patch
  Future<bool> ManagerEditSubmiting(int cuti_id, bool status_cuti) async {
    try {
      var responseInsert = await http.patch(
        Uri.parse(cutiUrl + cuti_id.toString()),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "status_cuti": status_cuti,
        }),
      );
      if (responseInsert.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> addWorkLeave(
      String detail_cuti, String tgl_mulai, String tgl_selesai) async {
    try {
      var responseInsert = await http.post(
        Uri.parse(cutiUrl),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "pegawai_id": myPegawaiId,
          "detail_cuti": detail_cuti,
          "tgl_mulai": tgl_mulai,
          "tgl_selesai": tgl_selesai,
        }),
      );
      if (responseInsert.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
