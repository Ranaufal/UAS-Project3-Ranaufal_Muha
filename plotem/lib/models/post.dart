// ignore_for_file: non_constant_identifier_names, camel_case_types

class Post {
  final int post_id;
  final String username;
  final String nama_jabatan;
  final String? url_profile;
  final String? url_content;
  final String? text_content;
  final int likes;
  final int unlikes;
  final int comments;
  final String created_at;

  const Post({
    required this.post_id,
    required this.username,
    required this.nama_jabatan,
    required this.url_profile,
    required this.url_content,
    required this.text_content,
    required this.likes,
    required this.unlikes,
    required this.comments,
    required this.created_at,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        post_id: json["post_id"],
        username: json["username"],
        nama_jabatan: json["nama_jabatan"],
        url_profile: json["url_profile"],
        url_content: json["url_content"],
        text_content: json["text_content"],
        likes: json["likes"],
        unlikes: json["unlikes"],
        comments: json["comments"],
        created_at: json["created_at"],
      );
}
