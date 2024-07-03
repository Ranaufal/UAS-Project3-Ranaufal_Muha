// ignore_for_file: non_constant_identifier_names, camel_case_types

class User {
  final int user_id;
  final int pegawai_id;
  final String username;
  final String password;
  final int hak_akses;
  final String created_at;
  final String? updated_at;

  const User({
    required this.user_id,
    required this.pegawai_id,
    required this.username,
    required this.password,
    required this.hak_akses,
    required this.created_at,
    this.updated_at,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        user_id: json["user_id"],
        pegawai_id: json["pegawai_id"],
        username: json["username"],
        password: json["password"],
        hak_akses: json["hak_akses"],
        created_at: json["created_at"],
        updated_at: json["updated_at"],
      );
}
