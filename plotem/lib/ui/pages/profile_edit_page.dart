import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plotem/ui/widgets/const_component.dart';
import 'package:plotem/utils/const.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  // form controller
  final usernameController = TextEditingController();
  final bioController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  File? _image;
  XFile? _pickedFile;
  final _picker = ImagePicker();

  Future<void> _pickImage() async {
    _pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (_pickedFile != null) {
      setState(() {
        _image = File(_pickedFile!.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Center(
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Done",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
      body: DefaultTextStyle(
        style: TextStyle(color: frontColor),
        child: ListView(
          children: [
            // Change Profile
            Center(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    width: 150,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: _pickedFile != null
                          ? Image.file(
                              File(_pickedFile!.path),
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              "./lib/assets/logo-sm-bggradient.png",
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  Container(
                    width: 180,
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => _pickImage(),
                      child: CircleAvatar(
                        backgroundColor: disabledBgColor,
                        child: Icon(Icons.edit, color: disabledColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Form
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  LoginTextField(
                    controller: usernameController,
                    icon: Icons.person,
                    obscureText: false,
                    title: "username",
                  ),
                  SizedBox(height: 15),
                  LoginTextField(
                    controller: bioController,
                    icon: Icons.details,
                    obscureText: false,
                    title: "Bio",
                  ),
                  SizedBox(height: 50),
                  Row(
                    children: [
                      const Text(
                        "Change Password",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  LoginTextField(
                    controller: passwordController,
                    icon: Icons.password,
                    obscureText: true,
                    title: "Password",
                  ),
                  SizedBox(height: 15),
                  LoginTextField(
                    controller: confirmPasswordController,
                    icon: Icons.password,
                    obscureText: true,
                    title: "Confirm Password",
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: 300,
                        child: Text(
                          "leave empty if u don't want to change the password",
                          style: TextStyle(color: disabledColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
