// ignore_for_file: non_constant_identifier_names, camel_case_types

class Login {
  final int pegawai_id;
  final int user_id;
  final int hak_akses;
  final String username;

  const Login({
    required this.pegawai_id,
    required this.user_id,
    required this.hak_akses,
    required this.username,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        pegawai_id: json["pegawai_id"],
        user_id: json["user_id"],
        hak_akses: json["hak_akses"],
        username: json["username"],
      );
}
