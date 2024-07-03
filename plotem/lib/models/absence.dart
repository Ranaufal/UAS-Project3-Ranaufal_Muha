// ignore_for_file: non_constant_identifier_names, camel_case_types

class Absence {
  final int absensi_id;
  final int pegawai_id;
  final String nama;
  final String? url_profile;
  final String status;
  final String? jam_masuk;
  final String? jam_keluar;
  final String created_at;

  const Absence({
    required this.absensi_id,
    required this.pegawai_id,
    required this.nama,
    required this.url_profile,
    required this.status,
    required this.jam_masuk,
    required this.jam_keluar,
    required this.created_at,
  });

  factory Absence.fromJson(Map<String, dynamic> json) => Absence(
        absensi_id: json["absensi_id"],
        pegawai_id: json["pegawai_id"],
        nama: json["nama"],
        url_profile: json["url_profile"],
        status: json["status_absensi"],
        jam_masuk: json["jam_masuk"],
        jam_keluar: json["jam_keluar"],
        created_at: json["created_at"],
      );
}
