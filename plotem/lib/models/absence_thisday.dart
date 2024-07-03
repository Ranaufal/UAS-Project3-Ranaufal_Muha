// ignore_for_file: non_constant_identifier_names, camel_case_types

class AbsenceThisDay {
  final int absensi_id;
  final int pegawai_id;
  final String created_at;

  const AbsenceThisDay({
    required this.absensi_id,
    required this.pegawai_id,
    required this.created_at,
  });

  factory AbsenceThisDay.fromJson(Map<String, dynamic> json) => AbsenceThisDay(
        absensi_id: json["absensi_id"],
        pegawai_id: json["pegawai_id"],
        created_at: json["created_at"],
      );
}
