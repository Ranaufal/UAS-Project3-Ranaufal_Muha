// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:plotem/models/post.dart';
import 'package:plotem/models/user_search.dart';
import 'package:plotem/services/repo_post.dart';
import 'package:plotem/services/repo_user.dart';
import 'package:plotem/ui/widgets/mypost.dart';
import 'package:plotem/ui/widgets/const_component.dart';
import 'package:plotem/utils/const.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Post> listposts = [];
  PostRepository postRepository = PostRepository();

  getData() async {
    listposts = await postRepository.getAllPosts();
    print(listposts.length);
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: GestureDetector(
            onTap: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
              decoration: BoxDecoration(
                color: glassColor,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: glassBorderColor,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search_rounded,
                    color: disabledColor,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Search",
                    style: TextStyle(color: disabledColor),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        for (int i = 0; i < listposts.length; i++)
          Column(
            children: [
              MyPostWidget(
                post_id: listposts[i].post_id,
                username: listposts[i].username,
                nama_jabatan: listposts[i].nama_jabatan,
                url_profile: listposts[i].url_profile,
                url_content: listposts[i].url_content,
                text_content: listposts[i].text_content,
                likes: listposts[i].likes,
                unlikes: listposts[i].unlikes,
                comments: listposts[i].comments,
                created_at: listposts[i].created_at,
              ),
              Divider(color: dividerColor),
            ],
          ),
        const SizedBox(height: 100),
      ],
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<UserSearch> listuser = [];
  UserRepository userRepository = UserRepository();

  CustomSearchDelegate() {
    getData();
  }

  getData() async {
    listuser = await userRepository.getSearchUsers();
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> image = [];
    List<String> username = [];
    List<String> jobTitle = [];
    for (var theallusers in listuser) {
      if (theallusers.username.toLowerCase().contains(query)) {
        image.add("");
        username.add(theallusers.username.toString());
        jobTitle.add(theallusers.nama.toString());
      }
    }

    return ListView.builder(
      itemCount: username.length,
      itemBuilder: (context, index) {
        var imageresult = image[index];
        var userresult = username[index];
        var jobTitleresult = jobTitle[index];
        return ListTile(
          title: Text(userresult),
          subtitle: Text(jobTitleresult),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> image = [];
    List<String> username = [];
    List<String> jobTitle = [];
    for (var theallusers in listuser) {
      if (theallusers.username.toLowerCase().contains(query)) {
        image.add("");
        username.add(theallusers.username.toString().toString());
        jobTitle.add(theallusers.nama.toString());
      }
    }

    return ListView.builder(
      itemCount: username.length,
      itemBuilder: (context, index) {
        var imageresult = image[index];
        var userresult = username[index];
        var jobTitleresult = jobTitle[index];
        return ListTile(
          leading: MyProfileImage(
            url: imageresult,
            radius: 0,
          ),
          title: Text(
            userresult,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            jobTitleresult,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        );
      },
    );
  }
}
