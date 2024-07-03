import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plotem/models/work_assessment_show.dart';
import 'package:plotem/utils/const.dart';
import 'package:plotem/utils/service.dart';

class WorkAssessmentRepository {
  String workAssessment = firstlink + "api/penilaiankerja";
  String workAssessmentManagerShow =
      firstlink + "api/listpenilaiankerja/" + myPegawaiId.toString();

// GET =========================================================
  Future<List<WorkAssessmentShow>> getMyEmployeeData() async {
    final response = await http.get(Uri.parse(workAssessmentManagerShow));

    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      List<WorkAssessmentShow> washow = jsonResponse
          .map((model) => WorkAssessmentShow.fromJson(model))
          .toList();
      return washow;
    } else {
      throw Exception('Failed to load Posts from API');
    }
  }

// POST =========================================================
  Future<void> createWorkAssessment(
    int penilai_id,
    int? pegawai_id,
    int? kehadiran,
    int? kinerja,
    int? kerjasama,
    int? kreatifitas,
    int? kepemimpinan,
    int? pemecahan_masalah,
    double total,
  ) async {
    try {
      var responseInsert = await http.post(
        Uri.parse(workAssessment),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "penilai_id": penilai_id.toString(),
          "pegawai_id": pegawai_id?.toString(),
          "kehadiran": kehadiran?.toString(),
          "kinerja": kinerja?.toString(),
          "kerjasama": kerjasama?.toString(),
          "kreatifitas": kreatifitas?.toString(),
          "kepemimpinan": kepemimpinan?.toString(),
          "pemecahan_masalah": pemecahan_masalah?.toString(),
          "total": total.toString(),
        }),
      );
      if (responseInsert.statusCode == 200) {
        print("Berhasil Assessment ");
      } else {
        print("Gagal Assessment: ${responseInsert.statusCode}");
        print("Response body: ${responseInsert.body}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
