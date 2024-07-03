// ignore_for_file: non_constant_identifier_names, camel_case_types

class WorkAssessment {
  final int penilai_id;
  final int pegawai_id;
  final int kehadiran;
  final int kinerja;
  final int kerjasama;
  final int kreatifitas;
  final int kepemimpinan;
  final int pemecahan_masalah;
  final int total;

  const WorkAssessment({
    required this.penilai_id,
    required this.pegawai_id,
    required this.kehadiran,
    required this.kinerja,
    required this.kerjasama,
    required this.kreatifitas,
    required this.kepemimpinan,
    required this.pemecahan_masalah,
    required this.total,
  });

  factory WorkAssessment.fromJson(Map<String, dynamic> json) => WorkAssessment(
        penilai_id: json["penilai_id"],
        pegawai_id: json["pegawai_id"],
        kehadiran: json["kehadiran"],
        kinerja: json["kinerja"],
        kerjasama: json["kerjasama"],
        kreatifitas: json["kreatifitas"],
        kepemimpinan: json["kepemimpinan"],
        pemecahan_masalah: json["pemecahan_masalah"],
        total: json["total"],
      );
}
