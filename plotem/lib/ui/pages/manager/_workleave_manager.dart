// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:plotem/models/cuti.dart';
import 'package:plotem/services/repo_cuti.dart';
import 'package:plotem/ui/widgets/const_component.dart';
import 'package:plotem/utils/const.dart';

class WorkLeaveManager extends StatefulWidget {
  const WorkLeaveManager({super.key});

  @override
  State<WorkLeaveManager> createState() => _WorkLeaveManagerState();
}

class _WorkLeaveManagerState extends State<WorkLeaveManager> {
  List<Cuti> listemployees = [];
  CutiRepository cutiRepository = CutiRepository();

  getData() async {
    listemployees = await cutiRepository.getEmployeesCuti();
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
        title: const Text("Work Leave"),
      ),
      body: DefaultTextStyle(
        style: TextStyle(color: frontColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            children: [
              SizedBox(height: 20),
              Text(
                "Waiting",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              for (int i = 0; i < listemployees.length; i++)
                if (listemployees[i].status_cuti == null)
                  GestureDetector(
                    onTap: () async {
                      await showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return ModalSalary(
                            isAccepted: listemployees[i].status_cuti,
                            cutiId: listemployees[i].cuti_id,
                            detail: listemployees[i].detail_cuti,
                            start_date: listemployees[i].tgl_mulai,
                            end_date: listemployees[i].tgl_selesai,
                            days: listemployees[i].days,
                            created_at: listemployees[i].created_at,
                          );
                        },
                      );
                      getData(); // Refresh data after modal is closed
                    },
                    child: ListWorkLeaveManager(
                      isAccepted: listemployees[i].status_cuti,
                      date: listemployees[i].created_at,
                      name: listemployees[i].nama,
                      url_profile: listemployees[i].url_profile,
                    ),
                  ),
              SizedBox(height: 20),
              Text(
                "History",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              for (int i = 0; i < listemployees.length; i++)
                if (listemployees[i].status_cuti != null)
                  GestureDetector(
                    onTap: () async {
                      await showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return ModalSalary(
                            isAccepted: listemployees[i].status_cuti,
                            cutiId: listemployees[i].cuti_id,
                            detail: listemployees[i].detail_cuti,
                            start_date: listemployees[i].tgl_mulai,
                            end_date: listemployees[i].tgl_selesai,
                            days: listemployees[i].days,
                            created_at: listemployees[i].created_at,
                          );
                        },
                      );
                      getData(); // Refresh data after modal is closed
                    },
                    child: ListWorkLeaveManager(
                      isAccepted: listemployees[i].status_cuti,
                      date: listemployees[i].created_at,
                      name: listemployees[i].nama,
                      url_profile: listemployees[i].url_profile,
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListWorkLeaveManager extends StatelessWidget {
  int? isAccepted;
  final date;
  final name;
  final url_profile;
  ListWorkLeaveManager({
    super.key,
    required this.isAccepted,
    required this.date,
    required this.name,
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
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    date,
                    style: TextStyle(
                      color: disabledColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Spacer(),
              isAccepted == 1
                  ? Text(
                      "Accepted",
                      style: TextStyle(color: mysecondaryColor),
                    )
                  : isAccepted == null
                      ? Text(
                          "Waiting...",
                          style: TextStyle(color: Colors.orange),
                        )
                      : Text(
                          "Rejected",
                          style: TextStyle(color: Colors.red),
                        ),
              SizedBox(width: 5),
              isAccepted != null
                  ? SizedBox()
                  : Icon(
                      Icons.edit,
                      color: disabledColor,
                      size: 20,
                    )
            ],
          ),
        ),
        Divider(color: dividerColor),
      ],
    );
  }
}

// =============================================================================
class ModalSalary extends StatelessWidget {
  int? isAccepted;
  int cutiId;
  String detail;
  String start_date;
  String end_date;
  int days;
  String created_at;
  ModalSalary({
    super.key,
    required this.isAccepted,
    required this.cutiId,
    required this.detail,
    required this.start_date,
    required this.end_date,
    required this.days,
    required this.created_at,
  });

  @override
  Widget build(BuildContext context) {
    CutiRepository cutiRepository = CutiRepository();
    return Container(
      height: isAccepted == null ? 600 : 450,
      decoration: BoxDecoration(
        color: bgColor,
      ),
      child: DefaultTextStyle(
        style: TextStyle(color: frontColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: SizedBox(
                  width: 60,
                  child: Divider(
                    thickness: 3,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // Spacer(),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    child: Text(
                      "Detail Work Leave",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Submission date"),
                        Text(
                          created_at,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: dividerColor),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Detail"),
                        Text(
                          detail,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: dividerColor),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Start - End "),
                        Text(
                          start_date + " - " + end_date,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: dividerColor),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Leave duration"),
                        Text(
                          days.toString() + " Days",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: dividerColor),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Leave status"),
                        SizedBox(
                          width: 150,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: isAccepted == 1
                                ? Text(
                                    "Accepted",
                                    style: TextStyle(color: mysecondaryColor),
                                  )
                                : isAccepted == null
                                    ? Text(
                                        "Waiting...",
                                        style: TextStyle(color: Colors.orange),
                                      )
                                    : Text(
                                        "Rejected",
                                        style: TextStyle(color: Colors.red),
                                      ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            isAccepted == null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () async {
                          bool success =
                              await cutiRepository.ManagerEditSubmiting(
                                  cutiId, false);
                          if (success) {
                            Navigator.pop(context); // Close the modal
                          }
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                        iconSize: 50,
                      ),
                      SizedBox(width: 50),
                      IconButton(
                        onPressed: () async {
                          bool success =
                              await cutiRepository.ManagerEditSubmiting(
                                  cutiId, true);
                          if (success) {
                            Navigator.pop(context); // Close the modal
                          }
                        },
                        icon: Icon(
                          Icons.check,
                          color: mysecondaryColor,
                        ),
                        iconSize: 50,
                      ),
                    ],
                  )
                : SizedBox(),
            Spacer(),
            // ===============================
          ],
        ),
      ),
    );
  }
}
