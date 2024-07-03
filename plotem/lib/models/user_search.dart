// ignore_for_file: non_constant_identifier_names, camel_case_types

class UserSearch {
  final int user_id;
  final int pegawai_id;
  final String nama;
  final String username;
  final String? url_profile;
  final String nama_jabatan;

  const UserSearch({
    required this.user_id,
    required this.pegawai_id,
    required this.nama,
    required this.username,
    required this.url_profile,
    required this.nama_jabatan,
  });

  factory UserSearch.fromJson(Map<String, dynamic> json) => UserSearch(
        user_id: json["user_id"],
        pegawai_id: json["pegawai_id"],
        nama: json["nama"],
        username: json["username"],
        url_profile: json["url_profile"],
        nama_jabatan: json["nama_jabatan"],
      );
}
