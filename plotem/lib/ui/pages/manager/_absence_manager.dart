// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:plotem/models/absence.dart';
import 'package:plotem/services/repo_absence.dart';
import 'package:plotem/ui/widgets/const_component.dart';
import 'package:plotem/utils/const.dart';

class AbsenceManager extends StatefulWidget {
  const AbsenceManager({super.key});

  @override
  State<AbsenceManager> createState() => _AbsenceManagerState();
}

class _AbsenceManagerState extends State<AbsenceManager> {
  List<Absence> listemployees = [];
  AbsenceRepository absenceRepository = AbsenceRepository();

  getData() async {
    listemployees = await absenceRepository.getEmployeesAbsence();
    print(listemployees.length);
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Absence"),
      ),
      body: DefaultTextStyle(
        style: TextStyle(color: frontColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: ListView(
            children: [
              const SizedBox(height: 15),
              const Text(
                "Employees History",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              for (int i = 0; i < listemployees.length; i++)
                EmployeesAbsenceHistory(
                  absenceValue: listemployees[i].status,
                  date: listemployees[i].created_at,
                  url_profile: listemployees[i].url_profile,
                  nama: listemployees[i].nama,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmployeesAbsenceHistory extends StatelessWidget {
  String? url_profile;
  String nama;
  String absenceValue;
  String date;
  EmployeesAbsenceHistory({
    super.key,
    required this.url_profile,
    required this.nama,
    required this.absenceValue,
    required this.date,
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
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(nama),
                  const SizedBox(height: 5),
                  Text(
                    date,
                    style: TextStyle(
                      color: disabledColor,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              absenceValue == "present"
                  ? Text(
                      "present",
                      style: TextStyle(color: mysecondaryColor),
                    )
                  : absenceValue == "sick"
                      ? const Text(
                          "sick",
                          style: TextStyle(color: Colors.orange),
                        )
                      : const Text(
                          "absence",
                          style: TextStyle(color: Colors.red),
                        ),
            ],
          ),
        ),
        Divider(color: dividerColor),
      ],
    );
  }
}
