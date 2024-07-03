// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:plotem/models/user_search.dart';
import 'package:plotem/services/repo_user.dart';
import 'package:plotem/ui/widgets/const_component.dart';
import 'package:plotem/utils/const.dart';

class EmployeeManager extends StatefulWidget {
  const EmployeeManager({super.key});

  @override
  State<EmployeeManager> createState() => _EmployeeManagerState();
}

class _EmployeeManagerState extends State<EmployeeManager> {
  List<UserSearch> listemployees = [];
  UserRepository userRepository = UserRepository();

  getData() async {
    listemployees = await userRepository.getUserByManager();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "All Employee ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            for (int i = 0; i < listemployees.length; i++)
              ListWidgetEmployee(
                name: listemployees[i].nama,
                job_name: listemployees[i].nama_jabatan,
                url_profile: listemployees[i].url_profile,
              )
          ],
        ),
      ),
    );
  }
}

class ListWidgetEmployee extends StatelessWidget {
  String name;
  String job_name;
  String? url_profile;
  ListWidgetEmployee({
    super.key,
    required this.name,
    required this.job_name,
    required this.url_profile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              MyProfileImage(
                url: url_profile ?? "",
                radius: 20,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    job_name,
                    style: TextStyle(
                      color: disabledColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                "active",
                style: TextStyle(
                  color: mysecondaryColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Divider(color: dividerColor),
      ],
    );
  }
}
