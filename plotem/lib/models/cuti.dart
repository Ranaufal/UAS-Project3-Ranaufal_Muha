// ignore_for_file: non_constant_identifier_names, camel_case_types

class Cuti {
  final int cuti_id;
  final int pegawai_id;
  final String nama;
  final String? url_profile;
  final String detail_cuti;
  final int? status_cuti;
  final int days;
  final String tgl_mulai;
  final String tgl_selesai;
  final String created_at;

  const Cuti({
    required this.cuti_id,
    required this.pegawai_id,
    required this.nama,
    required this.url_profile,
    required this.detail_cuti,
    required this.status_cuti,
    required this.days,
    required this.tgl_mulai,
    required this.tgl_selesai,
    required this.created_at,
  });

  factory Cuti.fromJson(Map<String, dynamic> json) => Cuti(
        cuti_id: json["cuti_id"],
        pegawai_id: json["pegawai_id"],
        nama: json["nama"],
        url_profile: json["url_profile"],
        detail_cuti: json["detail_cuti"],
        status_cuti: json["status_cuti"],
        days: json["days"],
        tgl_mulai: json["tgl_mulai"],
        tgl_selesai: json["tgl_selesai"],
        created_at: json["created_at"],
      );
}
