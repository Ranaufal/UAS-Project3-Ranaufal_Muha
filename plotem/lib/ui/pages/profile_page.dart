import 'package:flutter/material.dart';
import 'package:plotem/models/post.dart';
import 'package:plotem/services/repo_post.dart';
import 'package:plotem/ui/pages/profile_edit_page.dart';
import 'package:plotem/ui/widgets/mypost.dart';
import 'package:plotem/utils/const.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Post> listmyposts = [];
  PostRepository postRepository = PostRepository();

  getData() async {
    listmyposts = await postRepository.getMyPosts(myUserId);
    print(listmyposts.length);
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add),
                color: disabledColor,
                iconSize: 30,
              ),
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Settings();
                    },
                  );
                },
                icon: Icon(Icons.settings),
                color: disabledColor,
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 130,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const Image(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "./lib/assets/ifal.JPG",
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  myUsername,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  "Programmer",
                  style: TextStyle(
                    color: disabledColor,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("4.2"),
                    SizedBox(width: 5),
                    Icon(Icons.star, size: 16, color: disabledColor),
                    Icon(Icons.star, size: 16, color: disabledColor),
                    Icon(Icons.star, size: 16, color: disabledColor),
                    Icon(Icons.star, size: 16, color: disabledColor),
                    Icon(Icons.star,
                        size: 16, color: disabledColor.withOpacity(.3)),
                  ],
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 20),
        Container(
          width: double.infinity,
          height: .5,
          color: dividerColor,
        ),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    "88",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "performance",
                    style: TextStyle(
                      fontSize: 12,
                      color: disabledColor,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
              SizedBox(width: 30),
              Container(
                width: .5,
                height: double.infinity,
                color: dividerColor,
              ),
              SizedBox(width: 30),
              Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    "143",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "connect",
                    style: TextStyle(
                      fontSize: 12,
                      color: disabledColor,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
              SizedBox(width: 30),
              Container(
                width: .5,
                height: double.infinity,
                color: dividerColor,
              ),
              SizedBox(width: 30),
              Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    "43",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "day",
                    style: TextStyle(
                      fontSize: 12,
                      color: disabledColor,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: .5,
          color: dividerColor,
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 60),
          child: Text(
            "Saya Adalah Ranaufal Muha. saya adalah programmer di perusahaan ini. saya bisa bahasa pemrograman java, javascript, python, c#",
            style: TextStyle(
              color: disabledColor,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Container(
            width: double.infinity,
            height: .5,
            color: dividerColor,
          ),
        ),
        for (int i = 0; i < listmyposts.length; i++)
          Column(
            children: [
              MyPostWidget(
                post_id: listmyposts[i].post_id,
                username: listmyposts[i].username,
                nama_jabatan: listmyposts[i].nama_jabatan,
                url_profile: listmyposts[i].url_profile,
                url_content: listmyposts[i].url_content,
                text_content: listmyposts[i].text_content,
                likes: listmyposts[i].likes,
                unlikes: listmyposts[i].unlikes,
                comments: listmyposts[i].comments,
                created_at: listmyposts[i].created_at,
              ),
              Divider(color: dividerColor),
            ],
          ),
        const SizedBox(height: 100),
      ],
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: bgColor,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SizedBox(
                width: 60,
                child: Divider(
                  thickness: 3,
                  color: Colors.white,
                ),
              ),
            ),
            Spacer(),
            Column(
              children: [
                // Edit profil ===========================
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => ProfileEditPage()),
                      ),
                    );
                  },
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Divider(color: dividerColor),
                ),
                // About ===========================
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "About",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Divider(color: dividerColor),
                ),
                // Edit profil ===========================
                TextButton(
                  onPressed: () {
                    myUserId = null;
                    Navigator.popAndPushNamed(context, '/login');
                  },
                  child: Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
