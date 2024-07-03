// ignore_for_file: non_constant_identifier_names, camel_case_types

class WorkLeave {
  final int pegawai_id;
  final String detail_cuti;
  final String tgl_mulai;
  final String tgl_selesai;

  const WorkLeave({
    required this.pegawai_id,
    required this.detail_cuti,
    required this.tgl_mulai,
    required this.tgl_selesai,
  });

  factory WorkLeave.fromJson(Map<String, dynamic> json) => WorkLeave(
        pegawai_id: json["pegawai_id"],
        detail_cuti: json["detail_cuti"],
        tgl_mulai: json["tgl_mulai"],
        tgl_selesai: json["tgl_selesai"],
      );
}
