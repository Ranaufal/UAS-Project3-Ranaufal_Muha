// ignore_for_file: camel_case_types, avoid_print, non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:plotem/models/like.dart';
import 'package:plotem/models/post.dart';
import 'package:plotem/utils/service.dart';

class PostRepository {
// Variable
  String apiUrl = firstlink + "api/userPost";
  String apiMyUrl = firstlink + "api/uniqueUserPost/";
  String apiLikeUrl = firstlink + "api/like";
  String apiMyLike = firstlink + "api/readTotalLike/";

// GET =========================================================

  Future<List<Post>> getAllPosts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      List<Post> posts =
          jsonResponse.map((model) => Post.fromJson(model)).toList();
      return posts;
    } else {
      throw Exception('Failed to load Posts from API');
    }
  }

  Future<List<Post>> getMyPosts(id) async {
    final response = await http.get(Uri.parse(apiMyUrl + id.toString()));

    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      List<Post> posts =
          jsonResponse.map((model) => Post.fromJson(model)).toList();
      return posts;
    } else {
      throw Exception('Failed to load Posts from API');
    }
  }

  Future<List<Like>> getLikes(id) async {
    final response = await http.get(Uri.parse(apiMyLike + id.toString()));

    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      List<Like> likes =
          jsonResponse.map((model) => Like.fromJson(model)).toList();
      return likes;
    } else {
      throw Exception('Failed to load Posts from API');
    }
  }

  // Post
  Future<void> createLikePost(int post_id, int user_id) async {
    try {
      var responseInsert = await http.patch(
        Uri.parse(apiLikeUrl),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "post_id": post_id,
          "user_id": user_id,
        }),
      );
      if (responseInsert.statusCode == 200) {
        print("Like ");
      } else {
        print("Gagal Like");
      }
    } catch (e) {
      print(e);
    }
  }
}
