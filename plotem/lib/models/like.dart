// ignore_for_file: non_constant_identifier_names, camel_case_types

class Like {
  final int likes;

  const Like({
    required this.likes,
  });

  factory Like.fromJson(Map<String, dynamic> json) => Like(
        likes: json["likes"],
      );
}
