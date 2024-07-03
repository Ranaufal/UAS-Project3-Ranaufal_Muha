// ignore_for_file: camel_case_types, avoid_print, non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:plotem/models/absence.dart';
import 'package:plotem/models/absence_thisday.dart';
import 'package:plotem/utils/const.dart';
import 'package:plotem/utils/service.dart';

class AbsenceRepository {
// Variable
  String absenceManagerUrl =
      firstlink + "api/absencemanager/" + myPegawaiId.toString();
  String myabsenceUrl =
      firstlink + "api/listmyabsence/" + myPegawaiId.toString();
  String postAbsence = firstlink + "api/absensi";
  String absenceThisDay =
      firstlink + "api/checkabsencethisday/" + myPegawaiId.toString();

// GET =========================================================

  Future<List<Absence>> getEmployeesAbsence() async {
    final response = await http.get(Uri.parse(absenceManagerUrl));

    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      List<Absence> absence =
          jsonResponse.map((model) => Absence.fromJson(model)).toList();
      return absence;
    } else {
      throw Exception('Failed to load Posts from API');
    }
  }

  Future<List<AbsenceThisDay>> getAbsenceThisDay() async {
    final response = await http.get(Uri.parse(absenceThisDay));

    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      List<AbsenceThisDay> absence =
          jsonResponse.map((model) => AbsenceThisDay.fromJson(model)).toList();
      return absence;
    } else {
      throw Exception('Failed to load Posts from API');
    }
  }

  Future<List<Absence>> getMyAbsence() async {
    final response = await http.get(Uri.parse(myabsenceUrl));

    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      List<Absence> absence =
          jsonResponse.map((model) => Absence.fromJson(model)).toList();
      return absence;
    } else {
      throw Exception('Failed to load Posts from API');
    }
  }

  // Post
  Future<void> absenecePosts(int pegawai_id, String status) async {
    try {
      var responseInsert = await http.post(
        Uri.parse(postAbsence),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "pegawai_id": pegawai_id,
          "status_absensi": status,
        }),
      );
      if (responseInsert.statusCode == 200) {
        print("Berhasil Absence ");
      } else {
        print("Gagal Absence: ${responseInsert.statusCode}");
        print("Response body: ${responseInsert.body}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
