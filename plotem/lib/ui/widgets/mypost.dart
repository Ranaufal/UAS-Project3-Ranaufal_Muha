// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:plotem/models/like.dart';
import 'package:plotem/services/repo_post.dart';
import 'package:plotem/ui/widgets/const_component.dart';
import 'package:plotem/utils/const.dart';
import 'package:plotem/utils/service.dart';

class MyPostWidget extends StatelessWidget {
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
  MyPostWidget({
    super.key,
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

  final TextStyle _textStyle = TextStyle(
    fontSize: 12,
    color: disabledColor,
  );

  PostRepository postRepository = PostRepository();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 15,
            child: MyProfileImage(
              url: url_profile ?? "",
              radius: 20,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 85,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      username,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      created_at,
                      style: _textStyle,
                    )
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  nama_jabatan,
                  style: _textStyle,
                ),
                const SizedBox(height: 15),
                text_content == null
                    ? const SizedBox()
                    : Column(
                        children: [
                          Text(
                            text_content ?? "",
                            style: const TextStyle(),
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                url_content == null
                    ? SizedBox()
                    : Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                firstlink + url_content!,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            postRepository.createLikePost(post_id, myUserId);
                          },
                          child: Icon(
                            Icons.thumb_up_outlined,
                            color: disabledColor,
                            size: 18,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(likes.toString(), style: _textStyle),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.thumb_down_alt_outlined,
                            color: disabledColor,
                            size: 18,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(unlikes.toString(), style: _textStyle),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.mode_comment_outlined,
                            color: disabledColor,
                            size: 18,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(comments.toString(), style: _textStyle),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.ios_share_sharp,
                        color: disabledColor,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
