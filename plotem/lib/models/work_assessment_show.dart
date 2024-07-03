// ignore_for_file: non_constant_identifier_names, camel_case_types

class WorkAssessmentShow {
  final int user_id;
  final int pegawai_id;
  final String nama;
  final String username;
  final String? url_profile;
  final num total;
  final String created_at;

  const WorkAssessmentShow({
    required this.user_id,
    required this.pegawai_id,
    required this.nama,
    required this.username,
    required this.url_profile,
    required this.total,
    required this.created_at,
  });

  factory WorkAssessmentShow.fromJson(Map<String, dynamic> json) =>
      WorkAssessmentShow(
        user_id: json["user_id"],
        pegawai_id: json["pegawai_id"],
        nama: json["nama"],
        username: json["username"],
        url_profile: json["url_profile"],
        total: json["total"],
        created_at: json["created_at"],
      );
}
