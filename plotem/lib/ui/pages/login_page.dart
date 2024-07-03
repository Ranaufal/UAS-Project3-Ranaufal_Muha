import 'package:flutter/material.dart';
import 'package:plotem/models/login.dart';
import 'package:plotem/services/repo_user.dart';
import 'package:plotem/ui/widgets/const_component.dart';
import 'package:plotem/utils/const.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool checkedManager = false;

  List<Login> myuser = [];
  UserRepository userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: DefaultTextStyle(
        style: TextStyle(color: frontColor),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Transform.scale(
                    scale: 1.5,
                    alignment: Alignment.topLeft,
                    child: Opacity(
                      opacity: 0.027,
                      child: Image.asset("./lib/assets/mascot1.png"),
                    ))
              ],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  const Spacer(),
                  const Text(
                    "Plotem",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      children: [
                        LoginTextField(
                          controller: usernameController,
                          icon: Icons.person,
                          obscureText: false,
                          title: "username",
                        ),
                        const SizedBox(height: 15),
                        LoginTextField(
                          controller: passwordController,
                          icon: Icons.key,
                          obscureText: true,
                          title: "password",
                        ),
                        Transform.scale(
                          scale: 0.8,
                          alignment: Alignment.topLeft,
                          child: CheckboxListTile(
                            title: const Text(
                              "manager dashboard",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            value: checkedManager,
                            onChanged: (newValue) {
                              setState(() {
                                checkedManager = newValue!;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                        const SizedBox(height: 40),
                        GestureDetector(
                          onTap: () async {
                            myuser = await userRepository.getLoginUser(
                                usernameController.text,
                                passwordController.text);
                            if (myuser.isNotEmpty) {
                              myUserId = myuser[0].user_id;
                              myPegawaiId = myuser[0].pegawai_id;
                              myUsername = myuser[0].username;
                              hakAkses = myuser[0].hak_akses;
                              if (checkedManager &&
                                  (myuser[0].hak_akses == 1 ||
                                      myuser[0].hak_akses == 2)) {
                                Navigator.pushReplacementNamed(
                                    context, '/homemanager');
                              } else {
                                Navigator.pushReplacementNamed(
                                    context, '/home');
                              }
                            } else {
                              print("No User");
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            decoration: BoxDecoration(
                              color: disabledBgColor,
                              gradient: LinearGradient(
                                colors: [
                                  gradientColors[0].withOpacity(.5),
                                  gradientColors[1].withOpacity(.5),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: frontColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Powered by",
                    style: TextStyle(
                      color: disabledColor,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 18,
                        child: Image.asset("./lib/assets/ifal-logo.png"),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        height: 18,
                        child:
                            Image.asset("./lib/assets/peridot-logo-bgnone.png"),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
