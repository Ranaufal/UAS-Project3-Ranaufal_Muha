import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plotem/models/absence.dart';
import 'package:plotem/services/repo_absence.dart';
import 'package:plotem/ui/pages/confirmation_page.dart';
import 'package:plotem/utils/const.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class AbsencePage extends StatefulWidget {
  const AbsencePage({super.key});

  @override
  State<AbsencePage> createState() => _AbsencePageState();
}

class _AbsencePageState extends State<AbsencePage> {
  List<Absence> listUsers = [];
  AbsenceRepository absenceRepository = AbsenceRepository();

  getData() async {
    listUsers = await absenceRepository.getMyAbsence();
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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return AddAbsence(
                      isAbsenced: false,
                      onAbsenceAdded: getData,
                    );
                  },
                );
              },
              icon: const Icon(Icons.add),
              iconSize: 30,
            ),
          ),
        ],
      ),
      body: DefaultTextStyle(
        style: TextStyle(color: frontColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: glassBorderColor),
                  color: glassColor,
                ),
                child: Column(
                  children: [
                    Text(
                      "Persentage",
                      style: TextStyle(
                        color: disabledColor,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "100%",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: mysecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                "History",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              for (int i = 0; i < listUsers.length; i++)
                AbsenceHistory(
                  absenceValue: listUsers[i].status,
                  date: listUsers[i].created_at,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddAbsence extends StatefulWidget {
  final bool isAbsenced;
  final Function onAbsenceAdded;
  AddAbsence({
    super.key,
    required this.isAbsenced,
    required this.onAbsenceAdded,
  });

  @override
  State<AddAbsence> createState() => _AddAbsenceState();
}

class _AddAbsenceState extends State<AddAbsence> {
  bool isFinished = false;
  String? _selectedOption;

  AbsenceRepository absenceRepository = AbsenceRepository();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 390,
      decoration: BoxDecoration(
        color: bgColor,
      ),
      child: DefaultTextStyle(
        style: TextStyle(color: frontColor),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  widget.isAbsenced
                      ? Text("You have filled in today's attendance list")
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Absence Now",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 15),
                            RadioListTile<String>(
                              contentPadding: EdgeInsets.all(0),
                              title: Text(
                                'Present',
                                style: TextStyle(
                                  color: frontColor,
                                  fontSize: 14,
                                ),
                              ),
                              value: 'present',
                              groupValue: _selectedOption,
                              activeColor: myprimarColor,
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedOption = value;
                                });
                              },
                            ),
                            RadioListTile<String>(
                              contentPadding: EdgeInsets.all(0),
                              title: Text(
                                'Absence',
                                style: TextStyle(
                                  color: frontColor,
                                  fontSize: 14,
                                ),
                              ),
                              value: 'absence',
                              groupValue: _selectedOption,
                              activeColor: myprimarColor,
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedOption = value;
                                });
                              },
                            ),
                            RadioListTile<String>(
                              contentPadding: EdgeInsets.all(0),
                              title: Text(
                                'Sick',
                                style: TextStyle(
                                  color: frontColor,
                                  fontSize: 14,
                                ),
                              ),
                              value: 'sick',
                              groupValue: _selectedOption,
                              activeColor: myprimarColor,
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedOption = value;
                                });
                              },
                            ),
                            SizedBox(height: 20),
                            Align(
                              alignment: Alignment.center,
                              child: SwipeableButtonView(
                                buttonText: 'slide to absence',
                                buttontextstyle: TextStyle(),
                                buttonWidget: Icon(
                                  Icons.chevron_right_rounded,
                                  size: 30,
                                  color: myprimarColor,
                                ),
                                activeColor: myprimarColor,
                                onWaitingProcess: () {
                                  Future.delayed(
                                    Duration(milliseconds: 500),
                                    () => setState(() => isFinished = true),
                                  );
                                },
                                isFinished: isFinished,
                                onFinish: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      child: ConfirmationPage(),
                                      type: PageTransitionType.fade,
                                    ),
                                  );

                                  absenceRepository.absenecePosts(
                                      myPegawaiId, _selectedOption!);
                                  widget.onAbsenceAdded();
                                  // ---- the action ----
                                  setState(() => isFinished = false);
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class AbsenceHistory extends StatelessWidget {
  String absenceValue;
  String date;
  AbsenceHistory({
    super.key,
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
              absenceValue == "present"
                  ? Icon(
                      Icons.check,
                      color: myprimarColor,
                    )
                  : absenceValue == "absence"
                      ? Icon(
                          Icons.close,
                          color: Colors.red,
                        )
                      : Icon(
                          Icons.sick,
                          color: Colors.orange,
                        ),
              SizedBox(width: 5),
              absenceValue == "present"
                  ? Text("Present")
                  : absenceValue == "absence"
                      ? Text("Absence")
                      : Text("Sick"),
              Spacer(),
              Text(
                date,
                style: TextStyle(color: disabledColor),
              ),
            ],
          ),
        ),
        Divider(color: dividerColor),
      ],
    );
  }
}
